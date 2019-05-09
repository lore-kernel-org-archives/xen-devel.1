Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7B4C04AB3
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 16:19:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D5821783
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 16:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="Nxpg4aVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D5821783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOllK-00038T-Mc; Thu, 09 May 2019 16:19:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOllI-00038O-UQ
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 16:19:13 +0000
X-Inumbo-ID: 2d31c452-7276-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d31c452-7276-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557418749;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=5WIMA0/YtvMXo+V9WGp6/RA4X7WStcnKTfXjL8RET+U=;
 b=Nxpg4aVYGHsnTNjzgwzBUB+twM3Tvbsv5VlAVnXwX4XT8sjgjnUinX4sP/682d4fyg
 GGRwVqXPiUTGD305AGKjVlKGkFkkJNB9yx2N4uffTdQbxLlnwAbzG70WT4sk4tIb3QO6
 QGUHZvrDh+WVGCT8jAWazoO4o/8JFki8TDYBw2hXRXqy4AXe9EyFLFi3z/YjXr+xZoDl
 asK6LEbqJUb2pGaoEimWgWOl74iymKXy5DFbnXYWfxdKFbJ0Viy20G+cNjpq0K09zPzy
 ONhr3Qpgh/nLroVHLBTrtLhYD5UFvFrw33tsysWyDacMSFOIg/hGJYLn1fDQljVVy3Dg
 wAGA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 AUTH)
 with ESMTPSA id 60a847v49GJ8pVl
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 9 May 2019 18:19:08 +0200 (CEST)
Date: Thu, 9 May 2019 18:19:04 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190509181904.101ac9ef.olaf@aepfle.de>
In-Reply-To: <20190509161410.qb7kuokuq7xoyx5t@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190503161132.06f85271.olaf@aepfle.de>
 <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
 <20190509175438.3e2016b8.olaf@aepfle.de>
 <20190509161410.qb7kuokuq7xoyx5t@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============0911736039960498452=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509161904.gnU7GeZXVcCOVmf7uwCwlc2eNt_ZbM4Aetv6lcXBBUA@z>

--===============0911736039960498452==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/HP5jKJPhZjmFnbq=YG6lJXA"; protocol="application/pgp-signature"

--Sig_/HP5jKJPhZjmFnbq=YG6lJXA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 9 May 2019 18:14:10 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> The patch below looks sensible to me, and it's more like what I was
> expecting would be needed to solve this issue.

The remaining question is if a new state should be introduced,
or if LIBXL_DEVICE_MODEL_VERSION_UNKNOWN would be good to state the fact
that no device model is required.

Olaf

--Sig_/HP5jKJPhZjmFnbq=YG6lJXA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNRS+AAKCRBdQqD6ppg2
fq1xAKDRfYeZ/VZAlHsrQHMyjGMxx21CygCgqmPBxrtwHGNo35gmGdovQpqS30A=
=XhgC
-----END PGP SIGNATURE-----

--Sig_/HP5jKJPhZjmFnbq=YG6lJXA--


--===============0911736039960498452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0911736039960498452==--

