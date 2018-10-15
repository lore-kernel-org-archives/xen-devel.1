From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Interrupt injection with ISR set on Intel hardware
Date: Mon, 15 Oct 2018 12:30:15 +0200
Message-ID: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wsxcad2iikn7h63b"
Content-Transfer-Encoding: 8bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=06k+=m3=citrix.com=prvs=8197794ea=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gC08r-0005YC-Bo
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 10:30:29 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--wsxcad2iikn7h63b
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hello,

Wei recently discovered an issue when running a Linux PVH Dom0 on a
box with a Intel Family 6 (0x6), Model 158 (0x9e), Stepping 9 (raw
000906e9) CPU, we are not sure whether the issue is limited to a PVH
Dom0, or it just happens to be easier to trigger in this scenario.

The issue is caused by what seems to be an interrupt injection while
Xen is still servicing a previous interrupt (ie: the interrupt hasn't
been EOI'ed and ISR for the vector is set) with the same or lower
priority than the interrupt currently being serviced. This injection
always happen when returning from idle from a state ACPI_STATE_C3 or
lower.

Note that I haven't been able to reproduce this issue when using
mwait-idle=0 or max_cstate=2 on the Xen command line, but again
without knowing the underlying issue it's impossible to tell whether
it's relevant.

Andrew provided a debug patch which I've expanded to also log power
state transition, and is attached to this email.

Here is a trace of a crash, together with the debug info.

(XEN) *** Pending EOI error ***
(XEN)   cpu #1, irq 30, vector 0x21, sp 1
(XEN) Peoi stack: sp 1
(XEN)   [ 0] irq  30, vec 0x21, ready 0, ISR 1, TMR 0, IRR 0
(XEN) Peoi stack trace records:
(XEN)   [22619] POP      {sp  1, irq  30, vec 0x21}
(XEN)   [22620] POWER    TYPE 4
(XEN)   [22621] IDLE     PPR 0x00000010
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)   [22622] WAKE     PPR 0x00000010
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000004
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)   [22623] ACK_PRE  PPR 0x000000f0
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000004
(XEN)   [22624] ACK_POST PPR 0x00000010
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)   [22625] POWER    TYPE 5
(XEN)   [22626] IDLE     PPR 0x00000010
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)   [22627] WAKE     PPR 0x00000010
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)   [22628] PUSH     {sp  0, irq  30, vec 0x21}
(XEN)   [22629] POWER    TYPE 5
(XEN)   [22630] IDLE     PPR 0x00000020
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22631] WAKE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22632] POWER    TYPE 5
(XEN)   [22633] IDLE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22634] WAKE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000004
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22635] ACK_PRE  PPR 0x000000f0
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000004
(XEN)   [22636] ACK_POST PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22637] READY    {sp  1, irq  30, vec 0x21}
(XEN)   [22638] ACK_PRE  PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22639] ACK_POST PPR 0x00000010
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)   [22640] POP      {sp  1, irq  30, vec 0x21}
(XEN)   [22641] PUSH     {sp  0, irq  30, vec 0x21}
(XEN)   [22642] POWER    TYPE 4
(XEN)   [22643] IDLE     PPR 0x00000020
(XEN)                    IRR 0000000000000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22644] WAKE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22645] POWER    TYPE 3
(XEN)   [22646] IDLE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22647] WAKE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22648] POWER    TYPE 3
(XEN)   [22649] IDLE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)   [22650] WAKE     PPR 0x00000020
(XEN)                    IRR 0000000002000000000000000000000000000000000000000000000000000000
(XEN)                    ISR 0000000002000000000000000000000000000000000000000000000000000000
(XEN) All LAPIC state:
(XEN)   [vector]      ISR      TMR      IRR
(XEN)   [1f:00]  00000000 00000000 00000000
(XEN)   [3f:20]  00000002 00000000 00000000
(XEN)   [5f:40]  00000000 00000000 00000000
(XEN)   [7f:60]  00000000 00000000 00000000
(XEN)   [9f:80]  00000000 00000000 00000000
(XEN)   [bf:a0]  00000000 00000000 00000000
(XEN)   [df:c0]  00000000 00000000 00000000
(XEN)   [ff:e0]  00000000 00000000 04000000
(XEN) Assertion '(sp == 0) || (peoi[sp-1].vector < vector)' failed at irq.c:1340
(XEN) ----[ Xen-4.12-unstable  x86_64  debug=y   Tainted:  C   ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d08028737d>] do_IRQ+0x8df/0xacb
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
(XEN) rax: ffff83086c67202c   rbx: 0000000000000180   rcx: 0000000000000000
(XEN) rdx: ffff83086c68ffff   rsi: 000000000000000a   rdi: ffff83086c601e24
(XEN) rbp: ffff83086c68fd98   rsp: ffff83086c68fd38   r8:  ffff83086c690000
(XEN) r9:  0000000000000030   r10: 0000000004000000   r11: 0000000000000007
(XEN) r12: 000000000000011f   r13: 00000000ffffffff   r14: ffff83086c601e00
(XEN) r15: ffff82cfffffb100   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 0000000855ba7000   cr2: 0000556bfa53c040
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08028737d> (do_IRQ+0x8df/0xacb):
(XEN)  8d 7e 24 e8 51 66 fb ff <0f> 0b 0f 0b 0f 0b 0f 0b b8 00 00 00 00 eb 4e 83
(XEN) Xen stack trace from rsp=ffff83086c68fd38:
(XEN)    ffff82d000000000 ffff83086c601e24 0000000000000000 ffff83086c6724e0
(XEN)    ffff82d08037b841 ffff82d08037b835 ffff82d08037b841 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffff83086c68ffff 0000000000000000
(XEN)    00007cf793970237 ffff82d08037b8aa 00000003040712e5 0000000000000008
(XEN)    ffff83086c671448 ffff83086c671390 ffff83086c68fec0 00000003040b3015
(XEN)    ffff83086c672d08 ffff83086c6724e0 ffff83086c672d28 0000000000000180
(XEN)    ffff83086c67202c 0000000000000000 ffff83086c68ffff 0000000000002ccf
(XEN)    ffff83086c6713c0 0000002100000000 ffff82d0802e2403 000000000000e008
(XEN)    0000000000000202 ffff83086c68fe50 0000000000000000 ffff830088dd4000
(XEN)    00000020ffffffff 0000000000000000 ffff83086c68fee8 ffff82d08059bd00
(XEN)    0000000000000000 0000000000000000 000002d90000017f ffff82d0805a3c80
(XEN)    0000000000000001 ffff82d08059bd00 0000000000000001 0000000000000001
(XEN)    ffff830856085000 ffff83086c68fef0 ffff82d08027755d ffff83086c6a5000
(XEN)    ffff830088dd4000 ffff830088bfa000 ffff83086c6a5000 ffff83086c68fdb8
(XEN)    0000000000000000 0000000000000000 ffff880269a3bd00 ffff880269a3bd00
(XEN)    0000000000000005 0000000000000005 0000000000000000 0000000000000120
(XEN)    0000000000000000 000000002059d803 ffffffff816fe980 ffff88027335a7c0
(XEN)    ffffffff82049af8 ffff88027335a7c0 00000000dade4600 0000beef0000beef
(XEN)    ffffffff816fec52 000000bf0000beef 0000000000000246 ffffc90000d13e98
(XEN)    000000000000beef ffff83086c68beef 000000000000beef 000000000000beef
(XEN) Xen call trace:
(XEN)    [<ffff82d08028737d>] do_IRQ+0x8df/0xacb
(XEN)    [<ffff82d08037b8aa>] common_interrupt+0x10a/0x120
(XEN)    [<ffff82d0802e2403>] mwait-idle.c#mwait_idle+0x2a5/0x381
(XEN)    [<ffff82d08027755d>] domain.c#idle_loop+0xb3/0xb5
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Assertion '(sp == 0) || (peoi[sp-1].vector < vector)' failed at irq.c:1340
(XEN) ****************************************
(XEN)
(XEN) Manual reset required ('noreboot' specified)

