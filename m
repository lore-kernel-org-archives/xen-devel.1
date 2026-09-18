Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E56EC982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 11:58:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425210.1649304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7XEY-0002gJ-F9; Fri, 18 Sep 2026 11:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425210.1649304; Fri, 18 Sep 2026 11:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7XEY-0002gC-CV; Fri, 18 Sep 2026 11:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1425210;
 Fri, 18 Sep 2026 11:58:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x7XEX-0002g6-K4
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:58:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7XEW-00BBGi-WF
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:58:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aad275f-8faa-0a2a0a5109dd-0a2a4503dc2c-10
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:58:24 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aad275f-fae8-0a2a45030019-67a8ac99832f-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:58:24 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6D5F8140009A;
 Fri, 18 Sep 2026 07:58:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Fri, 18 Sep 2026 07:58:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 07:58:22 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1789732703; x=1789819103; bh=O3
	uG9dqlPfb/Zs/qiRaK9/x7Wn0S0Gv8fLS9Aik8M68=; b=u0KMFC5C64CX7QoFd9
	aZna7k3j5Agxnaq3je1WW4Z9l8eQVFRTJufxU4M2Hog2kwNxyQsTH1YD3k9s5Jbk
	3d9r3jM8ztK+MaGJm2RFhxh0dTMeXjnJGGOrvtzGxn4HMQBzw1GGwNpxjaXNHevb
	gBibsBADL9yKq8c0x8apSENBE7yuE9MZ8jqRuxMJN2alj1UkBl//W7c4+vLO8FGi
	dngMT48hTGAPbIpJ8y5ZSzcHeDqPCzcnfvBIKZ3YYnbW4CB+6iVTJyK++ILsBuZV
	Bq2bUPcr84jD82LghkOI6dKX1NmEGyFBTc4l9KbSzqnBRKb8J/W5Ue5HqJWelw+U
	LP/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789732703; x=
	1789819103; bh=O3uG9dqlPfb/Zs/qiRaK9/x7Wn0S0Gv8fLS9Aik8M68=; b=m
	J6RypAQodPKuLqC3/EtPJMNDRwF4/fV4LdGT7cJtt2V7BvRMmwSPxFxavVFzqrHz
	Ierh+BIAcAmdWoWeYu+PoqGvnC8Dm7JboWR9LK+xZeT2QkS2JVfJ1ltyTGeLAHnw
	Az6qXut88n3bnjcfdWZa2iw8Ijve6FStBEEWFyf49iDkXsszljzKJd3JgWP6/OZ+
	stX+HQr/CIX25Q9ewHuaz7rHFzD191vr9upr4skoH1svbV8KZCXRn8TfmYwRGJRI
	4E8CxQcmq4nrRUBbLCpaxbYjlh+/B7zWf02nr7zSBWOZYcmYLWgxOMoiN/wWKy3e
	8jSnQLqLErBrjCI9RI6iA==
X-ME-Sender: <xms:XyetauQtBgLFlXPYPql8aN0QyXJP-FVX0Ka4hXQTP34V4C1gDOFEMw>
    <xme:XyetapwBoEgLPQ2drV4IuUpujjsVbJ2teGraHWT3qcv0DD0HvOzt-HEn6Tuwttj_v
    zQcmgLriTKMWtD0LqCEITZeEScD7VOVH8tm-UzAGQE5fPYIkls>
