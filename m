Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9355FC982E2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425492.1649392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7ZuO-00044L-6t; Fri, 18 Sep 2026 14:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425492.1649392; Fri, 18 Sep 2026 14:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7ZuO-00044E-3q; Fri, 18 Sep 2026 14:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1425492;
 Fri, 18 Sep 2026 14:49:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7ZuN-000447-7x
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:49:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7ZuL-005x6C-O0
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:49:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f65-8faa-0a2a0a5109dd-0a2a45088c44-48
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:45 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f88-f659-0a2a45080019-4a7de68cfae6-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:45 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-91235f46716so8083386d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:49:45 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91257f2e58asm14263116d6.2.2026.09.18.07.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 07:49:42 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789742984; x=1790347784; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOvKZ7jMCmx8fIKUFee0Ich1k1yQqSbNT6X8Lv9nECM=;
        b=APX8OvT7pkb9r7E39tTToae961z+AnlcLyY69YsWoZINiweiy/ZJTavI8uW+UoG5Qq
         D++trAMnf8MO/8eIM5qjawIShA094oHg0Xs0RClr4s9L5Tc83W8TxU9AEkypt4GFn95v
         Hm0Kw4jgw19MiyETH9kLSLwrrYlE5gUUMJ+rayH/uR2VWOdIeA1EgQImm7aRUA3ZsIjC
         GqRxkM4H1Q4qVzOzSZHW90BTPYdaOXDIU2+LVqHKgOtZ8j/fYX4+mgwOFXxPCxuCqLg1
         dxdUinOkz8KPkzJ5lBsVBNbZvbUAZMKEaloqGWUmtVdOQHtGeGsQMwCRRi9+Vw1nAuXN
         sgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742984; x=1790347784;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOvKZ7jMCmx8fIKUFee0Ich1k1yQqSbNT6X8Lv9nECM=;
        b=ExbJKbTSnQP6mQ5jeJXd42VbKYCK95R3EuAOAR0OM6Gd/bXdtoFupj+EhRwK9AWywH
         M+0eoaOtVh0pWnsWwUcmMOnTHJm4ZIkP1ABfVF4XITLgztf3WCTl5jsgM2wKWiluzKuA
         cx+wx7sRa0j2SwzKOZkMtv9XUSUxXfg25jp9JWWGtS+MePmryFFgDBFO04oXApj+n/10
         jg9ObFiz4ZOdu9BNNDH56pDIVz72JaTbhA4RKycBfpwszVsKKGVedaBcegBmacVfsmbO
         WCsqVspYwiANovB/IawwHiM7fTK5BEKOMOLOJ71CkTW4xXcW3YJwOKLVdag8b+gHdNBR
         Ov6w==
X-Forwarded-Encrypted: i=1; AKwUvBy7qBeaMhKFd0TmQ15ggkfL63UuLiRME9NiiqXOnCj8AWMe6/WGYiTb6i1vPi+hd6ahFxcPVUO3Xb8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lV2w0JzCih7ytiEK4/+3k84W44KV6Jfj8/XC7Qo4ihjdaQC4ht
	hH3pQd0f7alAozib9lVWwsKtpKgEVH1nIOOVkSP3YRVpQ/Ko2Tl15yGJ8KgA/vLaoQw=
X-Gm-Gg: AYBFou2QCn3UH+Iss0fmNC8lW/Ju/lYfEpGAsDRp04b/CNdmfYcMz2AZLNYpiPqU3i2
	7vVW7YOBdq6W4/Uoy+3nbpClA9U/6UhIp1qmXYWnheAPnHSNYL6XS7WBKwoI0lHUMKEf4SGvEma
	IJvp4KC4iXnNp4YhaI/T+WNWHUxguG7OzHbWmD8Vfn6PKarvg8WiuZgEeS1RaLzSI1G/PONZGp2
	8iqhoIxPWxgisX7aIqiYfWnNejtrS7YzhxCu3UUSoTfG/X16P51yO9T0OFl/kbdtvJoX71XhK5I
	aR05kMOc5wUvOjNI+BaAt8PhuBayDnwN+MpQS+fnZ0+uZ434z5H8Q8z2nH3nzPVLpFibfg3LYzh
	wEALmnlRc0jx4+/4pp7k5rSqf6axpq56QCKjoQEJ52JSYp1dEMkOe008fCxkcIfgN3bDffF/GGj
	F4koQrHnQPTz8LLhePL3SMMv/7EcNmiWO46CxmyDQqFQRg3gnNPuOL1JmEvX1jUYfP4EQBr/YNC
	2odd7XYidgZ65WIMikoWCu24fVz3unDWXI1IrHwsdo/VTghLLvQBCOv
