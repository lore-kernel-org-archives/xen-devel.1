Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02C9109C033
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2026 15:57:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1262721.1555132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Qbs-0003va-Fw; Wed, 25 Mar 2026 15:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262721.1555132; Wed, 25 Mar 2026 15:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Qbs-0003vT-DH; Wed, 25 Mar 2026 15:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1262721;
 Wed, 25 Mar 2026 15:57:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5Qbq-0003vG-A8
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:57:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Qbp-005ZMt-KM
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:57:29 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c405dd-5cb7-0a2a0a5109dd-0a2a4501e860-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:57:29 +0100
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c405e8-6400-0a2a45010019-67a8ac918d5f-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:57:29 +0100
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 44C1CEC020C;
 Wed, 25 Mar 2026 11:57:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 25 Mar 2026 11:57:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 11:57:25 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774454247;
	 x=1774540647; bh=B7NKIpT95RzW5AHLxD63GiRxn2u3esxFjLPjPwD3lkU=; b=
	LlCAgQOkat/LhWeV0OBj/x+9L6uYARGyCKWvIFrLEXGzuLTtMgJk33/PmBgDYrg8
	3wkABSEIQqnoknHU8aMp3Bu0x7LrGJWTFKvRLJMLt4KROjwRH3HV07HRViKjpJxQ
	PsHxIlF3q5v7cV7uIq8hxqYo+R4AngxlonB8hkB9juJk/3B/8AN06FX/e+Stdu3i
	RqY0uKjDG+zKZAUO3atWv033RPIfH5GDJdy69QSpGJLybRndGw9Z5IMb6Rsquiu2
	dgqtCTHEVAzU3q30+HuO7JlkS+s8rysFa5PhlsxpE5TwMxw+vmUb74TIwWjiartn
	p0SFSR6h6CMy+TzGTeXPCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774454247; x=1774540647; bh=B7NKIpT95RzW5AHLxD63GiRxn2u3esxFjLP
	jPwD3lkU=; b=ehrkWAd/FAO6PV+6xDRCTVqLMkc4tX514EzSEidYDtJpzKzHV7e
	t+ztw4FGMy59HlAYkOkv3BGVPWtCheAgBQYHyx7db8nBzs2OPSIbLcofu9z/4XpE
	Hj8cuOpiXuWcCfOkDpchZDrrlRJNFzgU2gcaSaHgxyVngE9unLFXO3zcQj76o72V
	wdhDiOhzWCFWhDLrB7GlHWeRJ6ed7WRGW3Lk74wCXVPpqTtvSwJj/BvBsS9S3iou
	KC0uEqoImf2QZJCcURvbr92H1bgm1rTDarf8LIz/mbVQnGcUs/4EsbS0EcwnjQ+9
	CG5e/LH0NT/HbKgT7ekGiri9/hJq1cj2jtw==
X-ME-Sender: <xms:5wXEaVYwcdnwvVz_47RTk8-r2tlBJugeHseDq3BVKmN_LuBmaUAU1A>
    <xme:5wXEaerctGiomgEJS04TvGegKL8NhM3KKkvO-i7s9I88_-wx79j4G4a9xSz9ISGFR
    6VsPfwOEiAcr44EZcZ7PUjSHrTigRq0B6EHecVb1nJq876ASg>
X-ME-Received: <xmr:5wXEaaMneJKfdmHLoyQ9qAnokw6vLIwROCiHiIARXgQoivuGDPTq_6RA3-XjXp-2u8JRUmMmJzY6e3AnE7F6Tx2I1QMKpt_qPeo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtgho
    mhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphht
    thhopehsrghrkhgrrhhsohhumhihrghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:5wXEaZrAuMPPm7rLn0cc81yE71sgxTqKLi0kZRFwaVxGy5kSyOpgKw>
    <xmx:5wXEafcxYbSgcAozPejsf5M4BjNHQB-AVO8AdzXzIG_ew9rv95S_8w>
    <xmx:5wXEafSPR7Q-Op2MlUG44R6hjgPBP3oVcFYIuXbi8mkol-v6Hq8ytw>
    <xmx:5wXEaYbel85dzCGwQlFxn1Wa6y7JOFHHFnEuaL2oMICdpHBzt_AlCg>
    <xmx:5wXEaf0M5NSXTA77jE_St3ua-5rsIxB8u8ly8nP7_NVQ9t6r2WiWqcjE>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 25 Mar 2026 16:57:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting
