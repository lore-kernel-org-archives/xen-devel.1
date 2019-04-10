Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF74C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 18:42:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D4120818
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 18:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="pKgpBJwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D4120818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEIB1-0003ul-2g; Wed, 10 Apr 2019 18:42:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOu6=SM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEIAz-0003ug-EB
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 18:42:26 +0000
X-Inumbo-ID: 60d5f76b-5bc0-11e9-92d7-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 60d5f76b-5bc0-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554921742;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=7uqkKzQ966ujE58bfXg/c2pwR2WSTJ8tvlrjRUaXDtw=;
 b=pKgpBJwL58+DI/4w+g56wshxVT7r3G0GyPhqMBG5JacroISO8fF3SgKl8VI3Z+O5G9
 a6CGjaBhSp1LDmWqj4pXtPoa/ThEIfTaGZtJO7+rjtgAjI8bIGVzVaL0RywCVP+R7a5h
 Wxhv3TN+I2QXmbpoYu0gJ2BNJCezWMwk41PgoxNJakVWQkrIUjkQZZg+Zdp+o55EU3JY
 WWsypw3I2C/3IwBU6jAp/oK/sy4QoiHjWj1TQya6WQIRASXxFIySUs80d1CfPMrsYwbF
 oJXCDd6xKP/dSt7NMUJytwUHuNiWZYZm7Cu63nWrGhxYbC84fmBTc744GsU1YNlWkB1W
 YLmA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kU1cX93Hss2ZSGyqTGGg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v3AIgL7AY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 10 Apr 2019 20:42:21 +0200 (CEST)
Date: Wed, 10 Apr 2019 20:42:13 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190410204213.1c71758c.olaf@aepfle.de>
In-Reply-To: <20190410162503.GI1435@perard.uk.xensource.com>
References: <20190104165755.73674a27.olaf@aepfle.de>
 <20190104174831.271161e5.olaf@aepfle.de>
 <20190107110737.1ef0a0ef.olaf@aepfle.de>
 <20190410162503.GI1435@perard.uk.xensource.com>
X-Mailer: Claws Mail 2019.03.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] status of non-live migration of HVM with libvirt
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1911216236774869344=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410184213.knaT1VhJNb8RhgE_oDUJL64e7dN7XBtfhzqo15x8a6A@z>

--===============1911216236774869344==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/eBv18_mhE8LTGuS7qxs4D+j"; protocol="application/pgp-signature"

--Sig_/eBv18_mhE8LTGuS7qxs4D+j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Apr 2019 17:25:04 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Because "Snapshots don't need to inactivate images", see:
> https://lists.xenproject.org/archives/html/xen-devel/2017-10/msg02782.html
>=20
> I had to add the `live' parameter to fix the lock issue.

Thanks, I will double check this part.

Olaf

--Sig_/eBv18_mhE8LTGuS7qxs4D+j
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXK45BQAKCRBdQqD6ppg2
ftVlAJ9LDFF2oJ1IDcFXZNzFGg8QTySiWACgkmSCLCoVfvmOobBHqP6VCmFYh+o=
=YjKk
-----END PGP SIGNATURE-----

--Sig_/eBv18_mhE8LTGuS7qxs4D+j--


--===============1911216236774869344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1911216236774869344==--

