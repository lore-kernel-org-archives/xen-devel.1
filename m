Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D5CFD2D63
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 12:06:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250064.1547503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvqR-0003Qb-JA; Tue, 10 Mar 2026 12:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250064.1547503; Tue, 10 Mar 2026 12:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvqR-0003QU-G1; Tue, 10 Mar 2026 12:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1250064;
 Tue, 10 Mar 2026 12:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDxx=BK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzvqP-0003QN-Kp
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 12:05:49 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78343de1-1c79-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 13:05:46 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id E1CEC1D0011E;
 Tue, 10 Mar 2026 08:05:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 10 Mar 2026 08:05:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Mar 2026 08:05:43 -0400 (EDT)
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
X-Inumbo-ID: 78343de1-1c79-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773144344;
	 x=1773230744; bh=2WGFbOnRDU6ryJkj7VOMsza798aVYRtJwrdjku8elyQ=; b=
	q5xJNLi6odveOzVOviX1D+WumgvUmW4vrv/F/gUfiAsT5H1DkPHYeWjxdTq48nu3
	RvLEgSycTkvNQIwXnEX8wQ5Pl5E0G/mcvh0ZMk1ll8mNxUyk1Am0MDkLv4A967Cu
	GdrMxcyTITeiVaImGLEVrg8b349YIS4/rcF+ZrWP64pdlcmCzz2FmV62Yq4lzQWY
	N4hg+i2rO1qc+sb0sbKZ/6y/dkYhM3MW9OasTyRAXgJ0ZaSdbcySfn/X4HVNoXc6
	15h7VlNt93q7xeu1E+5P0PVFM6E7jkpf2BGdBSp9TVWQKmmDDxcnZZDdJYVM9mjq
	RXJwNFly8lrDxUqujsHNXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773144344; x=1773230744; bh=2WGFbOnRDU6ryJkj7VOMsza798aVYRtJwrd
	jku8elyQ=; b=V+034gMWEvotCy4gpTFt5X3MELf7/MOazqJ4LhA+QIt4MFcw5US
	vSi4TCjrIVGR7BZa36UHEJasLYU8AzpOPqXyZ4Dgp4+dZ7Vq7sRUBAgA9WNq8E4j
	yoa3f/uScB2RpovRdZmTXe5cAzj9BYmJiZNnqM1LaejDQWGuQC3k6z5AfrCilHVf
	nsNdDSVyG8TGRmHtFXU0y4lFNCyWiQT1C+sStHkB0oW1ZMmliqN07IyQ16ezoJ/J
	R5Cca4Kslt6MAgoNE1VidS/MZoYkf0k3DP1aMtysngU/C9FvjfF6Z+tHoMGWMh3p
	eU0jZj70p5KKBeUBczahsyb2Uo8FS1lMl3Q==
X-ME-Sender: <xms:GAmwaT-vQRLLubRvM6luZUlpjTvK97sbKobmuAr2xBOZcn_Y0rINeA>
    <xme:GAmwaR88TPi0OlTiBNQOBHdQ6HBHsp7ZTkM2eGC-StKd8dUQjxWgvoIGUrW8tht_l
    V-5WicOA2e6JQm5iVy7gc4k-M7-oTH4T3FyAj8MJAZLuxU8tDQ>
X-ME-Received: <xmr:GAmwaTRPUXD2VVnas-YN0d8JadaNGJoaRSTEKli_HLSSKwOLV_A21mAKpAAX0TDRtzAmCG1HYHFoRx3bfpam_151XiWqT4yqSjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkedtleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhs
    rdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopehsrghrkhgrrhhsohhumhihrghjhihothhivdefsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:GAmwaVffZoq4apeWgcz0K6I4dz__UBVQDwmkuo713enpMwemnedH0A>
    <xmx:GAmwaXAWXviDqsCDB-Q98y0MuRttHobBcquIwPLo5tOs23FKXL_yCA>
    <xmx:GAmwaXmNxWm89GeX1Y10F6AwqKHhehUqXDDwNmIG6nsWoUeyp6XQgQ>
    <xmx:GAmwaSdOnlMWJpDVPhw3HckRCqwtI3Pb0mgJUbDYqES-LQf-DUlHgw>
    <xmx:GAmwaQo5ucDR5keMWZNsGopc83lrMF72w79HIYvO9LFdWwS_AGhB7S-t>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 10 Mar 2026 13:05:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com
Subject: Re: [PATCH v2 3/3] x86/efi: Add opt-out mechanism for BGRT
 preservation
Message-ID: <abAJFQMqDssTsORx@mail-itl>
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
 <20260306132935.13727-4-soumyajyotisarkar23@gmail.com>
 <bce96393-9790-44fb-9958-0adeeafb78b9@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H3L8xXMJr0AcoNuY"
Content-Disposition: inline
In-Reply-To: <bce96393-9790-44fb-9958-0adeeafb78b9@suse.com>


--H3L8xXMJr0AcoNuY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Mar 2026 13:05:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com
Subject: Re: [PATCH v2 3/3] x86/efi: Add opt-out mechanism for BGRT
 preservation

On Tue, Mar 10, 2026 at 12:41:40PM +0100, Jan Beulich wrote:
> On 06.03.2026 14:29, Soumyajyotii Ssarkar wrote:
> > As described in the task, BGRT preservation is now enabled by default t=
o fix ACPI corruption
> > for desktop/workstation systems (similar to ESRT).
>=20
> What's "the task"?

I asked him to work on this, but I don't think there is a gitlab issue
created, so reference to "the task" is not relevant here.

> > Add an opt-out parameter 'efi=3Dno-bgrt' to allow disabling BGRT
> > preservation on systems where the ~1MB memory overhead is not
> > desired.
>=20
> This looks to contradict ...
>=20
> > The parameter is parsed during normal Xen boot (not during EFI
> > phase), so it only affects diagnostic logging.
>=20
> ... this. For xen.efi you want to add code to the command line parsing
> near the top of efi_start(). What to do for the MB2 boot path perhaps
> the only thing there is to peek into the command line (see
> arch/x86/boot/cmdline.c).

See also my response on v1 - for MB2 path, look at efi_multiboot2().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--H3L8xXMJr0AcoNuY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmwCRUACgkQ24/THMrX
1yxA5ggAiLMgeHCgw354QZxy5Nz4/ZL+zy+dagaWLjfWgg8hixKmsiIJE2jmnIC9
qdCvZEueyTdXXesW+ojfHOHWBmVxVKdnbO50lMWIpccmjDIGhfyHxSB3qalACeTJ
hmFMbp1eAnBNaqwouZFLgMI8TKSkg3m1xiegDMSIYIdIgUVYF3r4cZWAZ9XoLoIm
2oVnDhLs/k1KCyd2t4Ah3uIBWyt8N40dRCYdFfyISVpfuiF6iKrl5Y+D0DwRdcKI
bpSMEi0o2rGK6Cm77XSrCrgCCbnWoUAafH8xz5JgE8y0hc5Tc5D3SlGwsKSd8b47
Nj5mkEpbPJzM7eCOEY8NyfmdvsYVmA==
=FjQ8
-----END PGP SIGNATURE-----

--H3L8xXMJr0AcoNuY--

