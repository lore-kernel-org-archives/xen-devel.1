Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E2EC432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 17:25:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30EB420673
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 17:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30EB420673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoZK-0003uX-By; Tue, 24 Sep 2019 17:25:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCoZJ-0003uR-09
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:25:41 +0000
X-Inumbo-ID: 54470ed2-def0-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 54470ed2-def0-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 17:25:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 725B5AE1C;
 Tue, 24 Sep 2019 17:25:39 +0000 (UTC)
Message-ID: <675f35c08613778ce0f796df256b05ccd1765352.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 19:25:38 +0200
In-Reply-To: <20190914085251.18816-12-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-12-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 11/47] xen/sched: rename scheduler
 related perf counters
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8483517107973944649=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8483517107973944649==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tPybuNMySAb8+6Ho8Vek"


--=-tPybuNMySAb8+6Ho8Vek
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Rename the scheduler related perf counters from vcpu* to unit* where
> appropriate.
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


--=-tPybuNMySAb8+6Ho8Vek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KUZIACgkQFkJ4iaW4
c+5JGRAAuM+I2SFiAvmg98Zx7oGOHPHtuX2SdlXTKe8FC+1pkDmcz8cmYumt7Q81
oq+mx2L6qXWFGOdROrd1NSeEZ+lhswvmZYHQPCkj8058lfFJxsolgIgqvQnAUV/o
QhEUHEwCfJvGpvdZNeBK+wS9mTllVRLs+3kYnml0iVRAJLY+kNwIC/w59QjWrwK2
yZO5evOy3YMBXO16tl72lngPRtmr2OzglLmd+HvY+HTUv/FPL9Jlq9YHgLENFhz8
L4N40ikGxCJlGIdxf0hS8e3a0qj8o8HE8qmbvcuFymF0OYPGcNcG5yh9IStM6eBV
ze11jS5eyPaVTHu+Dix4KH8i1T3EZ6CK1kj+zf0U4RBwJb1sLv8YlaaRJrGKye+z
ADoARcU8w4Zshjkg+Iv4bi6YsjQz2DFerVnLtU7oWb+Lz6LTOoJOVKxY35jNCjuH
m8WT/Wqb2SpoofOMynhR8fcb/YdtSJ9Rj4jfNuq/hORgxsbP/lYAKLSgTSaikX6F
3jgGL9aE7qO7VjtDtefrXNeIoFzrpO1J6yibi1E9Qup0C/smeP2wH9FLioX+WZ03
/ummjBWGsDOu63O4HnH5rjyWkILkKC8e4dkUQmIMidhZmFWQb4u6wQuboVeFyx7O
Q9S2p6gePxDDndoWcC6eAKL0jP3GQdCh64pb+ibjCToT9QDn8i4=
=BVYT
-----END PGP SIGNATURE-----

--=-tPybuNMySAb8+6Ho8Vek--



--===============8483517107973944649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8483517107973944649==--


