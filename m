Return-Path: <SRS0=QTwr=6P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75532C47253
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 12:42:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E07A20708
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 12:42:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="30WSFI0Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E07A20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUzb-0006cv-Cv; Fri, 01 May 2020 12:42:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omc8=6P=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jUUza-0006cq-AJ
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:42:10 +0000
X-Inumbo-ID: 2afb9500-8ba9-11ea-9b04-12813bfff9fa
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2afb9500-8ba9-11ea-9b04-12813bfff9fa;
 Fri, 01 May 2020 12:42:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6A2676D8;
 Fri,  1 May 2020 08:42:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 01 May 2020 08:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dH47A/
 HCA03Gm0iJjCfgzzdHe/2mgAJtRjt+ZkKFEcg=; b=30WSFI0ZXxMDWwaUo99VLA
 NZGlMNWzFzz8dyC3ikrLeERTLGpjmETn2/PreTNEsAPoDLas/EzmfgqdSASvKyN4
 Ps4cyEozj72vswMnVWLozty3q/IV8SLQT7FUeK5qXYpCbq1xpkzLjr06VXNru5eO
 9nMOnFdnfaWLyaQDSuL1+fvK6POM9vMuVuOD7bEIlzjN5VUuM2tO5mBVpLh1YWJ6
 ThWUA/DJPfDext5ZI21buzfytK/Ah6N41CuFFTro7UDrTAXppjGbtMiJGqxKpSl3
 u0p+MWFDrw+h5rah6aGHCb/Z/CxHe4hRgXiGO0hIipmQBkvEFUKCcC+VLfG4EuQg
 ==
X-ME-Sender: <xms:HRmsXnvykCzwXngegHjtJElfnTY58p1WoX4S7Y4Wb1d6QL_Nt3_EmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieejgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
 gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
 drieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
 homh
X-ME-Proxy: <xmx:HRmsXo5WlKxqIRUpgysAZ-J3sk-pXqtNK2T5HAD5vammAYRpdOUBxA>
 <xmx:HRmsXhqxpopNJ1qKSN_KMz4tMRIp8Rp831BgEZysfVhk33pXLA3a2A>
 <xmx:HRmsXsczIvMaTykICrgh536NJTwTsFzxTXFNoJTECfU-_pJDpbvLsg>
 <xmx:HhmsXgqQSoh7Oucts-vjAM3EMBLb-frQdz-V7HuHW0cMa-VOUpVHmQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFC823065F5F;
 Fri,  1 May 2020 08:42:04 -0400 (EDT)
Date: Fri, 1 May 2020 14:42:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200501124201.GJ1178@mail-itl>
References: <20200429225108.GA54201@bobbye-pc> <20200430222717.GA6364@mail-itl>
 <20200501115959.m5pwm735mxbrs66a@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1y6imfT/xHuCvpN0"
Content-Disposition: inline
In-Reply-To: <20200501115959.m5pwm735mxbrs66a@tomti.i.net-space.pl>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: michal.zygowski@3mdeb.com, Bobby Eshleman <bobbyeshleman@gmail.com>,
 olivier.lambert@vates.fr, krystian.hebel@3mdeb.com,
 xen-devel@lists.xenproject.org, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--1y6imfT/xHuCvpN0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts

On Fri, May 01, 2020 at 01:59:59PM +0200, Daniel Kiper wrote:
> On Fri, May 01, 2020 at 12:27:17AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Apr 29, 2020 at 05:51:08PM -0500, Bobby Eshleman wrote:
> > > # Option #3: Lean on Grub2's LoadFile2() Verification
> > >
> > > Grub2 will provide a LoadFile2() method to subsequent programs that s=
upports
> > > signature verification of arbitrary files.  Linux is moving in the
> > > direction of using LoadFile2() for loading the initrd [2], and Grub2 =
will
> > > support verifying the signatures of files loaded via LoadFile2().
> >
> > This description gives me flashbacks to how xen.efi loads dom0
> > kernel+initramfs (Loaded Image Protocol). Practical issues encountered:
> >
> > 1. It works only when xen.efi is loaded via appropriate EFI boot
> > service directly. If xen.efi is loaded by a filesystem driver in
> > grub/other bootloader, it can't load dom0 kernel+initramfs.
> >
> > 2. Given variety of UEFI implementations and boot medias, it was almost
> > impossible to force bootloader to use the right file loading method
> > (cases like the same file accessible both via UEFI fs0: and via grub's
> > filesystem driver). Which means loading xen.efi via a bootloader (as
> > opposed to directly from UEFI) was hit or miss (mostly miss).
> >
> > 3. To avoid the above issue, one was forced to load xen.efi directly
> > from EFI. This gave up any possibility to manipulate xen cmdline, or
> > even choose system to boot in case of some EFI implementations.
>=20
> Are you talking about GRUB chainloader command? If yes then use "set root=
=3D..."
> to select ESP before running the chainloader.=20

This exactly resulted in issues in point 2. In many cases it ended up
accessing ESP via grub's own FAT driver.

> Of course the xen.cfg,
> kernel and initramfs have to live on ESP then.=20

Which is another issue - ESP on ISO9660 is limited to 32MB. Which is a
very tight limit for initramfs of an installer image.

> Xen uses UEFI file system
> calls which understand FAT only. And if GRUB root points to non-FAT
> partition than Xen cannot read anything from it...
>=20
> > 4. Even if one is lucky to boot xen.efi via grub2-efi, then still only
> > xen options could be modified. But not those for dom0.
> >
> > 5. It was impossible to load xen/kernel/initrd using fancy grub/ipxe
> > features like HTTP.
>=20
> Why cannot you use multiboot2/module2 to load Xen from GRUB on x86 UEFI
> machines? It does not have issues discussed above. Additionally, the
> Multiboot2 protocol works on legacy BIOS machines too.

Yes, multiboot2 (now supported with UEFI too) solves all the above. I
want to avoid situation where we'd go back to the (subset of) state from
before multiboot2 on UEFI.

>=20
> > In practice the above points mean:
> >
> > * To get a usable product, one is forced to enable all kind of
> >   workarounds (not only related to EFI) _in default configuration_,
> >   because otherwise there is very little chance to enable them only when
> >   needed.
> >
> > * If something goes wrong, in most cases you need to boot from
> >   alternative media (to edit xen.cfg, or efi variables). If you happen
> >   to forget your rescue usb stick, you are out of luck.
> >
> > So, please, can someone confirm the LoadFile2() approach wouldn't have
> > any of the above issues?
>=20
> If it is done properly it should not.
>=20
> Daniel

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--1y6imfT/xHuCvpN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl6sGRkACgkQ24/THMrX
1yyOfAf/dft8RGYrNSg7HW1BPhFhZoa3lOaE45q3EG8F1eakMeZnDqZ1ZVL4cYNf
SjTGZRZuj/O9LcnlmnwDkNcmSgVJQ/UOg4FYy+jnyApCiqSTNx/CqYSGecNDXxV2
zDtNHw0F7rqcARDQAmWixPFyzmeB930KZt4oRTrEcm/1KIwr2bqq5mCysJ8SZXx1
PQYxVEo6qOe+mt9NzIhQ7Q4POd4lMBvDqFATgvVsXXeNmI3hheVEhP1nlhzWWaiD
VEKQCTtfv/VeK6lM9acFx+/pqs67l0mTBsvnaGCNmKmTPZc9ulrVfJKeXt19d4aA
AZWFLMpdw1Mhfnhp6WVhY5BARngmsQ==
=dxlk
-----END PGP SIGNATURE-----

--1y6imfT/xHuCvpN0--

