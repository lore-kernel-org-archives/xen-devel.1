Return-Path: <SRS0=mRjJ=6B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC14C2D0EF
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 14:38:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370FF2087E
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 370FF2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPS7z-0000xx-35; Fri, 17 Apr 2020 14:37:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H8UU=6B=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jPS7x-0000xe-LM
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:37:57 +0000
X-Inumbo-ID: 0733e1fe-80b9-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0733e1fe-80b9-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 14:37:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A58FAC6C;
 Fri, 17 Apr 2020 14:37:55 +0000 (UTC)
Message-ID: <5c2f85e4817889fe5ac4a21774468ff9b1ddd569.camel@suse.com>
Subject: Re: [PATCH] sched: print information about scheduler granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Fri, 17 Apr 2020 16:37:54 +0200
In-Reply-To: <2d2fb0af-2ec3-4b2f-4427-eb13e9623111@suse.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <d2577c4b4ff040c8f256d203e647619d9d4d6ebb.camel@suse.com>
 <3dacf98c-c4b7-a263-01d3-f8562619ff53@suse.com>
 <1587131006806.63738@citrix.com>
 <2d2fb0af-2ec3-4b2f-4427-eb13e9623111@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-cupDj4zpwc4lTzuuZY3V"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-cupDj4zpwc4lTzuuZY3V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-04-17 at 15:52 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 17.04.20 15:43, Sergey Dyasli wrote:
> > While "sched-gran=3Dcore smt=3D0" gives:
> > (XEN) [  259.337588] Scheduler: SMP Credit Scheduler (credit) in 1-
> > way core-scheduling mode
>=20
> You might want to consider not using the global variables
> [opt_]sched_granularity, but the per-cpupool ones. Right now they
> have
> the same value, but this might change in future...
>=20
Yes, agreed.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-cupDj4zpwc4lTzuuZY3V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6Zv0MACgkQFkJ4iaW4
c+6TPw//VT/xB4VwOI2eap2ndai88df+Ty3eJ1l6KdgGvjShZwvsNueNhxt3WC1Q
oh5EGrtlN9yajJvjM3CavyyrdQHIZ4+VkqsIkBHp9bPVnQlD/UC27c+K28XpU9jF
1bdXkWKuBD6WAf7kP6hR2f+BNL86Tv58LRErmQYC84S+vTT0MT94mxCnzfQFB5M+
hl0+CdDOHsImaBjqihjOlsTUsu5y3f1E2CiQuw6iQwDip0Snhomy1st1P8dYEjw2
vdyJB+uEjmrkTGVJEt2sfUzDV2YP4j+K4mDept6mwjpt+t1seeCUVBnykbJ/d2R8
w56D7Asi646s606du3Kv0boI9UdGPSq8KDI/B8GAo2wdsMCT0mNt4N1qjozcoqS+
Jsne7/ihD/0Fly4xdz5F0IkQ4HKhwKuJ2uKEepssUzwuNw9t5bybKI9NgUqAvTjW
1+rAvorPahAtXACdPpxhXpffI19TqdzCjhdHLJWKCvuv+iJnR+A2oxPdoMFvbcg2
7oHB6g9W74rB1xUZ6nXY5ytZ+7LnrvSQTe/jE04gHfpkZ4QmSs+N2nd6E6VLg8KZ
l1/OpKlgfpMJVhOiR8OtXSwwNe2pOKBuc56L1bBIvKjJ3mB61IeuipJS75citVOM
By6iBIFxUo7WezRx1ShRN08T/j1Hn3lIN6+C55V1yg5I47atSE4=
=3KaA
-----END PGP SIGNATURE-----

--=-cupDj4zpwc4lTzuuZY3V--


