Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577E0C88E53
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 19:41:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419224.1646563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5Tav-00014l-0j; Sat, 12 Sep 2026 19:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419224.1646563; Sat, 12 Sep 2026 19:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5Tau-00014e-Sv; Sat, 12 Sep 2026 19:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1419224;
 Sat, 12 Sep 2026 19:41:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x5Tau-00014Y-6W
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 19:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5Tat-00BSlk-Jp
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 21:40:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa5aa95-e002-0a2a0a5209dd-0a2a4509d4ea-20
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 21:40:59 +0200
Received: from [209.85.161.52] (helo=mail-oo1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa5aaca-be1a-0a2a45090019-d155a134f100-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 21:40:59 +0200
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-6b1b3d7f10eso1664178eaf.3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 12:40:59 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5::])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6c0996dc5a6sm6404372eaf.6.2026.09.12.12.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 12:40:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242058; x=1789846858; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/mW9uIl4IQ84J3enCrJFqvgB+YMh25zxbJWRDQHZcYo=;
        b=s9hQD2Agz6C59mL3EABkZHvm5UCYEio8KSlEDEQ/eQ4qZiE2iQOgCTRgPfzl7qAAae
         T9PdhXQsg+KJ3Jm8z9P7egKdU3HPKkZMU0CiqRHYgHjjuWI6WQ600MRfjyqjGYxsa3az
         0AU+uJPz/sebB0repw5e6SjrOVGm7adwZ6uXoCx5ASTQnSiZLb4pXwfpUMJAjLqt3dE0
         OS1NNyvA/ctr3iFYLfYwD7ZgHJWzv+SYmwrUfSPo4q2HM7PZZcAbEX8Lt3eAktItDOhw
         TQ4TBtabpQvQkiRwUef25JgifEQtFw7KNpskgwN8jlof+YANn+gJ29SbM5jKhvzKew8o
         CWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242058; x=1789846858;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mW9uIl4IQ84J3enCrJFqvgB+YMh25zxbJWRDQHZcYo=;
        b=Ol5V39brexbOckxRZz4eRaSWGvo36j8MEcu0H1FwljpnqqkYhyPU1o8eKuzsRZiq8k
         coT9j05TjZcJoDCaIA7DdZPEBR3XkincB9bi6tojWgKZHvPs7wCSWRQGuca09Pyc7krt
         vLvEBoDXVNMyqd0R8ZaV090rlICPu6ScAkq3M2TgfcKW++utJiPrKv93qi86TeLO5Vpg
         YKmsbU32roO8p+fH+nDjcKOy+FjAfCSPXmRya5dQ0Ln+tOphryHxst3GHEMvZeTFPoIr
         K7MVxXKqOHhmzV6Nbr2XPDSF0jwnSjPZNPidWuHXQh2W8LArSvXjOCGdnrL0duJfqeur
         LDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOzindFgCCDkwLpaA/QstO9leStzBuMLRtrK2jmdyE8/ih02K3M1NDnRx/4+XI79w+kA3M8n4wgy0=@lists.xenproject.org
X-Gm-Message-State: AFuF++lnIPaLZ+Wfq6LaVtz3ogjA0amrTgCgHnWueIzfEGZ7bOBwvyXb
	i5JFDgGxADoD+7sVxOWOEC0yBovqruw9ZjbNGO6pw3af3I4PRHkPIpiY
X-Gm-Gg: AYBFou2ljoedUoTkEhAQZ+9im+0mvwQl1bsSzYCKMwRTpyFjSSQ5O+kWcRu1Cpf7/1G
	OqX5NfG7KbK9B8Ur8ftzbRtyigjzcWCbUsWyzOte3D5WX5ZhV3rjXkRagJRt1FS96+QhlgX9/Yc
	90Zqg5nPbPSkGjV9TDceUexR0fuDfNnXwCbQOklFqsTD2BGD0SdrH086fhPrKVaew0OLC8GkUk0
	XLMtAAWO+iBXdu5j/IoEPbPhZ3n/G32B0RynI1RZ4zcZAdo+ZHPOSSGQIsUKYHw7N+IfjR2p/5N
	+LqOIgRl13C4GvNIHoMXfUoa7hOoAYoKjWzTA+q4+UN0sw7RE44/J0fBPeirDR/mU14mUiHi9pp
	YHsRoWOX1JBYtgmHhC6+NOZb68QH0vJMbEgayBxtvAQ6EVg/ARNKIN4zvY0E55fPzBVB8oU1grY
	7PQRX09PwHkMW+FLTmD7Szx8nJWfyrfjc0jKoRvNkf/WsH2LyfejZPuYvQC3IoQ/Smv474BRIZY
	vLa8MHoiA81iYhS5X6fgdbqQktngjTvBLqup+nS3Glfm4orTAD1rh3ESmkFQ2O0CVd4cnaeuM8=
X-Received: by 2002:a05:6820:f034:b0:6c0:c954:e534 with SMTP id 006d021491bc7-6c0c9550c4dmr5760632eaf.38.1789242057820;
        Sat, 12 Sep 2026 12:40:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 12:40:55 -0700
Message-Id: <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
Cc: "Josef Bacik" <josef@toxicpanda.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <x86@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross" <jgross@suse.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <paulmck@kernel.org>
X-Mailer: aerc
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com> <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop> <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com> <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
In-Reply-To: <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
X-purgate-ID: tlsNG-bad1c0/1789242059-BDAC0034-D6DF696E/0/0
X-purgate-type: clean
X-purgate-size: 1388

On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
>
> In the old kernels, yes, we have current->trc_reader_nesting++.
> In the newer kernels, Tasks Trace RCU is instead implemented in terms
> of SRCU-fast, which instead increments per-CPU counters.  Which among
> other thins is a bit faster and does not need to hook into the scheduler.

old kernels? I'm confused.
rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
and then calls __srcu_read_lock_fast().

Are you talking about some RCU branch that you target for next merge window=
?

>
> So we have several ways forward:
>
> 1.	Revert the implementation of RCU Tasks Trace in terms of
> 	SRCU-fast, and use the existing current->trc_reader_nesting++,
> 	as you suggest.
>
> 2.	Deprecate RCU Tasks Trace entirely in favor of RCU Tasks
> 	augmented by rcu_tasks_trampoline_enter() and friends, as
> 	I was suggesting.
>
> 3.	Implement rcu_tasks_trampoline_enter() in terms of SRCU-fast,
> 	keeping the speedup, and put a synchronize_srcu() in the
> 	RCU Tasks grace-period mechanism.  This again deprecates
> 	RCU Tasks Trace entirely in favor of the augmented RCU Tasks.
>
> 4.	It is always good to explicitly state the apparent status quo,
> 	which involves redundant trampoline entry/exit overhead.
>
> 5.	As always, your additional ideas here!
>
> 							Thanx, Paul


