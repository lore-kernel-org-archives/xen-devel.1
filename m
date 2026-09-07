Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D4BC79FA0
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 13:58:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410888.1641692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Zrn-0006PT-8o; Mon, 07 Sep 2026 13:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410888.1641692; Mon, 07 Sep 2026 13:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Zrn-0006PM-68; Mon, 07 Sep 2026 13:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1410888;
 Mon, 07 Sep 2026 13:58:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x3Zrm-0006PG-SF
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 13:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Zrm-00DCu6-5U
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:58:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9ec2f3-e002-0a2a0a5209dd-0a2a4508dfa8-34
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 15:58:33 +0200
Received: from [18.217.159.240] (helo=ghoul.relay-egress.a.mail.umich.edu)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9ec308-f659-0a2a45080019-12d99ff0dd66-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 15:58:33 +0200
Received: from supernal-garuda.authn-relay.a.mail.umich.edu
 (ip-10-0-72-192.us-east-2.compute.internal [10.0.72.192])
 by ghoul.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A9EC308.E0FBD53.79CECFE.261231; Mon, 07 Sep 2026 09:58:32 -0400
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by supernal-garuda.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A9EC307.18650543.3E4BBE93.260121; Mon, 07 Sep 2026 09:58:31 -0400
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5b6036e9c70so2707620e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 06:58:31 -0700 (PDT)
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
	s=relay-2; t=1788789511;
	bh=Vi363ho9/7H9YTUq27CT/23svKZQ7SB0u62NNWIH71k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iyBDfwPkIur/lT5juUckBDoAAm5LAEtI2gGO9nEMpC8FdkRTXAUmnZVXMv/KSnxQK
	 ONxBsIUF87K9NU+jITOBNAr38F5cf8C2x6QWGGerfZlJcK5Kf5KSFL6Arkx7GMH1Gy
	 MwXHI7A6v5u4gviYk9NkLvjjQ/GNSZUxGjBl774vD9JYWay1j0/O2V4ZbT9X4kydfj
	 EVIlKjYm7MSj0poeHTDqqXZsFEC3RDqu3rDrCZOnJy1EYLWdpW4J8EplEm4SBhnd2K
	 Vorj+mh2C2nGCXfMCtMa5po9xJP6wnTq+tfDV3SkYr8/i/B84ww/TFPjt6ZC+sn703
	 I2Me+kzQmMcvg==
Authentication-Results: supernal-garuda.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.167.51 (mail-lf1-f51.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvByrkfMdmuKpnX1N22cU6xLaNK8iKumtnzslC1QB4nJm2RwpkEWWqUmk4PVRs9vLoH7uweHl2ksDJdE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mGv9J7ME3Gbw7HM10Quub1GeJ5RuGgXZcjbFSfZ5rgDn+peqdT
	fWPqPrkM2t0kg/xX+tfRybbtVnoDh5MhD5oDLgilBZmADDfFk6VpoW7EO0UVtqUkop5o0z71dvR
	9wQFNe+P5uDcFpygDCqb9uzwARDrL8sk=
X-Received: by 2002:a05:6512:3d07:b0:5b3:e02:b3a0 with SMTP id
 2adb3069b0e04-5b616f01f35mr3492292e87.7.1788789509401; Mon, 07 Sep 2026
 06:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org> <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com> <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
 <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
 <f413cc9c-cef5-4f85-b232-15e3c64f2a45@suse.com> <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>
 <apqevSM60s2g-mtE@macbook.local>
In-Reply-To: <apqevSM60s2g-mtE@macbook.local>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 7 Sep 2026 14:58:16 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZE5sKEmbUiTc+0jjbRmUZm0CrXwFt7ZpTVVnNhe9Akqw@mail.gmail.com>
X-Gm-Features: AcwNN1W-p67KphIux9-AXqcMIp3wWYIDfvLoVkw_C1Hh5f8KwGnexJxCGS5dy8Q
Message-ID: <CAFLBxZZE5sKEmbUiTc+0jjbRmUZm0CrXwFt7ZpTVVnNhe9Akqw@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1788789513-D735D87B-94E06030/0/0
X-purgate-type: clean
X-purgate-size: 2811

On Fri, Sep 4, 2026 at 11:34=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproj=
ect.org> wrote:
>
> On Fri, Sep 04, 2026 at 09:50:02AM +0100, George Dunlap wrote:
> > On Fri, Sep 4, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> > > > your position here is really inconsistent:  You wave
> > > > away a partial pagetable walk with three map/unmap operations on th=
e
> > > > context switch path as something we'll have to do in the interim, a=
nd
> > > > can optimize later, but are now threatening to make me add in
> > > > special-case codepaths and run tests to save a few memory reads and
> > > > shifts.
> > >
> > > I think you misunderstood. There was a concern raised already on v1,
> > > and that concern wasn't covered by the patch description. In my initi=
al
> > > reply I said "Functionally the change looks okay to me" for a reason,
> > > after all.
> >
> > To quote Andy's mail:
> >
> > <<<
> >
> > So what this patch is doing is still keeping the double copy (the
> > fragility) but reintroducing the expensive part of the operation into
> > the context switch path.  If you can't keep it being L1e, there's
> > probably no point keeping the optimisation at all.
> >
> > >>>
> >
> > Basically what I took from this is;
> >
> > - Andy thinks stashing any intermediate form (whether L1E or MFN) has
> > a technical cost (two copies that could potentially go out of sync,
> > thus "fragility")
> >
> > - Andy thinks that the expensive part of the conversion is the MFN ->
> > L1E conversion, not the vaddr -> MFN conversion
>
> We later discussed this, and the assumption was that the expensive
> part was the vaddr -> MFN translation, as that's where PDX is
> involved.  I expect crafting a PTE shouldn't be expensive at all, but
> maybe there's something I'm missing here.
>
> The original patch cached the MFN in an attempt to not remove the
> optimization, because my understanding was that the possible expensive
> part was the PDX translation.  Then again I don't have real
> measurements to back up any of the claims above, and hence it might
> all be plain wrong.

I ran some tests on my NUC.  Measuring cycles for *just*
update_xen_slot_in_full_gdt(), using the previous version (stashed
xenheap pointer + stashed l1e), and then mapcache walk with {stashed
mfn, full conversion} x {default, PDX forced on}.

xenheap+l1e: 38 cycles
mapcache walk, stashed mfn (v1), no PDX: 98 cycles
mapcache walk, full convervion, no PDX: 97 cycles
mapcache walk, stashed mfn (v1), PDX forced on: 128 cycles
mapcache walk, full conversion: 122 cycles

The variance is pretty high, so basically the mfn stashing didn't have
any statistically significant effect.

I'll leave it doing the full conversion for now.

 -George

