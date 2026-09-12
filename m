Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3693C88E56
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 17:19:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419051.1646544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5RNP-0003cy-1p; Sat, 12 Sep 2026 17:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419051.1646544; Sat, 12 Sep 2026 17:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5RNO-0003cr-VG; Sat, 12 Sep 2026 17:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1419051;
 Sat, 12 Sep 2026 17:18:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x5RNN-0003cl-LB
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 17:18:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5RNN-00C6fx-2F
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 19:18:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa5897c-bab6-0a2a0a5309dd-0a2a4508cbce-2
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 19:18:53 +0200
Received: from [74.125.231.205] (helo=mail-oi2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa5897b-f659-0a2a45080019-4a7de7cdd5b7-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 19:18:52 +0200
Received: by mail-oi2-f13.google.com with SMTP id
 5614622812f47-4b37a3ed715so463735b6e.3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 10:18:52 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:72::])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4c3315b19afsm5495263b6e.10.2026.09.12.10.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 10:18:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789233531; x=1789838331; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M1c6suOtzZ2rRuH1TXxQJyOcddxpg3oryXf9dCc4tZI=;
        b=eXni8R/Ig6XkctFZ1FR7KPVJsfac2Hwq3by/eSpBsp+BdBO7+H4N/Vxtwm/oUbLrJf
         xg/XePf6ilqAe2z3ghs2GP8dV0GXlRkEgBO6b5w2Ft5HE4+IftjO6oQTUqyVeF5IXEEZ
         tJDRsedrWJaCqtrmMcxoqvbqPGUyM7FFG9pXFINnZO8/lIxEHrUaAvgABxyGq8ztJad+
         Di4ZqGnoHp7SnmTR/QWPyvR7OSkOw0hCF90DOItE+oCIxIalH2EkHiUANdy91T2UXcRD
         kDHFzFjC/ODa+/39+WYj2tzxrlnBM0271E7QRpdK6Z0phjOyOmfwPRFwmiAewen+aPf3
         sVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789233531; x=1789838331;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1c6suOtzZ2rRuH1TXxQJyOcddxpg3oryXf9dCc4tZI=;
        b=eRZOVd5yBtuKcnhDy6XV4V+jX6rzlJxsDJ/2Ut3Rh9wdawUfWd7+PrQ9QVVj1+1sfL
         V3WBgCAqt0mqH+F/DVbjrMW17DZ0Yv1lfwmIqdn3fh/HGoOtriCawcC8g10FfQT8Ba1v
         eH4gI/qEQBjCtbR4De57Juy8Th4LEgXHgecgXcQ7cGNhUrE3OsxezPCWW8Rqso2wbx1w
         XFj9nOybLEhd8GqVNA6UFfHU5kXvkftEV+EH0iISuGubgMfx36PkOV8TSicH4PlzJThA
         bmDTmN74D3BqfkTIXA+lPn/78ctsVvCcEpACMBOWnlBONAX/jre2os6/ErkrKQyhU8SQ
         aiMA==
X-Forwarded-Encrypted: i=1; AKwUvByX27HkGbwQhdqc8nQzfR9rLJZu3mUm8nKOJ/IRtiMntg4oLHGtnCVkjGHVucW21zbLMqHUbYUs51M=@lists.xenproject.org
X-Gm-Message-State: AFuF++k7igI4dtWXqmX5j2WCBtP0t3Ulq2PtRB3cuDinp3qB47YmZozo
	bwawU5EZ4AumYcgva5QwE117ai/Ig7+9Z5noHYeSHcmaTn/qe2sQBr29
X-Gm-Gg: AYBFou2cCerQP0vZ8fZsXCwjMBngru7w6pDKeClPVNjciWKPUWUCG81qRafl9OEI2kn
	rFsynntQSdkDQ33VHvHcBPxuBzyrsqRtoN5146Mo1RPkp1nbPrxHW/mcg+aR4dItLEe/ghDv060
	GP34OSNlKdjUWuffIMCQgJQ8GNP9/tagMn//Qo7GkluTHnxckZKoYEd0Bz0xSorly2DkVmFJ9rl
	lKZz+b2UzVq0VSF6qTnBABBF7sgtisUw3THiB4qz+Jrp9q2IY7Cx8l/X5dYHpCI8up4BIiRZRjv
	nfB4NPF2MKBLKLecKPkjFdZJDkH3diLt3bVUFfd8Xg/5PfHXTS8xCk71kmrQZLcuBEXOGfZcnMM
	kMLOxE+HqfKxe7qhAnFkpAh3MPxNmq7AfQw8h4Fab5WT6lTGMK2guWjxVhkdjZpM9XcDCxZ4qgM
	q9mjpR6GeUUAOp2nMMdoENPdoDJITQoXjEfvhyDvbt4rCx6v/DRgvX0cRvmQ7StI62ceUkL0otE
	nJ43HgGA6bmuBC8Mv0Fibzf43JRbFUc8m7gSW8W+etIOgemsqlagzVWWu2I7IK25Q==
