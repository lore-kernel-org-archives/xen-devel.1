Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF739C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 14:56:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9361E2336D
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 14:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9361E2336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71486.128062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Eu6-00016X-A0; Wed, 20 Jan 2021 14:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71486.128062; Wed, 20 Jan 2021 14:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Eu6-00016Q-6X; Wed, 20 Jan 2021 14:56:14 +0000
Received: by outflank-mailman (input) for mailman id 71486;
 Wed, 20 Jan 2021 14:56:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQTN=GX=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1l2Eu5-00016G-I8
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:56:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a77624ff-7f85-4994-8be7-0bd422aab14a;
 Wed, 20 Jan 2021 14:56:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55DC42336D;
 Wed, 20 Jan 2021 14:56:11 +0000 (UTC)
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
X-Inumbo-ID: a77624ff-7f85-4994-8be7-0bd422aab14a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611154572;
	bh=pwC9nzP+vVc6dsGPWBSrBB/r3eTH19uhsaJxNS2zsug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DY3pBap0FLHNToGeZUeH+p+B71dr49YkUUtYHtMxVuo+/3iC0uA1XWtTZdTHAsSFS
	 e0uURVipbu4mkJG/Wj1k9ZYcSD/N8Wqf7mC9nOWtXtcFm8oNPlyFmQOBY73X9Ghi7c
	 Z7mHCqESG5WerJinms7zn4Kt4L+pK0xcMclsKgT0eQ6t71tS2/EtMRZtsKe3JieaR/
	 JsLXSsW7Vm3B/1V2BY9ZrCffGagLR6e4/15EoJaszBo9UW0APoxhRB5RyOTnqJjGVy
	 qKK3EtXLLJbXUBHj7G6/zEym/57p8LHjZRklZv2n7ZaPtLZ/eZn/q30S/8l855xj4z
	 YzVyWpky2wIog==
Date: Wed, 20 Jan 2021 16:56:08 +0200
From: Leon Romanovsky <leon@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/xen: Fix compilation error due to missing nopvspin
 declaration
Message-ID: <20210120145608.GA320304@unreal>
References: <20210120144303.501486-1-leon@kernel.org>
 <255ed6ed-fad1-dbe1-6d82-73c6a78701cf@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <255ed6ed-fad1-dbe1-6d82-73c6a78701cf@suse.com>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 03:47:00PM +0100, J=FCrgen Gro=DF wrote:
> On 20.01.21 15:43, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> >   arch/x86/xen/smp_hvm.c: In function 'xen_hvm_smp_init':
> >   arch/x86/xen/smp_hvm.c:77:3: error: 'nopvspin' undeclared (first use =
in this function)
> >      nopvspin =3D true;
> >      ^~~~~~~~
> >   arch/x86/xen/smp_hvm.c:77:3: note: each undeclared identifier is repo=
rted only once for each function it appears in
> >   make[4]: *** [scripts/Makefile.build:279: arch/x86/xen/smp_hvm.o] Err=
or 1
> >   make[3]: *** [scripts/Makefile.build:496: arch/x86/xen] Error 2
> >   make[3]: *** Waiting for unfinished jobs....
> >   make[2]: *** [Makefile:1805: arch/x86] Error 2
> >   make[2]: *** Waiting for unfinished jobs....
> >
> > Fixes: 3d7746bea925 ("x86/xen: Fix xen_hvm_smp_init() when vector callb=
ack not available")
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>
> There is already a fix queued in the xen tree.

Glad to hear, it is unfortunate that the problematic commit already in Linu=
s tree.

Thanks

>
>
> Juergen






--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT1m3YD37UfMCUQBNwp8NhrnBAZsQUCYAhEgwAKCRAp8NhrnBAZ
sU0bAP9yH3RzB2oucVf5I64Ur/cmm+KQP7+Z9hzCciE2HOnrowEAkMILn31D4Ix8
2vAqyHdFsLab+ArP/ppkqATsdi/xMg4=
=OQhj
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

