Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB3ECA600D
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 16:08:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443546.1660812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEqfW-0004i6-CE; Thu, 08 Oct 2026 16:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443546.1660812; Thu, 08 Oct 2026 16:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEqfW-0004hx-7E; Thu, 08 Oct 2026 16:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1443546;
 Thu, 08 Oct 2026 16:08:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xEqfU-0004hr-Iy
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:08:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEqfT-006DMi-3t
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 18:08:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ac7bfe9-bab6-0a2a0a5309dd-0a2a450b80fe-42
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 18:08:27 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ac7bff9-b7e8-0a2a450b0019-67a8ac95bd7b-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 18:08:26 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id A9904EC0B1C
 for <xen-devel@lists.xenproject.org>; Thu,  8 Oct 2026 12:08:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 08 Oct 2026 12:08:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 12:08:18 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791475700;
	 x=1791562100; bh=j4yKi+CxVYZjG+7LsXl25zrq4CZKQkF5vLwRqud13D8=; b=
	asWbyatbObYw9SLAX5mDBQtokk+kIwEC2ndQW3BAKRxm3WJJE9DTSPY+36RHnzS2
	r26EmZPtlcTvMJ0guOiUvPre1OqOhaJHSSdOnlzYN1fL5zjDMA4daD8U6BaF6qbG
	8X3R0Jys0eRNtmw+iXRwT5KyvGJNZzANttfJPYdPZfQ4YndRmujMPtKjblyaB1Rn
	1BBNaDgFiGTKXNZsvZIR/SoGhhy3bTXKG6RHZXYOWo8SI9pM42Rx7EShCfjMzXKM
	TKiPWttqZFcD/ceJ6m7NlFZVWsfVjcYGMwbeTubT9Juj7vGVGt8e16yP2I+ikvuk
	nsNRERvbJYB5LVZrz00m3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791475700; x=1791562100; bh=j4yKi+CxVYZjG+7LsXl25zrq4CZKQkF5vLw
	Rqud13D8=; b=lRhAWDNd6xSzsS/NSad40WfVPzNjd36ytfiHVFwi8M+QVeFLEXT
	QIjHKrXTvHjgtxO/QAaC10TqVI4WpYy6SM+S7TyRInEFfVKL+YiIbYQVVMA75OP0
	SQ6Y0FzgU7jud9+U3quqjVzU35GnHHPw6YFfUWskasz9MU+0ZKBw2xqSkvYElwSK
	BiIa4ntixAGfQ1hkzdcQb4d37/9/6JpohaPwi1rk+vpfbRNY2U15/Ct3saM/utGO
	TPpdfhpDWW613CK7s1qRoc3xluH7ffxLjZf86Oj3retfqGkRLah0Kjs8jep705FK
	FTxwIRFHGsbP1wf/8+9GFtWj0dv7N4MeC9g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791475700; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm1:rsa-sha256:oQRvh1qw/5Gm4/kTdiAvLeMswnc/bnfdXwimvfzRDoaKCV/
	4kwDSE7ls4TvhWYQW0WYp2ddYvvA3U6fsj7TcL7ch8mUFz+TdMdCXbse5ethtnIV
	JGLlCdumAmTVF51NfzIJM3FLOI2eZoiHFqf0ZQ4BoHQ/SI7uJCdpAhOr4kXcfiUo
	ENg+fooRYH3MtJ76LF5Fzcc5XfnGJD7nD15FHuj6tzMnR04ZAkF6rod/C9VQ73lJ
	ELQ1M+InHyILd/rPvc5BNFjdM9QerZIhLMBeKotRmObHtNieJqGwVMOYDwOKYKxS
	ql9i+6o7r5Qdad9Bv1pKJ9EgZf5PnoXIwTgo9Ug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cO1nAwtgffwz6uMCVr/qINUXSQjslTQr8MrCvI1aieM=:WUcRze/hXAyibIAcgHT9rlQCh+eo1SYSiI9gXmQc80E=;
