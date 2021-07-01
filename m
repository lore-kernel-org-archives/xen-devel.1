Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62942C11F69
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:41:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2576141D
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2576141D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148897.275203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxsv-00056h-8Y; Thu, 01 Jul 2021 14:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148897.275203; Thu, 01 Jul 2021 14:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxsv-00056a-4J; Thu, 01 Jul 2021 14:41:45 +0000
Received: by outflank-mailman (input) for mailman id 148897;
 Thu, 01 Jul 2021 14:41:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyxst-00052g-6J
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:41:43 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73148ac4-da7a-11eb-8330-12813bfff9fa;
 Thu, 01 Jul 2021 14:41:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61Efa7Ji
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 16:41:36 +0200 (CEST)
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
X-Inumbo-ID: 73148ac4-da7a-11eb-8330-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625150497;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JgvL2sC//ao7ppxnTpjo8vPlzd0G6gPifGziXQs2OzA=;
    b=XHUjnWf/aM4NltKDeHfnyPkt/qYhoW6PWtYJsajWBQ+QJ1eBo15M0UOBwjBGt9crLX
    T9zb8iBBNH47iQRN3PwesVfxiAWVJqPFpdjbGQi9NkVndMa6rA3yZtvskZ9HxVGmIYXx
    zFR6fzEDIYL/1YzXnUqRStZOXrFWh1SSgYQfdw6yQyie2jf1E26nMn70i3FYraGwE8hu
    gpUaD41yV9kqYVJbqt97tvPePxtZ5+019NihxFjE4lyhW+NfUNgGjcMpqonpAg0Z2rQI
    QVBUH/PwpZbn+g3DN0JtoWEo1Gx4shznntdziFdXnCD16W//4h7a4Ymw2S/L8iMAit4j
    vWOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 16:41:35 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
Message-ID: <20210701164135.5ba31381.olaf@aepfle.de>
In-Reply-To: <20210701164055.6f373be1.olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-4-olaf@aepfle.de>
	<038fa686-c7e8-4afc-e84d-216c3a3f6d5b@citrix.com>
	<20210701164055.6f373be1.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sLH2SbXlvagca7zYZblvAT2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sLH2SbXlvagca7zYZblvAT2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 16:40:55 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> could

"code", sorry.

Olaf

--Sig_/sLH2SbXlvagca7zYZblvAT2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd1B8ACgkQ86SN7mm1
DoDjGhAApUD5tFAYDpuaLWcvhrvLfaxl0Z6QGPz6A0FBpRntVONciHmApGynJUAN
QJPZ7ZKqTWGBe6qMUmPe9RUyNhj512n592tlk9uc0MBzOgLH7zrBAXEWBbNAtzoS
lf2elpLn+bWNP5YR2sYGeOk0NYw9+VRz8JjueTzH0Mhee3JLjm/fvaUeJUAXOMWS
9THptflu+j2waLZcXIH+f+HeB/vq6pN5s6eikPPaQpmia6B1JRWGtTz0VbbAA5KN
TNEyXwOYau3PCWnm8Ntt0iuqqYvSvdBE9bl/TQwTWttzulVQQZqxgdLSmIDOhieI
7NNmGRj9oKRbE9+el6J2Km2V5UsfCOlnzz02nSTdKcKSQC9nyx1d1n4eC/yrlPYP
MLrubbRAtDLu0WItg4NRQhfSY65/NzkGZmoK1RIA0g/D0AEG+T6N5O8OwffyPIMn
GPeIYvJbD8kYcJlxy7/og5Dt1VTh0UDfKJr45ocAFaB4CoNpC94d5oBzxg71OUFD
b3cCH2uI04d5Vd+E9XX5WMo8kO8apJA9jZTf7hvpTwd/e5G9WUnNwdHFDJXa2BOO
uR9vY7KO0nAOLE9V1CI/R9AimvkIROKMwIxVUCreJYmxCmybrGOzxYS8MyCDWhox
voEklUxfsue8MOKVaeBQGpu3D/wM6IIe1g6k05lgX76ofcuuGOM=
=X+eI
-----END PGP SIGNATURE-----

--Sig_/sLH2SbXlvagca7zYZblvAT2--

