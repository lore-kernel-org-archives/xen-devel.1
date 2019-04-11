Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E86C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:30:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0379217F4
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0379217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZms-000458-QR; Thu, 11 Apr 2019 13:30:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XEB1=SN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hEZmr-000452-Nt
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:30:41 +0000
X-Inumbo-ID: ff43b0bf-5c5d-11e9-92d7-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff43b0bf-5c5d-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 13:30:40 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 11 Apr 2019 15:28:38 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Thu, 11 Apr 2019 14:28:26 +0100
Message-ID: <9897c0cd2e850d303bdb352a620d429717055964.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 11 Apr 2019 15:28:25 +0200
In-Reply-To: <f3631a2a-f818-c940-8cec-3d2ace741158@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
 <59657c28f62cf82860560efaece6d0bfb0983846.camel@suse.com>
 <f3631a2a-f818-c940-8cec-3d2ace741158@suse.com>
Organization: SUSE
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC 00/49] xen: add core scheduling support
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6722482676298567991=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411132825.07CSfnsNSav-LvFZ0uBjF9OnIFQE5xcGhBIXukDaNx8@z>


--===============6722482676298567991==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MQxOh8v3mg4y8amteefG"


--=-MQxOh8v3mg4y8amteefG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-04-11 at 09:16 +0200, Juergen Gross wrote:
> On 11/04/2019 02:34, Dario Faggioli wrote:
> > Also, it's Phoronix again. I don't especially love it, but I'm
> > still
> > working on convincing our own internal automated benchmarking tool
> > (which I like a lot more :-) ) to be a good friend of Xen. :-P
>=20
> I think the Phoronix tests as such are not that bad, its the way they
> are used by Phoronix which is completely idiotic.
>=20
Sure, that is the main problem.

About the suite itself, the fact that it is kind of a black box, can be
a very good thing, but also a not so good one.

Opaqueness is, AFAIUI, among its design goals, so I can't possibly
complain about that. And in fact, that is what makes it so easy and
quick to play with it. :-)

If you want to tweak the configuration of a benchmark, or change how
they're run, beside the config options that are pre-defined for each
benchmark, (e.g., do stuff like adding `numactl blabla` "in front" of
some), that is a lot less obvious or easy. And yes, this is somewhat
the case for most, if not all, the benchmarking suite, but I find
Phoronix makes this _particularly_ tricky.

Anyway... :-D :-D

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-MQxOh8v3mg4y8amteefG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyvQPkACgkQFkJ4iaW4
c+46nw//cA0F8KVg50scdZQSTVPORMNP3YUdWSV27uN/T8e0BFVFbQZhkm433/WS
rjRHQa3gS2TB0CcIaU9H71gJbKa18CyYSXaJY8L+36IFkZIoddcEE5450Q8B+M+A
tUmCwkKvbIsvU+VNyOeSA9ij5yEHJwvCmGY97A0L5jEYgxhaIBU9JuI4ZWaAX+va
7t0CGFloI/E6S1azZ4Th00700LNFbRFikbQ03zebSl2aqTCHHC0BRgJwRg9XzErv
dtf2E2m/xktLAVvpSocBI2ZQSFk+Q8sTa5yJMh8XUn5Azsr2eChJJfKkr2BatwJo
n9Kv5mUIYRDK/2zoQiV9xxkw8u21mGTTdL1ROi4X6f13yObrTN5CCdp1NK5RZCQf
TaQcssBlJNSBRZc4p9SjiAPI71XKLE/q/my2R3QDsRl4XQ6ZU7qpNklpScbzyLVm
rJ4M8QI4iPWEiwo6S9qxWRf2KbXmaZKL2gW8JKe6WqOszKFGzpl/LPSSoMO99So+
ITjSM907tz+yPDGlMHYFnfqQrFRKn63VH1O9W8Q/m0e68dAjWKyOupLG2MSdYumP
3Adl0ROMfb2UrD0J2UNn5+DTzbORQMtf0BG2Jo4b74pDTn8zlpW8meBk6R8Dh6Fs
GWuZVQsVgiSxo/r6XUtXvdBNzcbv8h6CmXH5yP1aCG7Ri2hNOJw=
=sWYv
-----END PGP SIGNATURE-----

--=-MQxOh8v3mg4y8amteefG--



--===============6722482676298567991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6722482676298567991==--