X-ME-Sender: <xms:9L_HakBZcwRQlkXcG8-nPTyTbfEVwyRJxBNSNgdX_LLFmMvlLhKSgA>
    <xme:9L_Hall7tdysa-k_C69tLjASUBeIDdvc1RoRaqj8T568vfM-mnnCWaKQdvYbZj7zf
    K0xwPCkUpvCNrh6fH78Jce3Q9FS-h6BmGMkK-9RmDRLrRNTpMM>
X-ME-Received: <xmr:9L_Hatw4sH3wEG29h0BfB0Bq1et0blUlI_MrbwNZfScdJiEkvyF4Bmu7O4k_d8w97dmfqy2ws_2jHFRFcpG1a1oX5-QMSal_M3X5zMDIdMw>
X-ME-Proxy-Cause: dmFkZTGinpzVWOI+crd2k56253wTV9mHJnEA/0hSCKXUf9cGkxoSOH2SL0ldkx699GRx5B
    RyovquPAtBS2vm+B2YBmNZDu8UxjaqHd7LvRQnIE/kTJCoKJoX0lhq9pczJZb7RqoGtv4a
    Z2y0UGblPjozVrM5V6dB+qpie/GO+vJN5qTKKL8G99I+z65OBTwzCRjGz4JxVtv3NcvJh6
    tZQZDPVBBMkzGf9hZwPdYrtMMyMHU8cZ9lo6Fq5WesN7nWiyHptp1LFSiIl2M0ITj5BaJ8
    pLytyQBsT5pNbdVL3nE4eFpcObEnNBdj5SMykaS5WI4RJ9Fo1S4+2vh9m1Pi5h+Y4yT5I7
    j68jvZf84Af0DuxzFv+Bc4E0FmzVoY8Fw7BEb7fA5kxnhr7D3Y35NPKT6u3CBo2xyvAlRI
    CdTfA0G7kyHocPgo5vGlQMOC9VGnYr6FXgK0z2qezQ/OJscPumjlJFQ3P/VlTTzVI7D+jW
    ZzT6oEuFnnPlhqn7CDZnzJAYt82szwUKJWRrYr0HR570TLLKe1x2PhWYSzCIjf3jZ2ob4y
    E0E87i2v18AWpVIPcdOh6qqZrJ4xwdkCXdZpPr4nvWNiAohJ+iZnK+2r1i+irKQ9mgvU+p
    FBdTfmsXKCqwvyytPipJgwi3nDarR4FdXqI+x29UQ79SgkxxSFSAmszcLHvw
X-ME-Proxy: <xmx:9L_HanT71n5rQV_7bMou4KzufA-tPJ6P0eTc3rtweq2M2A4czIU-9g>
    <xmx:9L_Hat_WobZUfD7UzKcvG8-oYSFueE2_QqhNry_60tYQjoJW85r8pA>
    <xmx:9L_HatvUQIJZXyWbLEMealA27-uEi4u51TFw3-z6E8_geN7n9XT6rA>
    <xmx:9L_HatOzflu3Blbj3n057qFAg_fr-ENAzCmFzPv4z_SEw4YtfMTywA>
    <xmx:9L_HaqjI32gk8ZE9Q7cJ77YaphqhRAWQFoVI1tFBCE9ehzQTHb3FI1o0>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 Oct 2026 18:08:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] drivers/char: add timeout for XHCI console cable
Message-ID: <ase_8Flu9BEr5r5N@mail-itl>
References: <20261008150528.359731-1-marmarek@invisiblethingslab.com>
 <8f61b665-17ca-4eda-b452-313eff8bff93@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfxb7/CCakpY23MN"
Content-Disposition: inline
In-Reply-To: <8f61b665-17ca-4eda-b452-313eff8bff93@suse.com>
X-purgate-ID: tlsNG-42698a/1791475707-182F49EA-81D130A7/0/0
X-purgate-type: clean
X-purgate-size: 4285

