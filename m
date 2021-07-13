Return-Path: <SRS0=JVsS=MF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CA7C07E95
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 17:50:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7907961183
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 17:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7907961183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155527.287088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MY5-0000e8-K2; Tue, 13 Jul 2021 17:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155527.287088; Tue, 13 Jul 2021 17:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MY5-0000e1-HG; Tue, 13 Jul 2021 17:50:25 +0000
Received: by outflank-mailman (input) for mailman id 155527;
 Tue, 13 Jul 2021 17:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MY4-0000dv-Ds
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 17:50:24 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb23590d-e402-11eb-8792-12813bfff9fa;
 Tue, 13 Jul 2021 17:50:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DHoGt8f
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 19:50:16 +0200 (CEST)
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
X-Inumbo-ID: cb23590d-e402-11eb-8792-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626198616;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=SFJVxYgUdrFLkXTG9tAv0/GsNieccbCQUJp8qPRcpc8=;
    b=ZEk+2HcYwQ3xMo/ZveglVX4bf22md81YNzjhMpoNt92upS2Hmjag46pTEQ5Orfb/Vo
    suCrw4OnFjP1+exXR6eb1rncHQQuzBLejnNFp405W3o7NQSLRpxSCqLZfarKVvEh063Z
    reJdpYV22Q+URaPrqeAmz25ApLAo8xthwBoyX0e9BKWE0Dp9VO9rIg96ZSFHkKAPzs1Y
    gMDzbLaAjfaH4yOxjUlzBzL2dRosK4YQwI/1Dvjq5kue2KKTKh3WELLAyAAovoRyOYDx
    MsYoNhRR8VzKHrqWdtHmhiDwvgIF1w9fvPOO9L4lYtZ1lneXBP55/iHU0WqyZ/oYMwWb
    3M5g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEoBB7TP03sFNuPSPN4PnbbdNTIb1D72sIcKVnq"
X-RZG-CLASS-ID: mo00
Date: Tue, 13 Jul 2021 19:50:09 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 15/40] tools: prepare to allocate saverestore
 arrays once
Message-ID: <20210713195009.3657104f.olaf@aepfle.de>
In-Reply-To: <6bd5fbb4-881f-e41c-46f5-d31c93a7ff7a@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-16-olaf@aepfle.de>
	<644a7a4c-4fab-07be-2e69-2637254de859@citrix.com>
	<20210705132700.05d92744.olaf@aepfle.de>
	<6bd5fbb4-881f-e41c-46f5-d31c93a7ff7a@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uqzX_/hadRCxFLYTx9V8ZQ4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uqzX_/hadRCxFLYTx9V8ZQ4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 14:01:07 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> > Unfortunately, I'm not able to prove the reported gain with the systems=
 I have today.
> > I'm waiting for preparation of different hardware, right now I have onl=
y a pair of CoyotePass and WilsonCity.
> >
> > I'm sure there were NUMA effects involved. Last years libvirt was unabl=
e to properly pin vcpus. If I pin all the involved memory to node#0 there i=
s some jitter in the logged numbers, but no obvious improvement. The fist i=
teration is slightly faster, but that is it. =20
>=20
> Oh - so the speedup might not be from reduced data handling?
>=20
> Avoiding unnecessary data copies is clearly going to improve things,
> even if it isn't 25%.


For HVM the only notable improvement is the initial iteration.

On average with 4 migrations of a single domU from A to B and back from B t=
o A, transfer rate goes up from ~490MiB/s to ~677MiB/s. The initial transfe=
r time for the 4194299 domU pages:

with plain staging:
36.800582009
32.145531727
31.827540709
33.009956041
34.951513466
33.416769973
32.128985762
33.201786076

with the series applied:
24.266428156
24.632898175
24.112660134
23.603475994
24.418323859
23.841875914
25.087779229
23.493812677


Migration of a PV domU is much faster, but transfer rate for each iteration=
 varies with or without the patches being applied.


Olaf

--Sig_/uqzX_/hadRCxFLYTx9V8ZQ4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDt0lEACgkQ86SN7mm1
DoA+ZQ/+Pjrj+2WdAQPe6a99bsgsaDYhd6fyesbznYTQeaiPJ2Gdgkwi8vvGJTjX
KliDBfIxM1eXPgWmr+fuWtMN+THSnWwPU/QO/k5HInoTF/PPiwR2tgrda6OYnX80
cxfnN2tCP3UbuM2JgKqczVtujtGUlI8FNnbov/2xVKtEPt+fmoqgo6Jt6ncds/ZR
DKLRk6C8V2LpY4bBD1DxfQ9/7hVXmxOHoRR9EpjFISCeVJK5uMGEbeS+/4qwxZDp
4BI0SXcB37bYv6svg8MMkuO6GHpVsbi2rQsSEZz8K6u/yPTrMWmjlhFpm+FbKOOS
XtZ8nUSLUhc8LrDLrrTXY5zyPiivL73jmVy6K1FgAmLv4V9ry/EkbnD32whD7yd6
QAcvpIZYwbwYTal2pFEjLJ1nfIZ6cIsAPfj6wgZPPbkCVS/SoXuKOWFWBNNQ0TxC
Q0RWeP5zDkVlVdXMx2a9ugNK/FE0HWpPAs1F/vLGmBqs7tDNYJsXvZmL7pbMYKd8
Gk73+gbs94frZBadJtRuIbWdkie5Ve4imp7mlQXyFvS+z+bxXg6/deSV23syeaTn
XGsuH1jwH9x3zBvCP5+vUEIWPbgl2VpJ/tWpo8tao+ztPmsLDT8ADzqkKGJmoZZ7
SxbdGWERVXP1J90t17COsRMjRPPLfkR+s76BxH0ClZoFAJWLZO0=
=zGOK
-----END PGP SIGNATURE-----

--Sig_/uqzX_/hadRCxFLYTx9V8ZQ4--

