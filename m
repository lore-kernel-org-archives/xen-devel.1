Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA8C88E56
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 23:59:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419400.1646599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5Xct-0001Gv-Ug; Sat, 12 Sep 2026 23:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419400.1646599; Sat, 12 Sep 2026 23:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5Xct-0001Go-Rv; Sat, 12 Sep 2026 23:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1419400;
 Sat, 12 Sep 2026 23:59:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x5Xcs-0001Gi-Dx
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 23:59:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5Xcq-00BoEI-8Y
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 01:59:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa5e649-e002-0a2a0a5209dd-0a2a4501ec7c-38
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 01:59:16 +0200
Received: from [209.85.214.178] (helo=mail-pl1-f178.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aa5e752-5984-0a2a45010019-d155d6b2e107-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 01:59:15 +0200
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2cfbbdfa60bso21142785ad.3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 16:59:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1789257554; cv=none;
        d=google.com; s=arc-20260327;
        b=B4a5xdKJQ2v7f9LjwB3jfjHLwggFgSHOkdrH3FVbsjVCxAsLytAb1EVS9eny09iT33
         V2qgexTSXScug9Em79Aj46FBTHwB25723FBL8Yz9Snd15ruu6NPB5EF27DVH6eQMWO4R
         59iTt8ZQxRlDWtt1ExruQA6XIShBSQg5IYXRusZw7pkvouFoSQKYpLjmVnhLBMvDPsYe
         1gQj+rK54tfzf9ES1DW3MirOwrpqWKG0JomurwGrRb/rD8zsuvAr3cxkzBYlutg9/TS9
         lBHSLDJCFoUYe/765O7boEMaS62EMf4R5klBfNDNFdwkQ3CQl4jDdoW2N85mqZ6DoE7i
         +pEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        fh=KLzOaxjmFPU4ZAnxx5B7YBeW6stGSKQtRp7BAQnf2jo=;
        b=NRvXPohDoxSwdotPeJWKFC9WYeUpRK8PuYGtA0BbyUnhX/fKGc00Txbr5MzhG0LOep
         BHICtJRbK7VDwt8YdyGdRyzKTLHxQZrXX3Fn/fngI+SketIdDN5DZ3YxUcdOFqH3TJpN
         TtnUn4jcPoan607vUNfGPFsKc/m54N2HWQi0ekg5yFC5iOo3DxR9/zwfENgTynaWIuhj
         OMMZhLJv9chxg8C85XsCNH9u1pGvaaShLVfa3T2lnotFx57CVp3WgkFoUJg1JsIU5Fss
         NrouF8ZCuwhYqdvGADNMKIOcs3Zkj0+FJa3+scftkv+pVtYZ2ndiPsDrXOFsA9EGdoIW
         NoJg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257554; x=1789862354; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        b=bAibL0bmJ9pYf1JDhRPabeCbmltULmhELE/5+F/v+bW9cz1LSEz9c2HwC8lEuri3FN
         JOKG+a5RLUtho2Y8yYj8HisdSXKG8WZEgRZm9aZ69/1Kn4pipDhUbfRM4jXlPDwY6FFl
         ChyZpQ1Kmzndsd2yKZFPHNaudkY5Vk6ONFb4Fn+v8wFtZpbp2P6xBfHJ2iSEefjPjzha
         lA43fz+9TieZMruxop2vucJPhWDZU/nZo/LgZg6TIlnVnA7LRr0CiCQ4PGKhdEJyHqwa
         iAwSY7IBWvjKTEMeAdYabKYk5Wgt4mDF5R3I/Lx3KbBrwfBL8vKqEsT8YIq/Wv2P6dR2
         SVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257554; x=1789862354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        b=bb7IeblD65/nYZXYU34vrxrr/ZR7MEwnHZzM7DWpn5mRY5h6c/S7gbLjSRs3a63I7c
         JEAgzlsgmInHtzeuWQvuVbM+yHYNXacxR9XdCcg4uXNBIZ604Xa5cYUYC0U5xw5WICyt
         BgGte5S/8KxfjtmTfh8GSwwlRePg1KhZ2mOFtpvGvV9H4BzPejOJ3zgBm+dgnOE/9K8s
         ozX4KZQw5AXWB0oiisY4rrBGbUob0TGHyjTXdYyDptaIMQYmHYte+EvooglFL4j/SaGW
         FZkMN72tl+9qQcoJCvM3B70/l+3bxeUnF7ocwRa59zriDoHBzdXBY7o6X6MmWHP7CaaC
         fEnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxcfDv202XtItr+r75ONypLkOXXyWABkKR0arKGmnRHTCINMEXj+Alwyq9Lzz9t6hAl4kT1DfGY8w=@lists.xenproject.org
X-Gm-Message-State: AFuF++nWxxeQioL/UzSe4yJEDHFMm/TR/vEEAsBs8p1/8Znx0thya8xb
	cfTW3CqbPF5x5LN74I6NANyTRTtM/65LOZmZwekCvKbPrEGoGzjthM9IXFlTUX6b78p1gV2MNC9
	yPEVev8kjIkwSOpsKuLDZZudq52ZUpY8=
X-Gm-Gg: AYBFou3cWEDQQEe51ZUXn7gKEhWi9FlykhIbFIvcUDKoJy7nIv62+a3yet27koc/Maj
	k24VCf2DL+uMA9TV8ZUZpHXWyaMpwJFQVXaBns/AYz+0w/Rg6kOQkfT6r7pitQQ4dzXWAm2ow+M
	BI8LiZtDrdSnWimoTGh03wrijpE1k+xNMdEh7XnlNKrpdALjxob4J2kPQ5W9OgbyP7ehGBEUf9X
	75QGzBiFPjIhD6BMM35kqk3wgXzCZi9/WzHG2N1IQfFBhwKO8YQsaZqHlRUNBRojV0iT7e8uTmd
	yCQncy8Yq3c+AcFGo+q6UWcKlP5lj/ceBMvuJ7q87UU8TYlPPTUmp0Q0WqcGzIEbVX+POq0bF8g
	X/grlub8RMQ98omaB3EClZQCC9eoZq3QEM0WdSd4=
X-Received: by 2002:a17:903:1ac6:b0:2db:331b:e187 with SMTP id
 d9443c01a7336-2dd2a1e0a15mr200200855ad.8.1789257553733; Sat, 12 Sep 2026
 16:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com> <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com> <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
In-Reply-To: <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 12 Sep 2026 16:59:02 -0700
X-Gm-Features: AcwNN1V04v_YLyVyvshDjEX_boeHQmR-dgrTXGEZk0Tlq9YUUBiA7_5E2kzlt5Y
Message-ID: <CAADnVQLQs-+-cu2R3QrHppcxOQt9m7Hi+grr4fOnw8m73kQn0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	rcu@vger.kernel.org, linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1789257556-BD67C757-00C7B7B6/0/0
X-purgate-type: clean
X-purgate-size: 1758

On Sat, Sep 12, 2026 at 3:28=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sat, Sep 12, 2026 at 12:40:55PM -0700, Alexei Starovoitov wrote:
> > On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
> > >
> > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > other thins is a bit faster and does not need to hook into the schedu=
ler.
> >
> > old kernels? I'm confused.
> > rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
> > and then calls __srcu_read_lock_fast().
> >
> > Are you talking about some RCU branch that you target for next merge wi=
ndow?
>
> No, I was thinking of rcu_read_lock_tasks_trace(), forgetting that
> rcu_read_lock_trace() is still used.  (For good reason, just be clear.)
> Your comments are quite correct for rcu_read_lock_trace().
>
> Hmmm...  Josep's using t->trc_reader_nesting would break for
> partially overlapping RCU Tasks and rcu_read_lock_trace() readers.
>
> But yes, your #5 makes sense:  Deprecate RCU Tasks, upgrade RCU Tasks
> Trace to check for preemption from within trampolines, and move RCU
> Tasks users over to the rcu_read_lock_trace() variant of RCU Tasks Trace.
> (Or am I still missing your point?)

Pretty much. This way bpf trampoline stays as-is. No extra overhead there.
rcu tasks users (faultable tracepoints and what else ? )
switch to rcu_read_lock_trace().
The only difference for faultable tracepoints is
extra t->trc_reader_nesting++.

I have studied the rest of the patches in the series,
so this proposal can be completely off the mark.

