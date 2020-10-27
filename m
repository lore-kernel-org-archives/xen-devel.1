Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B2AC4363A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:30:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE62C22263
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="BvlBpleo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE62C22263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12758.33053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMFT-0000PZ-C4; Tue, 27 Oct 2020 10:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12758.33053; Tue, 27 Oct 2020 10:30:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMFT-0000PS-92; Tue, 27 Oct 2020 10:30:39 +0000
Received: by outflank-mailman (input) for mailman id 12758;
 Tue, 27 Oct 2020 10:30:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXMFR-0000PM-GD
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:30:37 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 893a64f6-c3c1-4f1d-810b-5a74f4ae42d0;
 Tue, 27 Oct 2020 10:30:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
 with ESMTPSA id R05874w9RAUY3b6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 27 Oct 2020 11:30:34 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXMFR-0000PM-GD
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:30:37 +0000
X-Inumbo-ID: 893a64f6-c3c1-4f1d-810b-5a74f4ae42d0
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 893a64f6-c3c1-4f1d-810b-5a74f4ae42d0;
	Tue, 27 Oct 2020 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603794634;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=fxoKuNTxv9y4hpE5nRksZZWZ43+oumRhQ3184OpepgQ=;
	b=BvlBpleoBJEfdjJuFRuOv0k6Syyv3WbvJh6XTVVNldLThIwEX7rThE6YzIxYE+agWh
	xKeiT2hUDliT7TnULMUi3FxVwHgxV+wz82hIIY9yUhn5GX5y2fJ/TMAuyVcnQLADl6wC
	o+zv7qakKgF7jKvwjXjczOFFarH1rPL6xrh4Vo19Uzb8ViBSgXczyvudIHTa8v9Nx3Eh
	2ER8Glh8eU4F55HQWl0GM+mbxx2IUnQFcT3q5jI1jzWQ7YjZ64P5zm0eBsL2Vsb7E/ge
	nu4FgBsm3XON2mOynndh6bz1yfBXTn8zcqj7joGPsaBeROWQitqNjngOLZK8O+XHcIPG
	n6aA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
	with ESMTPSA id R05874w9RAUY3b6
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 27 Oct 2020 11:30:34 +0100 (CET)
Date: Tue, 27 Oct 2020 11:30:24 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: flawed Makefile dependencies in libacpi
Message-ID: <20201027113024.36948380.olaf@aepfle.de>
In-Reply-To: <da99d577-ce8d-8fcf-c157-5b91ee895097@suse.com>
References: <20201027104548.5823c554.olaf@aepfle.de>
	<d6e3a7b0-129e-9b47-8802-b71eb8642519@suse.com>
	<da99d577-ce8d-8fcf-c157-5b91ee895097@suse.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3GDVV37_kR=8HRgDTUmTbvi"; protocol="application/pgp-signature"

--Sig_/3GDVV37_kR=8HRgDTUmTbvi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 27 Oct 2020 11:25:17 +0100
schrieb Jan Beulich <jbeulich@suse.com>:

> In this context it then is relevant in which context you see the failure =
- firmware/hvmloader/ or libs/light/ ?

I do not have the log anymore to check this detail.

Olaf

--Sig_/3GDVV37_kR=8HRgDTUmTbvi
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+X9sEACgkQ86SN7mm1
DoDB8g//f/gY9NKfEv01Ui5VFcmTaxgpmIXbrRPSCAmtS3YEpOOYuHTMCsubcm/2
6YAyp4RMVhPu5dZBYr8GBu0WpkkaUZda9Ow0GFJtkgOIgnoE6mOE5G43fcXXTQ67
Zlm0CzSF5lgN9xgHj4vUuelaNAnnoLgEyH15N21BLoNU+dO+UyqyMnbajp90EIiM
DDDw+SLQPldCAVoAkAe8TjklgzTcV4ymfWkTVzgxqIzhFDJZj1IIDnZrij4wTGXJ
46D2p8ERHgvwzGlpueDshZ25Vc8Hr69mJAMS7kDwKNol/r7+a1ftCyAMKSI0O1pR
mamjVMKuSbVN//n+G9XIAcBThgUVyGJnlimoDQp7fTamn5EB85wcHF3D++hsNLXO
jBEug7F0huzpzN0xluHGw3swX6qzTc1rH5S0xWzB7KgSDenSJcxg3Onowe6/HKtP
udewETTNGj6xSkeAVM91Lwx16PMyTk0JvFF1FA7QRTCshKDx0LFtmlzXuUJtt6O7
j9hmRGHZ9w2k/7t5Lpid1reU51x2NX6erTIt+0o4Ud1FO3ITZJSITCwSWX2lg3+T
OCEBIcsPT3SqWWjhpUm31e6Ri+tw7XtiXMVA0rWzV2Ss8nx//HcYa3BqNBPARj1F
jf36+3qC1c9cGfy58W3JDBCGbidKZcdifMFwzN4mfHNRBzfRtdI=
=1Tic
-----END PGP SIGNATURE-----

--Sig_/3GDVV37_kR=8HRgDTUmTbvi--

