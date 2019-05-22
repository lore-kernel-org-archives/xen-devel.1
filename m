Return-Path: <SRS0=PJHi=TW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501F9C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 17:55:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9B220879
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 17:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="Ig0Pq3VJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9B220879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTVS2-00055T-Bx; Wed, 22 May 2019 17:54:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8yeh=TW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hTVS0-00055O-Iv
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 17:54:53 +0000
X-Inumbo-ID: b1843922-7cba-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::11])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b1843922-7cba-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558547689;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ips8VJ3RoO2g1QRwqwXJ5CdCNiEbFBY+1GGel9lRvZk=;
 b=Ig0Pq3VJDg0c+61FNh+4EtQ5Gj0W+5BEtVJ+SLnj7WhyUQJ5SWqPImciXkd+WQJE9o
 fAUbz8vifgZRAuA1NcK77UFW3sMpVzgcPTbklAWbiUU9sfZ+pFFSceiHOwoaPxcA3Ntz
 dM2EkJTt963HYYC5geUEXWvEvxf3luU8tCzA+Ffrm9uC6rN1B0/FJXr6oXSGYNonEBZB
 H9X00+39QFsA4jfS3Tivu8f+kGv7wHy1Ag0BQRzDtbTSvFJSi12MumyLzK2jafIdg5Rz
 tbk+ZG68isA4Vm6oSPY9IclRN5e3ZjAJscluyLRzdi+gjQF4GswCY9YA9zuExjyzC+A7
 5Cwg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMhmsQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.21 DYNA|AUTH)
 with ESMTPSA id N09966v4MHsmDBO
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 22 May 2019 19:54:48 +0200 (CEST)
Date: Wed, 22 May 2019 19:54:42 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190522195442.5bf116ff.olaf@aepfle.de>
In-Reply-To: <20190522145140.12943-1-anthony.perard@citrix.com>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
X-Mailer: Claws Mail 2019.05.14 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5473312914761159783=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190522175442.8RBVlx2Vgg7kAbBLL3lt1lo_XSoS6qZhDgJoODkP7bI@z>

--===============5473312914761159783==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/oH+waEoNBm9PgAjbqR=XoI4"; protocol="application/pgp-signature"

--Sig_/oH+waEoNBm9PgAjbqR=XoI4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 22 May 2019 15:51:40 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Can you give it a try with one of the affected qemu? (qemu-xen-4.10 or
> qemu-xen-4.11)

Thanks for the patch. Unfortunately there is no easy way to trigger the rac=
e.
Is the changed code path also exercised for PV domUs?

Olaf

--Sig_/oH+waEoNBm9PgAjbqR=XoI4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOWM4gAKCRBdQqD6ppg2
fsB9AJ92UeWtofT9z9voq3oIYrp2GMT5iwCdFcFKnlk6pCjSrrM0mcXSjUvTJLA=
=sksl
-----END PGP SIGNATURE-----

--Sig_/oH+waEoNBm9PgAjbqR=XoI4--


--===============5473312914761159783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5473312914761159783==--

