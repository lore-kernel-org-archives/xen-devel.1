Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B68C11F67
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:41:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4184361423
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4184361423
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148892.275192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxsU-0004dI-Uk; Thu, 01 Jul 2021 14:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148892.275192; Thu, 01 Jul 2021 14:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxsU-0004dB-Rh; Thu, 01 Jul 2021 14:41:18 +0000
Received: by outflank-mailman (input) for mailman id 148892;
 Thu, 01 Jul 2021 14:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyxsT-0004d5-6h
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:41:17 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb43a995-f0da-4761-a821-cac8bb61fb1a;
 Thu, 01 Jul 2021 14:41:16 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61Ef97JZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 16:41:09 +0200 (CEST)
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
X-Inumbo-ID: fb43a995-f0da-4761-a821-cac8bb61fb1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625150469;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=5q+N2VBHAtQyFyml4WQuHRm2+lkqKSKOPkDkryAxlx8=;
    b=oXhof0CeDekuGnHNaHvW1SY2Rx8afQ8QXxwsK44yqadzuXh7Ua4g8bmAlu+89P8Fu5
    t9LK++7IOBPa/K8wUlGmcTWNAI2rh9xITHdCcKNBhFTE1O8jGD2MhGSbkciUbSyKpKbo
    IBTbpr6Jf1i3O/1jQTVGM9qHGW2LnBXg87tUXy9VaTzQX3NcI//tz4VjG7HbAw/KqN5Y
    5lT57MTeRzi5HYtzLYOHFP3Gdn3UawkP6jO6+ZlBeAaYj0/+RYaReQP+k4V4pS4/UCeq
    q0+KbirbjRAobQEJf23KJa7XngdvhDaOu6G69LBeG8tbo+BtVRAx6udw4i3Ygb2mpq7f
    cU7w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 16:40:55 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
Message-ID: <20210701164055.6f373be1.olaf@aepfle.de>
In-Reply-To: <038fa686-c7e8-4afc-e84d-216c3a3f6d5b@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-4-olaf@aepfle.de>
	<038fa686-c7e8-4afc-e84d-216c3a3f6d5b@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TdB8zB_riXzFLIKxwGc9yRx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TdB8zB_riXzFLIKxwGc9yRx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 15:33:47 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Since when?=C2=A0 It was absolutely critical to debugging issues during t=
he
> development of migration v2.

Well, I can find out if needed.
What could would it enable today?
Last time I looked there was none.

Olaf

--Sig_/TdB8zB_riXzFLIKxwGc9yRx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd0/cACgkQ86SN7mm1
DoA0pQ//eZ+/5fW3H7knOOLBHA2FOr3+k/hbEzF8pu0KBV7v6SU0WKtxtAqrvtpL
c/Yrlo3TSyjoo/svV1hqc3Ojn/kogClZW03tsUPw7rd4G7xoXoxCaFAV0NiiYlYy
f9MdwDzMoIfP3NZGzapxorLX2BdsbpDOz1s1EMUJ4eB5NzM9fQfr7r83uVSTADn0
12d98uKMDQEzVzYnLkbehu2tyLsUaXtGTgcNLLolkhFDm8E2R2VVbXpLOHYGXFiy
+2iS7+N2iTREMaHiDH22tj1VJ6L1O468fliQuQSwsvIek/HoleujJXHkksOFt8ed
puvQrhD7qVhPZP8udj1Wd7dMWvtU4EmeLAq1MfwIG9L9QXIJ45yiAjhv1qo6dBpT
/E6fSoiay/L+Gvoy8MJ3xQY/+XoecpRr/xXEwtR8acfyvMyZuqkXRGhiNhhmfudz
hh8HsbSnpol5GRFJaB8P9F9i83t3NcJ21fV95Med5Y8GylXQy6fzJz6fdPRwybAt
WKebKefFKn7FNUur0RWUDTPzZ7RTgIOeAR7+zviMpD40SKkzqifWjfW1ZCjfrqhP
dRB6e6NV6eOPX0aeg5Z90H2Y9HIWkLDM4ISLFXqvwNeutPx80Ug+DA1a9FYRjy0e
hc6LzTfWxNMs6XS10Fjzke+O0fvaCru0Fjhhf2bypqOMtEFX2Lk=
=Fsp2
-----END PGP SIGNATURE-----

--Sig_/TdB8zB_riXzFLIKxwGc9yRx--

