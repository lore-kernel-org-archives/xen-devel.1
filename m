Return-Path: <SRS0=m/e5=XI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C98FC49ED7
	for <xen-devel@archiver.kernel.org>; Fri, 13 Sep 2019 16:54:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414F9206BB
	for <xen-devel@archiver.kernel.org>; Fri, 13 Sep 2019 16:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 414F9206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8oqE-0001xG-Eg; Fri, 13 Sep 2019 16:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEUq=XI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8oqC-0001xB-Qn
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:54:36 +0000
X-Inumbo-ID: 29b3a9ca-d647-11e9-95b6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29b3a9ca-d647-11e9-95b6-12813bfff9fa;
 Fri, 13 Sep 2019 16:54:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF19EAF80;
 Fri, 13 Sep 2019 16:54:33 +0000 (UTC)
Message-ID: <1e5b964792e0b0cf3b1195d162328dcd7139d27c.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2019 18:54:32 +0200
In-Reply-To: <20190909093339.7134-2-jgross@suse.com>
References: <20190909093339.7134-1-jgross@suse.com>
 <20190909093339.7134-2-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen/sched: populate cpupool0 only
 after all cpus are up
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
Content-Type: multipart/mixed; boundary="===============1946631565345697032=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1946631565345697032==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dThgNyxwRDaazTfASQUS"


--=-dThgNyxwRDaazTfASQUS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-09 at 11:33 +0200, Juergen Gross wrote:
> Simplify cpupool initialization by populating cpupool0 with cpus only
> after all cpus are up. This avoids having to call the cpu notifier
> directly for cpu 0.
>=20
> With that in place there is no need to create cpupool0 earlier, so
> do that just before assigning the cpus. Initialize free cpus with all
> online cpus at that time in order to be able to add the cpu notifier
> late, too.
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


--=-dThgNyxwRDaazTfASQUS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl17ycgACgkQFkJ4iaW4
c+4qEw/+MW4r4K2q0uZmFenMa4c01p3qCpEIFpYbP07ByrykKuzJQPloyy99G99e
kAKc1DDY49G3SHPZELqVMAOuU4LoK9QARKRp9AF8jF/84wobXsK+e/4a78Eu1fWV
Lkw1SKF7JH21F09Tzy85Sf/KxuXNQgYADQCWahiczSS1E1sKd2mJpVoblUuE23iQ
tYgJwnDYiwnz5t8C3bx4wzBz6GQ1KyVJKnHlSNY/valTwKxbIRuNaDttkFPDbU0e
AMrlvpH/8ck7R9kniLIxfzRiyI5j9sPFgrjFYGydl8TITu7oe/sEPnetfeHqg9Sh
d8puw0rRvQKNyNnAbF1ojjleE8UucIoW4KasxJldRlUERc7BYlAUb8GA1B0Bh09o
N37IJ+095x5Gz1T2BravZw+D7xHDOzsJ+LFb0tDTmU4I+M0wQPsUoaw68zvoP6Bg
flL1Jy1LtoGttGhouH9pebQ/C6dRxvmWwzAkhfjQBZAp/gF0+fylBmwsN+yQkyoA
2wZZCTlU5pH8w6is3Cxs6B85/qWRghvWuid1GOFJ+qN4wkV/WE9oM9r6o4MB9wYl
sjPQlc1+ZLcycocArpSx5Z349dalbQ3CwlSCYHnRlW4x5mCHNqPqj0MUk9dUHYaF
CUhvXIJC3P2g/wte6MhxVHrTobKyJ57OgOWjzIZvh6KonzKxfAc=
=l7x9
-----END PGP SIGNATURE-----

--=-dThgNyxwRDaazTfASQUS--



--===============1946631565345697032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1946631565345697032==--


