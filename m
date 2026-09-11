Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB8CC88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416853.1645765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51wp-00057B-V7; Fri, 11 Sep 2026 14:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416853.1645765; Fri, 11 Sep 2026 14:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51wp-000574-SI; Fri, 11 Sep 2026 14:09:47 +0000
Received: by outflank-mailman (input) for mailman id 1416853;
 Fri, 11 Sep 2026 14:09:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51wo-00056x-Fv
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:09:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51wn-008feO-Mo
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:09:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40ba3-8faa-0a2a0a5109dd-0a2a4505898e-14
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:09:45 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40ba8-4cb1-0a2a45050019-d15580afdcbc-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:09:45 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-855c26cf490so5669817b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:09:45 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939ecc38105sm175654485a.4.2026.09.11.07.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:09:42 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135784; x=1789740584; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HYwKQGYnNu1I2ntnnDPNcKeVNgWeStLdN/CP2LgAeVM=;
        b=YMbZcthMhEPDFz7GnZTWT73rNpznfhRNsNniL9Po7g/Z+t70OZizTf2R0i8cUXXMZJ
         ala+jZBMWaSwTK5lsfkpVRgt0dxO0vyIENec3Es293xbOf1orcv6eApeMQ7uhgyjzYxV
         DAzmhaA8qe+hiA+LqXnYmMk4LffdMfJCa5y/VoVAhJJlF3LKynN+ZCBNOLU9brkHh59Y
         yt3mMcn0GNefE/aUpFOoxQhx9/Mvf9vGatT2cMt6T0DwY7Jia1XGlrD6uB76xvyp96XS
         VMD00PJHYDuwiJdsB4bHWuFodAymO0fLc9J2wDF3+3rzwQLjvLDshT73/wkVBf0NpQ1s
         jwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135784; x=1789740584;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HYwKQGYnNu1I2ntnnDPNcKeVNgWeStLdN/CP2LgAeVM=;
        b=VN10vIgmoDiJI4TimDLwz8hpIWgDArQtrBHV14fTQMOIQUkmQTc3xLKfrqSZwtJFir
         80wlGy4kBM6KlKYkTL3mK1+p8a8FrNKhlNLqUKPcxfbkh7ZiBO1VkV1sJ6bWwV3Vg1Oy
         bHgwBrxNfNDECzLURjpjE8KbNAP+w2BSCK03RRpeA9WZmXUC7bt+L59XM3FXyA//D7Ny
         9AQF0/4276lRZxwoV6JfzMsnwghZhuBfnTQUMk9CGYf6JhckKy6/OHliKHfSBmRfEb/r
         WR3g89pHbJFSHBMVv5nGDINWUQ4aP4g82L667RwNuf4khSWmzYgqk6WXMpuv4OPYkfJr
         7qyg==
X-Forwarded-Encrypted: i=1; AKwUvBw+vuZt/8JUdL2F8S2X7TbvIXOlKnRg+LRZRG6ZZPBktDAR3QNbokmnd3NxRSokE+4Eq7pcJI6Zq+s=@lists.xenproject.org
X-Gm-Message-State: AFuF++nHla9ehVkFTW9jks5m3JUdM0dFRT98TFcEOIOcOERc4JP0/1jf
	6CqtbK0i7I61fEimxznG9DOd4PF8dLB52QMkOFHXD1HQX2p/Gyy4EDgEyas3kCvt4gE=
X-Gm-Gg: AYBFou2k+I2zZLO7Me7WJYSTIIsmcnSjw8r0OKovq8y64Z6YVqvTLv9zf+Qs62v9I9Q
	PRHHxkPvo/AXf+HfbRYDz8NzCZYV8T8hbU7vQbpDEgwq7urJU2jKlRAY7Nmj9JVrUz+JjfKATqn
	sxw0Hrlqn1Fgtql1PiL8vI5nyNidsV08vGliRZvMVIRllUqtts67gbg7oq55k4U5vaq9V8HvIBH
	EsiOKOPPZfZlqr7orDXIQqfCTEWM0Jw+acoryWW9mvcflMngScMwZLZ/9iAyLPQvb2uyPybyPLi
	i4/GF1ZtlfjYnuvR1/aJgGQ5i0/MSEy5UP+b8bG8b4cOTN5PK3c5TDTGvpWhlZQ510JcOqoAL9Z
	p5eaTr2qxl5hYTyoq/qs76BhEFgoOi//XkSEv2SUjt2vfgCkSWXxYl5f9CJ/NOCiKqH8qjGd0c1
	/XsluY9W92fR5yH7LZB6G2e+aIVr2sEzUhxJf94zd8MSlr32Wh470AWgQXF5jzOoJPv7mBE3gt+
	lcedu4BSh/LGsSesn8YLrYkY7m0WlRcFyA0MM7UYtRVf+LicEfQrlH0
X-Received: by 2002:a05:690c:397:b0:869:1ab2:33aa with SMTP id 00721157ae682-884afd12eb1mr15658867b3.20.1789135783644;
        Fri, 11 Sep 2026 07:09:43 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH RFC v2 00/15] rcu-tasks: let preemption outside trampolines
 be a quiescent state
