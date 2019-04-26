Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F739C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:01:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3863D2089E
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3863D2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK0Tq-0005oO-KR; Fri, 26 Apr 2019 13:01:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9dDU=S4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hK0Tp-0005oH-1B
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:01:29 +0000
X-Inumbo-ID: 6654e86b-6823-11e9-843c-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6654e86b-6823-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 13:01:27 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 26 Apr 2019 15:01:25 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 26 Apr 2019 14:01:17 +0100
Message-ID: <49b2fb80a576cff4b26ae09668cc8b5b243a9f9a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2019 15:01:15 +0200
In-Reply-To: <c7f0e1c1-f69f-3c53-7147-21e24d4618b1@citrix.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388014.25746.13361382203794112287.stgit@wayrath>
 <c7f0e1c1-f69f-3c53-7147-21e24d4618b1@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid using
 cpumask_weight() in hot-paths
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
Content-Type: multipart/mixed; boundary="===============2104919476016393453=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426130115.jKP46pnAXxSXtof-pAmAq1iATcFRwnYVSqDn-_tNUWM@z>


--===============2104919476016393453==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8E48eeu5oe0rVn3CWdC+"


--=-8E48eeu5oe0rVn3CWdC+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-23 at 10:44 +0100, Andrew Cooper wrote:
> On 20/04/2019 16:24, Dario Faggioli wrote:
>
> Definitely +1 to algorithm changes which avoid its use entirely.
>=20
> A few cosmetic observations.
>=20
Ok...

> > diff --git a/xen/common/sched_credit2.c
> > b/xen/common/sched_credit2.c
> > index 6958b265fc..7034325243 100644
> > --- a/xen/common/sched_credit2.c
> > +++ b/xen/common/sched_credit2.c
> > @@ -466,6 +466,7 @@ struct csched2_runqueue_data {
> >      spinlock_t lock;           /* Lock for this
> > runqueue                     */
> > =20
> >      struct list_head runq;     /* Ordered list of runnable
> > vms               */
> > +    int nr_cpus;               /* How many CPUs are sharing this
> > runqueue    */
>=20
> Unsigned int.
>=20
Yep.

> > @@ -3944,8 +3951,12 @@ csched2_deinit_pdata(const struct scheduler
> > *ops, void *pcpu, int cpu)
> >      __cpumask_clear_cpu(cpu, &rqd->smt_idle);
> >      __cpumask_clear_cpu(cpu, &rqd->active);
> > =20
> > -    if ( cpumask_empty(&rqd->active) )
> > +    rqd->nr_cpus--;
> > +    ASSERT(cpumask_weight(&rqd->active) =3D=3D rqd->nr_cpus);
> > +
> > +    if ( rqd->nr_cpus =3D=3D 0 )
> >      {
> > +	ASSERT(cpumask_empty(&rqd->active));
>=20
> And here.
>=20
Right. Not sure how they ended in there. Will remove them.

> Is it really worth having both asserts?  The second is redundant.
>=20
I think I agree. I'll keep the first one only.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-8E48eeu5oe0rVn3CWdC+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzDARsACgkQFkJ4iaW4
c+7n3A//fEy9EInhBvJ/45bn9S7kEYzRk9Y/EcLMAm1Z0ub+oODPHrosYpQuDW1E
bahe9rTBHCZbu4B+Ml++PwYXVOik9rZSC36Lasjnohq3D1JXvThop4bDH5IWg3vK
Hi+s3bb8rzG5vXBuDMcAp7FB9Iuao1cVxS3F774VsvQ6uG0EXEydtHdDEgDrLfoI
5B5qyDFHmPz8O+Od+FNTUmw7f177MEVDngbeAVqBPu/0+JAqZjArCWvpVa72nLfj
91zO6shwM1Tj+8IBWPxIoqtspqSQMRR6vF2AVHq9Xw+KLv6U0UpFLYsR8on/dhXt
vPrriECfB6tReTPte1huA3d00ak/SRE9cr4rqx2diGQkGgt7dAFKmO5l0SDDy5D/
Wxf6Xgz/HSttvFWL0UIbjIHpTwxgtKTRLsZIxS4p7rwug113vGEreGJ+1yj6PQy2
97a/TyMAwvnnGjs1EMp/nNLkfk857mRzaPO6RUVkhOOEOlmpHvVKI8QqLx+hhaWS
bibdE86YQs5VnssTm9nN7DvTn4a9xsSBMs3me5cPOe3m4qHbZ4F03w/c9RSA+4CE
RTulWayKw+KJhfAvTvsr9NzsVro5A+qkOZCdlRsdwPyo9keQENKIZyKnuWu2/JJc
zDPvlXmFNTFSJS44IRvBvUzXl07nVcaYsWgl1+mifGXhWOQEXOg=
=p0L4
-----END PGP SIGNATURE-----

--=-8E48eeu5oe0rVn3CWdC+--



--===============2104919476016393453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2104919476016393453==--


