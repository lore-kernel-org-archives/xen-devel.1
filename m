Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D25C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 09:01:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58CC0206D5
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 09:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="W8rzkQ+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58CC0206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jia83-0007BW-Sj; Tue, 09 Jun 2020 09:01:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jia81-0007BR-H2
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:01:06 +0000
X-Inumbo-ID: bd0deb56-aa2f-11ea-8496-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd0deb56-aa2f-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591693259;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=RuuZCKgjPIJgtyGzKuYaweVGVX6p/xg0mzFWFdKIUMg=;
 b=W8rzkQ+/vf+c1oFRILxT+QeoCPeuiSiptpjr4kpiI/XVLyOBWI7zTGsnEyYnUichu5
 biPVHwIZ5VHk0SD3qTr9IthgsAvbQcZC35kQePo6iCwWq61tf+Xf9sH/sCCQKb1tdmaP
 W/iXsBN8agNS9zA4tspIR3tmxqUy9RIeQ3/WK+sHmLhUNLmpwLnUKumOtUx7iavk00kw
 suzZNcyvgusYTFbMCxGiOAWuJOixsNx6IOhY2gXt8RcBAlAGO5w2WRyKzmk9Ft6QhJU1
 akoMyucGoXAeneKQpCkgHuMAf0dn+pvC4ocNQ6eY8EK7X5VjXCEboYq38euH9g0pKgVs
 Vd1Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w5990uJTp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 11:00:56 +0200 (CEST)
Date: Tue, 9 Jun 2020 11:00:16 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200609110016.16a52277.olaf@aepfle.de>
In-Reply-To: <005001d63e3b$c85059f0$58f10dd0$@xen.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xLgo8N7WlYzeWYneK6Qtz7v"; protocol="application/pgp-signature"
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
Cc: xen-devel@lists.xenproject.org, 'Tim Deegan' <tim@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/xLgo8N7WlYzeWYneK6Qtz7v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 09:55:52 +0100
schrieb Paul Durrant <xadimgnik@gmail.com>:

> Is it not sufficient to just change the declaration of payload in kdd_pkt=
 from [0] to []?

AFAIR this lead to compile errors.

Olaf

--Sig_/xLgo8N7WlYzeWYneK6Qtz7v
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fT6AACgkQ86SN7mm1
DoAwCg//fJdmIIqoOS9TdBWweShgRB9K9KXMh//e1H1ZumbV5jP+IkwtmSrrDsTj
Q86fqlIgR8HkVlDPwxOjxf/mX7v6NipDsbHRyclaZ1eePhFzrLV8lcmTQhBSZRVj
IX0qxtMFHLVHX6xGcI3thISuv2T3viiBchoH4owXxpqD9dIrJ5iXWS1de45Ewgs2
xRGqsnPfCbtLn4XxsjNJ+5RHr3zpdkJEqQ1NXm9m6c4PQuRiRfEoBjHskbDhT8Cw
iXHge+aC9IRL/1oMJudyB3g6OpIFad8Ar1h1k1tR/YRAUznThDg+bIE3eU8JgLDg
/P8vEffB0EqkE+b1bhHgdlFdfbkud69P87C7sY4bgDkLoXWYRaVOgMUSTzvpb5RE
Hkx0jb/4RUJpz+ZWYDZaUKeEKRCoTY51MUCTyHMWInWwX0r5QlYknYrhjJ0BAHma
Wf729Mn8pQuFV5PwpFBftcyBBfCAWmebV/EEn/Zyq8wWKCwmmi1CYedHHor4GBdc
2ma5o0nouIv1pnVY33gN5RgFT2oQDprnFcEbKeo/2yBDJAQYcZK5Vi9yjUxNeT5u
+kdKcq+jYBnKj0bBaY4m8pu60ZVsPeWfNzJap220oHG656L4USish+NU/Fa5K7Ni
jLV3ew2vn8pRSv9Fscz5s2zj3bMQIDoJdbr8cuLvM9aFx61KBCA=
=PBl6
-----END PGP SIGNATURE-----

--Sig_/xLgo8N7WlYzeWYneK6Qtz7v--