Message-ID: <acQF5Kd4kZzo3BN6@mail-itl>
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
 <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com>
 <acQADhcNzkVBm3C3@mail-itl>
 <5e121a98-fcd1-4d20-aa6c-a02af7f7eef4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IsCjB6vHa36IQ6xv"
Content-Disposition: inline
In-Reply-To: <5e121a98-fcd1-4d20-aa6c-a02af7f7eef4@suse.com>
X-purgate-ID: tlsNG-d62444/1774454249-23EEADF3-71C8A054/0/0
X-purgate-type: clean
X-purgate-size: 4324


--IsCjB6vHa36IQ6xv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2026 16:57:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting

On Wed, Mar 25, 2026 at 04:44:15PM +0100, Jan Beulich wrote:
> On 25.03.2026 16:32, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Mar 25, 2026 at 04:16:25PM +0100, Jan Beulich wrote:
> >> On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> >>> @@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struc=
t acpi_table_header *table)
> >>>  	return 0;
> >>>  }
> >>>
> >>> +/*
> >>> + * Invalidate BGRT if image is in conventional RAM (preservation fai=
led).
> >>> + * If preservation succeeded, image is in EfiACPIReclaimMemory, which
> >>> + * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
> >>> + */
> >>>  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_he=
ader *table)
> >>>  {
> >>>  	struct acpi_table_bgrt *bgrt_tbl =3D
> >>> @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
> >>>
> >>>  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
> >>>
> >>> +	efi_bgrt_status_info();
> >>> +
> >>>  	return 0;
> >>>  }
> >>
> >> Does this really need doing from here? If you called it ...
> >>
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(uns=
igned long smfn, unsigned long emf
> >>>      return true;
> >>>  }
> >>>
> >>> +void __init efi_bgrt_status_info(void)
> >>> +{
> >>> +    if ( !efi_enabled(EFI_BOOT) )
> >>> +        return;
> >>> +
> >>> +    if ( bgrt_info.preserved )
> >>> +    {
> >>> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
> >>> +               bgrt_info.size / 1024);
> >>> +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
> >>> +               bgrt_info.old_addr, bgrt_info.new_addr);
> >>> +    }
> >>> +    else if ( bgrt_info.failure_reason[0] )
> >>> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
> >>> +               bgrt_info.failure_reason);
> >>> +}
> >>>
> >>>  void __init efi_init_memory(void)
> >>>  {
> >>
> >> ... out of this function, it could be static and no stub (misplaced in
> >> the earlier patch) would be needed either.
> >=20
> > It was here before, and I complained about it, because it printed the
> > invalidation reason way later than the actual invalidation.
>=20
> Sadly now I complain about this call out of acpi_boot_init(). What's wrong
> with logging the BGRT stuff together with the memory map?

If you try to diagnose what went wrong with BGRT, that's not very
intuitive to find - for example on my system it's 32 messages later.
It's even worse if system happens to crash between those two points.
IMO it makes sense to log reason for BGRT invalidation together with
the actual invalidation (message). I would be okay with moving it before
the actual invalidation, but I don't think there is a place like this in
xen/common/efi/boot.c (at a point where normal printk can be used already).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IsCjB6vHa36IQ6xv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnEBeQACgkQ24/THMrX
1yy75Qf/Rhz7VJ5ozQ6vzaB+ndMOtljsAfUbUKBaFES2089h2YFhw7qmX1HJpRxj
yu9RJbd9Evk8JOaIpwd/q0zODlPulQN302/7c3kCxRwXO8sIZI1NjNEOR6yc+0tS
L8574DQw0vYtjawcuKMbN7At50AT3UcK//LXDl0WBz6Wrh+1yJJQkFF6LXqeX2ww
Gbwoz3QmwC/oHie7c46vVEqzjJXFWVCJtaSHPI6/sVcF8uC4YAJUnHMtJ9WuVg/9
d0rs+24RiUFQPYsB+15C2yyYfaAu64MHbB3qYcFBqjGYliI36GHGsMkqFd6jkXc6
y1w+sniQxlj3d0Q5hlEN99g99VovGA==
=0WuX
-----END PGP SIGNATURE-----

--IsCjB6vHa36IQ6xv--

