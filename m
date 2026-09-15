Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020B7C982C5
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421865.1648137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDj-0003Kl-WB; Wed, 16 Sep 2026 11:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421865.1648137; Wed, 16 Sep 2026 11:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDj-0003K8-Ql; Wed, 16 Sep 2026 11:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1421865;
 Tue, 15 Sep 2026 14:17:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1x6Tyo-0002Yo-Fl
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 14:17:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Tyn-002pto-Sl
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 16:17:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6aa9538a-2eae-0a2a0a5409dd-0a2a4502a9e8-26
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 16:17:49 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6aa9538c-6ca4-0a2a45020019-ac6904feb846-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 16:17:49 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F66E602C2;
 Tue, 15 Sep 2026 14:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C088A1F00893;
 Tue, 15 Sep 2026 14:17:44 +0000 (UTC)
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
	s=k20260515; t=1789481868;
	bh=rJvpLOWtutAdyJcIT4Epm9F/ufbvJwi0dK09wh/lipY=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=b5hKV+gKFGEYB++V/g0LCzL6EdpH+9azJH56tU91B+MKNmFVYfcfubRI+Z6jUwjfZ
	 SEgnOeBs3bmkgqS7C1Kidx46+6Kxlpini01Qx0s2uUnpLOI7mdUSrPeOa7Y8lWQwY/
	 btfzDnYi+pjxUhgfSmgahplYapkq5Em2dbm/YNQOGAaK8WFvoovMEXiE7Xnr5EIpTo
	 8T6NeN//BDqwnyiMsnnAdm0lV97sGWugDZOU071h2RnNzNKJGDyAPMaQLiNiRqiaHf
	 B+gACGttwahZzLIHSCmZ+UYbizeNXEZ+OsDwsHi8Uan3ZCzG/CrX19BajbqyLIeDGI
	 ohwSxRnyNQGUw==
Content-Type: multipart/mixed; boundary="===============3131281285391241463=="
MIME-Version: 1.0
Message-Id: <c3244a34236665e0602fc3f0b56fb74cd94e8f741d4946749ca9c67578acf2ee@mail.kernel.org>
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-1-0ad30c4c5ee7@toxicpanda.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-1-0ad30c4c5ee7@toxicpanda.com>
Subject: Re: [PATCH RFC v3 01/13] entry: Pass pt_regs to irqentry_exit_cond_resched()
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,neeraj.upadhyay@kernel.org,joelagnelf@nvidia.com,boqun@kernel.org,tglx@kernel.org,peterz@infradead.org,rostedt@goodmis.org,mhiramat@kernel.org,mark.rutland@arm.com,jolsa@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,paulmck@kernel.org,frederic@kernel.org,neeraj.upadhyay@kernel.org,joelagnelf@nvidia.com,boqun@kernel.org,tglx@kernel.org,peterz@infradead.org,rostedt@goodmis.org,mhiramat@kernel.org,mark.rutland@arm.com,jolsa@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com
Cc: luto@kernel.org,josh@joshtriplett.org,urezki@gmail.com,mathieu.desnoyers@efficios.com,jiangshanlai@gmail.com,qiang.zhang@linux.dev,jgross@suse.com,mcgrof@kernel.org,ihor.solodrai@linux.dev,linux-kernel@vger.kernel.org,rcu@vger.kernel.org,linux-trace-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,xen-devel@lists.xenproject.org,luto@kernel.org,josh@joshtriplett.org,urezki@gmail.com,mathieu.desnoyers@efficios.com,jiangshanlai@gmail.com,qiang.zhang@linux.dev,jgross@suse.com,mcgrof@kernel.org,ihor.solodrai@linux.dev,linux-kernel@vger.kernel.org,rcu@vger.kernel.org,linux-trace-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,xen-devel@lists.xenproject.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 15 Sep 2026 14:17:44 +0000 (UTC)
X-purgate-ID: tlsNG-720697/1789481869-317CA2AC-B009F15F/0/0
X-purgate-type: clean
X-purgate-size: 1894

--===============3131281285391241463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 2c64b388f6164..3d85035f5624f 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c

[ ... ]

> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index 0bb6c03481fad..b811b469b0a77 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -346,21 +346,21 @@ typedef struct irqentry_state {
>   *
>   * Conditional reschedule with additional sanity checks.
>   */
> -void raw_irqentry_exit_cond_resched(void);
> +void raw_irqentry_exit_cond_resched(struct pt_regs *regs);

Should the kernel-doc block above this declaration be updated with an
@regs parameter description? Every other function in this header that
takes a regs argument documents it (for example, irqentry_enter_from_
kernel_mode's block has "* @regs:	Pointer to currents pt_regs").

Also, the kernel-doc block documents "irqentry_exit_cond_resched" but the
prototype is "raw_irqentry_exit_cond_resched" - that mismatch currently
prevents kernel-doc from checking the parameter list, so adding @regs
wouldn't trigger a warning yet, but it would make the documentation
complete for readers of the header.

[ ... ]

> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index e3d381fd3d251..e4acd50bd81a1 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/34975311706
--===============3131281285391241463==--

