Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376B1C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:09:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08992082E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="QubXnqgI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08992082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEqa-0007sS-DJ; Wed, 10 Apr 2019 15:09:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOu6=SM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEEqY-0007sL-D1
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:09:06 +0000
X-Inumbo-ID: 93aa32f8-5ba2-11e9-92d7-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::3])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 93aa32f8-5ba2-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554908942;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=gzlu8YtClm/WRb5AWAjBI2i/XlKg1m2x89cft0xKq4s=;
 b=QubXnqgIflTzZwCtQWiMcsTZEVGtCBv+qeZWuJJTurGfzlB3+W7n1iCSxN7w/Hb4kD
 ijxn1JVKMcmR0aR+aMRvGcaWRM/9BnZpTMyoY2J75w51lV5YWoG92O2tE7IqInyVbY/9
 Upy4mWDFD45NEpQuysOzi9bBVeEauMm2owd2tDNc2Lgh5xkiwDCBk213D7VxRazdNRb8
 MvE8olicZHKrFmBl++b/MKjgek9G5RaeLwo5cXmlVuFKvb1W2xN3L7ZcNwpzE+TMW7aP
 oy9a0tr3i4x4XGMXgGtp27CPLtPeKTRQFWUPuyjWtzaIAjV2Xr2GHhGb0LPQROeCuDmd
 aS7A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kU1cX93Hss2ZSGyqTGGg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v3AF8o6M5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 10 Apr 2019 17:08:50 +0200 (CEST)
Date: Wed, 10 Apr 2019 17:08:41 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190410170841.616b5ab8.olaf@aepfle.de>
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
Content-Type: multipart/mixed; boundary="===============7947008111119058541=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410150841.Ol9THOp46c_ik9nBNQeG3GvB3m2c9jAqT7E-n4Hp2Gk@z>

--===============7947008111119058541==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QIrur3JEkyC3xkS5PpPkTE3"; protocol="application/pgp-signature"

--Sig_/QIrur3JEkyC3xkS5PpPkTE3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Apr 2019 12:33:38 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

>              goto error_out;

This one should have been removed, now libxl fails right away.
Will do more runtime testing.

Waiting for feedback before sending v2.

Olaf

--Sig_/QIrur3JEkyC3xkS5PpPkTE3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXK4G+gAKCRBdQqD6ppg2
fj9pAJwMSgXp/U833+zVTB2zsM9k3upc1wCaA/2mikZZTrR5ZSxgPitLaIUkU2A=
=kkGJ
-----END PGP SIGNATURE-----

--Sig_/QIrur3JEkyC3xkS5PpPkTE3--


--===============7947008111119058541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7947008111119058541==--

