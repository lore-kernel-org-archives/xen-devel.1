Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36607EF8FF1
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2026 15:01:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1245550.1544905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnig-0006jE-5x; Wed, 04 Mar 2026 15:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245550.1544905; Wed, 04 Mar 2026 15:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnig-0006j7-39; Wed, 04 Mar 2026 15:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1245550;
 Wed, 04 Mar 2026 15:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/nm=BE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vxnie-0006j0-Sa
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:01:00 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f33ae674-17da-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:00:58 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id B1EAE1D001ED;
 Wed,  4 Mar 2026 10:00:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Wed, 04 Mar 2026 10:00:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Mar 2026 10:00:55 -0500 (EST)
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
X-Inumbo-ID: f33ae674-17da-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772636456;
	 x=1772722856; bh=/6mPn7+MSTQcX7GlpvXaiJVSgeglXAhuRBMxkvRDAGo=; b=
	Wq6xNLYp5ttwVnmeARhr5LgJx0+UAllepmNk/ASQHg8PRE81APuaJDOI5XaAUnZj
	PxRCppxbDK79V+D70mnHUQUP90D+SRR6rJFqd8D2CsnwjXgYtswdQ7NQudGb47dx
	NRueRb72av3pBSt8mPPUi4XvCbYNKedC1CeGOmJ2SEwcRzxOy93Iot/69LSN9rxK
	1vaWtWokBpGv+jI/6lKH6y17DuD/Y7l6gc1spDL/glaFofR7opXB0iFSmfkpPzcs
	tV4CZivlGkQx9N6rzGSyWSNxDXkHIDnX+Yr1eWDIykgtv6Ec+1LsFtKfpFOvWtmf
	JcWs58EZf46TqhO0EchisQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772636456; x=1772722856; bh=/6mPn7+MSTQcX7GlpvXaiJVSgeglXAhuRBM
	xkvRDAGo=; b=aWRNyu7AIUjkUzmOj03aqWQPu1ixaCzD+shJsMGX+spq4T80YGb
	pa+Ofv3XwBu7aKExRExozXCO/K6KIiWWBpiDGw3rllosy1tBKUyo4R8ROgxfgSDW
	OyVfWT66V+vTKPi6982zK4C23G8B8SpmJPqD5YapwT77UupjJ5YraaDSFqJmEzaB
	ZulLVmgz/0i/0DmfzV8QzOsLxj170zIXJLB2TNFDfAY36rnUsQ4O9VBZZFCS5/QS
	uMUkGUR4QGtzom/mIWK4jqmVMjSEpXpZDekmLolnY75CkSGbfyBs1Fu5pnaaBre3
	v8rGP8t2NVvJWuSAfxZz3uRjBN6WFmT/d1A==
X-ME-Sender: <xms:KEmoadTexLjbbNDq9RLqFWJzP4S5p_aVkLFZmzhrXK7woEvUdUrzwg>
    <xme:KEmoadwYpDKmFiy8J7XnYtUh3sqImUasYURuXnkFbOemxWP-T5WKnpN4fHWaF6X-X
    6Ok4I-lgCc2qYb7ZNlhL3_iIDz9tIFGhkJieIzAvJT0L4kRmA>
X-ME-Received: <xmr:KEmoaX1L7h4rlUqFjcqFGx-uJfqXBSAjLOTrR-PKvl3Jv_wbFLTSlr7UUB-bMPbyiiX_YM2Ye1iVUpnozMsXQ0xauLDwkGa2kWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieefjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfekuddtffettefhieeuheff
    keeuffelvdffuddtteetledtveekfeekleehjefgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthht
    oheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:KEmoaT6ApBmTPI_ce0cY8HZjtmNK6q-yHwxAdMQWRhH3LlRpKuRC-w>
    <xmx:KEmoaSWEq2Cn5wzJ4g-sq3ii5Ey-stU6R52B4tViq3CRdAFGyNhYvA>
    <xmx:KEmoaaDPcnhYpWKbYMvncGhs2SZC3l7sRHcsb0TN3yXvl790-HPa2w>
    <xmx:KEmoaZ461x65tv4h2dlzR4iZNPXydgcnrRDFjGMx2-D2PfsgJV4k0A>
    <xmx:KEmoaYDfZhB-4zzUmsmp0yVbD9SByWNcebFPIcFEKSdgZudG1ly_gbcJ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 4 Mar 2026 16:00:53 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
