Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29275C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421863.1648132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDj-0003Ey-NT; Wed, 16 Sep 2026 11:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421863.1648132; Wed, 16 Sep 2026 11:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDj-0003Ep-Js; Wed, 16 Sep 2026 11:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1421863;
 Tue, 15 Sep 2026 14:17:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1x6Tyk-0002X0-Uk
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 14:17:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Tyj-007PK2-Sw
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 16:17:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6aa9537a-bab6-0a2a0a5309dd-0a2a4501ce8a-30
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 16:17:45 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6aa95388-5984-0a2a45010019-ac6904fea58c-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 16:17:45 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BDC386022A;
 Tue, 15 Sep 2026 14:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692041F000FF;
 Tue, 15 Sep 2026 14:17:40 +0000 (UTC)
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
	s=k20260515; t=1789481863;
	bh=OkMqESzdj+3RbY/kyt0I+HkaA6aNmsfECfxsjJo32bA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=Vgvg6Vf6N5nvwhVZWf8fGzDXd9ZlEfXfBBG/w2riqNn/dcr/s/Bb1Kjn5xCt4rLZO
	 /FNDQs2/ZLouDowbLTAoG+bOsccbO7s5T82+OyYwfcX6um3B/KUl0YlT8/pOC1v+5f
	 qfcdM1Uto9fEVYDQOYHZKjjKOlmt0lChn43XPsBWCwsrLtJFm1HSPrz2wnmJCfJh1M
	 iDY+pqsv0fXbc6ZC9p6/TRWvhMishNU4m7IfF0kyo4cmqOO3eYQhyXTS5cVMxD4cbH
	 zUx/KbsD7HuIXt8sdbPnV1BFxKYfT7hprxoA82Tbi0rgBmyLGJtCk7rqFPY/rZT2dM
	 tUhop+sx6hp9A==
Content-Type: multipart/mixed; boundary="===============5486250446856456697=="
MIME-Version: 1.0
Message-Id: <2bb91d9868e07bedd1bc7a167a661b1f41e691d975184209c7e617adf551651e@mail.kernel.org>
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-2-0ad30c4c5ee7@toxicpanda.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-2-0ad30c4c5ee7@toxicpanda.com>
Subject: Re: [PATCH RFC v3 02/13] rcu-tasks-trace: Inline rcu_read_lock_trace() and annotate inside the reader
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,neeraj.upadhyay@kernel.org,joelagnelf@nvidia.com,boqun@kernel.org,tglx@kernel.org,peterz@infradead.org,rostedt@goodmis.org,mhiramat@kernel.org,mark.rutland@arm.com,jolsa@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,paulmck@kernel.org,frederic@kernel.org,neeraj.upadhyay@kernel.org,joelagnelf@nvidia.com,boqun@kernel.org,tglx@kernel.org,peterz@infradead.org,rostedt@goodmis.org,mhiramat@kernel.org,mark.rutland@arm.com,jolsa@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com
Cc: luto@kernel.org,josh@joshtriplett.org,urezki@gmail.com,mathieu.desnoyers@efficios.com,jiangshanlai@gmail.com,qiang.zhang@linux.dev,jgross@suse.com,mcgrof@kernel.org,ihor.solodrai@linux.dev,linux-kernel@vger.kernel.org,rcu@vger.kernel.org,linux-trace-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,xen-devel@lists.xenproject.org,luto@kernel.org,josh@joshtriplett.org,urezki@gmail.com,mathieu.desnoyers@efficios.com,jiangshanlai@gmail.com,qiang.zhang@linux.dev,jgross@suse.com,mcgrof@kernel.org,ihor.solodrai@linux.dev,linux-kernel@vger.kernel.org,rcu@vger.kernel.org,linux-trace-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,xen-devel@lists.xenproject.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 15 Sep 2026 14:17:40 +0000 (UTC)
X-purgate-ID: tlsNG-d62444/1789481865-1FA6E757-4D996BDA/0/0
X-purgate-type: clean
X-purgate-size: 3513

--===============5486250446856456697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
> index 273c59a032512..4035054309d7c 100644
> --- a/include/linux/rcupdate_trace.h
> +++ b/include/linux/rcupdate_trace.h
> @@ -93,22 +93,20 @@ static inline void rcu_read_unlock_tasks_trace(struct srcu_ctr __percpu *scp)
>   *
>   * For more details, please see the documentation for rcu_read_lock().
>   */
> -static inline void rcu_read_lock_trace(void)
> +static __always_inline void rcu_read_lock_trace(void)
>  {
>  	int n;
>  	struct task_struct *t = current;
>
> -	rcu_try_lock_acquire(&rcu_tasks_trace_srcu_struct.dep_map);
>  	n = READ_ONCE(t->trc_reader_nesting);
>  	WRITE_ONCE(t->trc_reader_nesting, n + 1);
> -	if (n) {
> -		// In case we interrupted a Tasks Trace RCU reader.
> -		return;
> -	}
> -	barrier();  // nesting before scp to protect against interrupt handler.
> -	t->trc_reader_scp = __srcu_read_lock_fast(&rcu_tasks_trace_srcu_struct);
> -	if (!IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB))
> -		smp_mb(); // Placeholder for more selective ordering
> +	if (!n) {
> +		barrier();  // nesting before scp to protect against interrupt handler.
> +		t->trc_reader_scp = __srcu_read_lock_fast(&rcu_tasks_trace_srcu_struct);
> +		if (!IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB))
> +			smp_mb(); // Placeholder for more selective ordering
> +	} // Else we interrupted a Tasks Trace RCU reader.
> +	rcu_try_lock_acquire(&rcu_tasks_trace_srcu_struct.dep_map);
>  }
>
>  /**
> @@ -120,12 +118,13 @@ static inline void rcu_read_lock_trace(void)
>   *
>   * For more details, please see the documentation for rcu_read_unlock().
>   */
> -static inline void rcu_read_unlock_trace(void)
> +static __always_inline void rcu_read_unlock_trace(void)
>  {
>  	int n;
>  	struct srcu_ctr __percpu *scp;
>  	struct task_struct *t = current;
>
> +	srcu_lock_release(&rcu_tasks_trace_srcu_struct.dep_map);
>  	n = READ_ONCE(t->trc_reader_nesting) - 1;
>  	if (n) {
>  		WRITE_ONCE(t->trc_reader_nesting, n);
> @@ -137,7 +136,6 @@ static inline void rcu_read_unlock_trace(void)
>  			smp_mb(); // Placeholder for more selective ordering
>  		__srcu_read_unlock_fast(&rcu_tasks_trace_srcu_struct, scp);
>  	}
> -	srcu_lock_release(&rcu_tasks_trace_srcu_struct.dep_map);
>  }

This isn't a bug, but the changelog notes that rcu_read_lock_tasks_trace()
already annotates inside the reader "on the lock side" and then says "Make
the trace variants match."

rcu_read_unlock_tasks_trace(), four functions above the changed code in the
same header, still calls srcu_lock_release() after __srcu_read_unlock_fast(),
i.e. the exact ordering being corrected in rcu_read_unlock_trace().

After this patch the two unlock helpers in the file disagree. This has no
functional effect (srcu_lock_release() is a lockdep annotation and compiles
away without CONFIG_DEBUG_LOCK_ALLOC), but would it be worth either flipping
rcu_read_unlock_tasks_trace() the same way, or saying in the changelog why
only the rcu_read_{,un}lock_trace() pair is being changed?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/34975311706
--===============5486250446856456697==--

