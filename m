Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6136AC79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 13:52:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410871.1641674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Zld-00052R-DI; Mon, 07 Sep 2026 13:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410871.1641674; Mon, 07 Sep 2026 13:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Zld-00052K-AA; Mon, 07 Sep 2026 13:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1410871;
 Mon, 07 Sep 2026 13:52:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x3Zlb-00052E-JJ
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 13:52:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Zla-000gWE-Oj
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:52:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9ec179-2eae-0a2a0a5409dd-0a2a4506abaa-44
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 15:52:09 +0200
Received: from [18.216.144.57] (helo=yurei.relay-egress.a.mail.umich.edu)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9ec182-195a-0a2a45060019-12d89039abdc-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 15:52:04 +0200
Received: from stately-duende.authn-relay.a.mail.umich.edu
 (ip-10-0-72-237.us-east-2.compute.internal [10.0.72.237])
 by yurei.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A9EC181.384435A2.5BB17DE6.837726; Mon, 07 Sep 2026 09:52:01 -0400
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by stately-duende.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A9EC181.8EF07DF.4ABD0CEC.892931; Mon, 07 Sep 2026 09:52:01 -0400
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3a33307ecd9so39108451fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 06:52:00 -0700 (PDT)
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
	s=relay-2; t=1788789121;
	bh=YNHbCtSnVPR8dGzK+lBth6MAGgEKazLdKLPlhiNoHeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BeHgazNSYi0XVbhWtNzVuaGB6z9KuI20qW9W5/I3d3WyO1RDXNbOUGpFW/CiYX/La
	 Txcpdo0/2Ro/5s1XJ3g5cTsDzWCf49xEpvJilYZqKM/qfPn6SSkdHAxbM+hPePzkkI
	 ME9wImbCd588hqtKQ1rXCdYuF/oc151mekVWjIIz0xc5o7QIk75WBkHQCqvWShR+cO
	 LXcvOEWz2FaTRZ9ABbV7D6oucVamEMU8GFkb/GEnTgYNpAA4oGTsU1zunrgVRYs0vv
	 fE2Rq89SBZD6r/C22/N5o7SsMVRb5scCwnqyXPiaXG9cBsILz/GfDe082FKltIpX88
	 BpaJzclx6u31Q==
Authentication-Results: stately-duende.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.169 (mail-lj1-f169.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBx24d9EvEs++3seCwC1oBlLwpsNOSWx9mSNa/PvNQ2ZI0cFTXNQvhEdfZqHSy5TUO70iR9s+2sTPDo=@lists.xenproject.org
X-Gm-Message-State: AFuF++l32WHBXSpdxclLiQIwGHlm5FT89ndJqyipCP12KtFm9zVUKaes
	eJX571/2EY8QluH6K1JW10a0yiUg37iXPuNUMae6DtklQ7732P5JULuxT1gdXS/TrmQsYKHpUih
	f2XMwJEln4tKCedga6ElZb9JHjOMVqD8=
X-Received: by 2002:a05:651c:b26:b0:3a3:7681:6d58 with SMTP id
 38308e7fff4ca-3a376817465mr19637121fa.16.1788789118905; Mon, 07 Sep 2026
 06:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-4-ecc269f268b7@xenproject.org> <39118b9f-2c63-4523-a7c6-76cc25d43163@suse.com>
In-Reply-To: <39118b9f-2c63-4523-a7c6-76cc25d43163@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 7 Sep 2026 14:51:45 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbp8V0qCLgfTRArVBcYnGcJJzyW++TvKHtuRdTuYUKzGg@mail.gmail.com>
X-Gm-Features: AcwNN1WV-VpuqnwSn5zZyD5mv8C8CtvmIPZ757oTGi1XPHCwvRzAgU2KAB2xwnM
Message-ID: <CAFLBxZbp8V0qCLgfTRArVBcYnGcJJzyW++TvKHtuRdTuYUKzGg@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] x86/pv: set/clear guest GDT mappings using populate_perdomain_mapping()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1788789129-F74C977B-84893CF7/0/0
X-purgate-type: clean
X-purgate-size: 3054

On Mon, Sep 7, 2026 at 1:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2026 11:43, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Until the previous patch, update_xen_slot_in_full_gdt() used the
>
> Please can we avoid "previous patch" (also again below) and alike in
> commit messages?

Something like this then?

8<---
update_xen_slot_in_full_gdt() used to update the incoming vCPU's page
tables with Xen's GDT through the stashed pointer in
d->arch.pv.gdt_ldt_l1tab, because map_domain_page() couldn't be called
in a context switch. Having a handy pointer to an always-mapped
version of the GDT/LDT L1 table, other sites which modify the table
started using it for convenience, even though they aren't called from
within a context switch. One example is pv{set,destroy}gdt().

With update_xen_slot_in_full_gdt() now using
populate_perdomain_mapping() (see "x86/pv: use
populate_perdomain_mapping() to map the Xen GDT"), the stashed
reference has lost the user that justified it. Switch
pv{set,destroy}gdt() to populate_perdomain_mapping() as well; the LDT
paths are the remaining users, after which the stash can go.
--->8

> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
>
> With the adjustment above:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> > --- a/xen/arch/x86/pv/descriptor-tables.c
> > +++ b/xen/arch/x86/pv/descriptor-tables.c
> > @@ -49,33 +49,42 @@ bool pv_destroy_ldt(struct vcpu *v)
> >
> >  void pv_destroy_gdt(struct vcpu *v)
> >  {
> > -    l1_pgentry_t *pl1e =3D pv_gdt_ptes(v);
> > -    mfn_t zero_mfn =3D _mfn(virt_to_mfn(zero_page));
> > -    l1_pgentry_t zero_l1e =3D l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR=
_RO);
> > +    const mfn_t zero_mfn =3D _mfn(virt_to_mfn(zero_page));
> > +    mfn_t zero_mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];
>
> I wonder if having an initializer here might not result in better code. T=
he
> array could likely be filled with REP STOSQ here, and ...
>
> >      unsigned int i;
> >
> >      ASSERT(v =3D=3D current || !vcpu_cpu_dirty(v));
> >
> >      v->arch.pv.gdt_ents =3D 0;
> > -    for ( i =3D 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
> > +
> > +    for ( i =3D 0; i < ARRAY_SIZE(zero_mfns); i++ )
> >      {
> > -        mfn_t mfn =3D l1e_get_mfn(pl1e[i]);
> > +        zero_mfns[i] =3D zero_mfn;
>
> ... the live range of zero_mfn would reduce to about nothing.

Tried it: GCC didn't use REP STOSQ [1], but seems worth it for clarity
and register efficiency anyway.

 -George

[1] Fable experimented with a few different compiler flags, but
couldn't get a REP operation;  it said "The reason is structural:
GCC's string-op machinery handles block clears and byte-splat fills
(memset means a repeated byte); a fill with a non-constant 8-byte
value is not a memset and never reaches that expander".