Date: Fri, 11 Sep 2026 14:08:38 +0000
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGgLpGoC/4WOzQ6CMBCEX8Xs2ZWWFAyeTEx8AK+GQ7sUqT+A3
 UowhHcX8GricWZnvp0B2HpnGXarAbztHLumnkS8XgFVur5YdMWkIRZxKjIp0Cj09MKg+cbYems
 fbcAnoxKyLFWi0oS2MLWnU+n6hXyG0/EA+dfkl7laCjNzjhnNFo3XNVWzdW8jo6LF/PVlblSOQ
 +Pfy+JOLvi/4zqJAgul0qxURFLIfWh6R62uC72h5gH5OI4f1jKPpQwBAAA=
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
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=9888;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ciq/+qqHqSRSh7FRYtq3aWelW6Wh5G33c0OaJbqUUSk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAo5VaRxmnCLTA74sHK3/IXlJk4maBdHJ/o8BcYQaWxLTsL0V/6t0pY/lmq70yYasPVK7mviH+F
 JmwKt5LbXdQw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1789135785-716AD2A1-390F1705/0/0
X-purgate-type: clean
X-purgate-size: 9890

v1: https://lore.kernel.org/all/20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com/

v1->v2:
- Only walk the kprobe hash while the optimizer is actually waiting (Sashiko).
- Re-check the kprobe jump window at every QS decision instead of once at
  preemption time (AI review).
- Updated Documentation/RCU for the new rule (AI review).
- Added 14/15 and 15/15 to address Paul's comments.
- Added a comment in trace_recursion.h per Steve.
- No change for the arm64 ftrace_static_tramp_end report, the Kconfig
  dependency already covers it (Sashiko).
- Re-ran the x86-64 QEMU tests, still 0.2-0.3s and clean.

--- Original email ---

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
Josef Bacik (15):
      rcu-tasks: Add per-task trampoline nesting count
      entry: Pass pt_regs to irqentry_exit_cond_resched()
      rcu-tasks: Hold trampoline nesting across irq-exit preemption in trampoline text
      kprobes: Let Tasks RCU recognise tasks preempted in an optprobe jump window
      ftrace: Mark modules hosting direct-call trampolines for Tasks RCU
      x86/ftrace: Maintain Tasks RCU trampoline nesting in ftrace_caller
      x86/kprobes: Maintain Tasks RCU trampoline nesting in the optprobe template
      bpf, x86: Maintain Tasks RCU trampoline nesting in the BPF trampoline
      arm64: ftrace: Maintain Tasks RCU trampoline nesting in ftrace_caller
      bpf, arm64: Maintain Tasks RCU trampoline nesting in the BPF trampoline
      samples: ftrace: Maintain Tasks RCU trampoline nesting in direct-call trampolines
      rcutorture: Bracket Tasks RCU readers with trampoline nesting
      rcu-tasks: Treat preemption outside trampolines as a quiescent state
      rcu-tasks: Retire switched-out tasks with no trampoline nesting at scan time
      rcu-tasks: Kick running holdouts through the scheduler

 .../RCU/Design/Requirements/Requirements.rst       |  28 +++-
 Documentation/RCU/checklist.rst                    |   8 +-
 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/kernel/asm-offsets.c                    |   3 +
 arch/arm64/kernel/entry-ftrace.S                   |  35 +++++
 arch/arm64/kernel/ftrace.c                         |  16 +++
 arch/arm64/net/bpf_jit_comp.c                      |  46 +++++++
 arch/x86/Kconfig                                   |   1 +
 arch/x86/kernel/asm-offsets.c                      |   3 +
 arch/x86/kernel/ftrace.c                           |  37 ++++++
 arch/x86/kernel/ftrace_64.S                        |  43 +++++++
 arch/x86/kernel/kprobes/opt.c                      |  20 +++
 arch/x86/kernel/vmlinux.lds.S                      |   4 +
 arch/x86/net/bpf_jit_comp.c                        |  43 +++++++
 arch/x86/xen/enlighten_pv.c                        |   2 +-
 include/linux/irq-entry-common.h                   |  14 +-
 include/linux/kprobes.h                            |   8 +-
 include/linux/module.h                             |   7 +
 include/linux/rcupdate.h                           |  86 ++++++++++++-
 include/linux/sched.h                              |   2 +
 include/linux/trace_recursion.h                    |  11 ++
 kernel/entry/common.c                              |  38 +++++-
 kernel/fork.c                                      |   2 +
 kernel/kprobes.c                                   |  46 +++++++
 kernel/rcu/Kconfig                                 |  17 ++-
 kernel/rcu/rcutorture.c                            |   6 +
 kernel/rcu/tasks.h                                 | 141 ++++++++++++++++++++-
 kernel/rcu/update.c                                |   2 +
 kernel/trace/ftrace.c                              |  39 ++++++
 samples/ftrace/ftrace-direct-modify.c              |   9 ++
 samples/ftrace/ftrace-direct-multi-modify.c        |   9 ++
 samples/ftrace/ftrace-direct-multi.c               |   5 +
 samples/ftrace/ftrace-direct-too.c                 |   5 +
 samples/ftrace/ftrace-direct.c                     |   5 +
 samples/ftrace/ftrace-direct.h                     |  64 ++++++++++
 35 files changed, 776 insertions(+), 30 deletions(-)
---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260910-b4-rcu-tasks-preempt-qs-401ff45465c7

Best regards,
--  
Josef Bacik <josef@toxicpanda.com>


