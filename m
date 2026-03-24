Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C91FE9A76A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 11:12:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1260346.1553692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zgh-0000GR-E3; Tue, 24 Mar 2026 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260346.1553692; Tue, 24 Mar 2026 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zgh-0000GI-Ar; Tue, 24 Mar 2026 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 1260346;
 Tue, 24 Mar 2026 11:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1JW+=BY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1w4zgg-0000GC-Fe
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:12:42 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e485baf-2772-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 12:12:39 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id CB1F9EC010A;
 Tue, 24 Mar 2026 07:12:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 24 Mar 2026 07:12:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Mar 2026 07:12:36 -0400 (EDT)
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
X-Inumbo-ID: 5e485baf-2772-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774350757;
	 x=1774437157; bh=/ckWOhAwOTP30+Ax9lTc6ysN39NU7+4bq8AsZwAGCmQ=; b=
	u0u8SsaV8kA2J1FxJoeTE1FyRsKKGX3Bgcqagfrdy25GiGaVSy9P29r1FmwUZuj9
	2GpCJGnnZi52tuFaYnPbFuREdHb3CkBfEs+VoX0rdcqVXD68aEUD2xvVYB7cCOHa
	b5AP0kHSxbHP2CLkg4OKZRDvqwzZ11+YmQQL9m+bsBcIdPzMcN3NIa8cEqQKR/FG
	YnChM5EUodoq+LTEh1GScQs2DfUUjBKphx/h2uo0lhE4zZN7t7286TIyYch3n5Rh
	bJysKEYj3aaW9ZcFYzxkz4B0GxC4vNn7dMAadIySTYRJS6SItHR28VML0PeUyfvF
	X+/0bahT51W5b/c8CyD2Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774350757; x=1774437157; bh=/ckWOhAwOTP30+Ax9lTc6ysN39NU7+4bq8A
	sZwAGCmQ=; b=STpJrx9tYNc2TXJ54p5WieMYdEb+qYv7ehAffNBz8lPE5Cz6epS
	VnxGTCGfh6uGqxRc+/L/scwHy0GdSx+5aeYymuaxJ32wbc9PF5wyyfhweJ7L5YYh
	IwiTFLlG/Nn188j3LMFyVP5rYG+y4sefUwYSyVUf5A8d2Grpz0UKb/OMs9gHozzu
	Fdzs53OodXaQblYlU7nd3A5NFhmkiHdq/gdSjg5jlCB9H5/vykP529Cuh1luE/sA
	3+OAPGCHpAE8T2Jfg/bLQpBW3qLMojLxt0jBJDp5CIxyvPeaT5kyXMixQ7hDjZBZ
	cIui5qv084dCYeqptf4Qx7uVJrLtJFtoGzA==
X-ME-Sender: <xms:pXHCaT12zJkldzUSrkWrpdBzEj3yVqJCcLg4Jo8uQAGEX4sHAyLclw>
    <xme:pXHCaUUqUxOBZxOAaEPK9CDM8yE396lZCcepeL7o16O1xf1dO5iuBS3C0f98uMtIW
    xfVeDxyDOrRkKPvQOg0rgtrgsNbpQN-Ixl6b3HFM5lvBmBQIw>
X-ME-Received: <xmr:pXHCaWLZQqub0-U3tE7Zdv-8WG4lKbQFymUUs7uEbQd_eYuE8_YezFHRBHWYs8lGtpX_m61NX_DWGGpGmAM81WIRpcEfbCgKQio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvddugeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeet
    geelleetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtohepshgrrhhkrghrshhouhhmhigrjhihohhtihdvfeesghhmrghilhdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphht
    thhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoh
    epjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeguphhsmhhithhhsegr
    phgvrhhtuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:pXHCae0IzOvqs2oHuvXa9_D_U4Gph07OjgSQw35U5_XHxX0Z7taORA>
    <xmx:pXHCaU6PFb5WGzb-l7UxYq8NvT-mH9vb9uhVj5D-vyTnCq0gWh8V1A>
    <xmx:pXHCaf93I2Btbeie07HPNgPoKGeaVnsaPJOqyt-N_BAhQI7SNe_HZg>
    <xmx:pXHCaTWN1wEKYC8nJSVod4X26-yfrvTtPxxHxM5NNppR6M8OkePkog>
    <xmx:pXHCafg7O-h3KYXJyaI4CdPwZcTmwqlx_996zr9Via5MG_qsV4z5tMMz>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Mar 2026 12:12:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure
Message-ID: <acJxoijDI6vhs5wo@mail-itl>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
 <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BN9tOkU+Ug1Au2dl"
Content-Disposition: inline
In-Reply-To: <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>


--BN9tOkU+Ug1Au2dl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Mar 2026 12:12:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure

On Tue, Mar 24, 2026 at 03:47:24PM +0530, Soumyajyotii Ssarkar wrote:
> diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
> index 77f138a6c5..9e595600d7 100644
> --- a/xen/common/efi/common-stub.c
> +++ b/xen/common/efi/common-stub.c
> @@ -20,6 +20,7 @@ unsigned long efi_get_time(void)
>=20
>  void efi_halt_system(void) { }
>  void efi_reset_system(bool warm) { }
> +void __init efi_bgrt_status_info(void) { }

This has a minor conflict with the current staging, but then for __init
you'd need include xen/init.h.
See:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2405049544

Did it built for you without it?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BN9tOkU+Ug1Au2dl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnCcaIACgkQ24/THMrX
1yySZggAki+ZUmNLOcqp25HyLLk7S3eLKzgNRFOgGXfNFxMASTmDB6LsCTy6GUdi
d6A31BIVE2YfiVPBbj3BAZj0xUx+rKUH/5Aoa3GU3T/enKkXYxMgPhFTH0IpC4+s
ddcl2/5bBYeVWuYVMUytKMlYI9cXaYHGDS6zxuJb7a+ZCoEKCTk9K/rh5B8IyY+v
vv1C8W68USIs97So3YRMCP2fLVrn4IHOtTjodtCGh3da08Y+Y6Ghi4nfNMuz4hQx
FMsNONvaEXnyL8qvZ2vjBFVh1AtbX0UZZmuRMnOkfKXSEWwcVrJaA9nAA7ptAlpN
Lp7dpjBw+25dNM7ZWgXK+62BLDOXCA==
=sPL6
-----END PGP SIGNATURE-----

--BN9tOkU+Ug1Au2dl--

