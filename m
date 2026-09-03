Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC1FC624DE
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 21:28:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407708.1640643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2EyL-000497-Lb; Thu, 03 Sep 2026 21:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407708.1640643; Thu, 03 Sep 2026 21:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2EyL-000490-IA; Thu, 03 Sep 2026 21:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1407708;
 Thu, 03 Sep 2026 21:27:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x2EyK-00048r-0n
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 21:27:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2EyI-00BaQ5-JN
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 23:27:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a99e651-2eae-0a2a0a5409dd-0a2a45028d88-0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 23:27:45 +0200
Received: from [13.59.128.245] (helo=basilisk.relay-egress.a.mail.umich.edu)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a99e64f-6ca4-0a2a45020019-0d3b80f5da54-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 23:27:44 +0200
Received: from top-brounie.authn-relay.a.mail.umich.edu
 (ip-10-0-74-245.us-east-2.compute.internal [10.0.74.245])
 by basilisk.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A99E64E.31EFB142.263FAEC8.3181220;
 Thu, 03 Sep 2026 17:27:42 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by top-brounie.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A99E64D.392E2C5E.6AB0DE6D.1021951;
 Thu, 03 Sep 2026 17:27:42 -0400
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3a1eb6fa0f4so4763221fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 14:27:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-2 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1788470862;
	bh=sFTnKPd4I05xSc/JFvWg12Da0qJ8iucIwim/WK0YEwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N3AqY28yPjaCWeEKdqW0vx6TcruI9hrRLLNptdEQNYvGweAH9KhyATKz6McelQHhY
	 sVRCb6lHKNNI6gnNm6zzNSp96xY7ekDbyCtdS6QV/EFfzisiwPdOJ/L5MM/yzBfGm8
	 FLbmhNcJr8iIwIVxdKs/haagXMnI//ASEiNnlRODjmaElxbyf9TmyFZeokVHgKoPL9
	 2TNErkEjinzO11B7IkQn0JOqy0yR4xqaNJ/Y/ngu6WyrCWO0gCj/3kHY9C2B5RZ2TU
	 OEjYEgSgPwtNL8c8pkm0k6VGJVDap3j5KmDo1flM00mFliOey28NbDV+U/HNH+qEjT
	 wI/WD9f44APow==
Authentication-Results: top-brounie.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.175 (mail-lj1-f175.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBwopSdPmS3oDYC71hNRRFqvlkdu6+GlggRWHxTEE6XDkDKp5dWWl9cR0lwlkAFfCkS2Jv2o9anvYas=@lists.xenproject.org
X-Gm-Message-State: AFuF++lMJncKOvAZYFiIGpeZjHZ/X+cBCCuj3akJ2k5zLhmolSCib/rp
	HfEhYVzcax4/GqyCvRBFli49ufuA2RLiwGK7WQ7MfKsjlJp4oLXl7QE/xc5u+MijmW2upcjGEst
	4xRP2mTY5gBL+8TGDDd9ZfyYo8doiaM0=
X-Received: by 2002:a05:651c:15c1:10b0:3a3:5a01:a759 with SMTP id
 38308e7fff4ca-3a371f0d685mr1890871fa.10.1788470860002; Thu, 03 Sep 2026
 14:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-2-ecc269f268b7@xenproject.org> <5071d4da-d9b1-45cd-8e9b-778df417ee7b@suse.com>
In-Reply-To: <5071d4da-d9b1-45cd-8e9b-778df417ee7b@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 3 Sep 2026 22:27:27 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZDh1TqwJNxChpk6pBWppQ5yOaDPz6V7orrHRe2uS-OEA@mail.gmail.com>
X-Gm-Features: AcwNN1VZKV3g83wsokELPxfkJQdeAisT9ktpksCxMBY7cjLbVjBLuOPAhzrSgNs
Message-ID: <CAFLBxZZDh1TqwJNxChpk6pBWppQ5yOaDPz6V7orrHRe2uS-OEA@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] x86/mm: introduce populate_perdomain_mapping()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Alejandro Vallejo <agarciav@amd.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1788470865-67CBA2AC-53A14287/0/0
X-purgate-type: clean
X-purgate-size: 2616

On Thu, Sep 3, 2026 at 4:57=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
> > +    if ( likely(this_cpu(pgtable_vcpu) =3D=3D v) )
> > +    {
> > +        unsigned int i;
> > +
> > +        /*
> > +         * Fast path: v's page-tables are loaded on this pCPU, so the =
L1
> > +         * entries can be reached using the recursive linear mappings.
> > +         */
> > +        pl1e =3D &__linear_l1_table[l1_linear_offset(va)];
>
> As mentioned elsewhere, I'm concerned of this (or really any) new use of
> the linear page tables. (Which, ftaod, isn't an objection.)

FWIW here we can drop this fast path at any time, and we get exactly
the same result as if we drop it from the patch now.

> > +    l2tab =3D map_domain_page_irqoff(l3e_get_mfn(l3tab[l3_table_offset=
(va)]));
>
> l3tab[] isn't used any further, so I think it wants unmapping right away.=
 No
> need to have undue pressure on the number of active mappings.

Ack

> > +        /*
> > +         * As the fast path -- and the slow path holds IRQs off throug=
hout,
> > +         * so replacing area-owned backing here is never permitted.
> > +         */
>
> With this comment I think ...
>
> > +        if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
> > +        {
> > +            ASSERT_UNREACHABLE();
> > +            free_domheap_page(l1e_get_page(*pl1e));
>
> ... this call should be removed from here (I would have suggested to comm=
ent
> it out, but Misra dislikes that iirc). Otherwise it would in principle be
> reachable in release builds.

Ah, right -- sorry, this was safe in v1's "xenheap-walk" approach
which doesn't need to disable interrupts; with the "mapcache-walk"
approach we can't do this any more.

> Maybe instead of ASSERT_UNREACHABLE() it should really be BUG() here.

Hrm, docs/misc/xen-error-handling.txt used to have guidelines about
*which* error handling to use.  Basically, BUG() is an immediate
hypervisor crash DoS in production, and should only be used when
there's no way to continue without doing something worse.  Leaking
memory is a lower-grade DoS, and so would be preferable in production
(though in this case probably with a printk, so there's some hope of
figuring out what's wrong).

In theory we could allow callers who knew they'd take the fast path to
do the free; but then we couldn't just rip out the fast path without
doing more surgery.

So I'd propose:  In both fast and slow paths, replace the free with a
printk (keeping the ASSERT_UNREACHABLE), with a comment explaining why
leaking is preferable to BUG.

 -George

