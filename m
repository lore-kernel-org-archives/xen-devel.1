Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CC2C43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 09:09:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F47520717
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 09:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F47520717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVKC-0003aO-1u; Wed, 18 Dec 2019 09:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihVKB-0003aH-7Q
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:08:55 +0000
X-Inumbo-ID: 03c905dc-2176-11ea-9048-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03c905dc-2176-11ea-9048-12813bfff9fa;
 Wed, 18 Dec 2019 09:08:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8FC7AE8D;
 Wed, 18 Dec 2019 09:08:53 +0000 (UTC)
Message-ID: <dcf357f19061842ec2fb25f204133826521741da.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 10:08:52 +0100
In-Reply-To: <20191218074859.21665-4-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-4-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/9] xen/sched: cleanup sched.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============0050102261987913226=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0050102261987913226==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qKbT6f40MmbETmL/VqZb"


--=-qKbT6f40MmbETmL/VqZb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
> There are some items in include/xen/sched.h which can be moved to
> sched-if.h as they are scheduler private.
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


--=-qKbT6f40MmbETmL/VqZb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl357KUACgkQFkJ4iaW4
c+4UahAAw5MvBtqN/nuM08OqEQJ9FKd9QD3a8MlDSuM4DpQ5TadJkGG8oZBS0RlN
kg8lBDJRCWsd3cZ8hqgHrPfZSMN2Vbx/BHInkU6B5SYnsa2KHbYFmcc8ODbcPcJB
GnlWak5oa5tXAwF2KZnM5qimbMmoZUXkouJW2mXumrOcssVhYAVT+NPiivvPmM16
vlqJ+/mXA/AAdijhEo5LGLJRVol8Ghmw8jkIn65hCCu8agjnN19fvOa3R1HiKYrg
H02tNnQ50JC0YW7YI7vuVJfldrhklWx1crvzHKj+etbxyqaFTgEfJu1nIxfoYhQE
RQ+/A51yjzg5yePol+CzqV26rFKqEUVJ4U8KsHLYOyJivSf7e2YkzxeHigaeoJ4a
qPBdxx7zSKsfQ24VoJHcLJwEilF5506JDdd/mHjcrlKzcDnDmehDs/6W6nTF9z78
ro00Xz4qyaLa19W9w8V3/tXbgS1HiduQaJDnuf4BU8zPL055veTrpEOqyj0TicrI
cz6qvsCMunzvzW0lB2wJjaE6PIQGd7zZnEuCLBnuMu04j0Q9lVgKR5REVjmK394x
MOVbOyDF9zhETmwQDrgUDjxNaoil8gbiobD59QrYBBNpm+VovFieubjM0y4pKCc9
RsPNYuwUZP5Q86bHSyVh1Q7TO9J3sr9VghRBOPqxQskfDX37B+4=
=l+Ak
-----END PGP SIGNATURE-----

--=-qKbT6f40MmbETmL/VqZb--



--===============0050102261987913226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0050102261987913226==--


