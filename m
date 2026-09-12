Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF1FC88E45
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 03:28:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418124.1646446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5EPL-0003qX-Ha; Sat, 12 Sep 2026 03:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418124.1646446; Sat, 12 Sep 2026 03:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5EPL-0003qO-CB; Sat, 12 Sep 2026 03:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1418124;
 Sat, 12 Sep 2026 03:28:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x5EPK-0003qG-GO
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 03:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5EPJ-005F8i-0z
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 05:28:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa4c65e-8faa-0a2a0a5109dd-0a2a450ccbd2-42
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 05:28:01 +0200
Received: from [209.85.210.49] (helo=mail-ot1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa4c6bf-f479-0a2a450c0019-d155d231edb6-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 05:28:00 +0200
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-80576d65d8eso404101a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 20:28:00 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:15::])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-803f6d208f5sm4822052a34.25.2026.09.11.20.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 20:27:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789183679; x=1789788479; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ud1ZpqadGMe+QubhUEhtcVCLKFg2sCSQ6NPZYlf26Tg=;
        b=pXiWr7h0vEndbtPWgWyjDbr/bRZTfLpAbBFPzBneRDv4D4S0T6wYgJBpEKr0ZRDzth
         uCJ/4XN9/a6N+XSnMySXr8/0TpgDMgiLAM7hnEzg/JZYVofwb8fZZzxMBUEuB74C3Hr/
         T4iwgSFp5iOuDVYe12NrENzmnIWDNAn6+ncmdkN4doQ2cxAljerJLlc+bXk8vF++o4CM
         7sY3No0++eCYzp4h5Mlna3k2UnM9391BHqBHEGf6B8Rk4zSr+xUsttVBOMkbPSiKr28o
         wtlYyLsmAs1wA7De4Z8rnvL2H15cuPd8VQybawuYaiGojf5joh+KKlS3JBVV8c2cxv/P
         5UqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789183679; x=1789788479;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud1ZpqadGMe+QubhUEhtcVCLKFg2sCSQ6NPZYlf26Tg=;
        b=cE9NjRiuaoSnlurFam7dN37IsggKVAJz/51IZkRCwwiGM3d6Fh5HkR8fjeFSb5TPfm
         jsD01OYiSilbWCX05TQp95aavu4IdDtWvYCCfDXYFjkMVIGgVwckZo8mCniMxB9ai6cF
         HViPJaNnMXP32oxKLCayW87rQlOtf7gepNmgt6M3Rj2jSMLPDz43E+Ziyj5S8pYo6728
         zIvftP4iOJ3dx8jBBWwMqoMq51DJO8Y+hxLTiZwcztkZaWuCCyhfae0ZHPPqdjs8Vzjl
         ksO3P8DUCymIfRdr3LyOTeS2O9ORAT8UmYLd6buuQMy75NAlZSYOVm7lR/Rk9gzLJAIf
         WYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBykwBUHJARxUbdvusYKSI8xNLPu/A21fKehKisPhUXDwyrJbB/84vuvIZVeJkeva3WxR5yu+9f4RXA=@lists.xenproject.org
X-Gm-Message-State: AFuF++lsRvPPl639OBjycCvXerIBW5UoHYkiJNu52LHNJMKTECHON+ke
	13tOo7srHWKOz/EWAvGR1aSxdd6Ta9DwbBuNjU57Am7mGULgCrAKENZS
