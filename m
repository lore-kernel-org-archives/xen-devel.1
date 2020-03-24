Return-Path: <SRS0=L5TH=5J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2438FC43331
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 15:11:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9BE20775
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 15:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9BE20775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGlCx-0004N4-Ul; Tue, 24 Mar 2020 15:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4dyw=5J=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jGlCw-0004Mv-Gv
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:11:10 +0000
X-Inumbo-ID: b11f55e4-6de1-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b11f55e4-6de1-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 15:11:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38538AC46;
 Tue, 24 Mar 2020 15:11:09 +0000 (UTC)
Message-ID: <386dc4bc9d2140420df641a19ec1e9747004b18d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 24 Mar 2020 16:11:08 +0100
In-Reply-To: <20200310090642.8476-1-jgross@suse.com>
References: <20200310090642.8476-1-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-4w+yCQHKdoU8P+0y9HZ7"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-4w+yCQHKdoU8P+0y9HZ7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-10 at 10:06 +0100, Juergen Gross wrote:
> When onlining a cpu cpupool_cpu_add() checks whether all siblings of
> the new cpu are free in order to decide whether to add it to
> cpupool0.
> In case the added cpu is not the last sibling to be onlined this test
> is wrong as it only checks for all online siblings to be free. The
> test should include the check for the number of siblings having
> reached the scheduling granularity of cpupool0, too.
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


--=-4w+yCQHKdoU8P+0y9HZ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl56IwwACgkQFkJ4iaW4
c+6uXBAA6iYCC/dSCoTOwcRyET0JLSrNOUfRaNRUWVNBu2r9AhoQzfPcJR/jcd5R
ApMWFKEhCqyn+CGrG0LCLncT+HZ2vUmRdvR4RiS7fdV/bbNbuBH2+WM4Y1u7B4X9
z6dYtJ8DdMtLo7QM9RiGKmZmMDRIjgdd8uyxscaFHZNogKnQavzZd0os/8QvL9cj
XrqNLFGME3olRu5Amxhr+Q8NFg0S4HjI3uT89U3+X1SjMIwf+tADpjmy+4FSOMMa
gTQMHIS3+IhGtWXid0alR0a0o4PMaZfDDVyD5KIywJKMzH7Rf2uR+PJXZK1Kq/eE
goZTZf29MQPDjYumE10ND8A32W2Bm7feLE2xwiKE5mp4mmJvYD77vtR4XHNqe6fq
WCBzS1MgbTylO5W6oszqK1t8cGsNB4Fpp+2wNuB0jfa9fO237Pu0PS6jhkR0PNTj
0I6DcgbFxonwYw27FqFZ31zss3rj4m3zmYV7E0UdS0lbuaNfX5lM/AQFQsURY/Rr
K5wwr7A33PrYrmXwSze8H6YKXW4ULul3hpP9+MJV65yXfIwK3fJ8KGUGiqWh+/0R
5s9DGIs8OP7JYa+RHbSqCJdgX2IhVHtP0QHhepK4h5N5pgEeuhIZKereGN8mGY7l
DFq4uOokmGSybxARgJZRNWWwAKpvoEbnsVj/HqPlOzd+cCVyW40=
=/7Al
-----END PGP SIGNATURE-----

--=-4w+yCQHKdoU8P+0y9HZ7--


