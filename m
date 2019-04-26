Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C3BC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:59:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCADF2077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCADF2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3GA-0003NQ-K5; Fri, 26 Apr 2019 15:59:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9dDU=S4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hK3G9-0003NL-UR
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:59:33 +0000
X-Inumbo-ID: 46b10651-683c-11e9-843c-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46b10651-683c-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 15:59:31 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 26 Apr 2019 17:59:29 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 26 Apr 2019 16:59:02 +0100
Message-ID: <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
In-Reply-To: <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
Organization: SUSE
MIME-Version: 1.0
Date: Fri, 26 Apr 2019 17:13:50 +0200
User-Agent: Evolution 3.30.5 
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7195325543815925688=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426151350.LjarNrwtK-K9nTtr3aOFzPFBbCt2BrNYUwKD_ezZojM@z>


--===============7195325543815925688==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Qya4sY0pOsb5RKC9AF51"


--=-Qya4sY0pOsb5RKC9AF51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-23 at 12:13 +0300, Andrii Anisov wrote:
> Hello Dario,
>=20
> On 20.04.19 18:24, Dario Faggioli wrote:
> > In schedule(), if we pick, as the next vcpu to run (next) the same
> > one
> > that is running already (prev), we never get to call
> > context_switch().
>=20
> And what about `if ( prev !=3D current )` in
> arm/domain.c:schedule_tail() ?
>=20
You're suggesting that's redundant too, aren't you?

=46rom a quick look, it seems to me as well that it would be. I'm ok
taking care of it, not sure if in this patch, or in another one.

I'm open to suggestions from ARM maintainers...

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Qya4sY0pOsb5RKC9AF51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzDIBEACgkQFkJ4iaW4
c+62sw/9EGBfsTcE7wmc64VwHDbpoYxfFhkL0YMuZB3yeZefV0EWIY4Ok3kzVOYu
hBMSlJW9LsllUBzAxTRWVPFsFWqo7/HjoJ1PkpBJSzwElIq/VEvH3//MzLwdD35v
7fND8ytY4NA+N55SAPsX0sQqA21/C2LfqlbguWu4+tL32mzkDyYtLlE+5+wAAiNB
ZnapmikiIn7LFfdYQ9kxseyioZWeF35msEKVeq/sIw6tQgxkK1j+00sSQxpqBGW2
jAAOwoTt4ybTnKhGCBLiCwYjZ45fQh+ZO4wGTIJku4Rkq8u2uLZIxh3tRWjmmC0s
G1UAXH/yiRGK3ipYK6YmBGvCNyntTDsDyNRNKSp6wqG65muXuoCB9ZqHmjQ+XnpL
ZA4a1fD2Vf2RR601hNXBqmhTGIuiMpq2fVIDMCYzCObra7kK3BkAtbmUC7e7eohG
mkqOOGUsRXo0iwzLpaklFSKJ44yj/3yFefzU6LEeBRLVY2yK60gMN1a0qg07Z05Q
fTgVtvaG9UcBYx95p6aldimGlGBj9h4liB/IHefIYjCx5lAdgoLA7rHTOBpYjLhF
JMB4BYmIqDCmLLE+ircGZf/tWmfw7YP9ZZarg47UPBUzeNR4bp8/hFBD1a8PuSEy
fOmsIykoOizycBb5yCD+fmvev//4mz636CNgLwMQEc6XRW/KifQ=
=HVcJ
-----END PGP SIGNATURE-----

--=-Qya4sY0pOsb5RKC9AF51--



--===============7195325543815925688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7195325543815925688==--