Finally I'm also proving the surrounding context of the instructions
pointers in the trace above:

(XEN)    [<ffff82d08028737d>] do_IRQ+0x8df/0xacb
xen/arch/x86/irq.c:1340:

  1325	    if ( action->ack_type == ACKTYPE_EOI )
  1326	    {
  1327	        sp = pending_eoi_sp(peoi);
  1328	        if ( !((sp == 0) || (peoi[sp-1].vector < vector)) )
  1329	        {
  1330	            printk("*** Pending EOI error ***\n");
  1331	            printk("  cpu #%u, irq %d, vector 0x%x, sp %d\n",
  1332	                   smp_processor_id(), irq, vector, sp);
  1333
  1334	            dump_peoi_stack(sp);
  1335	            dump_peoi_records();
  1336	            dump_lapic();
  1337
  1338	            spin_unlock(&desc->lock);
  1339
->1340	            assert_failed("(sp == 0) || (peoi[sp-1].vector < vector)");
  1341	        }
  1342
  1343	        ASSERT(sp < (NR_DYNAMIC_VECTORS-1));
  1344	        peoi[sp].irq = irq;
  1345	        peoi[sp].vector = vector;
  1346	        peoi[sp].ready = 0;
  1347	        pending_eoi_sp(peoi) = sp+1;
  1348	        cpumask_set_cpu(smp_processor_id(), action->cpu_eoi_map);

(XEN)    [<ffff82d08037b8aa>] common_interrupt+0x10a/0x120
xen/arch/x86/x86_64/entry.S:58

    47	        /* Inject exception if pending. */
    48	        lea   VCPU_trap_bounce(%rbx), %rdx
    49	        testb $TBF_EXCEPTION, TRAPBOUNCE_flags(%rdx)
    50	        jnz   .Lprocess_trapbounce
    51
    52	        cmpb  $0, VCPU_mce_pending(%rbx)
    53	        jne   process_mce
    54	.Ltest_guest_nmi:
    55	        cmpb  $0, VCPU_nmi_pending(%rbx)
    56	        jne   process_nmi
    57	test_guest_events:
->  58	        movq  VCPU_vcpu_info(%rbx), %rax
    59	        movzwl VCPUINFO_upcall_pending(%rax), %eax
    60	        decl  %eax
    61	        cmpl  $0xfe, %eax
    62	        ja    restore_all_guest
    63	/*process_guest_events:*/
    64	        sti
    65	        leaq  VCPU_trap_bounce(%rbx), %rdx
    66	        movq  VCPU_event_addr(%rbx), %rax
    67	        movq  %rax, TRAPBOUNCE_eip(%rdx)
    68	        movb  $TBF_INTERRUPT, TRAPBOUNCE_flags(%rdx)
    69	        call  create_bounce_frame
    70	        jmp   test_all_events

(XEN)    [<ffff82d0802e2403>] mwait-idle.c#mwait_idle+0x2a5/0x381
xen/arch/x86/cpu/mwait-idle.c:802

   788		if (cpu_is_haltable(cpu))
   789			mwait_idle_with_hints(eax, MWAIT_ECX_INTERRUPT_BREAK);
   790
   791		after = cpuidle_get_tick();
   792
   793		cstate_restore_tsc();
   794		trace_exit_reason(irq_traced);
   795		TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
   796			irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
   797
   798		/* Now back in C0. */
   799		update_idle_stats(power, cx, before, after);
   800		local_irq_enable();
   801
-> 802		if (!(lapic_timer_reliable_states & (1 << cstate)))
   803			lapic_timer_on();
   804
   805		sched_tick_resume();
   806		cpufreq_dbs_timer_resume();

(XEN)    [<ffff82d08027755d>] domain.c#idle_loop+0xb3/0xb5
xen/arch/x86/domain.c:144

   129	    for ( ; ; )
   130	    {
   131	        if ( cpu_is_offline(cpu) )
   132	            play_dead();
   133
   134	        /* Are we here for running vcpu context tasklets, or for idling? */
   135	        if ( unlikely(tasklet_work_to_do(cpu)) )
   136	            do_tasklet();
   137	        /*
   138	         * Test softirqs twice --- first to see if should even try scrubbing
   139	         * and then, after it is done, whether softirqs became pending
   140	         * while we were scrubbing.
   141	         */
   142	        else if ( !softirq_pending(cpu) && !scrub_free_pages()  &&
   143	                    !softirq_pending(cpu) )
-> 144	            pm_idle();
   145	        do_softirq();
   146	        /*
   147	         * We MUST be last (or before pm_idle). Otherwise after we get the
   148	         * softirq we would execute pm_idle (and sleep) and not patch.
   149	         */
   150	        check_for_livepatch_work();
   151	    }

--wsxcad2iikn7h63b
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment; filename="0001-PEOI-debug.patch"
Content-Transfer-Encoding: 8bit

>From 65f5703b9a7634bea440ebfea908120aaa6b35de Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Mon, 15 Oct 2018 12:26:42 +0200
Subject: [PATCH] PEOI debug
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
[power state tracing]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c  |   4 +
 xen/arch/x86/cpu/mwait-idle.c |   2 +
 xen/arch/x86/irq.c            | 182 +++++++++++++++++++++++++++++++++-
 xen/include/asm-x86/apic.h    |  14 +++
 xen/include/asm-x86/irq.h     |  44 ++++++++
 5 files changed, 244 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 14b02789c5..08e3ffd996 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -420,6 +420,8 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
     {
         struct cpu_info *info = get_cpu_info();
 
+        peoi_debug_apic(PEOI_IDLE);
+
         cpumask_set_cpu(cpu, &cpuidle_mwait_flags);
 
         spec_ctrl_enter_idle(info);
@@ -427,6 +429,8 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
         spec_ctrl_exit_idle(info);
 
         cpumask_clear_cpu(cpu, &cpuidle_mwait_flags);
+
+        peoi_debug_apic(PEOI_WAKE);
     }
 
     if ( expires <= NOW() && expires > 0 )
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 77fc3ddacc..8ccbdc97ae 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -781,6 +781,8 @@ static void mwait_idle(void)
 	before = cpuidle_get_tick();
 	TRACE_4D(TRC_PM_IDLE_ENTRY, cx->type, before, exp, pred);
 
+	peoi_debug_power(PEOI_POWER, cx->type);
+
 	update_last_cx_stat(power, cx, before);
 
 	if (cpu_is_haltable(cpu))
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 35e7de594f..5f12f2497c 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1148,6 +1148,161 @@ static void irq_guest_eoi_timer_fn(void *data)
     spin_unlock_irqrestore(&desc->lock, flags);
 }
 
