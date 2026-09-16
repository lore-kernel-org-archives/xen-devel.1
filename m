Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B26EC88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 03:45:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422259.1647730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6gaI-0007oo-SY; Wed, 16 Sep 2026 03:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422259.1647730; Wed, 16 Sep 2026 03:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6gaI-0007oh-Py; Wed, 16 Sep 2026 03:45:22 +0000
Received: by outflank-mailman (input) for mailman id 1422259;
 Wed, 16 Sep 2026 03:45:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x6gaH-0007ob-0M
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 03:45:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6gaG-00FpDF-DO
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:45:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aaa10b6-8faa-0a2a0a5109dd-0a2a450bbdba-30
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 05:45:20 +0200
Received: from [74.125.227.141] (helo=mail-pj2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aaa10ce-b7e8-0a2a450b0019-4a7de38dc0d1-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 05:45:20 +0200
Received: by mail-pj2-f13.google.com with SMTP id
 98e67ed59e1d1-396ccd78e6eso121477a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 20:45:19 -0700 (PDT)
Received: from localhost (ec2-35-83-186-167.us-west-2.compute.amazonaws.com.
 [35.83.186.167]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39e1bba0696sm1902898a91.7.2026.09.15.20.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 20:45:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789530318; x=1790135118; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ukRQUFxBTM3YxkUDVCzWjtsHOmDoo6m23BhwxAxqqWs=;
        b=DuM+AOgGFiWTaSXFKszBCnHTnJZgjSqjXJkFUXiiMxiru4MizjPORcEew6qlNgEWCd
         CuFScDe1RcDz23yOoyYY2MgH0fhtryBRa+Jy5uogZyE/NTS5Q3pAYqKV3cT6mKFpQi0G
         7K3V3/IFAIH8H0FGpCCTfecJ+kDvnPl22iitOYL7B8rcRcHnqJDbN8nUEbXp98TvkW5l
         alNk4K0UoZFAWxgLwj0HF+htiyfEN+7mB2lJQwU3mrcjyoi4WHRPam9Ekkakm0T+vXRV
         nPjHbpWhVitBeElH2COPD1wffS04P3xXgkvYkHBOLGUfQjUo9O9doocdP8GAL+QDpNRi
         ji6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530318; x=1790135118;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukRQUFxBTM3YxkUDVCzWjtsHOmDoo6m23BhwxAxqqWs=;
        b=IUjFQyCtSwEn1SpBx2G9PYmBIcMT5JEBTVSOe39agQL0GXruRyItS0ux6RcnkEVhXj
         YaVcDt/PhrQuLFwz9hPulwLaaC0pM+oJM/RVYIPxWl/6YrIeb8A6sZFoVbsSYu2/yMhe
         2FGHrR740j1/jvjhzqgxPuXD56KUeDIS8OAgHJLK4bPcT8NEPaA/bTJTq3ackGbtmYRg
         OhW3hewP58G3kRsmWubk5IkoDDYyIAXJ/C+Hfp/ef4OXTSZ4BC07wRx9zwl4nOr86oM4
         6nVdei0bNgVT/fq8hDjfUkJIG9TFQicjcqUiXfdy53QogB+SY8H5PbKXLmar4ztm37WA
         V7Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwjQbz7Za1LMloMdRs16UheezU1QHx+XIPAMws37QeL9Jf2E7C3qaMYeLSyyHmvhUmWcAI1e3OqQ/o=@lists.xenproject.org
X-Gm-Message-State: AFuF++nMkZlhJlQuMULMMXGviIKMJSfP8BInG0Ymovkob0r9mwVXCuDJ
	dF1aoN9ahQA+fO4t9wvxR0ITtfKCrbs7E/i9DvowzS7cob9cP4gh2bfS
X-Gm-Gg: AYBFou1CRKMQb2df6RaBEmI+XO50+PGq4741PAV2mcYse020vfXvMG9RaqsiNq5An0E
	7wCSs0Gr10pYqj70QFMnkf7qaVZ/T8Y5X6oYKdR9BjXeueARnstj8Fv5adLpVEx1hdLDUhRzPme
	0Uth9nyxCtCBqe/T8h+hXLf0TupqCIj5FTR0pcTHxeBoXHqeUNvjj53x50RAvwcUJGRh7UIStXJ
	R2TRZqOy/3QcQILDkNWCe61x577eT1dQVa+iqHbIqDA5JIQYSuumobVv4NDAOn3r7Mc1ebZ3DKK
	EQoWFDVWCZbZZkDdWZQz//ClKUJ1VhvsnqBTFFwdwbOsAnqw9OlaM6kBoyVKoNJmFiLR2tqT7lg
	Z72XIZKlxQyII9iK8w74PjjDDfRtzNuQcUcVrpO7XdcJWFVIlBn2Rel31h1ZwNWWvmX8Ditm/Bt
	MQhg9T7IV2ae54xEtW2cwbRXiCJztV+JzRNCki1TSp/SxZ/+uYPH88EtgJyLT9zYsuGIPbr8uGx
	mHg9RCEltYBY4i0dkRy4f3sgC+AKEudFuUG3CzlJNghz73Wh1+5rvvUlkzSuMTiF4ZTuGzXo7h7
	4DxpR/IklGq+R/HTuo6pO19WdRDPdJgNTpkt0M+kQ/8E0ZBeDcsBoKXhwb00pkiXGhY=
X-Received: by 2002:a17:90b:2f06:b0:39d:b57e:b47d with SMTP id 98e67ed59e1d1-39e1ff96302mr969180a91.8.1789530318064;
        Tue, 15 Sep 2026 20:45:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 03:45:16 +0000
Message-Id: <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com>
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
Subject: Re: [PATCH RFC v3 06/13] bpf: Take a Tasks Trace reader in the
 trampoline glue
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
X-Mailer: aerc 0.17.0
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com>
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com>
X-purgate-ID: tlsNG-42698a/1789530320-184CB9EA-DE772F7D/0/0
X-purgate-type: clean
X-purgate-size: 713

On Tue Sep 15, 2026 at 1:17 PM UTC, Josef Bacik wrote:
> +static __always_inline void bpf_tramp_read_lock_trace(void)
> +{
> +	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
> +		rcu_read_lock_trace();
> +}
> +
> +static __always_inline void bpf_tramp_read_unlock_trace(void)
> +{
> +	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
> +		rcu_read_unlock_trace();
> +}
> +
> +static u64 notrace __rcu_trampoline
> +__bpf_prog_enter_recur(struct bpf_prog *prog, struct bpf_tramp_run_ctx *=
run_ctx)
>  	__acquires(RCU)
>  {
> +	bpf_tramp_read_lock_trace();
>  	rcu_read_lock_dont_migrate();

This is double increment. rcu_read_lock_dont_migrate() includes
rcu_read_lock_trace().


