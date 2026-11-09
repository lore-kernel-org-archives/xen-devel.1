Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40587606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=SJxLqwaN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q7ux24Ok
Received: from list by lists.xenproject.org with outflank-mailman.1480206.1684169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQjS-0004Pa-T2; Mon, 09 Nov 2026 14:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480206.1684169; Mon, 09 Nov 2026 14:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQjS-0004PT-Pk; Mon, 09 Nov 2026 14:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1480206;
 Mon, 09 Nov 2026 14:52:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xQQjR-0004PN-EX
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQjP-00ESuu-Ll
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:52:23 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6af1de1e-2eae-0a2a0a5409dd-0a2a450a9110-12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:52:23 +0100
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6af1de25-f2d2-0a2a450a0019-ca0c7c92dd5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:52:22 +0100
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 491C11D000E8
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2026 09:52:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 09 Nov 2026 09:52:21 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 09:52:19 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794235940;
	 x=1794322340; bh=ZLpsXXWL6+IxY/9EEYT/XhLy6j+mxHN18XE6OIHFJQM=; b=
	SJxLqwaNucKUCYO1qEzpZU+4QzYWf8szThRD2tYWzfSefemhLrSNVVAEhqHw3QO2
	ZvzgNKqtoA/0FVJiTG5h3Vice+CCxtxVRUHZ4CS5Rd6L4kFICf/x+hXeVvGiHNsp
	sRTVPS6qie82w8XfUJod4C3xYig7lKfqS9f1uuL8WAZxU6EELEp6RckpW9fjPLNB
	ZasNmF2pKHrB0MVDgKz2U0j1FPZgGJJbUrJZTeVp9Y+2EMtM3VhHAkHeOfBh/7Rz
	hfKsZVqm4oJg8K2yacpDh3yAVayuvCIoT3n3sEKh3KPMGVoqwBsIQhWnuEzYz6xB
	YqPHCQ4cKDL7bq/bM+Ngbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794235940; x=1794322340; bh=ZLpsXXWL6+IxY/9EEYT/XhLy6j+mxHN18XE
	6OIHFJQM=; b=Q7ux24OkSbekt/H1shF+4YprEiW/SCLdw4mv59BqOHLgi3pweMO
	z/WiElqPw0lJ8NGD532F5UQfOsjH9MLOacJaPCylJOW5IMhmna3w9TMtfwzOIold
	2q10zAJoAXGOoqABDNzMN/9bHtuWbhbB37wPda+7tipRSNxiCbZad+DT/3LAA+Jt
	XrtdcAMu1l/UbdahKz8GMxTvpO9FeGOHq/viRKB4ptKKp+cxjmx6YczXRkVRZFo4
	L42sepAeY/bLlFD8M9FQAQMHW98jbk7vKIT0MK459kEUddjD4rlZauls1/KzWjoF
	rgaVs+35dIpb9LmuPoFYkrhpv/hPnL2RqlA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794235940; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:RMcr4mNZXyHQavKkX/vGZMSkJby+Pq5KdTUoM07nBNyIK54
	g7EdAtWuOnJe3H/M+hVdPBhQ91UyTp8mIjoIzExf79vyrX1Bv46NaaxpKsFK069G
	ZF5UCeWaO8Ne5vuKH+cQBrqDGNPmpLee1Ovp8q0Bri1KELKvc0eVYJgjFubYay1y
	VPvJ+lekp0tEcEVS8Mi2oad1mNFSydT3jF3HpICFY3/lhGehGdhGOB+ty7D0rBPp
	dkZg5O5HjVXBEbq9hjZ1HFINsWUp+T5apamLokxgRcb+5Z4cwwkKUQWDm+FYqhUb
	4iK9TOonXQwq9GanNYzr0WK3eOmEdthMMaGI1Fg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:e/4zs73J1X3pN1CbnbYjwURMR7hv9MVGZrblgOMhgic=:lRIo3dvOulfs0N7VdbozhmPgjeAtMiYS4GUpr1Mvax8=;
X-ME-Sender: <xms:JN7xaoEKSR4lZ9GXhXWv7OWN2ItQwxPAKErK_Fua5Um7ZH0k6C_e7A>
    <xme:JN7xajljQxCvvA2JMcQk28iGuUHMzlLEk62Mrd0Nn7ufieJCgSLLTdLb-ngn9HB3G
    yb7oXoBOrNG6H8xP2_TR8osBXRRfa12o9X4N8tKhGxT4L68Ryg>
