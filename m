Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA789C61DBE
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 15:26:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399317.1635459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyt2B-0003bA-QR; Tue, 25 Aug 2026 15:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399317.1635459; Tue, 25 Aug 2026 15:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyt2B-0003b3-Mh; Tue, 25 Aug 2026 15:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1399317;
 Tue, 25 Aug 2026 15:25:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wyt29-0003aw-NG
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 15:25:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyt28-009HRo-5q
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 17:25:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a8db3fa-bab6-0a2a0a5309dd-0a2a4502d858-6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 17:25:52 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a8db3fd-6ca4-0a2a45020019-ca0c7c9ae11b-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 17:25:50 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9324D7A012F;
 Tue, 25 Aug 2026 11:25:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 25 Aug 2026 11:25:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Aug 2026 11:25:47 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1787671548;
	 x=1787757948; bh=UOtbtAmf2ZFQ9HUbrtpF8rOLiDXRmAvIzLZdI5iFIoE=; b=
	NvFs7YDg/qo0/MeQCDLCS6yfXwv78/rv+XMv8mAt8D6yhji3mqBsUW9L09XSIaN4
	czeNSaX+R9MWM3IRY0kmINW68qz90KC1MnSADCE576Z6dC5Ix1ZQvj1r+bnyLMcx
	Tv/P4f4IslhQAG011fH+FHRXqUFU3rKPSHtQ+X2BfSfxmaJ5KVXN+CJhO0WDaDT+
	l3Tr5FlvC7fWsRzM9NEhKZyazLULlqOrudALEh5JVB+phaAxTMLXmxfsKBjpPA1X
	93iOdqFKZH5iv++wberNC2+7EQqZKshm8th1c7lKepk5NMRqUhioEp9vFaDwqQ3i
	vB+sVwxznVMq74rBcuyNmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787671548; x=1787757948; bh=UOtbtAmf2ZFQ9HUbrtpF8rOLiDXRmAvIzLZ
	dI5iFIoE=; b=Pz7Np16GfPANcEZhdyQ2hZe9vUF6sA9vZ0LjpTgG1g6EdPPp91w
	fn7VAbZqF+dfkvBdoyAHm4uOBV385Kd9eJm/zUWvOWa/OjYBCFZez/YChOfkUgPq
	PfS+prJwZoy9b0/Cv8k2bj81GpuxkKLRnyl6djUrRDNxdhGpm7my4JFrENGdp0Ju
	DAmV5RLz8xmQEA+6mwQBzxzJR+ksoMXJnFDqpZcpdwXE3ueOftyJv53+Hf95Go2D
	9XrHsa1YYvUrd+qYAKuUoK+kmLOmjuLeDGMXz3dGZB7yFUlkOK9bzmK7G/mkLx/b
	jwrTQVvw8HONx29YYjXRy1k3Gb8OJtjQIaw==
X-ME-Sender: <xms:_LONapUXU36_GCwyQfo3uZ6RkSwPPuk5AhcgnNRYNSb52uoNL95_ug>
    <xme:_LONagfPGX8ujXQS4eXujppb4fnKdqFIDVBKfZIeNTI7a2iafMejSTQ0Da0HMp83T
    C7QG6qDv-nO1EN7x-z1gZRD-LZDT37XsP9Yedm8XxaA0d9pJiE>
X-ME-Received: <xmr:_LONatsChN3L9uGpMYHd0X0_oya_hVpcCgASfxQs-QT6qMp9a2zBHjkgzrV7-SZ8E7KQ9LZvC0ApDv_eUl_z4eJWNyrGPeZT8YU>
X-ME-Proxy-Cause: dmFkZTErKQoUc1EFlCkg0FLQ9ECRHHLXJK1mMM3+xTKl7ay4Ew8B4QCWYnsTYAopL5auz2
    EbMNE6ODnLYI1WtQLfabBhgBM97aEL0zt+m4IsHpOa7bBPeHjZbqROD6ce1PKiXdhlRGwN
    2l4Hro7jzmMWzv7UHtYTAvkamoM0zAj0TkejklZe4Do7eMunhyuEEMyb282KNlDb05BKZQ
    T3VY/0ByfdMCLVE8Fnrz3Bp9uHBb4NMUtuH0KTq/tJeCtsQvvlWjxzAqRNStiA5O3XapAa
    Np/DfRcUaTVKMm0BHb6aG20wBYhkSCElgxh4W4A+nNCNdgQ48I8XTFri389yQin9I6AaSC
    kl9aYEQ3KF7CBfnMc7SnI0rjWrlPV0kF2hRY/88p9mbtD4prnTGMynJ0IJiWbguQdKe5lL
    RnLMMwQxzV+cviE7dgEmU+U2S1qW8nbehFlKV2Eo7++QpCG0NcRWIvyckqXRS/DBJbMvc/
    DUhK2nEKko0M+3RxIEfYUgF5tv50G5Jipkt0nke1GsOHjSxJkC0WTYKs5bmCDDoVemZpyG
    A3i+YY10fSxNv/pTWqGBnD5wVb9mtHznmdoAdDn270PO1StSG1/BXzSSWqqgS/8scKDIMm
    kD7n6JQ1Dp5Z9e4RC6Xn5M4lry9AQ7Prb3DlS3tz3HtSr5YOemdcoO7TXhDg