X-Received: by 2002:ad4:4ae2:0:b0:910:1989:a61a with SMTP id 6a1803df08f44-91254b8fdebmr32250336d6.9.1789742983465;
        Fri, 18 Sep 2026 07:49:43 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH RFC v4 00/13] rcu-tasks: build Tasks RCU on Tasks Trace
 readers in trampolines
Date: Fri, 18 Sep 2026 14:49:19 +0000
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBPrWoC/4XOwU7DMAwG4FeZciYsSd1O44Q0iQfgijg4jkszW
 NslWTU09d1Jw2USmzj6j/3lv4jIwXMUT6uLCDz56Ic+D/CwEtRh/8HSuzwLo0yjtlpJCzLQSSa
 Mn1GOgfkwJnmMEpRuW6ihqWkj8nV+av25yG/i9WUn3n/DeLJ7prSYy5rFyNIG7Klboq9xbWFdw
 lu/LBedj2kI36XxpAv/b7lJSyUdQLNtgUgr/ZyGs6cRe4ePNBxKuclcY/o+ZjLGiNhodsYh3MS
 qa6y+j1UZU+gqRUA18+YPNs/zD+q4d2SmAQAA
X-Change-ID: 20260910-b4-rcu-tasks-preempt-qs-401ff45465c7
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742979; l=12201;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=nVRI2iS5SJPI0UIAyaf7kiy21X18lzaxRK2+gPRlH0U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGSSszuFkwNYW13g7UbMZ/uKcGE7zBiDRtSatX6MTARbwezhPrC0ErVvu6KywLXNx40Pit80HwV
 IpJmIrJhiigM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1789742985-CD34D87B-970EB052/0/0
X-purgate-type: clean
X-purgate-size: 12203

v1: https://lore.kernel.org/all/20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com/
v2: https://lore.kernel.org/all/20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com/
v3: https://lore.kernel.org/all/20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com/

v3->v4:
- BPF: the reader is emitted by the x86-64/arm64 JIT around the
  fentry/fmod_ret and fexit regions instead of taken in the C glue (Alexei).
- An idle CPU only counts as quiescent while in an RCU EQS (Sashiko).
- Dropped the rcu_read_lock_trace() lockdep/inline patch; BPF CI bot nits.
v2->v3:
- Reworked per Alexei and Paul: trampolines take rcu_read_lock_trace(),
  and Tasks RCU on x86-64/arm64 becomes a per-CPU pass plus a Tasks Trace
  grace period instead of a new per-task counter.
v1->v2:
- Sashiko/AI review fixes, Paul's and Steve's comments (see v2 changelog).

What it does now:

Every trampoline whose lifetime Tasks RCU guards (ftrace_caller and its
copies, the optprobe template, BPF trampolines, out-of-line direct-call
trampolines) takes rcu_read_lock_trace() around its call-out, open-coded
in asm / by the JIT. That leaves the few trampoline instructions outside
the reader, the static ftrace stubs and x86 return thunks that carry a
trampoline address, and the kprobe jump-optimization window. A task can
only linger in those by being interrupted there, so on x86-64 and arm64
the Tasks RCU grace period becomes: wait for every CPU to pass through
__schedule() or sit in an EQS (the irq-exit preemption checks the
interrupted IP first and briefly makes a task caught in such text a
holdout), then synchronize_rcu_tasks_trace(), then one more pass for the
trailing instructions. It runs from the existing rcu_tasks kthread, so
call_rcu_tasks() and friends keep their names and callers; there is no
task-list scan and no dependence on voluntary context switches, and
cond_resched_tasks_rcu_qs() becomes unnecessary there. Other
architectures keep the classic implementation.

Testing is still QEMU: x86-64 PREEMPT_LAZY (PREEMPT_RCU=n) and
PREEMPT_DYNAMIC, PROVE_RCU, lockdep. synchronize_rcu_tasks() against a
30s in-kernel spinner is 20-70ms (classic: 29.7s), ftrace instance
teardown ~0.2s, optprobe register+unregister ~0.6s, the direct samples
cycle in about a second, and fentry+fexit attach/hammer/detach on
do_sys_openat2 and hrtimer_interrupt runs and detaches in 50-100ms with
the return-to-user reader assertion quiet. arm64 is build-tested;
hardware numbers for both are still owed.