X-ME-Received: <xmr:JN7xakZRpknQVN3wKdCqdDGOmyaodsRJSd62daRJC_3ZIlxH27F63ZyOJLcuIre2a_I4BLrxoPwAbGRwA_4DrCAsjvgWk1np50xER3zhCKo>
X-ME-Proxy-Cause: dmFkZTGAKBM1wXtterCMCKqOCPseJgEbF6lVSmDpVDO46aajt+l/2GeUuyrdt73vCAG+im
    m1e3MWkvOKXb0EVwdfE/zkJsCTxsybk7FxZE1Ap4JZ1dr/3a4NuZ/lN7EcV41DkSs0KLyF
    LMS5SXUrenqMF5Hqot4/7YD8tB24gS7QtFriSZdrHjNjIvXCF5JfzjEfqZMs4ciw1rFiDa
    LyXYf3fGv7XGMFNHu5jZzdLCx6XubBCK03PU0LuuS2hbHoql6Qzgh1ZxtPV/RdUrAkJ09O
    zsm0sEsJlO9jIY/ZSWE0LCu5PgFvnO/Cp3iGdNJ0ywGBB/wzWNYwAushxLHqzQZr9pY0uE
    EFD9xcNF41k1AtQL5bWAhw1+bAyw5ZhFqZLbuUCC5YXCP0bHxZeWmK8msRfWGuExE/0vRV
    dHQ6s6F/xVA6wo3H2mThYAYehDNrr0WS0De8TvISs4lAALe+ihurxig1jdweHd4ORn21nW
    MEBCftjPP/x7KxvQeCtmMZjR5kpaVXSUr4Aphc7rqHqt7XomKYFkLq/7oIKbQWsUEFOkSf
    sH9sW14A9mojjTt3MISVnWytUExXYqpO5JvabwqY1L5f9d3YOB8UYmlgHOFAHi/ytSFaT+
    7MgpJvdaN/ECGH8CqHJ5gomTDwcWkLksQVF0yp6QW405nQY0zYrPhNAKUvcA
X-ME-Proxy: <xmx:JN7xagHtDPiCY20_RVxcrcNMSRRRfXqyQvy2iklr9lu6tAVPKG78sA>
    <xmx:JN7xatKjEN3j5lLuBOsuI_LqYtNjW_zAduZO79CAN3E1SjDebj9e-g>
    <xmx:JN7xajPMKYf-vG67t7mexIo7pCp8NrxnC8QRBLUtlbfoQqPKaVjPiQ>
    <xmx:JN7xalkfIAfJ0ldq0-oQzLZQ_z8zJPqORtHNYnu7n4DdjsR5G_RJTA>
    <xmx:JN7xarxi1_QjLXSKYPZgB5XhGdEyrSNqm2ZI_7xqFs0fgT1MfWeSaU2P>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 9 Nov 2026 15:52:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/EFI: fix padding of EDD strings
Message-ID: <avHeITupUgK01tiT@mail-itl>
References: <MA5PR01MB11455822E04DAC972F77A25A7FD772@MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G5dl/i/OVL3tyrXM"
Content-Disposition: inline
In-Reply-To: <MA5PR01MB11455822E04DAC972F77A25A7FD772@MA5PR01MB11455.INDPRD01.PROD.OUTLOOK.COM>
X-purgate-ID: tlsNG-4011c0/1794235943-5A5DBCFC-59C7083C/0/0
X-purgate-type: clean
X-purgate-size: 2594
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--G5dl/i/OVL3tyrXM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Nov 2026 15:52:17 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/EFI: fix padding of EDD strings

On Thu, Nov 05, 2026 at 09:10:28AM +0000, Anandu Padinhare wrote:
> edd_put_string() decrements n in its copy loop condition even when the
> loop terminates because the end of the source string was reached.  The
> padding loop then writes one space too few, leaving the final byte of
> the field untouched (zero, as boot_edd_info[] lives in .bss).  On an EFI
> boot this yields e.g. a host bus type of "PCI\0" and an interface type
> of "ATAPI  \0", whereas BIOSes space-pad these fields (SeaBIOS reports
> "PCI " and "ATA     ").
>=20
> Furthermore, if the string exactly filled the field, n would wrap to
> SIZE_MAX after the copy loop and the padding loop would write past the
> end of the field.  No caller currently passes such a string.
>=20
> Only decrement n when a character was actually copied.  While touching
> the function, also correct its indentation.
>=20
> Fixes: 51f03ec421fb ("x86-64/EFI: construct EDD data from device path pro=
tocol information")
> Assisted-by: Claude
> Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--G5dl/i/OVL3tyrXM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmrx3iEACgkQ24/THMrX
1yz/dAf/U8qzTY44XV7U44SvWSfowet06inwoU1+nQy1gHnAxNn74QS91v73QoqE
wKJ24vOqnN+hSiC+SOrY1/DG0yaU32mEL435/kq437VZXQ0rIyr09WvRy/gcztkM
Gb9R8QUQVj0vEa/MM8INb1lI6DXaEXzLCRwN5orIVqnb+ZPWuWkALlYSRWMfioSG
LEo+0obv313UEU0jAgNQtAcqik3+77EAnCk92lvP9dhlTbx0GwCzbmYCpt5H2bkV
O6aZbAUXGOmMtu9jZrP4WMWwdPvq+rvNsjOIsxskEeidIz8J/K9ts1OTug3BrxjL
pfsXhOs/6sZOfJuyfsaa+pcCapBlJw==
=CRaj
-----END PGP SIGNATURE-----

--G5dl/i/OVL3tyrXM--

