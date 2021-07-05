Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03758C07E98
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 08:02:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8508613B2
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 08:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8508613B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149867.277185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JYp-00028T-62; Mon, 05 Jul 2021 08:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149867.277185; Mon, 05 Jul 2021 08:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JYp-00028M-2z; Mon, 05 Jul 2021 08:02:35 +0000
Received: by outflank-mailman (input) for mailman id 149867;
 Mon, 05 Jul 2021 08:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0JYn-000289-FM
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:02:33 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59806caa-dd67-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 08:02:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6582UKaQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:02:30 +0200 (CEST)
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
X-Inumbo-ID: 59806caa-dd67-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625472151;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=2a35YCiZlYF+krv9oSYPP0qwc7dNF0JWN07wu+SYq0I=;
    b=g81ylTiAx4n9ra+L0C5ZvJkBTOMFvEO9rnW3zkuwkFEomNx5ojU0NMnDo+dujVKQQ2
    +RjH/pgf/HfxbhJKyk2N7WxY5Lx6Amk4ghWso4Rc4ACpDtRJ2zbXG0OQ1Klpd6L/Pv0I
    uw/UbZx9U/q10Quyml2oE18CqbHjlKSWRXYL83laaB2FnDN3cRYDouR1WgONDId6MbX1
    l7+suYInxLzcfZjGbOdcRTxHvmI1/dgEx79vgmBZqfIdcxJupf+9cD38n2PPLq6R5v7h
    cGwXaICsKcrCLc3nIdgiJ3Fa8oT9WgnGlMqAiCHEoc0UnKclFBeiIunCqu0oY2XYN2ps
    e8bQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:02:28 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
Message-ID: <20210705100228.4947ed4e.olaf@aepfle.de>
In-Reply-To: <06968742-355f-ad37-0681-e51eea256414@suse.com>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
	<06968742-355f-ad37-0681-e51eea256414@suse.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bl.bklON165KmYyWfGn78yU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bl.bklON165KmYyWfGn78yU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 09:57:21 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> What is "the grant problem" referring to here? Neither anything above
> nor the offending original commit has any reference to grants, or a
> problem with them.

When the guest is paused during final transit, the backends will continue t=
o write into domU memory. As a result the final additional iteration to ver=
ify memory on both sides will always see errors. The code has no way to kno=
w for which pfn such mismatches in page content can safely be ignored.


Olaf

--Sig_/bl.bklON165KmYyWfGn78yU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDivJQACgkQ86SN7mm1
DoCxqxAAk7WabDn5fjrO+RWOBvCAdMST89Qxyyox0g8uwbThD3CHKjHKWGMLHfyi
GvMACwgD8s6AX2kFXp2G6jKUJExAfjIvjaQylebdvSP3KqEBqOkqKDopF5RwOyO6
m0WOXq9uGUqXIieuhdLcAQ93hBLRziG/uLN6/RSiN1fAQAWVkcc7dg3S1SgQFfNx
FqVBX1ncYCfWkW5W3CyMWQlIRA+R9HcdA514OXzIERDcGYlDvandICx/RTGAVfvo
lnXzebWZe1ZihY4OZnNdAO7gWiQrSUHNdtD44PBVBmpo4GU6xSKoMpBLWjD+lHBK
8rJrxbf7VRxcIMaBaEdO6omft0uZXBC0vEZ4/GjNI6eKVSpxxFLA5fouSHW64hEc
V99nZkz1Va9bJvrwC5c3i2RkbBd7VaCTusTBiT8LztsPUOmpn4Xgfsj1+2BrdvyG
AMLTG1+35ssqhmQ7Xxa3XBQFMwPh4Qu1EWx1EYvSqxM6+7Rm5HkFxMBb8ToYkmqg
7lBHfUEezH6CkF1JWyLXJ8agL4/BnBWnsJnAbjMH85dGPmdA+cUy6D7PwDUC6oXH
QaZQ2Bg0RCiIuD4QuwLq2GUy/CghHvK+QG9vZNnbyNiMWygduCwitMWcRuCqZJYB
drnUmG/iqnIsKleD3jNePYRggnNgUZRKDXV/twSLahkkeGRoS8Y=
=ZKzQ
-----END PGP SIGNATURE-----

--Sig_/bl.bklON165KmYyWfGn78yU--