X-ME-Proxy: <xmx:_LONan8jS_2G8SAKfW6FgBVtdYZeUgoniVg-cJEU56zxl7RxOKwnow>
    <xmx:_LONag30C2stactqU_aCW_vy34Y6q6XL2tWuWy6bMJWuGqQnS9_xAw>
    <xmx:_LONakDxUpfE41c_L-2AVMZhUo3Z8crpcCeLpxryrckSadnyVjj2xA>
    <xmx:_LONakeASTBU3fAH9Pd8kSNsJvMF-kYJuhjrABsKbYE7M_NcssTUxg>
    <xmx:_LONatRGBVBBwmaAm5fJSX5dR3kTcrZcnXPDMBpg7rQFivPT49tauqwV>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 25 Aug 2026 17:25:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v4 13/13] Setup ssh access to test systems
Message-ID: <ao2z-V1K_tDz8u26@mail-itl>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
 <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
 <alpine.DEB.2.22.394.2605261201180.182011@ubuntu-linux-20-04-desktop>
 <ah24pfWb_orPRaJG@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s05IUUr9rd2cnQjr"
Content-Disposition: inline
In-Reply-To: <ah24pfWb_orPRaJG@mail-itl>
X-purgate-ID: tlsNG-720697/1787671550-F30B02AC-F7DD6316/0/0
X-purgate-type: clean
X-purgate-size: 2538

--s05IUUr9rd2cnQjr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:25:45 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v4 13/13] Setup ssh access to test systems

On Mon, Jun 01, 2026 at 06:51:49PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, May 26, 2026 at 12:02:23PM -0700, Stefano Stabellini wrote:
> > On Fri, 22 May 2026, Anthony PERARD wrote:
> > > On Mon, May 04, 2026 at 02:35:52PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > For this add also bridge package, so xenbr0 can be configured with
> > > > /etc/network/interfaces.
> > > > This allows extracting more logs out of the test system.
> > > >=20
> > > > Create empty /etc/network/interfaces, so the 'networking' service s=
tarts
> > > > cleanly even if no interfaces are configured this way. This is
> > > > necessary, as dropbear service depends on networking.
> > > >=20
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > >=20
> > > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> >=20
> > Since Anthony has reviewed the entire series, on the whole series:
> >=20
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Thanks.
>=20
> I seem to have forgotten the "test-artifacts" subject tag (adding now).

AFAICT this series is fully acked, is there anything preventing
committing it?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--s05IUUr9rd2cnQjr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqNs/kACgkQ24/THMrX
1ywcTwf8Cb+gYk2IHF7OABQV9sKHM2YZnVLL8gg2WbkC4uHI0B3i8gdIvmf4kKXV
wqfgm2LExzs7TOLMiyMoCbPWHSB5UV42RkNrlUcU5yBf/SSwsZmk9Q4qDSxXsMcS
2a0DcQE+W6uye1lrDXVgzFUmpoaaGtSwPKJdKdeviz8/4Ya015J3HafCgYjKj54T
3P/q3/r7xD/xL/uoZDIOvKa4x+WYneG5h718n7mmSsiv8DpWGJnOnllT1wmr8yaC
lU1uepTe4bVKP9SR0AY+z65yc3zoAGNq/+1SVUfnOch/4FP4z+8ZWrHjqjStT7dA
kmBdk/qcYd/Or1jZdrdIUcbel44huQ==
=GOaJ
-----END PGP SIGNATURE-----

--s05IUUr9rd2cnQjr--