--hfxb7/CCakpY23MN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 Oct 2026 18:08:16 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] drivers/char: add timeout for XHCI console cable

On Thu, Oct 08, 2026 at 05:54:53PM +0200, Jan Beulich wrote:
> On 08.10.2026 17:05, Marek Marczykowski-G=C3=B3recki wrote:
> > Do not wait indefinitely for XHCI to configure console connection. If
> > the cable is not plugged in, timeout after about 1s and continue boot.
> > If the cable is plugged in later, the console will be activated then
> > (see final part of dbc_ensure_running()). When timeout occurs, print a
> > warning message - it will be saved in the console ring buffer, to be
> > later retrieved from dom0, or possibly later printed when the cable is
> > finally connected. But, do not print the warning when waiting after
> > controller reset, as that may have been called from from console
> > dbc_putc() and printing here would result in (possibly infinite)
> > recursion.
> >=20
> > Try the timeout to be about 1s, which is way above time needed for
> > configuring already connected cable. But, since this part runs very
> > early in the Xen startup, time is not calibrated yet, and functions like
> > NOW() do not work yet. Use raw TSC and estimate needed time to be at
> > least 1s on a fast CPU (5GHz), and possibly longer on a slower one. This
> > is not very accurate method, but fortunately it doesn't need to be.
>=20
> A little fragile, but well...
>=20
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -851,9 +851,15 @@ static void dbc_reset_debug_port(struct dbc *dbc)
> >      }
> >  }
> > =20
> > -static void dbc_enable_dbc(struct dbc *dbc)
> > +static bool dbc_enable_dbc(struct dbc *dbc)
> >  {
> >      struct dbc_reg *reg =3D dbc->dbc_reg;
> > +    s_time_t start;
> > +    /*
> > +     * Too early for proper time calibration, assume a 5GHz CPU and le=
t it wait
> > +     * about 1s, with still reasonable timeout on a slower CPU.
> > +     */
> > +    unsigned long timeout_ticks =3D 5UL*1000*1000*1000;
>=20
> Even if right now we don't use the driver in any 32-bit env, I think we
> better wouldn't deliberately break such a possible use. IOW unsigned
> long isn't a suitable type to use here.

So, uint64_t?

> Also, nit (style): Blanks please around *.
>=20
> > @@ -870,8 +876,12 @@ static void dbc_enable_dbc(struct dbc *dbc)
> >      writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
> >      wmb();
> > =20
> > -    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) =3D=3D 0 )
> > +    start =3D rdtsc_ordered();
> > +    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) =3D=3D 0 &&
> > +            rdtsc_ordered() - start < timeout_ticks )
>=20
> Urgh - now the driver's truly becoming x86-specific. Is there a reason
> this cannot be get_cycles()?

Sure, it can be get_cycles(). I just need it to not try to apply scaling
that works only after calibration, but indeed get_cycles() should work.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hfxb7/CCakpY23MN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmrHv/AACgkQ24/THMrX
1yxT+wf9HjVlb4mWp1HQMPrYJDS/3xYXcJmWC7couH8B8N5WCKGPqSXmtVa0FfQp
a4ZLeRmsXwOvloz38O7te8s3x7JfkkEScvG36EXlufwo2MFtF2wOP/X8umgE6AYt
3r7Ai96TDkif+rCa1WTtjjQgm0xkL3YTDcuFVsnEEJFya3/yXhZneT/w3l1VKSg4
ePP3QDyaK0guUkIAJa8TMsfhJTLbyiUiBVfnHoCk+cCASKsThuxsh7iYJYyNRdb1
T2cZ+Xi6D7zUivaLQqHlHNOkamkmjBnzegS4bhu6LClTjC0tmba5UZbuv5vRNlBj
0oK9rJ/1tZl3YQ82Z1Tb6Zdg9pb2GQ==
=F1g0
-----END PGP SIGNATURE-----

--hfxb7/CCakpY23MN--

