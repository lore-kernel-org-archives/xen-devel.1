Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D59DC88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421867.1648143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDk-0003R0-8S; Wed, 16 Sep 2026 11:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421867.1648143; Wed, 16 Sep 2026 11:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDk-0003PS-1q; Wed, 16 Sep 2026 11:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1421867;
 Tue, 15 Sep 2026 14:17:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1x6Tyt-0002ZP-NE
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 14:17:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Tyt-007PNe-3q
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 16:17:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6aa9537f-bab6-0a2a0a5309dd-0a2a4507d13a-46
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 16:17:55 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6aa95391-b4ea-0a2a45070019-aceafc1f8a26-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 16:17:54 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AA57444FB;
 Tue, 15 Sep 2026 14:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615571F000FF;
 Tue, 15 Sep 2026 14:17:49 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="In-Reply-To:References:Subject:From:To:Cc:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481872;
	bh=dlifTzsU870ATuTg2IJn/IPrNft0aFbK+vPgKDTS1dk=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=NcJKS+kV0GgjRC3ooOQJBaPV2jeb6Y3d7UL4KriHUw2PKdKGn7mKEA7SMmMWfIlqt
	 bc5DtxknhNCYHW85dgnR0O1wnuoYHGcJ4C0AiZgmu+fz+2klekeelQG3tQy3kn6mb+
	 Bxu2osCJ/9PVurBc5hIFiJw9HG5D0gNBBXFktBxTe2x/6bGUzUrFRDlIdugN52I3XS
	 6ljxmdn9PqqOpms/XSTRgW4rIXZ4KadYi1RlA823W0VzXI7FxNHwHs5eMtMxi15qv5
	 /tajIopVGIHRQEKBrIrFfINbf3r5PbFrdZhzKSzVcNP89nB8SMq97bnqwcqNM7l/MA
	 5l0+g0xX/gTig==
Content-Type: multipart/mixed; boundary="===============7591369071524205309=="
MIME-Version: 1.0
Message-Id: <08596bcdd997ab7122dafdb363cf80caaf038378f32ccb89fbca114c2fd9110a@mail.kernel.org>
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-5-0ad30c4c5ee7@toxicpanda.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-5-0ad30c4c5ee7@toxicpanda.com>
Subject: Re: [PATCH RFC v3 05/13] ftrace: Mark modules hosting direct-call trampolines for Tasks RCU
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,neeraj.upadhyay@kernel.org,joelagnelf@nvidia.com,boqun@kernel.org,tglx@kernel.org,peterz@infradead.org,rostedt@goodmis.org,mhiramat@kernel.org,mark.rutland@arm.com,jolsa@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,paulmck@kernel.org,frederic@kernel.org,neeraj.upadhyay@kernel.org,joelagnelf@nvidia.com,boqun@kernel.org,tglx@kernel.org,peterz@infradead.org,rostedt@goodmis.org,mhiramat@kernel.org,mark.rutland@arm.com,jolsa@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com
Cc: luto@kernel.org,josh@joshtriplett.org,urezki@gmail.com,mathieu.desnoyers@efficios.com,jiangshanlai@gmail.com,qiang.zhang@linux.dev,jgross@suse.com,mcgrof@kernel.org,ihor.solodrai@linux.dev,linux-kernel@vger.kernel.org,rcu@vger.kernel.org,linux-trace-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,xen-devel@lists.xenproject.org,luto@kernel.org,josh@joshtriplett.org,urezki@gmail.com,mathieu.desnoyers@efficios.com,jiangshanlai@gmail.com,qiang.zhang@linux.dev,jgross@suse.com,mcgrof@kernel.org,ihor.solodrai@linux.dev,linux-kernel@vger.kernel.org,rcu@vger.kernel.org,linux-trace-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,xen-devel@lists.xenproject.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 15 Sep 2026 14:17:49 +0000 (UTC)
X-purgate-ID: tlsNG-ef75cf/1789481874-370DDAE4-84E6386A/0/0
X-purgate-type: clean
X-purgate-size: 6027

