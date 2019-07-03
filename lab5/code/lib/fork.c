// implement fork from user space

#include <inc/string.h>
#include <inc/lib.h>

// PTE_COW marks copy-on-write page table entries.
// It is one of the bits explicitly allocated to user processes (PTE_AVAIL).
#define PTE_COW		0x800

//
// Custom page fault handler - if faulting page is copy-on-write,
// map in our own private writable copy.
//
static void
pgfault(struct UTrapframe *utf)
{
	void *addr = (void *) utf->utf_fault_va;
	uint32_t err = utf->utf_err;
	int r;

	// Check that the faulting access was (1) a write, and (2) to a
	// copy-on-write page.  If not, panic.
	// Hint:
	//   Use the read-only page table mappings at vpt
	//   (see <inc/memlayout.h>).

	// LAB 4: Your code here.
	if((err&FEC_WR)==0)
		panic("not write fault");
	if((vpd[PDX(addr)]&PTE_P)==0)
		panic("page directory entry is not present!");
	if((vpt[PGNUM(addr)]&PTE_COW)==0)
		panic("not copy on write");
	
	// Allocate a new page, map it at a temporary location (PFTEMP),
	// copy the data from the old page to the new page, then move the new
	// page to the old page's address.
	// Hint:
	//   You should make three system calls.
	//   No need to explicitly delete the old page's mapping.

	// LAB 4: Your code here.
	//为当前进程分配一个页
	if((r=sys_page_alloc(0,(void*)PFTEMP,PTE_U|PTE_P|PTE_W))<0)
		panic("page alloc failed");
	//copy data from old page to new page
	addr=ROUNDDOWN(addr,PGSIZE);
	memmove(PFTEMP,addr,PGSIZE);
	//move the new page to the old page's address
	if((r=sys_page_map(0,PFTEMP,0,addr,PTE_P|PTE_U|PTE_W))<0)
		panic("sys_page_map failed");
	//panic("pgfault not implemented");
}

//
// Map our virtual page pn (address pn*PGSIZE) into the target envid
// at the same virtual address.  If the page is writable or copy-on-write,
// the new mapping must be created copy-on-write, and then our mapping must be
// marked copy-on-write as well.  (Exercise: Why do we need to mark ours
// copy-on-write again if it was already copy-on-write at the beginning of
// this function?)
//
// Returns: 0 on success, < 0 on error.
// It is also OK to panic on error.
//
//将虚拟页映射到指定进程的相同虚拟地址上
static int
duppage(envid_t envid, unsigned pn)
{
	int r;

	// LAB 4: Your code here.
	void* addr=(void*)((uint32_t)pn*PGSIZE);
	pte_t pte=vpt[PGNUM(addr)];
	if(pte&PTE_P){
	if((pte&PTE_W)||(pte&PTE_COW))
	  {
		if((r=sys_page_map(0,addr,envid,addr,PTE_U|PTE_P|PTE_COW))<0)
		  panic("duppage:page map failed");
		if((r=sys_page_map(0,addr,0,addr,PTE_U|PTE_P|PTE_COW))<0)
		  panic("duppage: page re-map failed");
		
 	  }else{
		sys_page_map(0,addr,envid,addr,PTE_U|PTE_P);
		}
	}
	//panic("duppage not implemented");
	return 0;
}

//
// User-level fork with copy-on-write.
// Set up our page fault handler appropriately.
// Create a child.
// Copy our address space and page fault handler setup to the child.
// Then mark the child as runnable and return.
//
// Returns: child's envid to the parent, 0 to the child, < 0 on error.
// It is also OK to panic on error.
//
// Hint:
//   Use vpd, vpt, and duppage.
//   Remember to fix "thisenv" in the child process.
//   Neither user exception stack should ever be marked copy-on-write,
//   so you must allocate a new page for the child's user exception stack.
//
envid_t
fork(void)
{
	// LAB 4: Your code here.
	//首先为当前进程设置缺页处理函数
	set_pgfault_handler(pgfault);
	
	envid_t envid;
	uint32_t addr;
	int r;
	//调用sys_exofork()创建子进程
	envid=sys_exofork();
	if(envid<0)
	  panic("sys_exofork failed");
	//return 0 when env is child
	if(envid==0){
	  thisenv=&envs[ENVX(sys_getenvid())];
	  return 0;
	}
	
	//父进程将用户空间的页面映射到子进程
	for (addr = 0; addr < USTACKTOP; addr += PGSIZE)
        if ((vpd[PDX(addr)] & PTE_P) && (vpt[PGNUM(addr)] & PTE_P)
            && (vpt[PGNUM(addr)] & PTE_U)) {
            duppage(envid, PGNUM(addr));
        }
	
	//为子进程设置错误栈
	if (sys_page_alloc(envid, (void *)(UXSTACKTOP-PGSIZE), PTE_U|PTE_W|PTE_P) < 0)
          panic("sys_page_alloc() failed");
	//设置env_pgfault_upcall
	extern void _pgfault_upcall();
    	sys_env_set_pgfault_upcall(envid, _pgfault_upcall);

    	if (sys_env_set_status(envid, ENV_RUNNABLE) < 0)
          panic("sys_env_set_status");
	
	return envid;
	
	//panic("fork not implemented");
}

// Challenge!
int
sfork(void)
{
	panic("sfork not implemented");
	return -E_INVAL;
}