Open questions:
 - Paul: whether an alternate gp_func on the rcu_tasks kthread is
   acceptable as the first step, with Frederic's core-RCU variant as the
   follow-on you suggested.
 - The open-coded reader is ~9 instructions each side in ftrace_caller and
   at four points in the BPF trampoline. rcu_read_lock_tasks_trace() would
   be shorter but needs a slot for the cookie.
 - CONFIG_TASKS_TRACE_RCU_NO_MB depends on RCU_EXPERT, so non-expert
   x86/arm64 builds get the smp_mb() in the reader despite
   ARCH_WANTS_NO_INSTR; the asm follows the C but that looks unintended.

--- Original email (v1) ---

Tasks RCU only treats a voluntary context switch, usermode or idle as a
quiescent state, because a preempted task may be sitting in a trampoline
that is about to be freed. That was a fine trade when PREEMPT_NONE
servers compiled Tasks RCU away and PREEMPT desktops rarely ran
long-lived in-kernel loops. PREEMPT_LAZY changes both halves at once:
Tasks RCU is now real on server configs, and cond_resched() is a no-op,
so a CPU-bound kthread or kworker only ever loses the CPU by being
preempted, which is exactly the event Tasks RCU refuses to count.

The way this showed up for us was a cgroup writeback worker draining a
very large cgwb for around eleven minutes on an arm64 box. Nothing wrong
with that on its own, but a BPF program detach on another CPU went
bpf_trampoline_update() -> ftrace_shutdown() -> synchronize_rcu_tasks()
while holding trampoline_mutex, forty-odd tasks piled up behind the
mutex, and the hung task detector panicked the machine. The kprobe jump
optimizer is worse in principle: it does synchronize_rcu_tasks() under
kprobe_mutex, text_mutex and cpus_read_lock(), so one long-running
kthread can stall static key updates and CPU hotplug for its whole run.
The current answer is to find each such loop and add
cond_resched_tasks_rcu_qs() to it, which is the kind of annotation
PREEMPT_LAZY was supposed to let us stop writing.

This series tries the other direction: have the trampolines say when a
task is inside them, so that a preemption anywhere else can be a
quiescent state.

 - task_struct grows an int, rcu_tramp_nesting. Every trampoline whose
   lifetime Tasks RCU guards increments it before calling out and
   decrements it before returning: ftrace_caller and its dynamic copies,
   the BPF trampoline (which drops it again around the call to the
   original function, since im->pcref covers that), the x86 optprobe
   template, and out-of-line register_ftrace_direct() trampolines. Only
   current writes it and nested users are balanced, so it is a plain
   non-atomic inc/dec, one load of current plus one RMW per entry/exit.

 - The inc/dec are inside the trampoline, so there is a window of a few
   instructions on each side where the count is zero but the task is in
   (or on its way into) trampoline text. Nothing there can be preempted
   synchronously, only from an interrupt, so the irq-exit preemption path
   looks at regs->ip and holds the count across preempt_schedule_irq()
   when the IP is somewhere the counter cannot cover: outside core and
   module text (all the dynamically allocated trampolines and slots), in
   the static ftrace stubs or the x86 return thunks that still hold a
   direct-call target, in a module that hosts its own direct trampoline,
   or inside the bytes after a kprobe that the jump optimizer may be
   about to rewrite (the one synchronize_rcu_tasks() user that is not
   about trampolines at all).

 - With those in place, rcu_tasks_classic_qs() also clears the holdout
   flag on a preemption when the count is zero, on architectures that
   opt in. x86-64 and arm64 do so here. Everyone else keeps the
   voluntary-only rule and is untouched apart from the (unused) field.

A running holdout already gets poked via rcu_request_urgent_qs_task(),
which makes the next tick set NEED_RESCHED, so with this the resulting
preemption retires it and a Tasks RCU grace period is bounded by roughly
a tick plus the longest preempt-off section rather than by the longest
stretch without a voluntary schedule().

Patches 1-12 are scaffolding and change no behaviour on their own; patch
13 flips the rule and selects the option for the two architectures.

Testing so far is QEMU only: x86-64, PREEMPT_LAZY with PREEMPT_RCU=n,
PROVE_RCU and lockdep, with and without PREEMPT_DYNAMIC. A kthread
spinning in-kernel for 30s with the function tracer, an ftrace kprobe,
an optimized kprobe and fentry/fexit programs attached:
synchronize_rcu_tasks() goes from 29.7s to 0.1-0.3s, tearing down a
DYNAMIC ftrace_ops (tracefs instance function -> nop) from 27s to
0.2-0.8s, and the ftrace-direct sample modules load, fire and unload in
about 2.5s each while the spinner runs, with no warnings and the new
return-to-user assertion quiet. arm64 is build-tested only at this
point; real hardware numbers for both are the obvious next step and I
did not want to sit on the idea waiting for them.