X-Received: by 2002:a05:6808:3503:b0:4b3:8323:8cd8 with SMTP id 5614622812f47-4c4a751294bmr2617971b6e.5.1789233530981;
        Sat, 12 Sep 2026 10:18:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 10:18:48 -0700
Message-Id: <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
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
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com> <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
In-Reply-To: <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
X-purgate-ID: tlsNG-c1860d/1789233532-CF35D87B-DB50ED72/0/0
X-purgate-type: clean
X-purgate-size: 3717

On Fri Sep 11, 2026 at 10:10 PM PDT, Paul E. McKenney wrote:
> On Fri, Sep 11, 2026 at 08:27:56PM -0700, Alexei Starovoitov wrote:
>> On Fri Sep 11, 2026 at 7:08 AM PDT, Josef Bacik wrote:
>> > Emit an increment of current->rcu_tramp_nesting once the trampoline's
>> > frame is set up and a decrement before the final register restore, so
>> > that a task preempted while running fentry/fexit/fmod_ret/LSM programs
>> > or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
>> > Tasks-RCU quiescent.  Drop the count around the call to the original
>> > function: that may run arbitrarily long without sleeping and must not =
pin
>> > a Tasks RCU grace period, and the trampoline frame above it is held by
>> > im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
>> > fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke b=
oth
>> > skip the decrement/increment pair around the original call, so the cou=
nt
>> > stays balanced on every path.
>> >
>> > The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]=
";
>> > r11 is scratch at every emission point and (u32)&current_task is a val=
id
>> > sign-extended %gs-absolute with the current per-CPU layout, the same f=
orm
>> > the JIT already uses for this_cpu_off.  The image is dynamically
>> > allocated text, so the instructions outside the bracketed region are
>> > covered by the irq-exit IP check.
>> >
>> > Assisted-by: LLM
>> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
>> > ---
>> >  arch/x86/net/bpf_jit_comp.c | 43 ++++++++++++++++++++++++++++++++++++=
+++++++
>> >  1 file changed, 43 insertions(+)
>> >
>> > diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> > index 2853e87797a7..a375c1b7bd50 100644
>> > --- a/arch/x86/net/bpf_jit_comp.c
>> > +++ b/arch/x86/net/bpf_jit_comp.c
>> > @@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bp=
f_reg, u8 *ip)
>> >  	*pprog =3D prog;
>> >  }
>> > =20
>> > +/*
>> > + * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
>> > + *
>> > + *   mov r11, QWORD PTR gs:[current_task]
>> > + *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_=
nesting)]
>> > + *
>> > + * r11 (AUX_REG) is scratch in the trampoline at every point this is =
emitted.
>> > + */
>> > +static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
>> > +{
>> > +#ifdef CONFIG_TASKS_RCU
>> > +	u8 *prog =3D *pprog;
>> > +
>> > +	/* mov r11, gs:[abs32] */
>> > +	EMIT2(0x65, 0x4C);
>> > +	EMIT3(0x8B, 0x1C, 0x25);
>> > +	EMIT((u32)(unsigned long)&current_task, 4);
>> > +	/* inc/dec dword ptr [r11 + disp32] */
>> > +	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
>> > +	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
>> > +
>> > +	*pprog =3D prog;
>> > +#endif
>>=20
>> It's not a lot of overhead, but I feel it will be the death by thousand =
cuts.
>> rcu_read_lock_trace() in bpf_prog_enter_sleepable is doing the same thin=
g...
>> increamenting a variable inside current.
>> Can they be combined? Like treat current->trc_reader_nesting > 0 as
>>  current->rcu_tramp_nesting > 0 ?
>> Or replace one with the other?
>> Two current->foo++ operations look redundant.
>>=20
>> bpf trampoline is already quite heavy. I'd like to find ways to reduce
>> its overhead instead of adding more.
>
> Replace rcu_read_lock_trace() with Josef's rcu_tasks_trampoline_enter)?

If necessary...
what I don't understand why we need another rcu_tasks_trampoline_enter-like=
 counter.
Can existing rcu_read_lock_trace() current be used ?
It's already doing current->trc_reader_nesting++
so use that as a signal ?


