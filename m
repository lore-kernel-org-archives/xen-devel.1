Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090D3C44527
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:27:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366475.1616364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllD1-0005BL-Hm; Mon, 20 Jul 2026 10:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366475.1616364; Mon, 20 Jul 2026 10:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllD1-0005BE-EM; Mon, 20 Jul 2026 10:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1366475;
 Mon, 20 Jul 2026 10:26:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wllCz-0005B8-Ow
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:26:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wllCy-006opm-IQ
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:26:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5df7d8-5cb7-0a2a0a5109dd-0a2a4508a5a2-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:26:48 +0200
Received: from [103.168.172.155] (helo=fhigh-a4-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5df7e6-f659-0a2a45080019-67a8ac9bbebd-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:26:47 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A6D4414000C4;
 Mon, 20 Jul 2026 06:26:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 20 Jul 2026 06:26:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 06:26:44 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784543206;
	 x=1784629606; bh=pPfGZE2h+4xEPuHdc1ju7sCSPDIBxougu+5pCGVFlr8=; b=
	zbysK/t1dcahW9Fy9aiMxXKyQwJ2munuWnXRwGebENKOZJO7f2icillZYM8/BO/W
	VQ6Gw3BtJBLF8D7fkvZ0NaDf+lQyn7OTs3P2G200Mu3Sooxk+NTU/bX2NdSBIEtP
	rmnyurTKw0vHOEtkOYlY+eVOpcP2HkZJvYdz0uEeVozd1Ji8CvAnQrONxTY78lGO
	hN8EEwOtyL4AMpI0HgDzaTlxsZlMSuCrYcNo9lZdIApBiaJQxu/jWoB0/HIgdz+O
	ZdrsNKy+VG37o6WkFEU2yY/KRqpXkwuEU9xCKn/KhK5rg1sKQUGHlZ2J+AR22VD9
	mM4Da+183CM3TwFrAkI4aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784543206; x=1784629606; bh=pPfGZE2h+4xEPuHdc1ju7sCSPDIBxougu+5
	pCGVFlr8=; b=TShg0qnsBhcLz0TxgFmcAPyGj0gdMc4PgmzXF+cvCNAhK7tkkpX
	Pjyv37WN/E+aEnLzYSBfSCciPgC7cswshq2t+0MERHG2e8vXg5FxmCcwsU3ItP/e
	PJNJbxjmS9fTVVuVdPkfQzjhU4s2EVgfgPLZDbhczL8GUiEig/K4lD0QHEESE1sg
	xOkzX76XqTfZjYUcjG+pg+4XOQqMBVyYkanSti1lqrBCyr46i0K4QuPgW2VtuvA6
	gz5mugwh5BEM/ySCsCKNUWKAbLAe8DaHtWWzLjSjS0s5K+Wmyx1TTY1ihxdWlGIb
	QAUS+pGXebuIY3T7M9ToxfEW87KXnEdOsQg==
X-ME-Sender: <xms:5vddaunF4dsuQ0-MHYcqSZwLSn1bWNSYtt_YjlH7OXz50tSrAIyjwg>
    <xme:5vddaoGeivbfaftceqqaY41rpYpnXJxTTSph-jUHiDTdM4XpgBDNJUD6eVe4WYRVr
    0-GGtNtq8RSa0diz3vG33cbXwiS8DSx17JELK97WUOpSm8l>
X-ME-Received: <xmr:5vddau4-nWslDRl9J7fL3si2gKhCUG2qMVpScJhc-P3U6LUy-mHEBAJabxJam78i0T7skIzpaaRMvV98AzSPSLCfU6fTF_Q3x-Q>
X-ME-Proxy-Cause: dmFkZTE35h047GjmKz65lwAggilpKqKcmpOWL0g1kCxRvCPjbqdrxSy3bRzou1lyyvavEG
    lJpGR0QTTbepVufYSOSQ6ndmsKrHijYz/z44oZc1fKo/E3bk3TmrcyMRLwu5wV+iP0Esh1
    1XCku0e3+jZfYEoulSpFWdP/JZzBtxLn6AbA8pO5Dr0xuSGelA6o/Pj+KA4jNB7ptA4vmJ
    0uaKTdpTiphOguo2TxS16u6mi+aJFn4CsVXByWImHQjnDqcrsR+TpeWHdKUUDswB2cN257
    POTCuxPT70/PfM4dlWPqQmWnyUccugCZ+dlsmsd1/fbXbKf0nJNKFiIm62vnfsbqENqOfp
    ujujF5h6SFvrRJzBWZEP9+1JldktPrMuz6++oJcFTP8IpHD5ngp7BRf7jOiUH/dvcDfSei
    bhfICuRWtJ68pDz6XskaDVYQchZijCDUzo91oQrlhfTFeLoLCUcEyxH7h/4ly3BcwyRNA4
    KzlOOhk9kE9q63OOQvy1XVg/IYA8GRdtbxhl9yICCDeXGvPf8QhbO9Fgci6d0rOI5oF2r5
    8+jfKeb5R+r1D6ZRAWeZ8voAFDYrGPlkWb3wXWSbmp1rboTlsnKXzBEwixpk/dMZ5MLjJM
    OWx35TgQjWKGBgsglu1yEe/5u6stjFc32QeXYAs3GGBtoZ2bD0h6PqdL4Qdg
X-ME-Proxy: <xmx:5vddaokNlQ72DF40vGkGnidLmeAciDVhzvJ86aFHFbsoOtrfBwHW4g>
    <xmx:5vddarqtoK9IGLOe9PoEXZW_rgngK3iJayeyRZ5dLtcyePdm5AF-1A>
    <xmx:5vddavtzROlDdtC1zzVCKlYxgdustV9F5-KRsrISfStoLQPrvClU7w>
    <xmx:5vddaoE_l9ujt6kXTtF_1L23Zbcp4oQTlQQONjA0Q8DUMwnfcsRrHQ>
    <xmx:5vddapK67MNtgSqdHqawCTuy8Sz0RZ3kP2mOF-HA3PiJZ6Z-MImp72ij>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 20 Jul 2026 12:26:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
Message-ID: <al334sTLWh8sNmbV@mail-itl>
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
 <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
 <f0d40078-4e00-4307-84ae-1d5c65346af7@citrix.com>
 <CAHt6W4cM2sYhUsu7Z3KZzMyF3JKzjHLm_orDmjEs+y4hpT98Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nKr41kE0KMCj0I53"
Content-Disposition: inline
In-Reply-To: <CAHt6W4cM2sYhUsu7Z3KZzMyF3JKzjHLm_orDmjEs+y4hpT98Zg@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1784543208-D775B87B-A54D311D/0/0
X-purgate-type: clean
X-purgate-size: 2830

--nKr41kE0KMCj0I53
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 12:26:42 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()

On Mon, Jul 20, 2026 at 10:59:00AM +0100, Frediano Ziglio wrote:
> On Mon, 20 Jul 2026 at 10:09, Andrew Cooper <andrew.cooper3@citrix.com> w=
rote:
> >
> > On 20/07/2026 8:19 am, Jan Beulich wrote:
> > > On 20.07.2026 02:12, Marek Marczykowski-G=C3=B3recki wrote:
> > >> Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
> > >> converted memcpy() of the cpu_user_regs structure to explicit copy of
> > >> its fields. In the compat case, it intentionally missed few of them,
> > >> named in the commit message. But the 64bit case missed also r8-r15
> > >> registers, which was not intentional. This, at least, caused Linux
> > >> 6.18.x crash when resuming PVH domU.
> > > Oh, wow, what a bad mistake (including by me as the reviewer).
> >
> > Yes, I'm very embarrassed by this mistake.  It also highlights a serious
> > gap in testing which we need to address.  We've managed a release and a
> > half with PV migration plain broken before figuring out why.
> >
> ...
>=20
> Is migration tested by CI or just for some reason this was not captured?

It was in osstest, but it isn't in gitlab. I'll cleanup my current test
and submit it, but I'd really appreciate committing the (reviewed/acked)
test-artifacts series[1], as some of the pending tests depend on it
(although the suspend one doesn't).

[1] https://lore.kernel.org/xen-devel/ah24pfWb_orPRaJG@mail-itl/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nKr41kE0KMCj0I53
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpd9+IACgkQ24/THMrX
1yyYMAf/UurMsPt1UcHRVAzCR327cixupl2mtchHiIqYZih3W6HwvV+vhxC5RROV
KJlXdpwykKuMOvy/SHmauyqsvQnzcBwXYch1nOvZEYURBJqN897xYY3BfNAAyCYz
svEC8HKb2SM+/kFJ9XUaE3FQIAEFKIejvzXUiowOR+z+U1uROlWGo+VeLEyTMTSj
Df3Yl7rSjsbMi2XrdRCe+fQvbep3OVu/xl3oPdj9CwI2W2e8rL4dXitdVC+UO4ES
BqhaI3jUax/onsVeI9f5mZpKm9VzKGuMdepQaPfdJj3HA/WR9iAx3QHevjAytIz2
RWEJ49LS/adrTaKnT3LCCV/2ixWEpQ==
=9BWr
-----END PGP SIGNATURE-----

--nKr41kE0KMCj0I53--