+DEFINE_PER_CPU(struct peoi_dbg_record, peoi_dbg[NR_PEOI_RECORDS]);
+DEFINE_PER_CPU(unsigned int, peoi_dbg_idx);
+
+void peoi_debug_stack(enum peoi_dbg_type action, unsigned int sp,
+                      unsigned int irq, unsigned int vector)
+{
+    unsigned int *idx = &this_cpu(peoi_dbg_idx);
+    struct peoi_dbg_record *rec =
+        &this_cpu(peoi_dbg)[*idx & (NR_PEOI_RECORDS - 1)];
+    struct peoi_dbg_stack *stack = &rec->stack;
+
+    rec->seq    = *idx;
+    rec->action = action;
+
+    stack->sp = sp;
+    stack->irq = irq;
+    stack->vector = vector;
+
+    (*idx)++;
+}
+
+void peoi_debug_apic(enum peoi_dbg_type action)
+{
+    unsigned int i, *idx = &this_cpu(peoi_dbg_idx);
+    struct peoi_dbg_record *rec =
+        &this_cpu(peoi_dbg)[*idx & (NR_PEOI_RECORDS - 1)];
+    struct peoi_dbg_apic *apic = &rec->apic;
+    uint32_t *irr = _p(apic->irr);
+    uint32_t *isr = _p(apic->isr);
+
+    rec->seq    = *idx;
+    rec->action = action;
+
+    for ( i = 0; i < APIC_ISR_NR; i++ )
+    {
+        irr[i] = apic_read(APIC_IRR + i * 0x10);
+        isr[i] = apic_read(APIC_ISR + i * 0x10);
+    }
+
+    apic->ppr = apic_read(APIC_PROCPRI);
+
+    (*idx)++;
+}
+
+void peoi_debug_power(enum peoi_dbg_type action, unsigned int state)
+{
+    unsigned int *idx = &this_cpu(peoi_dbg_idx);
+    struct peoi_dbg_record *rec =
+        &this_cpu(peoi_dbg)[*idx & (NR_PEOI_RECORDS - 1)];
+    struct peoi_dbg_power *power = &rec->power;
+
+    rec->seq    = *idx;
+    rec->action = action;
+
+    power->state = state;
+
+    (*idx)++;
+}
+
+static void dump_peoi_record(const struct peoi_dbg_record *r)
+{
+    const struct peoi_dbg_stack *s = &r->stack;
+    const struct peoi_dbg_apic  *a = &r->apic;
+    const struct peoi_dbg_power *p = &r->power;
+
+    switch ( r->action )
+    {
+    case PEOI_PUSH:
+        printk("  [%5u] PUSH     {sp %2d, irq %3d, vec 0x%02x}\n",
+               r->seq, s->sp, s->irq, s->vector);
+        break;
+
+    case PEOI_SETREADY:
+        printk("  [%5u] READY    {sp %2d, irq %3d, vec 0x%02x}\n",
+               r->seq, s->sp, s->irq, s->vector);
+        break;
+
+    case PEOI_FLUSH:
+        printk("  [%5u] FLUSH    %d -> 0\n", r->seq, s->sp);
+        break;
+
+    case PEOI_POP:
+        printk("  [%5u] POP      {sp %2d, irq %3d, vec 0x%02x}\n",
+               r->seq, s->sp, s->irq, s->vector);
+        break;
+
+    case PEOI_IDLE:
+        printk("  [%5u] IDLE     PPR 0x%08x\n", r->seq, a->ppr);
+
+    dump_apic_bitmaps:
+        printk("                   IRR %*phN\n"
+               "                   ISR %*phN\n",
+               (int)sizeof(a->irr), a->irr, (int)sizeof(a->isr), a->isr);
+        break;
+
+    case PEOI_WAKE:
+        printk("  [%5u] WAKE     PPR 0x%08x\n", r->seq, a->ppr);
+        goto dump_apic_bitmaps;
+
+    case PEOI_ACK_PRE:
+        printk("  [%5u] ACK_PRE  PPR 0x%08x\n", r->seq, a->ppr);
+        goto dump_apic_bitmaps;
+
+    case PEOI_ACK_POST:
+        printk("  [%5u] ACK_POST PPR 0x%08x\n", r->seq, a->ppr);
+        goto dump_apic_bitmaps;
+
+    case PEOI_POWER:
+        printk("  [%5u] POWER    TYPE %u\n", r->seq, p->state);
+        break;
+
+    default:
+        printk("  [%5u] ??? %d\n", r->seq, r->action);
+        break;
+    }
+}
+
+static void dump_peoi_records(void)
+{
+    unsigned int i, idx = this_cpu(peoi_dbg_idx);
+    struct peoi_dbg_record *rec = this_cpu(peoi_dbg);
+
+    printk("Peoi stack trace records:\n");
+    for ( i = 0; i < NR_PEOI_RECORDS; ++i )
+        dump_peoi_record(&rec[(idx + i) & (NR_PEOI_RECORDS - 1)]);
+}
+
+static void dump_lapic(void)
+{
+    unsigned int i;
+
+    printk("All LAPIC state:\n");
+    printk("  [vector] %8s %8s %8s\n", "ISR", "TMR", "IRR");
+    for ( i = 0; i < APIC_ISR_NR; ++i )
+        printk("  [%02x:%02x]  %08"PRIx32" %08"PRIx32" %08"PRIx32"\n",
+               (i * 32) + 31, i * 32,
+               apic_read(APIC_ISR + i * 0x10),
+               apic_read(APIC_TMR + i * 0x10),
+               apic_read(APIC_IRR + i * 0x10));
+}
+
+static void dump_peoi_stack(int sp)
+{
+    struct pending_eoi *peoi = this_cpu(pending_eoi);
+    int i;
+
+    printk("Peoi stack: sp %d\n", sp);
+    for ( i = sp - 1; i >= 0; --i )
+        printk("  [%2d] irq %3d, vec 0x%02x, ready %u, ISR %u, TMR %u, IRR %u\n",
+               i, peoi[i].irq, peoi[i].vector, peoi[i].ready,
+               apic_isr_read(peoi[i].vector),
+               apic_tmr_read(peoi[i].vector),
+               apic_irr_read(peoi[i].vector));
+}
+
 static void __do_IRQ_guest(int irq)
 {
     struct irq_desc         *desc = irq_to_desc(irq);
@@ -1170,13 +1325,29 @@ static void __do_IRQ_guest(int irq)
     if ( action->ack_type == ACKTYPE_EOI )
     {
         sp = pending_eoi_sp(peoi);
-        ASSERT((sp == 0) || (peoi[sp-1].vector < vector));
+        if ( !((sp == 0) || (peoi[sp-1].vector < vector)) )
+        {
+            printk("*** Pending EOI error ***\n");
+            printk("  cpu #%u, irq %d, vector 0x%x, sp %d\n",
+                   smp_processor_id(), irq, vector, sp);
+
+            dump_peoi_stack(sp);
+            dump_peoi_records();
+            dump_lapic();
+
+            spin_unlock(&desc->lock);
+
+            assert_failed("(sp == 0) || (peoi[sp-1].vector < vector)");
+        }
+
         ASSERT(sp < (NR_DYNAMIC_VECTORS-1));
         peoi[sp].irq = irq;
         peoi[sp].vector = vector;
         peoi[sp].ready = 0;
         pending_eoi_sp(peoi) = sp+1;
         cpumask_set_cpu(smp_processor_id(), action->cpu_eoi_map);
+
+        peoi_debug_stack(PEOI_PUSH, sp, irq, peoi[sp].vector);
     }
 
     for ( i = 0; i < action->nr_guests; i++ )
@@ -1383,6 +1554,8 @@ static void flush_ready_eoi(void)
         if ( desc->handler->end )
             desc->handler->end(desc, peoi[sp].vector);
         spin_unlock(&desc->lock);
+
+        peoi_debug_stack(PEOI_POP, sp + 1, irq, peoi[sp].vector);
     }
 
     pending_eoi_sp(peoi) = sp+1;
