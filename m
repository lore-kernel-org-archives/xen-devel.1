Return-Path: <SRS0=n2L7=XU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DF3C432C2
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 15:27:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF04207E0
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 15:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF04207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Cf-0006aK-Q7; Wed, 25 Sep 2019 15:27:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD9Ce-0006Zz-Ag
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:27:40 +0000
X-Inumbo-ID: 01a09d88-dfa9-11e9-9637-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 01a09d88-dfa9-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 15:27:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BDF93AE89;
 Wed, 25 Sep 2019 15:27:37 +0000 (UTC)
Message-ID: <204c838192b90c5af5471e78e3ed7ea3542bdd88.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 17:27:36 +0200
In-Reply-To: <20190914085251.18816-14-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-14-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 13/47] xen/sched: add is_running
 indicator to struct sched_unit
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
Content-Type: multipart/mixed; boundary="===============0435256878369256140=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0435256878369256140==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Mk5zgqBc7GixSUgBJYNn"


--=-Mk5zgqBc7GixSUgBJYNn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Add an is_running indicator to struct sched_unit which will be set
> whenever the unit is being scheduled. Switch scheduler code to use
> unit->is_running instead of vcpu->is_running for scheduling
> decisions.
>=20
> At the same time introduce a state_entry_time field in struct
> sched_unit being updated whenever the is_running indicator is
> changed.
> Use that new field in the schedulers instead of the similar vcpu
> field.
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


--=-Mk5zgqBc7GixSUgBJYNn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Lh2gACgkQFkJ4iaW4
c+4icRAA5oeGnsrxBbdJ/ybDVGXERVxMbN/RiDsk8e9/NUorwF6AC1GX6nBbtvQy
QnmHVvucFEZX+nquSLuNvP4yB+dEtEH4TfmXQlpiB368h2HkMsGWg37vKk+2yafm
IM529BFZH2sNu7DojG9dqQpHJxM6FjvSuzrPSimypXzPXixLmeaqeyJv37nWY+Mi
wjJdg1DSrww5RA3XfNWHWn892vg/I3zBEXkMoPw0hKFVzI8GmIcYkHfjmWoH0OTu
qHo+uh24Y9EgCFgqNnrg6jfosGjP4QQVVIL2/CRtrRiw/BKew3Q9uqdCGs86Oc44
v2BmnnpyR/Vd399yzcNUGo6Se1AAKsY4aTRjqQJKGQ4zQJdquJgAfRmRl/SnBmcD
UtL+gN6McVDe0hL2wPyZhjqAnGjvyOPYva3uAiXxn/jIC10rTEnIiiCJ1kbioreJ
Q4cDtQbMirVkXiXZDhUtJsIm/i8fDO5Ul5514ARkRI5OOCEewYMumFEPlxgsU+YI
QDJF+/geOFtgD6UhR2loHRKw3ghnLnCN8VpIgqaA/Nm0eSScA6o5AO4z9TGVIMb1
Bvlk8kctaF5vCX2ffD/XyPudurR439KZxTUL0jwMcagVvvGTk6HXQ9KdPLLcX5TI
cV/lHzE/q3fOh6LDXq/jLgVcDIAwYTPaLqWovPrmGeXXABEBTuQ=
=pINA
-----END PGP SIGNATURE-----

--=-Mk5zgqBc7GixSUgBJYNn--



--===============0435256878369256140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0435256878369256140==--