Message-ID: <aahJJdA6ftj3OucN@mail-itl>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
 <aahDX_QvrB1MTLcq@mail-itl>
 <0c556f7c-6567-43ec-a9cd-eb542fc970b3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fOaXe1B5sBHN0ltu"
Content-Disposition: inline
In-Reply-To: <0c556f7c-6567-43ec-a9cd-eb542fc970b3@suse.com>


--fOaXe1B5sBHN0ltu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Mar 2026 16:00:53 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init

On Wed, Mar 04, 2026 at 03:47:14PM +0100, Jan Beulich wrote:
> On 04.03.2026 15:36, Marek Marczykowski wrote:
> > On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
> >> MCE init for APs was broken when CPU feature re-checking was added. MT=
RR
> >> (re)init for the BSP looks to never have been there on the resume path.
> >>
> >> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
> >> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Sadly we need to go by CPU number (zero vs non-zero) here. See the call
> >> site of recheck_cpu_features() in enter_state().
> >=20
> > With this patch, I now see the "Thermal monitoring enabled" on resume
> > also for AP.
> > And then, the "Temperature above threshold" + "Running in modulated
> > clock mode" for AP too. But, I don't see matching "Temperature/speed
> > normal" for any of them...
>=20
> Which would imply that for each CPU you see at most one such message after
> resume. Can you confirm this?=20

For the current test, yes. I got the messages for CPUs 16, 6, 18, 4, 2 -
in this order. Not for 0, 8-15 or 20-21. Not sure about CPU0, but for
others it kinda looks like I got it for P cores, but not E cores? But
I'm not sure how to reliably distinguish them - I base it on the holes
in numbering due to smt=3Doff. Specifically I have online CPUs:
0,2,4,6,8-16,18,20-21 (yeah, weird ordering...).

> (Generally for every CPU they should be
> alternating, but appear no more frequently than every 5 seconds. Albeit I
> can't help the impression that it is possible for the current state to not
> be reflected by the most recently seen message, for a potentially
> indefinite period of time.)
>=20
> > My simple performance test says it's okay for now, though. I'll see how
> > it looks in a few hours...
>=20
> I actually don't expect the change here to make a difference in that
> regard. intel_thermal_interrupt() exists only for reporting purposes.

Yeah, it's too soon to say definitely, but just after resume test said
stable 6ms, and now (~30min later) later it's at 12-14ms.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fOaXe1B5sBHN0ltu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmoSSUACgkQ24/THMrX
1yyUUQf9G3qyWkVM9gFdWcbsyo/0WTGqS3d2lW8xdRYF33d29PRe54WTOOFhAQXG
3vHXNfWWme5N4YeFM/P8CH0rLuO8Zj8LKZk8lEvpFmQUXreA0RzvNwPJGa67Ogp+
o4MRZbsYNWXyKkFRfZK0CV+27qmWCv2Aw2j5iIBYhCM6ylrzXUGl6Ojxzs/TrfRF
gM/FzHPDYhkoqys57qwaDKuTfbxhrd9Txlo4xEj/yoeoLZijmnDU766JI2ObIlKb
y7aNrh4GYpSM1GmNML0RoK9zIeokLCJ1E4qWSt24yIStwgcgSRDHBk9AuWKLFEsn
SrsXH6um9QmJEsIQtSIdw1e61KQMzA==
=lMYs
-----END PGP SIGNATURE-----

--fOaXe1B5sBHN0ltu--