@@ -1409,6 +1582,8 @@ static void __set_eoi_ready(struct irq_desc *desc)
     } while ( peoi[--sp].irq != irq );
     ASSERT(!peoi[sp].ready);
     peoi[sp].ready = 1;
+
+    peoi_debug_stack(PEOI_SETREADY, sp + 1, irq, desc->arch.vector);
 }
 
 /* Mark specified IRQ as ready-for-EOI (if it really is) and attempt to EOI. */
@@ -2276,7 +2451,7 @@ void free_domain_pirqs(struct domain *d)
     pcidevs_unlock();
 }
 
-static void dump_irqs(unsigned char key)
+void dump_irqs(unsigned char key)
 {
     int i, irq, pirq;
     struct irq_desc *desc;
@@ -2448,6 +2623,9 @@ void fixup_eoi(void)
 
     /* Flush the interrupt EOI stack. */
     peoi = this_cpu(pending_eoi);
+
+    peoi_debug_stack(PEOI_FLUSH, pending_eoi_sp(peoi), -1, -1);
+
     for ( sp = 0; sp < pending_eoi_sp(peoi); sp++ )
         peoi[sp].ready = 1;
     flush_ready_eoi();
diff --git a/xen/include/asm-x86/apic.h b/xen/include/asm-x86/apic.h
index 9d7ec93042..77a60f8ac1 100644
--- a/xen/include/asm-x86/apic.h
+++ b/xen/include/asm-x86/apic.h
@@ -149,6 +149,16 @@ static __inline bool_t apic_isr_read(u8 vector)
             (vector & 0x1f)) & 1;
 }
 
