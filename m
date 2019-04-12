Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFDBC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 08:03:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8448205ED
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 08:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="I0oWAIYi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8448205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEr8C-0005oI-9A; Fri, 12 Apr 2019 08:01:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UqIg=SO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEr89-0005oD-W9
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 08:01:50 +0000
X-Inumbo-ID: 38723e23-5cf9-11e9-92d7-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38723e23-5cf9-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1555056107;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jQk6D9QbNGJVdFiJcll9l5Ro9qs0z93nH3wxfjqKMzw=;
 b=I0oWAIYiwe8lDh3Y7GKuzH7VDOOyJ60KUjrSCvp0dDczcF/RjFsPdYxqmYQ6U/0yHI
 2GLj5iTAQN5445BFF1hU2PjXzQCmX4TCFRHhfIRtmfHDoegUwl+wDbtfkW/6LejkW2Xg
 XWRE1gbTICZz9pQVeIy2UCwz8aeDinsnPE5y052mJFj/1xV9n/pdgiix1QggECBOn+Mu
 sXo9qQnPPksc5EvuRnajnPDze4rdIRj4XgG/5rudmfYgIBTfoiOzIUX9suTll7i5y2OV
 MP7xfif4VAnAmYkQk2ueMTkue7MZ/8IF4R9bt8kfXTG2e5hglZCeZc6QXRO1J72dFw+m
 QB7w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kU1cX93Hss2ZaGwqes"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v3C81iD0S
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 12 Apr 2019 10:01:44 +0200 (CEST)
Date: Fri, 12 Apr 2019 10:01:37 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190412100137.22a6a3ec.olaf@aepfle.de>
In-Reply-To: <20190411155602.GL1435@perard.uk.xensource.com>
References: <20190410103338.5456-1-olaf@aepfle.de>
 <20190411155602.GL1435@perard.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0974651229378493655=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412080137.fZkEqhikPPdEGs-pnLjV6wB3pR_8ebJ_-5snL5nn4lg@z>

--===============0974651229378493655==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=a=EhyE3mgKG.QHG=su1j2n"; protocol="application/pgp-signature"

--Sig_/=a=EhyE3mgKG.QHG=su1j2n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 11 Apr 2019 16:56:02 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> I haven't managed to reproduce this, but this bug will go away with
> QEMU 4.0. The backend in QEMU 4.0 will not lock the disk image anymore.

I also have a hard time to reproduce it myself, but QA gave me a hard time.

Are you saying it is not required to fix it anymore in libxl now that QEMU =
may eventually fix it?

Is it ok for libxl to internally lie about the device_model requirement (no=
ne vs. qemu)?

Is it ok to leave this unfixed in released branches?

Olaf

--Sig_/=a=EhyE3mgKG.QHG=su1j2n
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXLBF4QAKCRBdQqD6ppg2
fl7mAJ9BWgwoO2dlerPQRPsLnyYC8emjhQCdEgVlvd66aTjjt9cV7q+Z+VzVP/w=
=YdLj
-----END PGP SIGNATURE-----

--Sig_/=a=EhyE3mgKG.QHG=su1j2n--


--===============0974651229378493655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0974651229378493655==--

