Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7748C43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 14:08:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFCF82146E
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 14:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFCF82146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZze-0000Wk-Un; Wed, 18 Dec 2019 14:08:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihZzd-0000Wf-QE
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:08:01 +0000
X-Inumbo-ID: cc829ef6-219f-11ea-9080-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc829ef6-219f-11ea-9080-12813bfff9fa;
 Wed, 18 Dec 2019 14:08:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3F36AC1C;
 Wed, 18 Dec 2019 14:07:59 +0000 (UTC)
Message-ID: <6145592154e787eca4fe0118e17812b51c26c46e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 15:07:57 +0100
In-Reply-To: <20191218074859.21665-10-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-10-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 9/9] xen/sched: add const qualifier where
 appropriate
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============5228943335216381585=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5228943335216381585==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Dxu9FUiYaWBtdOkKja5B"


--=-Dxu9FUiYaWBtdOkKja5B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
> Make use of the const qualifier more often in scheduling code.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Cool!

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Another thing that it may be worth checking is whether all the places
where 'int' is used for CPUs and vCPUs IDs (or alike) really need to be
integer, or could be turned into unsigned.

Of course, I'm not suggesting/asking to you to do that as well, I'm
just mentioning in case anyone is interested/has time, or even just for
the records.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Dxu9FUiYaWBtdOkKja5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl36Mr0ACgkQFkJ4iaW4
c+5sUxAA23GYAf9/cRpEPGYzjzdtkJhQL1ZURtjoSEgYMOpdg4ZHNruEErIHUQMm
nC6YyNZ7maGC3Eb47EGWYxeYhEqrF46KvVHUaoEBJBkpl/0hJRGvnViHvo25cSEv
yecjR/lFpSBxU4j59kO4DRsCONDbUv9YrHax5U0XZyRwJNyzrx8pbO6hUkQVytqJ
xbNzYWaPQjxVUeLvqTzwg5nlFw1W+2dybMdJaR/njUP0XwUVsz0V0X1s5So6cdKE
bXqIME+DnmiNvg8TKL6DaXaBx+CW0SpjNG0MvLy8kedNqhsdUZYlzyHnskbTObn8
d8ARzAoZDC8Rg1hoIUZ1D0zGq7XokoJpQNAzMOC9JU9FnJv6dholjN4fmLYYV6ZV
Yv2VTn89MgkZhJ37Qu4O/D21hzYhXdfpAdL4g5EEXANu6wP6KXuEZqvOQxVhr/fO
t2T/WC90KT+aJiF0zh0k7ETtbfkAzDtDCQISzf/AToYcXwVzwJ9FcTBDwJUMUrdO
MQ+695w9OASAaP8rNwX/EaItElLOXrWp+LK+tl2it8oTJKYOf9IVRfms4ZZQy4hy
yYtg/WuLRhwVijaUvafVOHsov+KXxhinvS1OiQQ/8BJag8DoLb/7dP4RjeTuYotE
JzAX4oOFGgc7Q2FjI7Ai9hdFahmsNfv2n/3kxpt4Uss9qhE7jq0=
=j7RI
-----END PGP SIGNATURE-----

--=-Dxu9FUiYaWBtdOkKja5B--



--===============5228943335216381585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5228943335216381585==--


