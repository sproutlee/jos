#include <inc/assert.h>

#include <kern/env.h>
#include <kern/pmap.h>
#include <kern/monitor.h>


// Choose a user environment to run and run it.
void
sched_yield(void)
{
	struct Env *idle;
	int i;

	// Implement simple round-robin scheduling.
	//
	// Search through 'envs' for an ENV_RUNNABLE environment in
	// circular fashion starting just after the env this CPU was
	// last running.  Switch to the first such environment found.
	//
	// If no envs are runnable, but the environment previously
	// running on this CPU is still ENV_RUNNING, it's okay to
	// choose that environment.
	//
	// Never choose an environment that's currently running on
	// another CPU (env_status == ENV_RUNNING) and never choose an
	// idle environment (env_type == ENV_TYPE_IDLE).  If there are
	// no runnable environments, simply drop through to the code
	// below to switch to this CPU's idle environment.

	// LAB 4: Your code here.
	struct Env *e;
	// cprintf("curenv: %x\n", curenv);
	//if(curenv!=NULL)
	  //cprintf("\r\ncurenvid:%x\r\n",curenv->env_id);
	//idle=((curenv==NULL||curenv-envs==NENV-1)?&envs[0]:curenv+1);
	//if(curenv!=NULL)
	//cprintf("%x,idel:%x\r\n",curenv->env_id,idle->env_id);
	if(curenv==NULL||(curenv->env_id==NENV-1))
		idle=&envs[0];
	else
		idle=curenv+1;
	//if(curenv!=NULL)
	//cprintf("%x,idel:%x\r\n",curenv->env_id,idle->env_id);
	for(i=0;i<NENV;i++){
	  if(idle->env_type==ENV_TYPE_IDLE);
	  else if(idle==curenv){
		if(idle->env_status==ENV_RUNNING){
		 env_run(idle);}
 	 	}else if(idle->env_status==ENV_RUNNABLE){
		    env_run(idle);}
	  idle = (idle - envs == NENV - 1) ? &envs[0] : idle + 1;
	}
	//cprintf("kkk\r\n");
	// For debugging and testing purposes, if there are no
	// runnable environments other than the idle environments,
	// drop into the kernel monitor.
	for (i = 0; i < NENV; i++) {
		if (envs[i].env_type != ENV_TYPE_IDLE &&
		    (envs[i].env_status == ENV_RUNNABLE ||
		     envs[i].env_status == ENV_RUNNING))
			break;
	}
	if (i == NENV) {
		cprintf("No more runnable environments!\n");
		while (1)
			monitor(NULL);
	}

	// Run this CPU's idle environment when nothing else is runnable.
	idle = &envs[cpunum()];
	if (!(idle->env_status == ENV_RUNNABLE || idle->env_status == ENV_RUNNING))
		panic("CPU %d: No idle environment!", cpunum());
	env_run(idle);
}