+static inline bool apic_tmr_read(u8 vector)
+{
+    return apic_read(APIC_TMR + ((vector & ~0x1f) >> 1)) >> (vector & 0x1f);
+}
+
+static inline bool apic_irr_read(u8 vector)
+{
+    return apic_read(APIC_IRR + ((vector & ~0x1f) >> 1)) >> (vector & 0x1f);
+}
+
 static __inline u32 get_apic_id(void) /* Get the physical APIC id */
 {
     u32 id = apic_read(APIC_ID);
@@ -161,8 +171,12 @@ int get_physical_broadcast(void);
 
 static inline void ack_APIC_irq(void)
 {
+    peoi_debug_apic(PEOI_ACK_PRE);
+
 	/* Docs say use 0 for future compatibility */
 	apic_write(APIC_EOI, 0);
+
+    peoi_debug_apic(PEOI_ACK_POST);
 }
 
 extern int get_maxlvt(void);
diff --git a/xen/include/asm-x86/irq.h b/xen/include/asm-x86/irq.h
index 4b39997f09..938e5ef6b5 100644
--- a/xen/include/asm-x86/irq.h
+++ b/xen/include/asm-x86/irq.h
@@ -27,6 +27,50 @@ typedef struct {
     DECLARE_BITMAP(_bits,NR_VECTORS);
 } vmask_t;
 
+struct peoi_dbg_record
+{
+    unsigned int seq;
+
+    enum peoi_dbg_type {
+        PEOI_PUSH,
+        PEOI_SETREADY,
+        PEOI_FLUSH,
+        PEOI_POP,
+
+        PEOI_IDLE,
+        PEOI_WAKE,
+        PEOI_ACK_PRE,
+        PEOI_ACK_POST,
+
+        PEOI_POWER,
+    } action;
+
+    union {
+        struct peoi_dbg_stack {
+            unsigned int sp, irq, vector;
+        } stack;
+
+        struct peoi_dbg_apic {
+            DECLARE_BITMAP(irr, NR_VECTORS);
+            DECLARE_BITMAP(isr, NR_VECTORS);
+            unsigned int ppr;
+        } apic;
+
+        struct peoi_dbg_power {
+            unsigned int state;
+        } power;
+    };
+};
+
+#define NR_PEOI_RECORDS 32
+DECLARE_PER_CPU(struct peoi_dbg_record, peoi_dbg[NR_PEOI_RECORDS]);
+DECLARE_PER_CPU(unsigned int, peoi_dbg_idx);
+
+void peoi_debug_stack(enum peoi_dbg_type action, unsigned int sp,
+                      unsigned int irq, unsigned int vector);
+void peoi_debug_apic(enum peoi_dbg_type action);
+void peoi_debug_power(enum peoi_dbg_type action, unsigned int state);
+
 struct irq_desc;
 
 struct arch_irq_desc {
-- 
2.19.1


--wsxcad2iikn7h63b
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--wsxcad2iikn7h63b--
