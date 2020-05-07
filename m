Return-Path: <SRS0=QEX0=6V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3A3C38A24
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 18:36:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF9B208E4
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 18:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF9B208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWlNR-0005DZ-AZ; Thu, 07 May 2020 18:36:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slKb=6V=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jWlNP-0005DU-PC
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 18:36:07 +0000
X-Inumbo-ID: 9c8410d4-9091-11ea-9f60-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c8410d4-9091-11ea-9f60-12813bfff9fa;
 Thu, 07 May 2020 18:36:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C5CBADCE;
 Thu,  7 May 2020 18:36:07 +0000 (UTC)
Message-ID: <e02432bf8ea8ca85a31176de1a1f9e429c84b243.camel@suse.com>
Subject: Re: [PATCH 3/3] xen/cpupool: fix removing cpu from a cpupool
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 07 May 2020 20:36:04 +0200
In-Reply-To: <20200430151559.1464-4-jgross@suse.com>
References: <20200430151559.1464-1-jgross@suse.com>
 <20200430151559.1464-4-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-yHozix7pt+5nKfA5jTcL"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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


--=-yHozix7pt+5nKfA5jTcL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 17:15 +0200, Juergen Gross wrote:
> Commit cb563d7665f2 ("xen/sched: support core scheduling for moving
> cpus to/from cpupools") introduced a regression when trying to remove
> an offline cpu from a cpupool, as the system would crash in this
> situation.
>=20
> Fix that by testing the cpu to be online.
>=20
> Fixes: cb563d7665f2 ("xen/sched: support core scheduling for moving
> cpus to/from cpupools")
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-yHozix7pt+5nKfA5jTcL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl60VRQACgkQFkJ4iaW4
c+4imw//blPkeUMBPocu+vJT2lP3DkM6Qs0eB2OVEgzsoLBcwcWQFYnhy3ieZND6
QWWN0/yWXJpvvgDHOWP0Gn+PcefgAjG4iHJmAwoJb/0xa6GNA09i/us5l/9SdWg0
oJOFmwrF9XDgufFvILD9OFpPMRVaETnqkqX8PWfn1IOWzRIbk/W9PUBqj/gII27X
VfbfO8NgohQv+6HFNElTnGJKIcew6+sEETfc9sTvKepsjGZwoYrpIQtRVlcqq/bX
eW8RLpA4VifUorP+kYbWnFTlJ2Fi0GWVKUbRk8ivTVRqghNoSLq54kzGz/3El4ui
C2Vi9HrHaQd254V3MzYZsQQ+gXnWdJz9bCNtpb4Z9EpwPNPvMfBmNpJRDKAyHaHU
3buhGtUD0+pBD2SDfnB3wqUX7gGGhTVhSiJZXWywVW0JfjySezMZPWdkVu4eZZzz
XlRq25kywnpBW2+FByRqk6SGXqi81HMyFMOQs0lPhcvOnY+S4Rv4lckpXkTxOtul
2peO0YjYvM3y4fgOCrLb+KR3THK6+ajBMN07Anz9PpCFR6bJQuHmodBVX1dOMIGy
pawVdG6qMRW2NgdzMWBptanmQosRnL3i8gyukcWCOR7ITDjJJH03SJlD0qAemlJL
5FwvXkuvtRr2vI9/l2ssfBOrihvK/vXkgWwcUfCZQ4rmKyF1oT4=
=qjbJ
-----END PGP SIGNATURE-----

--=-yHozix7pt+5nKfA5jTcL--


