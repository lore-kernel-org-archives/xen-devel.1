Return-Path: <SRS0=IXL8=37=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22676C352A3
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 10:08:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA9620848
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 10:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA9620848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1SSH-0002qF-5t; Tue, 11 Feb 2020 10:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H8PB=37=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j1SSG-0002qA-Ck
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 10:07:44 +0000
X-Inumbo-ID: 57f65aa4-4cb6-11ea-852a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57f65aa4-4cb6-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 10:07:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E419CAE65;
 Tue, 11 Feb 2020 10:07:42 +0000 (UTC)
Message-ID: <2fac0567e7ff8fe65f2e6e5ea68ccd7793083d77.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 11:07:42 +0100
In-Reply-To: <20200211094418.7500-1-jgross@suse.com>
References: <20200211094418.7500-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: remove pointless BUG_ON() in
 credit2
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
Content-Type: multipart/mixed; boundary="===============6737641343291128753=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6737641343291128753==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-c1OIGsI+aA4iDwzfHKzx"


--=-c1OIGsI+aA4iDwzfHKzx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-02-11 at 10:44 +0100, Juergen Gross wrote:
> The BUG_ON() at the top of csched2_context_saved() is completely
> pointless, as the ASSERT() just following it catches the same problem
> already.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-c1OIGsI+aA4iDwzfHKzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5CfO4ACgkQFkJ4iaW4
c+6R6g/6A3XDwZBDXodpw4KvesSlOuiIcqeiVXGRQUa2IufUc1KxP4DuqFkPVJPr
j+wbQZ9Ut+veN1DziLbzCgfmHX7BjSej5zDJQhvG/LNDy+fLCgZLOXnzuV4NpXoI
pOp1LlfAedjr68nmedW1ryn/FqMQmxF/174g6UGWwhOGndZnZZCTNTTWwvpDx/PL
X3/WjAh77DBKiz3Ab49dtaqb3eG6yB2CJodW0zhNIKpTIlyrDqbCZ8ilrI7lNdW+
sxy1kzoy5FK1kXa5j+5o5zIt2v+r2Uh2Mk5QERUblD61oEbybjVwptoU/Kaiglmv
gUXC1h0FYYqk3ONdcI+67FI8kn9uxIPYT5MduslWsOux67JOeQGqNkFfrU7ujHaJ
GAQ//ao/Y6DZg1xF0H0/2NtQQPDZj1ySVLEYrGS1UWkmPUpD7kekruiU9NI85LGv
P+VII0a4DTreC5aMjeqjhtekIM6Y79qqIRY3zhJAhYcErPkuafJMrl9tloZ7ljSF
VEGKCPrNTYE1x+bzMWoguFPxvjse8YuU17NXry0Ho4Meo19JZRCzT6bMXgZCxVu2
oEDnq9leaYEKelFTvHHRfKXgt3I+czZTRvOF0yo8WAt6Y+H5n9P70d1V2IdP3rn6
gS8FWGME8QDkjgSSH7iTIWeqYr7r4xv6cl4CO7eZEOhY2QutSmM=
=K+zA
-----END PGP SIGNATURE-----

--=-c1OIGsI+aA4iDwzfHKzx--



--===============6737641343291128753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6737641343291128753==--


