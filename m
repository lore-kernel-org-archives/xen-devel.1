Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA87DC982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:23:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428835.1651756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90Sg-0006Wr-9g; Tue, 22 Sep 2026 13:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428835.1651756; Tue, 22 Sep 2026 13:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90Sg-0006Wk-6o; Tue, 22 Sep 2026 13:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1428835;
 Tue, 22 Sep 2026 13:23:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x90Se-0006WX-M7
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:23:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x90Sd-00G3uD-HR
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:23:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ab2812c-2eae-0a2a0a5409dd-0a2a4502c746-12
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:23:03 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ab28131-6ca4-0a2a45020019-ca0c7c90eb61-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:22:57 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 6DF961D0009D;
 Tue, 22 Sep 2026 09:22:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 22 Sep 2026 09:22:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Sep 2026 09:22:54 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790083376;
	 x=1790169776; bh=8yLYVHJ6jNzwsHMgG8xS1Ovb4UA04vsZw/QYJZxSTJI=; b=
	X2ypO5wa3iO9/WOfyPan5UDJcstQ/iIZO8ZhmMI7WI/ShG5xQwz2lBfxZm4CQHfM
	S+kF8r7kJNl188Vlhw6T0Ej8ocpDirFuhCQAbwIfMziP+YVjAJq/x7LFmearYekN
	5AMtSzTmFWobxTnA2Fa6Fw7MvPGG3uvrZYOikSajG6rhYqwizFwsIQ29BJGWGTko
	RuU4Ye8h0bBgrLWQi+s5CccTRCcgR6noEYDJTAeyJllFlVk3Mbzx+ZxwdcTBnXss
	9FHo0AJm9YjpVYqtnO15OcWdMu18PEOsNv7TMwYGj6KmwmwyAKFOlvjBPKtEfpPt
	TEMQWs6Ql4cyHTzlXUwzJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790083376; x=1790169776; bh=8yLYVHJ6jNzwsHMgG8xS1Ovb4UA04vsZw/Q
	YJZxSTJI=; b=i0nALIbfl7oxb6z9DtuhZVBboe4ijUGOMuZeJpZPLr1bbTqXzka
	aEC6GsFZmPeG1bVv61bPK0G+QBcsiwHtmdBa3/sg589hXpRF41SL+gF0O1We5oWl
	Usimv9UfK5nAFHjZdJPCglGfJds/Lld4b3bZkQSB9HcNAPDisxQ+OJaOz3ouPkiB
	A6nW4W78kF9ZMUZSonHnpZQZl1e3W7gyHx0pg605P85aZpMBhl+1wLWbhGL5FEUG
	vvZxyHt12m2OeYp/+VnPWGZrIoxxnCNIg4hB3APAqGpTLsyIK7ZLxwhx+Ih3XeG9
	/xFtvWs5tIdhjeydkPVZhsd9at+ZUKGhZng==
X-ME-Sender: <xms:L4GyaroC6iAkdzgKH85wUd6E-K1mWyvhst3pFB26jxlaayOtGJChLg>
    <xme:L4GyaktA959mramabtMWhnj-eErCVIkse_XdFhmYhovuQqULBluOBIirqRu4oMdGH
    AaL0A-qdRj6ny2cDa2v7_0sVNnI_pL9U2hU3a1UUZXaJGZE7g>
X-ME-Received: <xmr:L4GyauZ_uiJDllLhjGfIyTy381dUyswtYLUyz5TBLIW7pXlp3BqR9ZDvIu6BSgh5CpoxyxPR-YLBU_9WETH_Xb69nTYnR6GnV-_b3VwKXTA>
X-ME-Proxy-Cause: dmFkZTGfELLFfugd19QwWNMUx/tN0RfiMI7ehPd4jmxTb0QXU0+VfZjqDjZOAKNphemAil
    rmqN74zJleUWWCqI8Trx5U9i1ROrF++RFTlMWaBw7cUhxMLH9xkcZj3HgwVZa3CJl4oqZ9
    lN0pxKfKfXSt+WJIZt8blUxdlCJ1cfqZQXCyrtfOFP7+e7Rut5ssK16fr6BMz9Qla3SAlC
    NgL5Ul00WvBCgLWKloTgd40nKH3+iS5SuD9/2cJ2baFinZ+aa+USU3OH8TvjYOnGec3g/1
    BUdDuHPQH8IY3TqIdqNpy0OMvH3c8Xt0QEiim/6SMx4Fae3jEKCXbFjFJHhQrIUV/1Xwjv
    vnk05nWlshLTR7N9Nxw8qqE0VH+UGV7CJsuJfwhxx9IOzEyIbcmK4eNuqNBvkUba6PupyQ
    nINvJLCGKguSugVtLxwRbYGP7EYoVReXPPmuetCsziet0J4JmJVViQbrDBcVNYz6ZLcWrU
    5R+B15C4ABX3rmQeoIHfeL6IZpNG8j13N0J2/wHkIdumiexEL6AxHNXMb5hQlx3JbPg+ml
    vy8CjjoRoBhMSq2OwIqBhhsf/lnozxl6rnDu8+hzOV/0qu8yRit7lAZ6aMAOdm8r8ZmZpF
    pdzto7JsTUryzvI1RZhMqj7Sinf2szIfmWgPCWJrrNjuPoQk1WToOPXz4vmQ
