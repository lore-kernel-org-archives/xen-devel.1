Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F069C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:01:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428640.1651533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yFa-0000IN-Kh; Tue, 22 Sep 2026 11:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428640.1651533; Tue, 22 Sep 2026 11:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yFa-0000Gy-GG; Tue, 22 Sep 2026 11:01:26 +0000
Received: by outflank-mailman (input) for mailman id 1428640;
 Tue, 22 Sep 2026 11:01:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x8yFY-0000FB-Sa
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:01:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yFX-004CEG-CV
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:01:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ab25ffa-e002-0a2a0a5209dd-0a2a4503ee46-26
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:01:23 +0200
Received: from [202.12.124.158] (helo=fhigh-b7-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ab25ffd-fae8-0a2a45030019-ca0c7c9e852f-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:01:18 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CE4EC7A0013;
 Tue, 22 Sep 2026 07:01:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 22 Sep 2026 07:01:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Sep 2026 07:01:15 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790074876;
	 x=1790161276; bh=MYygLDtPfb/W4acI0Ri+L3sAyA0P31Lk4K752AAwctE=; b=
	egsZNAdvumhi+WSmNtrFyNShRyCe8MqML0D9ML/Q6WeHOi4iEJk89cQL/lVZ/tNI
	kAM7/rrZpNETvpoN/Tau9WDOyrbm8fNLjPC0k6VJ5QKheVH429CiTUHCkh+kyYMX
	DJrGOLv9VZXR4eEEoI5jLC2tPEAbhdKPZR6vSQjLflZVzhSkGcmAejqM1okg9+j3
	ARK3XF9sh6usglrVTeHTpjpB+jL3I3W1uSXII4NbisB8GtsMxiK9Nw/6MVQFG3Kp
	642KKKLWoh8Hb6up/zlwnrPQ6Pt88PGZn/mnDe9WV3iOAPjCP5f0UeX/Vir0UtgS
	AMamFVCGwNrIHuaiGpeuLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790074876; x=1790161276; bh=MYygLDtPfb/W4acI0Ri+L3sAyA0P31Lk4K7
	52AAwctE=; b=htGiZLzJMd6IA/Kiqcyd99bOLhnw9pSWbQkEFlg+RMmr84sXCFy
	BuM5c1cYy1QREifVBfn7dAoJ1+dDr/FPFq4fl6eSU3knu2ZjNbvuS1v57iBG9OXO
	pIgJ+GF37v35erk2eV0PqGQcWw5ubo11YxBEp2wjLlvklKEPVmfYGQUQ661Rr2at
	kBTGmJqxtvyfPSmx0KRJE9Exc5kykNeO4qBbTXIYiDHRCp1kGzK9wQ6QSJHQv0sB
	2dfIgo1saGsujMlJuxV5kTz3POSe6QdSLgt3nxyfkSUYN9ob0mZM+iQarJQksUo8
	DRReI3jYrF/9Qef/i8vxoMlYGFPnkChsqeA==
X-ME-Sender: <xms:_F-yahf5arTC9Iil-O2oIyNfiZYae9ARuI7g-uTY1mpvyFGRYtX9dQ>
    <xme:_F-yai76-3dleynXHN5qT-RZAyaaBXxZ466cMY5hURwVYjiOor2SZi_BCqYiejv9X
    ElH4K-Arf-H43FrxQq9l5-St0b1MJxwZ7UnPqKtnRTmRQwy0JU>
X-ME-Received: <xmr:_F-yakU0OkiTv1ol74midqTUqRXB_3NvUlu1oTIGoXHUQF-btFglmM2BXWoTd00OVyBw776M0pltjDyWwj2qSPxwhURGAZbwl53k40W0I3g>
X-ME-Proxy-Cause: dmFkZTE/CnSKbM///aIgkuD5hcBJHRSc1C2NT3P7sThk0KXRWii2XGNS4/3nW8BtwVlnQf
    7hOVZJANrqzgKgprEgxGPySg17ZS6opopFGQdlXN7pQMI0hRw455OKq8RQ9Ge3IyDjNZGC
    tQybyunHLNgRimMVeV9gAgr9h8mua9QqV4LvwTyDUEEGhJQaHIZY/5TBcGqZy107ybyzwx
    /cV8A1mtcdp2xFIdQvJwiLfdbjE9fCmd2vfcBuTF8JG9bg+B70Y/LKRj9hBE2HChKvmEqG
    sJnZA4HGPKWxrEz1juwhT4YRCbTUd+VvZQ6wHeSdfoq0FB6uDjZO6hMavx/k+RQkOu71kR
    lGjQB8cZjH9THYkWrGvVRQTKWNbCnbtqDbGOPoqqPHUBOtBoLRPCRGevgIE1Urygi0cIBI
    QN+Z5MUn8sJhy8ppySB5mIMvbupQA9qXJyG4acm7oHumjnTmb4InjSqS3b3prHAYdCxDxA
    1Qt7gZHQIsMBG0TLzgU73CyR5L4kLYttMngnAk/iL3AUJCoq1c7JZqraAUve7n3iUnwVfO
    RFn5Lij4WEBoWyUmOmlQxQxgkOi82cISjU7Wj97Vu8p4tZ4K110fByQ6N8iJ33pocxVjY1
    CrLLd4keFsxV5sR9+T/D3Hj8g1syC5Vnt+e0vJaVeHs/nZ44AkSL2MBLZGlg
X-ME-Proxy: <xmx:_F-yah6vR_U7--kUCyDPHMc9tXi1X5iV-qOej0YvWZLD9CFKm9yFuA>
    <xmx:_F-yavpS-LCmmUH-k7WxMQWg67MCGG3e3m4Bkhas5ttk6C_O1YWKZA>
    <xmx:_F-yakkP8E3KgLNybzc46wyOL-T2XcqkGqDIjaQztXl1Z33sNQ2mtg>
    <xmx:_F-yarOORlDoa_TkfzyK2CtQ0wVOi5xNq4Xd-AnMxV9pyC1Po_LYbA>
    <xmx:_F-yag0ucRFiexf4VGlqTDCXwBkVp2cp1oOmTP-1JCAc78Od96UOrrxQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 22 Sep 2026 13:01:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH 00/13] Running bare-metal tests with "pytest"
