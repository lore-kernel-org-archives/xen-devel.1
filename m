Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFFCC982D8
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 21:26:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425910.1649600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7g6N-0007GQ-3S; Fri, 18 Sep 2026 21:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425910.1649600; Fri, 18 Sep 2026 21:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7g6N-0007GJ-0l; Fri, 18 Sep 2026 21:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1425910;
 Fri, 18 Sep 2026 21:26:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x7g6L-0007GB-UW
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 21:26:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7g6L-007EQD-BX
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 23:26:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aadac7a-bab6-0a2a0a5309dd-0a2a4504e610-16
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 23:26:33 +0200
Received: from [74.125.228.42] (helo=mail-pz2-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aadac87-b57f-0a2a45040019-4a7de42aa754-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 23:26:33 +0200
Received: by mail-pz2-f42.google.com with SMTP id
 41be03b00d2f7-cc1ceb47d55so264591a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:26:32 -0700 (PDT)
Received: from localhost ([153.61.198.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39e6cb427casm1165720a91.17.2026.09.18.14.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 14:26:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789766791; x=1790371591; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D3SEXFUxByL8NwUA0aascO5krkdBelJ+D590uzi7yTc=;
        b=UNHs+MiHd2nfXX+g1Zs+29XnW3IMxTi3uEwxBn/R7Ng/bUxqhK7x6VckNm7rmGWK+N
         ayqnrS0rvUgLu+C2eHUnAVYcHlIdp0MEJZE4trNybOaRR7HmzmA+X35UmTxYmK8GmEOO
         NitypRppCOg1SAVFqpRyp2bykY/l1JL0PQnykpy3iiVLi8pG2CAbVXaiN1LtXZ3ar9Cs
         /cwmYUBAIChYb3cmOmBEtJ+tDbfNUQm5TiFWnxEgXDgf4ZPGP3VwwK+ULgrwibdtWBgr
         9no/PT+4Tx85lhLmXaHNX3Kzf96g9h3WGs1s47CLcH8+ob8B1HK6AkWi/ItlwjwxnsTv
         eMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766791; x=1790371591;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3SEXFUxByL8NwUA0aascO5krkdBelJ+D590uzi7yTc=;
        b=o0Fkj1q1oxT5ubgcKt5DtIe67+H77F7Rw4OMMNWONHSk5I6+SbT0cFRCatvUh5q20i
         gbykyrdkXQz89kFNYOqXdebvtBrOwqAK1SAw1pwp/uupCZDxweFjqalX1zVlw2gCwaee
         qCreTVdof2Z8h3D1ykfyhUTRUJGtkpjxjeeGho7OOUvWbdcN/Hz3xy4OTbwq+EAcAvhC
         mG9RC82eEKqdHTADqmhHF24MBnuxmKXuZ3g91qfKU830YyoxSnGiqQ3qZhWGMvBK6Y38
         1HtYChPemH7RwdEDQ0n1tZiQR4h/JceCA0AEsHbxJ37QkECQcfQ7UQ7S7Bwsk5B3bKMb
         ct7A==
X-Forwarded-Encrypted: i=1; AKwUvBzWUoE4dvGrPoNmQZ0owMTmGzI/FnKzWtSk3WV+WBmz7PXe4i98vZhE14gU8uEFHVAtWx11Ydq9Ghc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mycoL0qf1mVONs/ZXFOdS074+pnqOTt4XjMsN0u7n8xYIVw4nm
	ilvIfwILdsoqc8Q8FbewkEH+A+fNfmQAHsdJ6l19Yoq6Huqov/X6tbm+
X-Gm-Gg: AYBFou1ZVTlYiMASB6Y2RzR4Tf6j3nZEsFBk9y0/TKs1vUhYbt3NsR8F8aVyJNHlfFy
	6U6xj0zTUWHLENJS2REyKOrtGeWGXSHtJhUKqm8qW0jCqrB+s9ztn51u+j89zrmFu9fL6hVJRCZ
	afmSl9ZivwyBX5FWxAd1hVkt5Msu1WKhWaugJgDl8UWIizWFXJA+3jhjwzbbnunrwLmb774yQ72
	LKKGJgkNEmO/94N5UzngcyvS0L+EpzrxW8kuQ3GiRRNyyByNs8zhMof7o4JRcB111ij3a3ye9XM
	AnulYdZyZ6O6U1c+HGSgv429yohTgOZiZ8oUavvwgcAbZDsN8qkjnApxPmDYlGTipuQ2n05dzWj
	GoGhO/oAmgzFuj2o93TsWOLaHvtzaF1BVih4nmVf05KeiEQCWE114oPgYti5kTIZ7DT6EvtKB9q
	VwXpwXCuA38qjCYvnpjWMEZWWw7+4KBdBHoo2iVpfkQy5DlkRhRH+5r2emE0bfox8yULuFeKhum
	JQ+bDL7rumYdD+WXDBBq4eZ3xSmFILbsnyZw12HtVJ4utx+JyvFhvoQg4BIIWE2OjyuIypYkOA3
	kEgH
X-Received: by 2002:a17:90b:2584:b0:39e:6c68:fd89 with SMTP id 98e67ed59e1d1-39e6c68feb9mr902813a91.30.1789766791008;
        Fri, 18 Sep 2026 14:26:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 21:26:29 +0000
Message-Id: <DLIRDKA6G2IQ.2Q62BXX7CJWIW@gmail.com>
Subject: Re: [PATCH RFC v4 07/13] bpf, x86: Take a Tasks Trace reader in the
 trampoline around its call-outs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj
 Upadhyay" <neeraj.upadhyay@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 <x86@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu
 Kuohai" <xukuohai@huaweicloud.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj
 Upadhyay" <neeraj.upadhyay@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 <x86@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu
 Kuohai" <xukuohai@huaweicloud.com>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Josh Triplett"
 <josh@joshtriplett.org>, "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross"
 <jgross@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>, "Andy Lutomirski" <luto@kernel.org>,
 "Josh Triplett" <josh@joshtriplett.org>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Lai Jiangshan" <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>,
 "Juergen Gross" <jgross@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com> <20260918-b4-rcu-tasks-preempt-qs-v4-7-63f0e9d69661@toxicpanda.com>
In-Reply-To: <20260918-b4-rcu-tasks-preempt-qs-v4-7-63f0e9d69661@toxicpanda.com>
X-purgate-ID: tlsNG-ebf023/1789766793-C10DDB50-9A27AA68/0/0
X-purgate-type: clean
X-purgate-size: 4865

On Fri Sep 18, 2026 at 2:49 PM UTC, Josef Bacik wrote:
> On HAVE_RCU_TRAMPOLINE_READERS kernels Tasks RCU keeps a BPF trampoline
> image allocated only while a task using it is a Tasks Trace RCU reader
> or is executing text that rcu_tasks_trampoline_text() recognises.  The
> image itself is such text, but the C glue and the programs it calls are
> not, and only sleepable programs take rcu_read_lock_trace() today.
>
> Have the x86-64 JIT open-code rcu_read_lock_trace() and
> rcu_read_unlock_trace() in the trampoline, as ftrace_64.S does for
> ftrace_caller: one reader from just after the frame is set up to just
> before the original function is called, covering __bpf_tramp_enter()
> and the fentry and fmod_ret programs, and a second one from just after
> the original function returns to just before the final register
> restore, covering the fexit programs and __bpf_tramp_exit().  The
> original function itself runs outside both, since it may run for a long
> time and the image is pinned by im->pcref across it.  Trampolines that
> do not call the original function get a single reader around all their
> programs.  The second reader is entered before ip_after_call, so the
> ip_after_call -> ip_epilogue jump that bpf_tramp_image_put() patches in
> is inside it, and the fmod_ret early-exit branch lands after that point
> still holding the first reader, so exactly one is held on every path.
>
> The sequence uses r10 and r11, which are scratch at each emission point,
> and references current_task and rcu_tasks_trace_srcu_struct by absolute
> sign-extended address, the form the JIT already relies on for
> this_cpu_off.  Sleepable programs' own rcu_read_lock_trace() simply
> nests.  Nothing is emitted on other configurations.
>
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 113 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 113 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 2853e87797a7..c991f7ceacdf 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -14,6 +14,7 @@
>  #include <linux/memory.h>
>  #include <linux/sort.h>
>  #include <linux/execmem.h>
> +#include <linux/rcupdate_trace.h>
>  #include <asm/extable.h>
>  #include <asm/ftrace.h>
>  #include <asm/set_memory.h>
> @@ -722,6 +723,97 @@ static void emit_indirect_jump(u8 **pprog, int bpf_r=
eg, u8 *ip)
>  	*pprog =3D prog;
>  }
> =20
> +/*
> + * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() for the
> + * trampoline, see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the equivalent
> + * macros in arch/x86/kernel/ftrace_64.S.  The image is not relocated, s=
o
> + * current_task and rcu_tasks_trace_srcu_struct are referenced by absolu=
te
> + * (sign-extended 32-bit) address, the form the JIT already relies on fo=
r
> + * this_cpu_off.  Uses r10 and r11, which are scratch at every emission
> + * point, and clobbers flags.
> + *
> + * lock:                                  unlock:
> + *   mov  r11, gs:[current_task]            mov  r11, gs:[current_task]
> + *   mov  r10d, [r11+nesting]               mov  r10d, [r11+nesting]
> + *   inc  dword ptr [r11+nesting]           sub  r10d, 1
> + *   test r10d, r10d                        jnz  2f
> + *   jnz  1f                                mov  r10, [r11+scp]
> + *   mov  r10, [&srcu.srcu_ctrp]            mov  dword ptr [r11+nesting]=
, 0
> + *   inc  qword ptr gs:[r10+locks]          (smp_mb)
> + *   mov  [r11+scp], r10                    inc  qword ptr gs:[r10+unloc=
ks]
> + *   (smp_mb)                               jmp  3f
> + * 1:                                     2: mov [r11+nesting], r10d
> + *                                        3:
> + */
> +static void emit_trace_rcu_reader(u8 **pprog, bool lock)
> +{
> +#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
> +	const u32 nesting =3D offsetof(struct task_struct, trc_reader_nesting);
> +	const u32 scp =3D offsetof(struct task_struct, trc_reader_scp);

nesting_off ?
scp_off ?
Otherwise
EMIT(nesting, 4);
is a bit confusing.

> +	const bool mb =3D !IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB);
> +	u8 *prog =3D *pprog;
> +
> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE));
> +	BUILD_BUG_ON(offsetof(struct srcu_ctr, srcu_locks) !=3D 0);
> +	BUILD_BUG_ON(offsetof(struct srcu_ctr, srcu_unlocks) !=3D 8);

Looks too hardcoded here.
Why not to use the same approach as with offsetof() few lines above?

Overall looks ok,
but I wonder what Paul will say that rcu_read_lock_tasks_trace()
becomes baked in into JITs and will be pretty hard to change.

We also lose rcu_tt lockdep runtime checks.
So lockdep might get confused?


