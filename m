Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BECDC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:39:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDA620830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="gLpp9iSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDA620830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEAd4-0001xo-La; Wed, 10 Apr 2019 10:38:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOu6=SM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEAd2-0001xe-Gj
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:38:53 +0000
X-Inumbo-ID: d3d4d4b6-5b7c-11e9-92d7-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::8])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3d4d4b6-5b7c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554892729;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=w11LQW8q9JFJj/PbciNDa3+dD9oCnmziNQVcswHUEA0=;
 b=gLpp9iSRTELfj/ZZyBCyWCO0qeTSY3UTkukBYcSWFDGVO3KrC9KUVh0/ynda83IwFe
 6pwn7I2YjatZhlmtvPnjoV0xZ4Q9B6ZyUCejARVpBJ74gICczJ66KU2ifCWcS8UuwmMK
 cxeD1i8RNZHOzOSldZAjjrhgNioAGHbBUusJ7mQKwuvnQ0gwJjRwCkRkHTFtUCpHp3qg
 xz1P+J3CdXrPvygw+QDvv+2zTIVNbr7WhXVHNvBVMmQdrDC3WPFxy9jVu3hf1gqxPmsk
 1BsuhA0Q2dHVMzT0Iu84LABqDkTRsr4eFLvJWHaSrsAXsMUHkUWibr999A1kTgahgkMP
 xmyA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kU1cX93Hss2ZSGyqTGGg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v3AAci4ym
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 10 Apr 2019 12:38:44 +0200 (CEST)
Date: Wed, 10 Apr 2019 12:38:40 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190410123840.5bf511db.olaf@aepfle.de>
In-Reply-To: <20190410103338.5456-1-olaf@aepfle.de>
References: <20190410103338.5456-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2019.03.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix migration of PV and PVH domUs
 with and without qemu
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8890331554127464064=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410103840.Y5ofnktW2FKye0PgAEP4yadEXv6iOzlZOypEg7-ZgJo@z>

--===============8890331554127464064==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/+vu.R/0SGYvll4dPa2=MDcZ"; protocol="application/pgp-signature"

--Sig_/+vu.R/0SGYvll4dPa2=MDcZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Apr 2019 12:33:38 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> +            /* will be set later */

That should read 'may be set later' because not all callers of libxl__domai=
n_build_info_setdefault() have a need to update this field.

Olaf

--Sig_/+vu.R/0SGYvll4dPa2=MDcZ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXK3HsAAKCRBdQqD6ppg2
fmzvAJ9IS4U2tzx7qXruVEXy1+CpJl6YVwCcCGe5hIk8S63XFL8oOOVP/tP16Hs=
=97wC
-----END PGP SIGNATURE-----

--Sig_/+vu.R/0SGYvll4dPa2=MDcZ--


--===============8890331554127464064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8890331554127464064==--

