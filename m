Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10266C982CC
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 01:17:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423559.1648574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x70kW-0006Lc-NB; Thu, 17 Sep 2026 01:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423559.1648574; Thu, 17 Sep 2026 01:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x70kW-0006LU-KL; Thu, 17 Sep 2026 01:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1423559;
 Thu, 17 Sep 2026 01:17:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x70kU-0006LO-CG
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 01:17:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x70kS-009V84-Ug
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 03:17:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aab3f8f-e002-0a2a0a5209dd-0a2a4503839e-6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 03:17:12 +0200
Received: from [74.125.230.235] (helo=mail-qk2-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aab3f97-fae8-0a2a45030019-4a7de6eba3fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 03:17:12 +0200
Received: by mail-qk2-f43.google.com with SMTP id
 d75a77b69052e-52fb767cc7fso2151781cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 18:17:12 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5326200b8d1sm35571491cf.12.2026.09.16.18.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 18:17:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789607831; x=1790212631; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5zFJ55cgnEY1OXRIavKUOEIG38H34pgZ3VgFg2bzwY=;
        b=ZF6puEjZqmdQ9NTlnAIu64KuLtkP+pIjsYbOi67PToGmST8ot7FrfSia9hkzRpdb58
         /qiCSEqzK4906vuX73H6ZvCVdw30C7S49EL3S7GMnCzmUIaNTH06sBmPnmTzYu+iroFO
         oelxMYgFXn7EiFJ5SgS6DpJYuyRH2EPOkZUwFicO08+QntpJFJyX545Quua/YKmefQIy
         WC5+qQQFVcdZ7CpAnqcMtyEXxzUVmru/J59zAKpjr7kCPRbsVCYmM7GiMVy2+phjK6Ke
         VyaYwxW/TCWjc1+k43UW0w5+XyLXvwdVSBKDKFqGUPAJIIfLh85NEhSkK89ujUOutDQX
         BnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607831; x=1790212631;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5zFJ55cgnEY1OXRIavKUOEIG38H34pgZ3VgFg2bzwY=;
        b=kcG+EzY/1XWjBvFpAHDdEcdthsd8LSkSUhKXSea4lt25HIaIbvOcqGvOyJDBejmvpj
         pnUndnXm+3Tdx0irAcCTtHvMOY+e0gaXzNqlMxcln4G2W3H/4R0p3jcxxCCueyCyOqjM
         Y9zFgBmp1JGkOX+pERnm+JfDkFjm1lJ4RIg9NQNbZkxIKrW5HG59Gspp2GRRCAB3bDc4
         CNt4DXXivSofPhOpw20ZniZWG4pxusBo3LsPxz01QsV3Tbw2VbtBAALFRExrkzEvX5PM
         PLkn6k6c3mBon2K0Qg42ga4m/pMd83KM/C/NTuBXK7mrBrWYy8Pu97ZdeflMEzJ5QXt6
         82qg==
X-Forwarded-Encrypted: i=1; AKwUvBxFxEMuOa6nH5Cp0QMCUzFcBs5Xx4KmKY+CTOpvagnF00qZ9Oo+P8+RPBXO3HF6BFbxjPppCScjzDc=@lists.xenproject.org
X-Gm-Message-State: AFuF++n057Sm05UVXI0ZoH6rmNOpmiifhvhclmE2zmOZMgcGjvuia8Nk
	xdEbDahgpgR1raso4z99z4TPB9nibf9v3VeQmGBCUORAiM6unUmFcmlJX6Yk7SSPdUo=
X-Gm-Gg: AYBFou2OBzwfFxbHrvNUb1YLWQlP0IRdjW0HYqUgW5EwOow2uAo5BScvvnrhHTGKpvI
	ykIW78ZOSts/OnyR8fA+XCNdmEj5m3I3EJSyy8UwFKQc0dgHeNXI/C2WOYitG9ra/XupO0KiWCu
	UAkBVcV2dGtnGM8jhqu/josgvHGld1do2b/rcVJnHKRuUjQQ+ge274Ir/NbP0BNF81E+AE65qGB
	pLNHV5xU23SdO/XXh910dUjwgf4NuorAG3guVkcnagRKtAUjmbqzMFrkCLzV1T8261f9OUSlw0P
	PF30+HwB+l6hkB8+gqYP+OIWDgQHDIEx9WpDsZzaCCtEiVN5wwWwCpsWPMfMihky+oLNa2GxFFp
	5SFAqVoMr0sn9RZFZ1fZ+ZPr5W5ug5mJ8A64FmuROfNQZ4tnQssKr/ulJTZsUEx7ejYrwUKSx5y
	VNWGwRlpYzl5JaDiSmMgWqUmTCp9t1TGJGkOzaK4BzGiHJ6W/wzSgNnFd8wp6chDTaFfHiC/rmQ
	0EFwiVI+4XYJ6mwea/D9UvzfhUzGxnI2UWftE9o5bGNxz3Ybq+jzSjQ
X-Received: by 2002:a05:622a:1a93:b0:530:4249:e7a9 with SMTP id d75a77b69052e-5327ed78742mr91407171cf.13.1789607830859;
        Wed, 16 Sep 2026 18:17:10 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:16:58 +0000
Message-ID: <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v3 06/13] bpf: Take a Tasks Trace reader in the trampoline glue
In-Reply-To: <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com> <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1789607832-7428D4E9-77E71A0B/0/0
X-purgate-type: clean
X-purgate-size: 1802

On Wed, 16 Sep 2026 03:45:16 +0000, Alexei Starovoitov wrote:
> On Tue Sep 15, 2026 at 1:17 PM UTC, Josef Bacik wrote:
> >  	__acquires(RCU)
> >  {
> > +	bpf_tramp_read_lock_trace();
> >  	rcu_read_lock_dont_migrate();
>
> This is double increment. rcu_read_lock_dont_migrate() includes
> rcu_read_lock_trace().

Unless I'm looking at the wrong tree it doesn't, on Linus' master and on
bpf-next it is

	static __always_inline void rcu_read_lock_dont_migrate(void)
	{
		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
			migrate_disable();
		rcu_read_lock();
	}

so plain RCU plus migrate_disable(), no Tasks Trace reader. That is why
the non-sleepable glue needs one added here: on these architectures the
trampoline image the glue returns into is only kept alive by Tasks RCU
while the task is a rcu_read_lock_trace() reader, and rcu_read_lock()
does not give us that.

It is two counters for a non-sleepable prog on x86-64/arm64 though,
rcu_read_lock()'s and trc_reader_nesting plus the SRCU-fast percpu one,
if that is what you meant. I don't see a way around it short of not
using Tasks Trace as the trampoline reader: the prog still needs plain
RCU for everything it dereferences, and the image needs something that
survives preemption. It is compiled out on every other configuration and
nothing changes in the JITed image. If you would rather the reader be
taken once around the whole image in the JIT instead of per prog in the
glue (which would also let the fentry-only teardown stay a single grace
period), I can do that for x86 and arm64, it is what v2 did with the
private counter.

Separately, Junseo's "bpf: keep trampoline progs alive until image
release" also adds bpf_tramp_image::nr_progs; if that lands first I will
just use it here.

Thanks,

Josef

