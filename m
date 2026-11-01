Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E653606A324
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 22:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=EC1DMFyX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qa9JAVC0
Received: from list by lists.xenproject.org with outflank-mailman.1467485.1676629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNeBW-0001zu-7C; Sun, 01 Nov 2026 22:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467485.1676629; Sun, 01 Nov 2026 22:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNeBW-0001zn-3u; Sun, 01 Nov 2026 22:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1467485;
 Sun, 01 Nov 2026 22:37:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xNeBV-0001zh-GJ
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 22:37:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNeBU-007P6p-MK
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 23:37:52 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ae7be76-2eae-0a2a0a5409dd-0a2a4506aa98-44
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 23:37:52 +0100
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ae7bf3e-195a-0a2a45060019-ca0c7c90b4fb-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 23:37:51 +0100
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 934061D0011E
 for <xen-devel@lists.xenproject.org>; Sun,  1 Nov 2026 17:37:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 01 Nov 2026 17:37:50 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 17:37:49 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793572670;
	 x=1793659070; bh=zYednr1U73JLFHC2nz98Dlkn4k/zCN0N7V3mLVHnZ4g=; b=
	EC1DMFyXJ0OfI76yvYQvrlP6v5AuX5eO/2eSdOiMGs4hI+IcspaARBzEIG/9jgNl
	jAOfFJ3riKjW7Z4WrHXEc1ticndGChiVRcoGhS5xT1HphBFOchI0EZa3DDO7AvUx
	X6cPghWGw/dNBvPcvKitUqJADhHEkbFwKJm5f8VvQvoG08SSvh9k9LXYj0VlMO0a
	9pjFTFMi5D4BopLdD3WGTAxLnEkN2HTLJ4zmHJ1o5ugZNl6XkjZKtexP9XeU4pt6
	tSopdp6e34LizlIAFf1eSX4WLN0xB5DL1hycystbG+WGagWPvU1gf7EdonAzpacC
	kPAAIJ257ZEnQ9r8DMkt4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793572670; x=1793659070; bh=zYednr1U73JLFHC2nz98Dlkn4k/zCN0N7V3
	mLVHnZ4g=; b=qa9JAVC0Rzd0ooBTPy3ARQAFvxd7pLcegrrPRX2aIeukmJDMRgV
	kC8XMhtu63NIJ7f63uOyCSK8o55gnl9mMUq/kZC/yY/QvEMGWj0vx6Ggc16vv87e
	N664Culb0QwBv6p1y+t0zbnrjaGvOqh7SLm6yKYyKb50vGLu5QmFfd7QRe5ihdpE
	g5fPndffLbvCHeRC6r4B/r8ye8/+B5mfp/l5Vir5UeUB/C3nDEOU6hod+oIAPpQM
	bqcfqKMhT/5aq88b8sKKj292V6l6oq3GFNgVccRJ8YQFGlgGcMuNaZe2sx4aogpW
	+vSxwpBfvcx4VI1zRZMmAFweLDd3PxlFlAw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793572670; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:L9t8Ly27U/k2BrT+fqP+m0RsIJn1BoL4OJG4hDAKv1GhYO4
	mIHOJbE4sfB6ev0ThK4UnVo3lWjua+8/eF4nEDtX3q3Jzaq0CxpgCttCFY4iLTQx
	BWZoq+bp0s8ZRclANthCKCvpimb6rlpEVj7KppRK+QZxQhyTHCiV0/hEtdyG42aj
	65ln2Pw0HJqMLUNOVFGFnx2KqiJtGed/Y0RP1AAbfkX4DD0oRXbFfucX1XqMTIFo
	YGFup4OOTS79GBnb69sLpdVaHOPGCmbiFoZ4e8WPvyRcjJ4OhEucLaNJxTvj9lJw
	kAadLAXXFYrMyD/8DBCdr7GxPjPebCjt6lFPwDQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3NQNMVoWWbZLb+kwUKXhJtCaycfHvIbnCiD5DmQ+qMQ=:zYednr1U73JLFHC2nz98Dlkn4k/zCN0N7V3mLVHnZ4g=;
X-ME-Sender: <xms:Pr_nas5rRyYE-8Bw7zvQhAVYJu_wRMHI6Sg0cLGHJIQdNCPzy3ibLg>
    <xme:Pr_naj6av1UqX3jr3-1yxXjWjfChp1CgZ0VxrH-CM9Fbx0cCw7EdNf-VVSPwyicdL
    B08sg8SD1plfBv9v8JUyRiMBA6-VothILLYgF-6lJMWM0tV21oY>