X-Gm-Gg: AYBFou0/aJPZib000p4PuPw+pmUwLAzGBZxvIZp8JH6VfzOWYI4Kq4rC7ZFzESseFNl
	5Dp6AM0VwFU2SRc82HFS3OL8NiN0r+NSi4HRePpUB8ryWHL8MosT4XWexJsgWdZLkM6NJ+ikCZA
	0xC2fEjeyQjFCvlf8tcCGhtewrG+ePwobNoaK1bAxnqONpM8Rpe05IA+sHn0OazOOTYnNthI0Rw
	Hlabf6ehZsRiBM8BrgM3Q9sjWHYag8YQEX0NkIvv0Xt75mDgUvPSi8cZkK8m2H9fRQxb5WFsi6N
	jcyyJPbtTtsA3lMye3Jw05xGFbVtomWu44MA7TokWfuaKOzgMOLV92U9U1uk0uVlRpnCyAUBFGW
	5l0PAivt5x98QwqBSTwLhwi8376m+q8LA8/5TkhZi59OqeXFkOJ0R3QwIyGELhOtojBkZRcu/z2
	rg7J4/8cxm8bkQfDQBuCYIaaQ6c6PuMuvkDcwLgrn3KevJ3Snrj7mDWw1/ni2gknGs8R7jezYey
	wR8XjrB+BR6FqG69v8iQVaFMH6RjRlnirNq9NNqcmiLn8J0P7gpoQpI6ZVb6ULNcg==
X-Received: by 2002:a05:6830:2786:b0:7fa:ac4f:785 with SMTP id 46e09a7af769-80400b2042dmr6714669a34.17.1789183678934;
        Fri, 11 Sep 2026 20:27:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 20:27:56 -0700
Message-Id: <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
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
 Kuohai" <xukuohai@huaweicloud.com>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Josh Triplett"
 <josh@joshtriplett.org>, "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross"
 <jgross@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
X-Mailer: aerc
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
X-purgate-ID: tlsNG-d25034/1789183680-51D34A5B-B273C263/0/0
X-purgate-type: clean
X-purgate-size: 3041

On Fri Sep 11, 2026 at 7:08 AM PDT, Josef Bacik wrote:
> Emit an increment of current->rcu_tramp_nesting once the trampoline's
> frame is set up and a decrement before the final register restore, so
> that a task preempted while running fentry/fexit/fmod_ret/LSM programs
> or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
> Tasks-RCU quiescent.  Drop the count around the call to the original
> function: that may run arbitrarily long without sleeping and must not pin
> a Tasks RCU grace period, and the trampoline frame above it is held by
> im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
> fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke both
> skip the decrement/increment pair around the original call, so the count
> stays balanced on every path.
>
> The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]";
> r11 is scratch at every emission point and (u32)&current_task is a valid
> sign-extended %gs-absolute with the current per-CPU layout, the same form
> the JIT already uses for this_cpu_off.  The image is dynamically
> allocated text, so the instructions outside the bracketed region are
> covered by the irq-exit IP check.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 43 +++++++++++++++++++++++++++++++++++++++=
++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 2853e87797a7..a375c1b7bd50 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bpf_r=
eg, u8 *ip)
>  	*pprog =3D prog;
>  }
> =20
> +/*
> + * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
> + *
> + *   mov r11, QWORD PTR gs:[current_task]
> + *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_nes=
ting)]
> + *
> + * r11 (AUX_REG) is scratch in the trampoline at every point this is emi=
tted.
> + */
> +static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
> +{
> +#ifdef CONFIG_TASKS_RCU
> +	u8 *prog =3D *pprog;
> +
> +	/* mov r11, gs:[abs32] */
> +	EMIT2(0x65, 0x4C);
> +	EMIT3(0x8B, 0x1C, 0x25);
> +	EMIT((u32)(unsigned long)&current_task, 4);
> +	/* inc/dec dword ptr [r11 + disp32] */
> +	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
> +	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
> +
> +	*pprog =3D prog;
> +#endif

It's not a lot of overhead, but I feel it will be the death by thousand cut=
s.
rcu_read_lock_trace() in bpf_prog_enter_sleepable is doing the same thing..=
.
increamenting a variable inside current.
Can they be combined? Like treat current->trc_reader_nesting > 0 as
 current->rcu_tramp_nesting > 0 ?
Or replace one with the other?
Two current->foo++ operations look redundant.

bpf trampoline is already quite heavy. I'd like to find ways to reduce
its overhead instead of adding more.


