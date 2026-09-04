Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEDAC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:50:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408034.1640768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Pcy-0000Z4-0t; Fri, 04 Sep 2026 08:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408034.1640768; Fri, 04 Sep 2026 08:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Pcx-0000Yx-Ts; Fri, 04 Sep 2026 08:50:27 +0000
Received: by outflank-mailman (input) for mailman id 1408034;
 Fri, 04 Sep 2026 08:50:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x2Pcw-0000Yn-Id
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:50:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Pcv-004rRH-V2
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:50:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9a863b-2eae-0a2a0a5409dd-0a2a4507ec8c-44
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:50:25 +0200
Received: from [13.59.128.245] (helo=basilisk.relay-egress.a.mail.umich.edu)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9a864a-b4ea-0a2a45070019-0d3b80f5e6a8-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:50:19 +0200
Received: from suasive-ogre.authn-relay.a.mail.umich.edu
 (ip-10-0-74-242.us-east-2.compute.internal [10.0.74.242])
 by basilisk.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A9A864A.816EEAA.1B782D84.689335; Fri, 04 Sep 2026 04:50:18 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by suasive-ogre.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A9A8649.16713475.6C8EB235.144331; Fri, 04 Sep 2026 04:50:17 -0400
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3a305310ddaso8010501fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 01:50:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=fail header.s=relay-0 header.d=umich.edu header.i="@umich.edu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-0; t=1788511817;
	bh=RpTRgDXJK5Wxk10Gj6RuFNHrhmtCcKQUHfCBSm7zYiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=icRyUrLNdMuNv4bEHcmvNsLJPVRxdvT/D+8QrKSlYO9zWFPWGXKbEsyieHr4ttvko
	 A2+3CkQlnWPbtkhhDmUQgA6WDZZDq5HNmZUkg1/Z8Zcq46iCnzbjXorIrdNo730aO0
	 ljKqWe3HVpaoxai2QYa28oaQh60e2K3tQ1W9cvho2EsM0DdVS3neLbRihO9K7AUc/h
	 Equ8Ga4zRr6VklRArZYFolmvBe/iBCen1bwUwk+HYslfNFqvanhjxyyDEAYJgHxVLO
	 K5ortZ8lh6nGZoNJWTof0K3mA/ppRoz1+9WNmHGJ/o1LQTQnv55lFavD/nNNnv+1vY
	 EJCCyWvJSS72Q==
Authentication-Results: suasive-ogre.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.170 (mail-lj1-f170.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBw4MQTpokQZx2FPwLWfdGxxFCabqnysq4Ebyedur/D+os/f/WkmvCdCsemq8KeWU2tC68719QyUEiM=@lists.xenproject.org
X-Gm-Message-State: AFuF++nRopGMQTmL48hYWT21bmkeUu25ItGdYkrUOVtmERcZiuByrsiM
	7yA5zYL9yA2q5L2IdjG7OsyuI/ISTw8RWwI34XLdTvbLSZyV6Iy+58Mgzkcbzxpo8IPnWZT4OSn
	5ddd/Vk2JeM5pZ65IFwo1nzFxTD5OR2k=
X-Received: by 2002:a05:651c:1544:b0:3a3:10f:5a28 with SMTP id
 38308e7fff4ca-3a371baa417mr5412661fa.11.1788511815101; Fri, 04 Sep 2026
 01:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org> <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com> <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
 <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com> <f413cc9c-cef5-4f85-b232-15e3c64f2a45@suse.com>
In-Reply-To: <f413cc9c-cef5-4f85-b232-15e3c64f2a45@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 4 Sep 2026 09:50:02 +0100
X-Gmail-Original-Message-ID: <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>
X-Gm-Features: AcwNN1WJwUt15jj3yGFul9RfemX7H3C7yaQ4RBKWFTPr8e04EwtEBb5Tc-aR3b8
Message-ID: <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1788511824-378D1AE4-C8EF93AE/0/0
X-purgate-type: clean
X-purgate-size: 2409

On Fri, Sep 4, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
> > your position here is really inconsistent:  You wave
> > away a partial pagetable walk with three map/unmap operations on the
> > context switch path as something we'll have to do in the interim, and
> > can optimize later, but are now threatening to make me add in
> > special-case codepaths and run tests to save a few memory reads and
> > shifts.
>
> I think you misunderstood. There was a concern raised already on v1,
> and that concern wasn't covered by the patch description. In my initial
> reply I said "Functionally the change looks okay to me" for a reason,
> after all.

To quote Andy's mail:

<<<

So what this patch is doing is still keeping the double copy (the
fragility) but reintroducing the expensive part of the operation into
the context switch path.  If you can't keep it being L1e, there's
probably no point keeping the optimisation at all.

>>>

Basically what I took from this is;

- Andy thinks stashing any intermediate form (whether L1E or MFN) has
a technical cost (two copies that could potentially go out of sync,
thus "fragility")

- Andy thinks that the expensive part of the conversion is the MFN ->
L1E conversion, not the vaddr -> MFN conversion

- So, stashing the L1E might be a win, but stashing the MFN is unlikely to =
be.

- If we're not going to special-case this path, we have to pass an
MFN; and if we're going to pass an MFN, it's probably better to just
to get rid of the stashing; the extra fragility introduced doesn't pay
for itself in terms of potential performance improvement.

Note also that by the end of the series, we add two more
populate_perdomain_mapping() calls to the context switch path, at
least for ASI domains, which means another two of the "expensive" MFN
-> L1E conversions.

So v2 is doing what I understood Andy to have suggested.  I agree the
meaning isn't 100% clear, though, so I may have misunderstood him.

As I've said, I'm not opposed to optimizing this path once we have the
final form functional and have measured it.  Mapping the three tables
we need to modify in vmap, and stashing both the addresses and
pre-baked l1es, sounds like a perfectly reasonable thing to do,
*after* we get things functional and have had a chance to measure the
new context switch in its entirety.

 -George

