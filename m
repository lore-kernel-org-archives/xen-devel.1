Return-Path: <SRS0=k60x=3L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A19C2D0DB
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jan 2020 13:07:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E192467A
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jan 2020 13:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E192467A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFig-0007rG-Om; Wed, 22 Jan 2020 13:06:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iuFif-0007rA-Kk
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 13:06:53 +0000
X-Inumbo-ID: 0a0c9cfc-3d18-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0c9cfc-3d18-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 13:06:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43A37AF65;
 Wed, 22 Jan 2020 13:06:44 +0000 (UTC)
Message-ID: <0961fa96db2c7e991a6117c989592efe16eb0ef5.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 14:06:43 +0100
In-Reply-To: <20200108152328.27194-5-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-5-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/9] xen/sched: remove special cases for
 free cpus in schedulers
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============0248318942723488356=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0248318942723488356==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KGIsjrr1c6GsKuliE2n7"


--=-KGIsjrr1c6GsKuliE2n7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-08 at 16:23 +0100, Juergen Gross wrote:
> With the idle scheduler now taking care of all cpus not in any
> cpupool
> the special cases in the other schedulers for no cpupool associated
> can be removed.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-KGIsjrr1c6GsKuliE2n7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4oSOMACgkQFkJ4iaW4
c+567w/9GuBDsS+on9jebYlB6qBsFhe2mI09dzJvg30v9557nXYNeCTB0QcShl5f
KptS+pcgZawfXB4lOkMruCBgstyr/cX26Fy16vCB/FND34mAuc4EeG4VlWsVYAk6
fRfNowZqsSXLriNvMARyCarP+WnyIEIvwjcYkn/EkyYsxRikuwcOLaxLD2K6hWR4
rBqyu5bwv2CCBsZX3T4Ktzi3DB7F2xsBdKfb7UQQho6lTx5PGMnUSXjT2J7Bd98u
v+j1LO5Ea6SlYYq+Mg8K4s7ifYG3WQtJIGZhiynYViCbbbqeGVoIN6q1gl0q+R6/
rwe0IdAfHrzu6qp0K1UfzSoD1uP/mYJ2VI8Np6RdyxVsenYwX6W+kZTs+9xXnZZM
Fhr6z8uDS/P2dBICqvAF5Dmm5jFN/7v+g5UY4aTGvQjdAveyMDxkdGOEMhOvGL07
hvwgj1Z4/yDWso2UCS2HJKAVgd4dUtFrguRR4qRgoQTszF9CYB9le+GF5pFJ+zBb
CZOlugVm+w8i0CYgpNzpvohIGYIUKz7w3sQIQQPjGQJbDsDjR0THprrh4LjP/q2v
StTCIAKbSAkOVz93NNuoOykcHn9M2B1LzMAvV95yGutVgut2BAcaJALPf0M6LyWQ
8x+aza/ZoCxaSh9hRrjAi6WinaYs8BkR6KGk2UWBKRKx5T7ZUmI=
=hry5
-----END PGP SIGNATURE-----

--=-KGIsjrr1c6GsKuliE2n7--



--===============0248318942723488356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0248318942723488356==--