Message-ID: <arJf-RRYlruUajsK@mail-itl>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="culn7o+zK8dyCUbi"
Content-Disposition: inline
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
X-purgate-ID: tlsNG-33051d/1790074883-6F4C74E9-F1916DE1/0/0
X-purgate-type: clean
X-purgate-size: 4949

--culn7o+zK8dyCUbi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 13:01:13 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH 00/13] Running bare-metal tests with "pytest"

On Tue, Sep 22, 2026 at 12:08:47PM +0200, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>=20
> Patch series available in this git branch:
> https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git b=
r.ci.bare-metal-with-pytest-v1
>=20
> Hi,
>=20
> I wanted to add some new machine to our GitLab CI, but I didn't want to
> duplicate yet another time the existing shell script. They are good to ge=
t the
> ball rolling but are getting harder to maintain as more test are been add=
ed,
> and don't share common code between machines.
>
> So, I've start work on something based on `pytest` which I hope will be e=
asier
> to maintain and extend and use to add new machines.

Nice!

> It's still Work In Progress.
>=20
> Here is the current result:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/165291076=
19

Minor readability improvement idea: force color output of pytest.

> In this pipeline, the artifact use are a bit different from master; linux=
 is
> built with network driver, and vlan; the rootfs is from Marek's patch ser=
ies,
> with networking and dropbear service enabled.
>=20
> Next:
>=20
> I'd like to at least have a new fixture that give a started Host that a t=
est
> can ssh into. Then maybe a new class "Host" which could have functions fo=
r ssh
> and getting the serial console output.
>=20
> Don't go to much into detail review, I'm more interested of a general ove=
rview,
> and to present what I have so far.

We had a design session on this topic, and we discussed a structural
change: have one job per Xen boot flavor (mostly dom0 PV vs PVH, but
could be also other settings needing host reboot) and then have pytest
run several tests via SSH. The idea is to not waste 2-4 minutes for
every ~10 sec test. Yes, it does mean one failed test will likely
prevent others in the same job from running (especially in case of Xen
panic), but since the intended state is "all green", a single failure is
bad already, and this approach should still get you enough information
to debug that first failure.

In practical terms, it would require most fixtures to be class or
session scope, instead of the default test scope. And using more SSH
instead of baking tests into startup scripts (already partially done,
but may need extending to domU commands too).

Other than that, this approach looks nice, and I really like using
pytest here, as it makes the structure significantly better. This will
likely require a bit of adjustments to handle also other hosts (for
example for qubes runners tftp dir is mounted into gitlab's container so
there is no need to sftp boot files). But that should be easy to do
later, it doesn't change the overall structure much.


> Some runes:
>     - uv run mypy .
>       to check the code, at least the types used.
>       other code check could be added, and run by the pipeline
>     - uv run pytest
>       to run the whole test suite
>     - uv run pytest test_boot.py::test_xen_tools_tests
>       to run just one test
>=20
> I did create an Arch Linux docker image with pytest, but paramiko got too=
 new
> to be used, so I've started to use `uv` to deal with the dependencies. `m=
ypy`
> always needed to be run with `uv` due to missing types for paramiko (not
> packaged in Arch Linux). So the image is useless, and I'll look for a dif=
ferent
> image later, for now just Arch Linux with `uv` installed.

FWIW Qubes tests use Alpine container, seems to have all what we need. I
see it also has paramiko 4.0.0

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--culn7o+zK8dyCUbi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqyX/kACgkQ24/THMrX
1yxZBwf/TrOqGCDo6Oi5bGk+C61cwMP0zgcVH1gyo//GF9K0QU58qOZBRwYWfkfv
U5hUXvroj8VngUwK/IfGCO3MH8dKkLiSKWFKmO0ajSZBi5BraxHqqzQ4xsZkwfEO
281f5wuqSCAsPod+sVT/M3Wl2Y1FxwL6NP9WZEvHHIRX1dm9aChV4INiO3NLmwN0
jJguLBebbo3tyZOVtvAhOmvoUJJkhM39N7dxAXJjNuo2Nv0Nd2ZKsaC4xfgzSTgl
kaPyrXUrmm7dcqFcyZg3h5UuJs3BktSqIAYRo20yBZr4+UFB2BIZeUWNPoVOR3If
3U9ZTEFZZRwV6ugRWogMk90BEFN08g==
=7MrS
-----END PGP SIGNATURE-----

--culn7o+zK8dyCUbi--