X-ME-Received: <xmr:Pr_napFWmdAn7qLMn7tUChqjdhhpeyB63pxxit55RQ6qaDhwmNA02dcb6fiifK5941VHq6EGhytArpKlvIIDmL4idr3Hrs6Gx3MtYuDf62w>
X-ME-Proxy-Cause: dmFkZTEix5/tRtjbsw62yriC7Eb3O+PqN9AAFyavPt4FSl0FobetRpeRmhzEanKN400jsm
    it9CKx2+5d9C8n0MMFDu3TKSWrKDNzM4y+/SYLlawwwDNovBrS4BVd/yynKXVCuB+fFblg
    XwVzmiYk+R9e2bfuQn2h/EFGhu8PX/IooS1UEHLuf30sF1dEEE9kcCJ82hl8bDzs+QNmiA
    MRNO/NxkEKOviiHTvA0UWQxm2yHrt0hnVbZk65IkcPubElKXMQsYRpiQC3gmBiVOTutXhT
    bVRN5i8oyW2/XGcwyilSAXmEa0GkKjjwsMCGtPqUKvuYJmwUeZkz4l7sxwpe897YksU0K9
    XfVMUKIgTZpCA+5ngjR8jFuv7HDgLySfSCElP1BlTJfSYt+a4DkxQamXb/qmej3HfQzDfB
    Bfx82g+XRRC4W60AlVpribp1J1qHTrFsl9oy68RP8lRPOzqfHYqISNkBY+D15mDYMS/vSD
    aqAyjS0chUf7wl2NR4n+7VVM3gWZw/731gcPnWxR5jHSO3TAtttnRyg6CalRLYXsZJDYpl
    XkP+1rGA+e1H6sjlFdHVCNaupXMFLATp+BoF+DBhoX6WEA/V1I4iA1TRGWD4PleMK55OeL
    GJe0LILuK7VjdkADSXpyL85QWdpuum3c5kupEaQHEYx7Oc+pwY+nknXh4cAQ
X-ME-Proxy: <xmx:Pr_nasRqlkjygycmuZhjajY-XX9rFcY9V91uudSSNQlULXwaXWdwNA>
    <xmx:Pr_naisLblpkZw6w6FT7ol2u42CIdVDGtwmSEUAWPJa7XR2ZMmd_fw>
    <xmx:Pr_narxOH5LYlCvAISJeDvgiH1_81R1wNnrQpKAwcZvjlizTF6rtKA>
    <xmx:Pr_nas4g9tA3npvFQYtPz2saTgmPXhOiVKTGWKfSAXRv1jMSW3ocPQ>
    <xmx:Pr_nao8w-29HUHIUIWDsU9uoDK2WQHOzZa0XWR8BE-PzSKVEDwIfPD-r>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 1 Nov 2026 23:37:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>
Subject: Re: Test report: IGD (RPL) SR-IOV on Xen - Linux 7.2.5, xe
Message-ID: <aue_O36U1Y7kQpEC@mail-itl>
References: <aqpihasUJ4lTZcnU@mail-itl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mnS/OHZMVY2zPAsM"
Content-Disposition: inline
In-Reply-To: <aqpihasUJ4lTZcnU@mail-itl>
X-purgate-ID: tlsNG-16d1c6/1793572672-F6C7777B-3C0B1B84/0/0
X-purgate-type: clean
X-purgate-size: 1571
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--mnS/OHZMVY2zPAsM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Nov 2026 23:37:47 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>
Subject: Re: Test report: IGD (RPL) SR-IOV on Xen - Linux 7.2.5, xe

On Wed, Sep 16, 2026 at 11:33:57AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> I kinda suspect getting similar result on PTL, but I'll hold off with
> the proper bug report until I can actually confirm it.
> I'll repeat the test on Xen 4.22 later.

I managed to test it on PTL, with Linux 7.2.5 and Xen 4.19.5. It just
works, no patches nor tweaks necessary. So, it was all about Linux's
'xe' driver.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--mnS/OHZMVY2zPAsM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmrnvzsACgkQ24/THMrX
1yxm5wf/eUezbKtOq9nkYOoFZwoPMDltm84mm3aR2vQDuUzt1pq87A3qbm8iECks
QAZVB9HJZUZAoFLcrqdl6Us0NnRH3g5nHLKmP3BJ3p7s2MN1jNGdXGWjBfW6cjZZ
mPjw/QiHgD1ZShVgQ6oRaELyyXgtLh56tu0bV8KfjjWMml5qWOZHo/+tQNbYjCl3
HKrBCnwAphcWxSNDjqE16GtRfQYLFRlBLTKl5tTU5UoOgOCFs8e47xBGSFjuA9bQ
eURS3hN1AJavSkOYfJuWD/pEZmN/OCM0oOi4emiOFLslxRWHAxStalTUZ510plRm
6hTYV2gHQQXQoTfIUt+fMa9PA7O9EQ==
=eWz3
-----END PGP SIGNATURE-----

--mnS/OHZMVY2zPAsM--

