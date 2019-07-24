Return-Path: <SRS0=H2PL=VX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8315C76194
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jul 2019 00:25:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893E0217D4
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jul 2019 00:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893E0217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqo2I-0004K5-0U; Fri, 26 Jul 2019 00:24:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqo2G-0004Ip-FW
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 00:24:36 +0000
X-Inumbo-ID: bd6821b4-af3b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd6821b4-af3b-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 00:24:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CE97AC0C;
 Fri, 26 Jul 2019 00:24:32 +0000 (UTC)
Message-ID: <da915ca1a21d33182c39fe030e5fee0e2d1545da.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
In-Reply-To: <1563950358-8988-1-git-send-email-andrii.anisov@gmail.com>
References: <1563950358-8988-1-git-send-email-andrii.anisov@gmail.com>
Organization: SUSE
MIME-Version: 1.0
Date: Wed, 24 Jul 2019 15:25:51 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH] schedule: fix a comment missprint
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Type: multipart/mixed; boundary="===============7173210321304714060=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7173210321304714060==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-pN7EMFpoMDthFXgfgxfr"


--=-pN7EMFpoMDthFXgfgxfr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-24 at 09:39 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> Fix the comment misprint, so it refers to the exact function name.
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

In case it's worth a commit...

Thanks and Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-pN7EMFpoMDthFXgfgxfr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl04XF0ACgkQFkJ4iaW4
c+6aXhAAwqCNKuF1+xr89DlV0/Nhecbj8P08zGI0kuZO8HmAKKzNxWeuNWB1ttx5
4DdPuJhTxBH5QBGMJ3TS6vfHThMwi2W2uTLMDgPSVqvaUOp867OPmTjDyO8QkEUR
S7AMrPCJZPG8DahSyHyl637+dvVp+7MZspVUo9Mo8l7ne0/TMGiRN/d0s1vCYSp+
IdZFflWjzlxvmHDKwArj5jiAN4zs+0vEzyA7KPFbSiCEgXgT72TiVpAynlPnC2ge
WI9Nwu+sS7A8tjVVmLB+RvtxZYOqT3ty67B95/IQUTfcGvBwS6QwW+bkMditeu7E
KIssCbGa4OL30kXSWfydjCgVMT2cu8U8qELPZMjxO9+0C/TLm6UPmGpee7G0zgvz
/brKXLugPIycQ+9IXADV63pDJ8dhabyRIMPn6HBIkY+NjmjlximCp2dDShVSjqwq
2iV2cXk04IhO9vGL5lGhcvXSqjNHi4yzOBxELrUwIVV3ytBPQZqClxksiN0OPM9Z
ATwlJS2wndOwAhDtTraMb6B5T5Fvm919rvioHx6WM6eJ4w0Thdux+v/MWqb+S5iX
CpuF07ryUKKPh0HhQtRAsR3SSaPsOAYcJaiiBODdR3Ueq8RwOMGAAqxcRxINYvqP
1Z+lXpjV+auC/5v4EHD/3/okqjunMoizjNEb7ij9O6KAzIv9GDQ=
=vZIi
-----END PGP SIGNATURE-----

--=-pN7EMFpoMDthFXgfgxfr--



--===============7173210321304714060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7173210321304714060==--


