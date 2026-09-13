Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB042C88E56
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 11:29:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419765.1646671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5iOS-0006xW-6p; Sun, 13 Sep 2026 11:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419765.1646671; Sun, 13 Sep 2026 11:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5iOS-0006xP-4D; Sun, 13 Sep 2026 11:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1419765;
 Sun, 13 Sep 2026 11:29:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x5iOR-0006xJ-2O
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 11:29:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5iOQ-007zor-Bb
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 13:29:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa688f5-2eae-0a2a0a5409dd-0a2a45028128-14
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 13:29:06 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa68902-6ca4-0a2a45020019-4a7de18ca232-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 13:29:06 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d37b5so7344865e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 04:29:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb32d3c7sm17806381f8f.10.2026.09.13.04.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2026 04:29:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789298946; x=1789903746; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8/tv6bYjr/JxaCBgXPuXjqSK44p/M/ZKAj7rPsQHeE=;
        b=b1sukgJhjBFiTPVTpOaTwwKly60OaSYLq5epVqm+QV8sEvubJWZvlOV1h9POl0t+Xp
         w4hmGYAYRxrzpXsAVIExpcSqj1ASp5QS8LFXrhC/8p27JqKcuKKDvSW63llRuZGoX9O9
         s0EGfWxuzm7o69PahMh2p6rWGMrtDlFpjxRMp2mM+16H8USz1gagKiCGFB/dXYIHGPgQ
         AvycpEjW3itp6elFlUYyshG8c6M5/gd3mYUiU+/0R0P++g4qejp7E4R5wqPNiiunPVOU
         XpeflmG0A4ysjX4tHLXVcVztItyBdIp5TBzl3V1Iktyg9DvIEhXXJv4qRMB7pTbLcFdJ
         BsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789298946; x=1789903746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8/tv6bYjr/JxaCBgXPuXjqSK44p/M/ZKAj7rPsQHeE=;
        b=Azw00I1xpIWb8PPArPelsOESKWv0ZfiOYwBltJylJI5IomwO5Te2UBPgwve38NZotp
         4J815ZJ4Wc6tii5oST5OwWPMi28Zl8r0Y+yuxLSsqS2RQ69aiyI2gR8+PNcQpzGbDWqe
         em+/CQLdh8ANgXD8m/Kv2p8tq7AybSaoUQpi4YA2d5FLJPSXEe0bx7uWhT+J0iOVcswc
         HS8/4K8hGyobfc56mBqoNpQAZX44JHPoXZVWixxHo7aeo/L2sCqExlnZMAoC/hUL/EJC
         tjPcKOhJ9FWpNEv2mTb5eMOP+4I+Pk62hvLYXfymTjY5lJs4fv2oe+fID0I18TIvkZR5
         DUMw==
X-Forwarded-Encrypted: i=1; AKwUvBwNdKqGjGbgWUWv/20bpAA2d9lD+NkFdSwrARgHWL8ledNJ/N31mQgG7rEVTdt/0emPkeTNx1DBykk=@lists.xenproject.org
X-Gm-Message-State: AFuF++mXn33P+/fqv69ODHxmJHfR4bdGN3Jt2kP4ROOoe39cAmn0UDIo
	2WhYBG0j2LArmpAJroRsmn+RwO+VE7sDIc/8JtrJ5rCPeTsneyY+mpZw
X-Gm-Gg: AYBFou3KHovia1cTOzh/8WejPpZgSEyI+4BwriY7EB8YlQ97/feG+YQZGWhHh7OHT3J
	h6BOftsltxx0cfsSzR4XRNm3ZeqrrHzPJsfoeY8mXwWtUlI9Qpldo0bWE1R9VWiDkw4vywY7FHj
	FwQm1JJqkB8UlA8b9sSmPSCf0QB7pqYp+lbiPhXAX2dSpwqompVnfplncF8SDIT38ZxPOkpQNtp
	hsoONniDtRZplIQuqg5sJDYMgck2Ch1npvXCX+AWgR35OVWeYjkZvdIS55b8/xijHAQ1WyhZjwd
	RRqf/P22UcH4Rj1T08GZ62fdVz1Fs6b6uMsjQxo+9APBvcnWCcGRYL4APsXmB4wvJzcfVapS/DD
	QybTt07tqNjDTglOUcZj0hF8T/p5uVkriNxAxKsZnxLfdPMcLRPOT2MvMkBkHBHEd1pMiNM3aV7
	tdSLWKKIhBLuHmTvm2tdq0yNELjURTi2KkW20YAkW+yO9cOOD5ZDFI66UHpCrOMUK5VKis6DzrK
	wbn4L+xFGWv6bmY0Vs2Ekm0TODwr3uLUawJ
X-Received: by 2002:a05:600c:4ecc:b0:49e:6be6:d783 with SMTP id 5b1f17b1804b1-49e6be6d9dbmr138768675e9.0.1789298945625;
        Sun, 13 Sep 2026 04:29:05 -0700 (PDT)
Date: Sun, 13 Sep 2026 12:28:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Josef Bacik
 <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, x86@kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Andy
 Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <20260913122859.4d5067cd@pumpkin>
In-Reply-To: <ffffa178-c475-4249-a609-c5d222704987@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
	<20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
	<DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
	<14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
	<DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
	<8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
	<20260912221400.4045198b@pumpkin>
	<ffffa178-c475-4249-a609-c5d222704987@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789298946-31FD62AC-A9CB0DFC/0/0
X-purgate-type: clean
X-purgate-size: 1225

On Sat, 12 Sep 2026 15:31:24 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Sat, Sep 12, 2026 at 10:14:00PM +0100, David Laight wrote:
> > On Sat, 12 Sep 2026 11:03:34 -0700
> > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >   
> > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > other thins is a bit faster and does not need to hook into the scheduler.  
> > 
> > Isn't that rather architecture dependant?
> > It is fine on x86, but on arm incrementing a per-cpu variable is
> > significantly expensive.  
> 
> Last I heard, slow ARM increments of per-CPU variables were to be a
> transitory phenomemon.  Plus changes late last year greatly sped up the
> per-CPU increment operations.

There are some unapplied patches to improve per-cpu operations for both
arm64 and s390.
Without those preemption has to be disabled (in current->xxx) which requires
a conditional call in the preempt enable path.

David

> Plus this change removed some hundreds
> of lines of RCU code.
> 
> 							Thanx, Paul
> 