X-ME-Received: <xmr:XyetapfNq6XKT0GVNmdfEE8MWw8dUCephuSVu9OfvHBvsUe9tdOyhMhQR_PsOyyqYHDCDDsy9gVYz8nXzGNg8mZLzVfQPNiEOSp-mhDVjK0>
X-ME-Proxy-Cause: dmFkZTE/2Gn5ijyLCaoq8oPOQ4LbUZIcnZMUOtxDnZTdxIuzLNE/cOOhMZe6fx+T8iiIAX
    IgmmoGimADrV5G1RRbZsjkfi67c3P7VVPoaGS9LR8JQr9fDW5DVpkcA+jIhc0WPeg3AAJo
    aLNLNzLVkJ98LAejSQ+yinThiyREwGNv18pb/gBu4CSkAbi75sbh9pqTZXlpbgGJDj95L6
    n6Ca6Bdt5cjNB7AFMJSmpFsrJr4pcF9rEjFSI37yw4golBrVkt4vN/0HXG9JSu/NlEaqn+
    tyMXKc4SvP7JzYozfie9ehzqDoJX7h9xnG6PQesyDLSjMmTu6DpAL0W23pblgHKQ0jb0AM
    iqgWEf4E1dv406yaVnNkpJVcnbk/HpPwR+RJFu0GVnKcVJoSx9Ai4vc1qI+plSahr8d7hG
    ZWJDO6Kr6eRCz/p7s8MAMhlLBQAXPVpdNBYfIV1dV7tvc4gFKL5MIed+Fas8NRMaMH/CwH
    a8DOsf17t/WxKYe38NQ/IkGi57ueC6nzY6RsLOyd1AYx3xd6y9szv+eU2tCfnlZ2NO6Ap7
    qUY8ZZPcoRBe/iInPFVRRlCs8Wqr47p2y5keudK+OSTPO2EgtkKKtku43yLoYqagWX63Zw
    a/6V8H9ZRmAoayZQYCfleAOo2pge1IB3bheo3vZRCsN4OigRpUpnmStt9q+A
X-ME-Proxy: <xmx:XyetalJ86oWzzPs_0YbxTul9BYrO9xmh-sx5yjLIob02ZpKJ-x4SYQ>
    <xmx:XyetaqEY51FZ2UM23CuvwX53kQaInW0YMvKer4C1iWRj-FfL_cn61g>
    <xmx:XyetavoNim_6TCfo2y-a0zz103apM4x2QI1gGWgR5Z2oqNYE6KU-Ag>
    <xmx:XyetajRCYxB8NIP3CNuKy0FhZRgndiNWd4pRPA2fcjtizJQ49pVA-A>
    <xmx:XyetajUue8L3W4jJTkpymHFGulcVey5jzcPBDdPppc_GRiuCnLI3IQ3n>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 18 Sep 2026 13:58:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Zen5 runner access
Message-ID: <aq0nXDnJ5PX5uiW2@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dMebaTGnIpaxfV48"
Content-Disposition: inline
X-purgate-ID: tlsNG-33051d/1789732704-77AF14E9-9F12E21C/0/0
X-purgate-type: clean
X-purgate-size: 1879

--dMebaTGnIpaxfV48
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:58:20 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Zen5 runner access

Hi,

After some debugging, the AMD Zen5 gitlab runner seems to be working
now. You can add it to your repo by going to
https://gitlab.com/xen-project/people/dmukhin/xen/-/settings/ci_cd
Runners -> Other available project runners and add hal9021 to your repo.
This relies on temporary access I granted you, so you need to click it
in the next two weeks.

Then grab top commit from
https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-hw21
that actually defines some jobs on it - edit it to your liking to run
tests you want there.

And then, you can also select which jobs to run while pushing stuff to
gitlab, for example like this:

git push gitlab -o ci.variable=3DSELECTED_JOBS_ONLY=3D"/zen5-.*|alpine-3.24=
-x86_64-gcc-debug/"

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dMebaTGnIpaxfV48
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqtJ1wACgkQ24/THMrX
1yxHZgf+I+CoXmc1svMVnblyDYhgx5HHCdWSUTM0vijrQIUFRarYidlyft5TBGBw
DYA07Tfxi29j8LjsRkAmzm/8BHuH+MM4YCUzGOg9ar2z8lk44QBdWz62CMzsvzqH
KueZYVDn1HmnKpuEKNnVYBWy0s0MOh66VphOLM1ailuuPJTO123sShOSGcznQB2j
X9msvdLLRjs7AbtzeG6fOCeFsGX79ljT5l4/mDD65rM+MIxM9yel9LRNGRLbuhFS
0dTItQPp3i1oHD41oLNsfUxnr0/05hIu5mA7YFnL8eAkWDVBJrlqtUJnY+zVrSmV
EAzlzWuhHvZ5a+nBhqVZDE4EFTywyw==
=/1bt
-----END PGP SIGNATURE-----

--dMebaTGnIpaxfV48--