X-ME-Proxy: <xmx:L4GyarY2QikXBD62j0m-CSoBLgtgR6usAmVwfRIzK_mZk8BaFgOMNg>
    <xmx:L4GyavldX3oeRDWYZhTTeOkR59NQoXyfm1NLK3A9xzNkBhl6-L6PYw>
    <xmx:L4Gyau22TDkwbo-lGc_dLggF371aUcfNb9f93pgb2JcrF6te9NQZKw>
    <xmx:L4Gyan0hQv1BfeT8TAEXXx7fudtagz9na9JpdeqTH1pbErH5X19siw>
    <xmx:MIGyaqJOAfOuPRQ6GFopusVv2oWaVg7D9BnrQdkpvAvnIlMYTpofrIHy>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 22 Sep 2026 15:22:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor
Message-ID: <arKBLCOvv8SIii9z@mail-itl>
References: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
 <acdf64df-240a-4186-bf92-ccaf1f83dc60@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kSAC0yivbSsstiZu"
Content-Disposition: inline
In-Reply-To: <acdf64df-240a-4186-bf92-ccaf1f83dc60@suse.com>
X-purgate-ID: tlsNG-720697/1790083383-315CD2AC-62A64731/0/0
X-purgate-type: clean
X-purgate-size: 3768

--kSAC0yivbSsstiZu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 15:22:52 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor

On Tue, Sep 22, 2026 at 03:06:35PM +0200, Jan Beulich wrote:
> On 04.09.2025 13:41, Marek Marczykowski-G=C3=B3recki wrote:
> > Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
> > available in earlier toolchain versions. But use it together with
> > -fmacro-prefix-map (if available) for hypervisor build, otherwise it
> > still contains some paths in out-of-tree builds.
> >=20
> > The out of tree build requires -fdebug-prefix-map mapping for both sour=
ce
> > dir and object dir - otherwise the latter is included (2 occurrences) in
> > xen-syms. Note the ./xen path for out of tree builds may not be strictly
> > correct choice, but it's consistent across the tree, and just require
> > starting debugger from the source, not object, directory.
> >=20
> > Ensure to have a realpath for XEN_ROOT else it fails to substitute
> > properly paths in strings sections.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Coming back to this, as it was also mentioned at the summit.
>=20
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -1,4 +1,4 @@
> > -XEN_ROOT =3D $(CURDIR)/..
> > +XEN_ROOT =3D $(realpath $(CURDIR)/..)
>=20
> $(realpath ...) may not be available (with older make), it wants to be
> $(call realpath, ...), allowing use of the fallback in ./Config.mk.
>=20
> I'm further not really sure if $(realpath ...) is actually meant here;
> to me $(abspath ...) would seem more logical (as we don't want to
> resolve symlinks in the path, but rather keep it as specified / seen).

Honestly, I don't remember all the details a year later... But I think,
based on the commit message, there was some case where XEN_ROOT needed
to textually match the actual directory, possibly when some other
part of the build system embedded a resolved path to the binary anyway.

> And finally - isn't the above rendering redundant ...
>=20
> > --- a/tools/Rules.mk
> > +++ b/tools/Rules.mk
> > @@ -166,6 +166,8 @@ endif
> >  CFLAGS-$(CONFIG_X86_32) +=3D $(call cc-option,$(CC),-mno-tls-direct-se=
g-refs)
> >  CFLAGS +=3D $(CFLAGS-y)
> > =20
> > +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(XEN_R=
OOT))=3D.)
>=20
> ... the use of $(realpath ...) here?

This seems to be correct observation.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--kSAC0yivbSsstiZu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqygSwACgkQ24/THMrX
1yx4jwf/RGmjRI1+CvVrXCsM219ug75nn/KNfZ/hfgZxSSCwc+/guiTyj0DYeBTy
6Y3/9+yMbUk/whSO/JGN7u6TCRasbuhozet3JuE6OO7VOij6zoqFFYDYfJuy/Xmo
sN5gEtFZNoYgqfv7m/JR63wC6dCkT4aFAhkA+eaH3LQtleVInrAYu9zBn396ervu
Qz/rY9e8jS8uiklBJVzt3gehf0bL9+pIPlRvHSpgvm1UccICyaq1So+suVRvZeWE
FeZHYPWqdFOEtuOT5gvvZu8OmMMV3NlUT+PaaILsE01Dhof2P1wLc5UVFfyzieKF
EiD26Fduz/YW2SWImIHCqiIl/GqTMQ==
=9tOx
-----END PGP SIGNATURE-----

--kSAC0yivbSsstiZu--