Things I would particularly like opinions on:

 - Whether hooking rcu_tasks_classic_qs() is the right place, or whether
   Paul would rather see this expressed differently inside Tasks RCU.
 - return_to_handler and the rethook/kretprobe trampolines are not
   instrumented. Their C callees take the ftrace recursion lock before
   touching any ops and the trampolines themselves are static text, so I
   believe they do not need it, but I would like Steven and Masami to
   confirm.
 - The register_ftrace_direct() contract change: out-of-line direct
   trampolines now have to maintain the count themselves (the samples
   are converted). I do not know of out-of-tree users beyond BPF, but
   this is the one place an existing user could be silently weakened.
 - Whether arm64 folks are comfortable with the ldr/add/str in
   ftrace_caller and the BPF trampoline, and with treating all of
   ftrace_caller as trampoline text for the IP check.
 - If this holds up, cond_resched_tasks_rcu_qs() and
   rcu_softirq_qs_periodic() become unnecessary on the opted-in
   architectures; I have not touched them here.

Based on v7.3-rc2+ (893e11787f78).

---
Josef Bacik (13):
      entry: Pass pt_regs to irqentry_exit_cond_resched()
      rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
      kprobes: Expose the optprobe jump window to Tasks RCU
      ftrace: Mark modules hosting direct-call trampolines for Tasks RCU
      x86/ftrace: Take a Tasks Trace reader around ftrace_caller's call-out
      x86/kprobes: Take a Tasks Trace reader in the optprobe template
      bpf, x86: Take a Tasks Trace reader in the trampoline around its call-outs
      arm64: ftrace: Take a Tasks Trace reader around ftrace_caller's call-out
      bpf, arm64: Take a Tasks Trace reader in the trampoline around its call-outs
      samples: ftrace: Make the direct-call trampolines Tasks Trace readers
      rcutorture: Make Tasks RCU readers Tasks Trace readers where required
      rcu-tasks-trace: Assert no reader is held on return to userspace
      x86, arm64: Build Tasks RCU on Tasks Trace readers in trampolines

 .../RCU/Design/Requirements/Requirements.rst       |  24 ++
 Documentation/RCU/checklist.rst                    |   7 +-
 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/kernel/asm-offsets.c                    |   8 +
 arch/arm64/kernel/entry-ftrace.S                   |  74 ++++
 arch/arm64/kernel/ftrace.c                         |  20 +
 arch/arm64/net/bpf_jit_comp.c                      |  90 ++++
 arch/x86/Kconfig                                   |   1 +
 arch/x86/kernel/asm-offsets.c                      |   8 +
 arch/x86/kernel/ftrace.c                           |  43 ++
 arch/x86/kernel/ftrace_64.S                        |  69 +++
 arch/x86/kernel/kprobes/opt.c                      |  44 ++
 arch/x86/kernel/vmlinux.lds.S                      |   4 +
 arch/x86/net/bpf_jit_comp.c                        | 113 +++++
 arch/x86/xen/enlighten_pv.c                        |   2 +-
 include/linux/irq-entry-common.h                   |  15 +-
 include/linux/kprobes.h                            |   8 +-
 include/linux/module.h                             |   7 +
 include/linux/rcupdate.h                           |  24 +-
 include/linux/rcupdate_trace.h                     |   7 +
 include/linux/sched.h                              |   1 +
 kernel/entry/common.c                              |  14 +-
 kernel/fork.c                                      |   1 +
 kernel/kprobes.c                                   |  50 +++
 kernel/rcu/Kconfig                                 |  28 +-
 kernel/rcu/rcutorture.c                            |  10 +
 kernel/rcu/tasks.h                                 | 476 ++++++++++++++++++++-
 kernel/rcu/update.c                                |   2 +
 kernel/trace/ftrace.c                              |  39 ++
 samples/ftrace/ftrace-direct-modify.c              |   9 +
 samples/ftrace/ftrace-direct-multi-modify.c        |   9 +
 samples/ftrace/ftrace-direct-multi.c               |   5 +
 samples/ftrace/ftrace-direct-too.c                 |   5 +
 samples/ftrace/ftrace-direct.c                     |   5 +
 samples/ftrace/ftrace-direct.h                     | 126 ++++++
 35 files changed, 1326 insertions(+), 23 deletions(-)
---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260910-b4-rcu-tasks-preempt-qs-401ff45465c7

Best regards,
--  
Josef Bacik <josef@toxicpanda.com>


