Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89857C04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 15:09:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F2C20657
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 15:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="J3exx5PW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F2C20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRI0j-0000ix-WF; Thu, 16 May 2019 15:09:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRI0h-0000is-TE
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:09:32 +0000
X-Inumbo-ID: 9a0694df-77ec-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a0694df-77ec-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558019368;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=yxeyVj51HStzV9C8+XYBTwVpOnUyJ7+j7Eerkyy1tFo=;
 b=J3exx5PWQ2LijqUDIaLIi2UjgZzq6EYOAtStt26n4stsdLSkgKl2fh+NLlZU05UhKM
 aiFYVVLAkJtIo5rJvmA5iQel9O5LMA7NV9DUn1/CmPR0PY+pfLsENIOxoomKhosp/cdp
 72VrhBlR+3qT63rF3O3tt+CtMY4Vgg5ptXlUPJClNgBwkv7U3GghLTBy90bXPXOuSIJw
 H7ywu66oKV1jVDF2Xlp0LLJ9045aYX/O7TzrLUyVj4/JuMVxyBdY0itFjKuiwgm5eOk1
 8Gna11E50YiSHIK3tJ/ZDyxu+6+jnMcfXIyGq4o0rhOydGMb2MuTTx+LdNg0uG/dFXyZ
 b81Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4GF9NFjY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 17:09:23 +0200 (CEST)
Date: Thu, 16 May 2019 17:09:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516170919.07393e95.olaf@aepfle.de>
In-Reply-To: <20190516150355.GJ2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
 <20190516153601.45352e5c.olaf@aepfle.de>
 <20190516134653.GI2798@zion.uk.xensource.com>
 <20190516155455.3a97d2fb.olaf@aepfle.de>
 <20190516150355.GJ2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix device_model_version related
 assert
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5535046229367981717=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516150919.-JxmtZ3sCJ0KgLYVqXopRD7Gp--w3zAZNAGmX2ATlzs@z>

--===============5535046229367981717==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/0FL8uAyhIrP06+CoEGqk55Q"; protocol="application/pgp-signature"

--Sig_/0FL8uAyhIrP06+CoEGqk55Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 16:03:55 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Does this make sense?

Sure, I was looking at the wrong function.
Doing it within libxl_domain_need_memory will certainly work.
Thanks!

Olaf

--Sig_/0FL8uAyhIrP06+CoEGqk55Q
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN19HwAKCRBdQqD6ppg2
fthHAJwOh5WBQAuLmcEkxBfPZntW/yR30ACfYND5NDjM4qwBWGCt+GHAJiZYx50=
=UQ57
-----END PGP SIGNATURE-----

--Sig_/0FL8uAyhIrP06+CoEGqk55Q--


--===============5535046229367981717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5535046229367981717==--

