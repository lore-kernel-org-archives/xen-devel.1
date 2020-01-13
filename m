Return-Path: <SRS0=S16M=3C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B062C33CA9
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jan 2020 17:27:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30548206DA
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jan 2020 17:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="R8GJ57wg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30548206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3U4-0002R9-7G; Mon, 13 Jan 2020 17:26:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=boG1=3C=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ir3U2-0002R4-Fv
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 17:26:35 +0000
X-Inumbo-ID: d70b46cc-3629-11ea-b89f-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d70b46cc-3629-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578936391;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=kpxJwgp2dwUFGWhc0mraOWi7EKMZPNDBiG+sV/3ntCI=;
 b=R8GJ57wgUJXIYFBVb93JdO61JyiT3ZNpmTNgGM3RHj0iUsBaWPhifouNyAbyZcwFk+
 7TsQHHt8HkTUH4YFnQB28LUnlUNj/UDM8lFRVNBmdaDPvtWGuJDtlH+nhRE22dBigKhe
 0Er7+PuYuSQlIrgGcnvWl5LBXTmKE6grVTAgNk2I5B92UF5DqauKcLoVX6qj3W4UvuJz
 u+7QgsDtGNZF8lBl7xr5fRQ4CoTR5Dt/EveHXccWc3mOSFGykkB2CB1wuB9vNN++lCWv
 AXrJlNGf3TPTVdNxxDnoqikPAshmNJca+f+ICp3Ey6ZgDZA+CddUpR+pQVAcjYwfc9rn
 FFlg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuY8phYg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
 with ESMTPSA id j08473w0DHQVH7y
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <xen-devel@lists.xen.org>;
 Mon, 13 Jan 2020 18:26:31 +0100 (CET)
Date: Mon, 13 Jan 2020 18:26:23 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xen.org
Message-ID: <20200113182623.1de409b4.olaf@aepfle.de>
In-Reply-To: <20200113113627.08786ba0.olaf@aepfle.de>
References: <20200113113627.08786ba0.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
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
Content-Type: multipart/mixed; boundary="===============4033518590438519813=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4033518590438519813==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u.nH3ZyKk_xPKv_C96V094i"; protocol="application/pgp-signature"

--Sig_/u.nH3ZyKk_xPKv_C96V094i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 Jan 2020 11:36:27 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> qemu-system-i386: Unknown savevm section type 111

Looks like hw/i386/pc_piix.c:xenfv_machine_options must set m->smbus_no_mig=
ration_support to true.
Not sure why this remained unnoticed for so long.

Olaf

--Sig_/u.nH3ZyKk_xPKv_C96V094i
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl4cqD8ACgkQ86SN7mm1
DoDNqhAAoniFYUHNdoErUeW3yqaT3ktBqwA5ywaOJXjE+FCTkTdlnln7c95errCr
LVKkMOjTr60K15emTktZ4oo5xCz417ALakG0KxR4JEYnnVh9DXtpaWPcIh6hUxPj
crt0hU7H0oFmfS5Bu8ZNzrSXb6zcR8nv5DSCf8IDdzEuPu9iuGuRFf02uvMtZm/l
kFXgtTD7keWtLkJ074B49HXgvu8bf7At6J11qWre9tN7A8xA1hfFuam6SlYQnn1f
ebSsBWcwihJj/CVCa1dWPFE3oXvb9CPq9c1TgWqidnLJmekMCk0Mu1st9xzf1/JJ
2CeSULfoDD2bx1ijcmAJY1pt0UbADqYQUDpLP/nRC/iWINpP/Ass87fonGbmjDWB
QZGC2OcJDrcWS30IHmu5yKN8Sq0NIkwqVWbz9UwLacx8ZwkMdcKsWTov3yaTZSqb
n9uJO+LxF7cm1LxGY9xYNh9VX1SU6plO9f3Y/GRiwwvrWjBNQbBdUgbi+YBoi0nL
+rNXcwBRg+g4nr8FpfCFI+RrFwRPRWvl/oApCK+S6As2/Ptw8lxabYvbc4dPMFCD
aW/kr/e1RSyoNWyIFqv4GLsjcl1lBRwxqIQvnmcI+LQCtgPnCzKOjTDfz5NUEJd+
a92sjfdQFz9HphDSxDzh3Av0n7XUkiBcbXUBJMl1bgNG8avYWyY=
=BKDu
-----END PGP SIGNATURE-----

--Sig_/u.nH3ZyKk_xPKv_C96V094i--


--===============4033518590438519813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4033518590438519813==--

