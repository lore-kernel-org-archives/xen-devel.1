Return-Path: <SRS0=6W/h=IJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923EFC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 16:21:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3037964F98
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 16:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3037964F98
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96683.183187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO3s-0002bg-65; Thu, 11 Mar 2021 16:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96683.183187; Thu, 11 Mar 2021 16:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO3s-0002bZ-2c; Thu, 11 Mar 2021 16:21:20 +0000
Received: by outflank-mailman (input) for mailman id 96683;
 Thu, 11 Mar 2021 16:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gir7=IJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lKO3r-0002bU-5B
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:21:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63606b8c-7d9a-4392-b7c3-2af537a9168b;
 Thu, 11 Mar 2021 16:21:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F944AB8C;
 Thu, 11 Mar 2021 16:21:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 63606b8c-7d9a-4392-b7c3-2af537a9168b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615479677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iGcM6UsZHx9gD1D04IJo/iPO7ukzmoCGzXge9mo+keg=;
	b=oraT0/gU9VuyORr1YZGRVZbF6u4TWS7BAErzE4hAf2KRMI3tqmqD8BLBlDfe3tZ0RBkvNc
	xN7/AtvX5IpsmF64pmPnBV2fR45mthXkSZGPAGHRLUUZ4/usOk61RhHyzO+ARZ/ZEbdhAh
	MogDm9WBBj4HhnMl4ADU7PCGYTrisC8=
Message-ID: <fc6cf1a2e27fc2c62152e7772be01fac4e9acc50.camel@suse.com>
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>, xen-devel@lists.xenproject.org, Roger Pau Monne
	 <roger.pau@citrix.com>
Date: Thu, 11 Mar 2021 17:21:16 +0100
In-Reply-To: <9cc6f3ff-f078-1657-7c5a-9f356a857cdb@suse.com>
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
	 <9cc6f3ff-f078-1657-7c5a-9f356a857cdb@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-PoEK/B/t/GaWRBgsbq74"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-PoEK/B/t/GaWRBgsbq74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-03-11 at 12:28 +0100, Jan Beulich wrote:
> On 11.03.2021 10:40, Dario Faggioli wrote:
> >=20
> > Removing the special casing of NR_CPUS =3D=3D 1 makes things work again=
.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Doesn't this want a Reported-by: Roger?
>=20
It definitely does! And I even forgot to Cc him... Sorry Roger :-(

Will you add it, or do you want me to resubmit with it?

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
Thanks

> And FTR I don't really mind the other NR_CPUS =3D=3D 1 piece of logic to
> remain there.
>=20
Ok. I agree with Juergen that they're totally useless, but at least
they're not wrong.

Oh, BTW, since you mentioned in your other email the fact that this
comes from Linux, I've had a look there and there's a comment in their
cpumask.h file, under the NR_CPUS=3D=3D1 define, looking like this:

/* Uniprocessor.  Assume all masks are "1". */

https://elixir.bootlin.com/linux/latest/source/include/linux/cpumask.h#L149

Of course, that does not make the fact that for_each_cpu and
for_each_cpu_not are identical less weird, and the whole thing still
does not make sense, at least not to me.

I'm wondering whether or not it is worth to report this to them too, as
I have the impression that they just don't care.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-PoEK/B/t/GaWRBgsbq74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmBKQ3wACgkQFkJ4iaW4
c+7xAxAA7k5/dm0/2Wg4ERmbZgaItQubvksdh/iOBepDeI5V19KTaba2hsctUCwF
sUIu4cMhcvFIRHO+1KNuJMVcDiSMOE6GfTDGUqZOgwiBfbXpx8/csHay1JfLV5C+
qGO4xQMGOhrJ191mVAbwgo/rEnwSU2f0+kuQTo9qDhXxMmSVYcvcsGmbGaROZHK/
bEdgc3ET7sMD4qg2GOY7kUNxoBxzbOr4ExfeDyXf7b/MF1aHaW6khzGtzmNBG85F
mw/VfBJ6vPct+/oKo8LFBDnCEIq5D1E5juHwFDcoZqncu4Jt/6r5To24t8qxtPnS
JRRBwq4z//uvU/ZuyzG1mE5zUpL776WsevulSL2KpPDGyOT2NC+77nvwN1Pgr5hn
VDv2qhlzt62bSMyOLHuAlPW+vubTxzbJoKS8mzTk415aLpQbLqETEwpdSHlIiEn2
h23JkPnDy7O2PFaz/WixKEdF+yDhUksazgmj/EmRSYi432ju0+vREwJ5rjxNtez8
X4IZPPR4jaxDbUtUt8uCoS6xE+fmPg23twBnTt5jYorio55jbsO9x268Fm7wWkY7
ZXcgLfvdqLVaZSAETgEIBGfvvml0ytozkqWInnhtSQQgU1ofYl5s2HZEAT8cGv3Q
552HbuNPjXQZNKj6LdqEqUQNN5iecQ3yWGsUnWvqfwEgi4ITCl8=
=x2Lx
-----END PGP SIGNATURE-----

--=-PoEK/B/t/GaWRBgsbq74--