--===============7591369071524205309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/module.h b/include/linux/module.h
> index 96cc98568eea5..28488687cb01f 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -521,6 +521,13 @@ struct module {
>  	unsigned int num_ftrace_callsites;
>  	unsigned long *ftrace_callsites;
>  #endif
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> +	/*
> +	 * An ftrace direct-call trampoline lives in this module's text; see
> +	 * rcu_tasks_trampoline_text().  Sticky once set.
> +	 */
> +	bool ftrace_direct_tramp;
> +#endif

This isn't a bug, but could the field and ftrace_direct_mark_module()'s
body be gated on CONFIG_TASKS_RCU_TRAMPOLINE_READERS instead? The only
reader of module::ftrace_direct_tramp is rcu_tasks_trampoline_text(),
which lives inside kernel/rcu/tasks.h's CONFIG_TASKS_RCU_TRAMPOLINE_READERS
block:

kernel/rcu/tasks.h:rcu_tasks_trampoline_text() {
#ifdef CONFIG_MODULES
    scoped_guard(rcu) {
        struct module *mod = __module_text_address(ip);

        if (mod) {
            ret = kprobe_in_optimized_region(ip);
#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
            ret = ret || READ_ONCE(mod->ftrace_direct_tramp);
#endif
        }
    }
#endif
}

On every configuration that does not select HAVE_RCU_TRAMPOLINE_READERS
the per-module bool and the four ftrace_direct_mark_module() call sites
that write it have no consumer.

> diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> index 8667684628500..ec54a27e47fae 100644
> --- a/kernel/rcu/tasks.h
> +++ b/kernel/rcu/tasks.h

[ ... ]

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 53d5db60bfa56..efc4a518658a3 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c

[ ... ]

> @@ -6090,6 +6113,17 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
>   * and save the parameters of the function being traced, and restore them
>   * (or inject new ones if needed), before returning.
>   *
> + * Nothing but Tasks RCU keeps the trampoline at @addr alive while a task is
> + * executing it or is preempted in something it called.  On architectures that
> + * select HAVE_RCU_TRAMPOLINE_READERS, Tasks RCU only waits for such a task if
> + * it is a Tasks Trace RCU reader, so the trampoline must enter one
> + * (rcu_read_lock_trace() or its assembly equivalent, see
> + * samples/ftrace/ftrace-direct.h) before calling out and leave it before
> + * returning, as the ftrace and BPF trampolines do.  The few instructions

This isn't a bug, but would it read better to point at the sample header
only once it exists in the tree, or to word the ftrace/BPF trampoline
part as what the series establishes rather than as current state? The new
kernel-doc paragraph points readers at samples/ftrace/ftrace-direct.h,
which does not exist at this commit (it is added later in the series by
'samples: ftrace: Make the direct-call trampolines Tasks Trace readers'),
and states in the present tense that the ftrace and BPF trampolines
already take the reader, which also only becomes true in later commits of
the series (bpf/x86/arm64 reader patches). Anyone reading or bisecting at
this commit gets a dangling reference and a claim the tree does not yet
satisfy.

> + * before and after are covered by the irq-exit check: automatically for
> + * trampolines outside kernel and module text (e.g. BPF images), and via
> + * ftrace_direct_mark_module() for trampolines in module text.
> + *
>   * Returns:
>   *  0 on success
>   *  -EINVAL  - The @ops object was already registered with this call or

[ ... ]

commit ef57b52d2606546f6d483b113fc2202c13863c2c
Author: Josef Bacik <josef@toxicpanda.com>

>     ftrace: Mark modules hosting direct-call trampolines for Tasks RCU
>
>     An out-of-line direct trampoline registered with register_ftrace_direct()
>     is kept alive only by Tasks RCU while a task executes it or is preempted
>     in something it called; ftrace_shutdown()'s synchronize_rcu_tasks() is
>     what stops rmmod freeing it under such a task.  Where Tasks RCU is built
>     on reader-marked trampolines, such a trampoline must be a Tasks Trace
>     reader across its call-out like the ftrace and BPF trampolines are, so
>     document that in register_ftrace_direct().
>
>     That still leaves the few instructions before the reader is entered and
>     after it is left.  For BPF images those are in dynamically allocated
>     text that rcu_tasks_trampoline_text() already treats as unmarked
>     trampoline text, but the in-tree samples (and any similar user) place
>     their trampolines in module .text.  Add a sticky
>     module::ftrace_direct_tramp flag, set by every register/modify path when
>     the direct address is module text, and have rcu_tasks_trampoline_text()
>     treat a task interrupted anywhere in such a module as a potential
>     holdout.  Other modules' text is unaffected.
>
>     Assisted-by: LLM
>     Signed-off-by: Josef Bacik <josef@toxicpanda.com>

This looks like a bug fix for reader-marked trampoline support. Should
this include:

  Fixes: 00bd9b746f5e ("rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines")

The bug was introduced in commit 00bd9b746f5e which added
rcu_tasks_trampoline_text() but failed to properly handle module .text
containing direct trampolines. The function returned false for module
text addresses, meaning such trampolines were not protected by Tasks RCU,
potentially allowing module text to be freed while still executing.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/34975311706
--===============7591369071524205309==--

