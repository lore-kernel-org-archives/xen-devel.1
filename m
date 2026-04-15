Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A6FA0C46
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 08:45:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282222.1564859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCvrR-0006K9-95; Wed, 15 Apr 2026 08:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282222.1564859; Wed, 15 Apr 2026 08:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCvrR-0006K2-69; Wed, 15 Apr 2026 08:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1282222;
 Wed, 15 Apr 2026 08:44:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wCvrP-0006Jw-Fl
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 08:44:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCvrO-001aZC-3S
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 10:44:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69df4fe7-bab6-0a2a0a5309dd-0a2a45079824-42
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 10:44:34 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69df4ff0-ba2d-0a2a45070019-67a8ac90a24f-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 10:44:33 +0200
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 9A248EC0451;
 Wed, 15 Apr 2026 04:44:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Wed, 15 Apr 2026 04:44:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Apr 2026 04:44:29 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776242672;
	 x=1776329072; bh=N2sUNPb/DUN86WUSuc8oHa4ohFtHe6vFAApW3P+4DdU=; b=
	o19SrUIyrrxuBn3DkwvfqvySyVBCOXtcvW/r8iCDhAtUfO9CfquryPb8jUcnyoWK
	4OCND67nM5najTMDMoG17q0VS4HOU3HCc3aipFRpoGpYWbYOH+ngBLeF/VkVjYiu
	KDSncmPPMr+vcPJwELE+Q1ZXhmmDJnD9kpe/yWLmuiAZXiEczXtbJa6BegpvGOkK
	xkQg9LiLzbweJXAwD1feNzi77tU9JRn2hPyrYGHDM4Ymd5aPIjkSca4cDpmEoaox
	u3hLn4doy88x9PFqXofJEYCj7o7MAPTzVbHZIS7lehCnpTD3Q/u9d8ruKMmRQKxr
	7ZBJC0DE82PfK8xDCKMf8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776242672; x=1776329072; bh=N2sUNPb/DUN86WUSuc8oHa4ohFtHe6vFAAp
	W3P+4DdU=; b=XLHOTjmwkiyAuKLWm90TlgmEOQMaCK6kQE0ac4DEoi41dWnPrKG
	GTKv9AB4T27zoMhe+10mf7M10R8weIKBfJCRulYOlygRjubup2rEchBcSK+hYnGg
	mBIHkYptAWd2UXqnbRZFvh+m4srHq+21bxtEVCtQAXkbxyTiXMw8O8EXrCCieG03
	ka79CW9eLYypbBQjKKW1SDlI9XLwRO9O6WQpgLMhruq3eixGmIcwBLWalOWY7NyZ
	kMnFntPXnie6fy4MYPfYGhGz19mjiDEtr0caaUF8cxiunOUtYWXbqucMKlxMMTWa
	4DnRR3YsBpNJ9KWmOtkbGscjMpasRbyUrSQ==
X-ME-Sender: <xms:70_faarmNuvCy18KK6d_qFOBnz6EPdfxMjLQcPVr0kjdZmT_Lma8qQ>
    <xme:70_fafBwv9xcC38icVx7nxyOp4AVoUmKZBOtU0xZQbBTij_-YU-eIgLEJpY8pxONa
    yKc4HZX4M1uKoAf8rfRNgclJ_k8f-KjC0e6ThV3WiNk-JMeNQ>
X-ME-Received: <xmr:70_fabfXKrcw-Mm59HrC2AqGCWHLyifVwmxhyXkY1PpWyFPLc8DU8tylo5zH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegfeeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedufedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpth
    htohepthgvugguhidrrghsthhivgesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhs
    thgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhulhhivghnse
    igvghnrdhorhhgpdhrtghpthhtohepsggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhm
    rdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhm
X-ME-Proxy: <xmx:70_faXviLW98SJtNx1kx7k6CkEwpVNyMk5jpcIR6ndkS7GlGNBV3JQ>
    <xmx:8E_faSj7UZxGuwrnGiZZHkHva1-ydIPeNoQprtijKnRuaQSi4CRT9g>
    <xmx:8E_fafsrGH2y32nBDuo2OKy2EEOby44u4HJ9Qc6tq7rISWj3QHSdpQ>
    <xmx:8E_fad8eIKpaFDU5GGDOxJAjcrSK-QePgQnhjrMP1S7D96G2ad-92Q>
    <xmx:8E_fadOoaomSTdd4cEIFZRJWIuKSp0SngMdFp2VdjX_cxn0lBIfU3ape>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 15 Apr 2026 10:44:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 0/2] time: fix time accounting for x86 HVM guests
Message-ID: <ad9P7K1BY442UD0Z@mail-itl>
References: <20260414103327.7420-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OXkKdlGRfDshscfP"
Content-Disposition: inline
In-Reply-To: <20260414103327.7420-1-roger.pau@citrix.com>
X-purgate-ID: tlsNG-ef75cf/1776242674-8AF4E41E-890966F3/0/0
X-purgate-type: clean
X-purgate-size: 2192


--OXkKdlGRfDshscfP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2026 10:44:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 0/2] time: fix time accounting for x86 HVM guests

On Tue, Apr 14, 2026 at 12:33:25PM +0200, Roger Pau Monne wrote:
> Hello,
>=20
> When not emulating the TSC the guest time value calculated by using the
> vCPU time info page in HVM mode would drift between time synchronization
> intervals.  First patch fixes the drift, second patch makes the
> calculation of cpu_khz round up the value for better accuracy.

I confirm with with those patches, and without the other fix ("x86/time:
do not kill calibration timer on suspend") the post-S3 issue is also
gone!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OXkKdlGRfDshscfP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnfT+wACgkQ24/THMrX
1yzkOwf+MKW7KLhSeEiOfUGFN213ssCRXJNceF+o9Jd63DzpnbvLZgLl/jpu7oPb
tBsuKDdTGi3UlVaPCvspWLxE1PEo8xRNa7WJXt+7TXstdvtbegP/iDyPtRd7o5Z2
pdWTjbfCkSNLCKjMaTUar/QahBwDxzF554j7qcd17ocY6UzopuPmfl4bo2EGp84a
BWBiqncXwDQIEqDby7C8uShEpm5nEzXH9IpfSSfKItxMulh6x0ZPHR89YxDxaQhw
1+I6RIaeC9sY8kO8TGaiQXLyKqXzZLPkW76S/+WYiBDLySm5s8Eewny9bJu6G09V
+aOvgZxUjFUZFE7wv7gFWBVWM0HO7g==
=Ci4O
-----END PGP SIGNATURE-----

--OXkKdlGRfDshscfP--

