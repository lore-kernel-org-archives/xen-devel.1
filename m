Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB17F513E9
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2026 01:54:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247305.1546042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyKNp-0004q6-8s; Fri, 06 Mar 2026 01:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247305.1546042; Fri, 06 Mar 2026 01:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyKNp-0004py-4K; Fri, 06 Mar 2026 01:53:41 +0000
Received: by outflank-mailman (input) for mailman id 1247305;
 Fri, 06 Mar 2026 01:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FCob=BG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vyKNo-0004ps-2n
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 01:53:40 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a275681-18ff-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 02:53:37 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id C9BDAEC053E;
 Thu,  5 Mar 2026 20:53:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 05 Mar 2026 20:53:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Mar 2026 20:53:34 -0500 (EST)
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
X-Inumbo-ID: 4a275681-18ff-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772762015;
	 x=1772848415; bh=6U8fQSkuzzGHsgVG0KV2VvXbd2zo1NyGpnENVNDSsbc=; b=
	JhtL3HQ22nMVwDNjR3CQvnkuSN1tkQ49+2VHFFjUJlsOxRtHWrBunnT5F9YaMufV
	D4fx5sg8eN7fzVPHW9AQwiwv1PMfwuJe47H9lZJEgxqCiCrwo27WuyIpUk/qWeDF
	ZumNeSeyPTxVicrnwGhWzkNQ2QkK/yNVQCJd2g6ji8WsMehrxZIiRSAu97wgn9tF
	MqMcP/1vd0OLJFQut0EB/9QKnaDPZgK4dWcYE1+Rq2X0DCnp35VAscyifD1mwUcg
	08VHm7AxXT+7PJ8RpHHp5yDWjlGeCzeg1RZ9psI2Mv8UUZt99oG1GDWYkpE/SVts
	YyoVC2XpAOmWRgQIqzCUtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772762015; x=1772848415; bh=6U8fQSkuzzGHsgVG0KV2VvXbd2zo1NyGpnE
	NVNDSsbc=; b=NfoWcLYKXi0VFuPamyhexjlj3Td2ngWOhPy5Y18c58OaWvRKypX
	kVRe9didpmFCLua3EgBBNy6WCTJzOir5d2DU5yTouCXf/t3krDdpltPLTrUFUgH4
	Zo8YE44mKwz7maf30bsyk4/4pVh23hVbLgOTAas0S9c0c47VW2y4PPpJQI2FPHEK
	10lEZK7CbuRC0l3201tvbvLwc8kQkjaV8Znp0+cvvGKfDeHqHfwooZhd98FijFSg
	aW7XlNvispkG8WCmtBr3sUQDeJoe6IRa6eKa1s/9WMn0vI8DYnUSCz+517xY34tt
	BJvXDAuPgR9AG1dYxmrrFZ9TVEnClX/26Hw==
X-ME-Sender: <xms:nzOqaTPsvZt_rE1bRb-hug4Mql_cPZmfIPshOfq5bd7TVUpuxUE4-w>
    <xme:nzOqaQNo5elvx2C6BZJONdvBjn0JWmngeoGh6ErJ-h7UnKUtiGifrOOJWzRiX_9u4
    lhSu_1Nip1bvRxU8t17QLE1ycwAKy6nUSZXvHt9X8ofje7RuQ>
X-ME-Received: <xmr:nzOqaUjXJxpQTgHO6fsbdKujx7RawIe6IRdSRyyQzaKmtSNA6NZPXgNH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieektdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihohhtihhsrghrkhgr
    rhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsrghrkhgrrhhsohhumhih
    rghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhse
    hsuhhsvgdrtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhu
    thhiohhnshdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:nzOqadvHcGNxg-3w1cAqAKfxBqF52Krn7DgonNrj4XW8HEDnAGRgHQ>
    <xmx:nzOqaaSuLBolOisjhGocy4aVbC51wWqnE34F9LhJV_Y5vWpnev23sg>
    <xmx:nzOqaZ0Ta9P8V2yQMF6feax9sxPkKetYJus94038dWmtUyi0W9INDg>
    <xmx:nzOqaXvDzOYWnP6r6Yj4nTB2AJ8vYecj4TVCQWycqgAkkeUl2_SYEg>
    <xmx:nzOqafaT8QaTwHvZC6qlWPhbgmWP4r436AxjmF3Dbk23Cc65yb5ZduSQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Mar 2026 02:53:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/acpi: Remove BGRT invalidation code
Message-ID: <aaoznRwdCKzRvKlD@mail-itl>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-3-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/16QqovfCfoBuKIR"
Content-Disposition: inline
In-Reply-To: <20260305191810.31033-3-soumyajyotisarkar23@gmail.com>


--/16QqovfCfoBuKIR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Mar 2026 02:53:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/acpi: Remove BGRT invalidation code

On Fri, Mar 06, 2026 at 12:48:09AM +0530, Soumyajyotii Ssarkar wrote:
> Now that BGRT images are preserved during EFI boot (via
> EfiACPIReclaimMemory allocation), the invalidation code in
> acpi_parse_bgrt() is no longer needed. The BGRT table remains
> valid throughout boot.
>=20
> This removes the code that was marking BGRT invalid when the
> image memory was detected as unavailable, which was causing
> ACPI warnings in Linux dom0.

When preserving failed for any reason, or when it was disabled (the next
patch), the entry still should be invalidated. In fact, the check here
for RAM_TYPE_CONVENTIONAL may already disable invalidation when it got
preserved?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/16QqovfCfoBuKIR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmqM50ACgkQ24/THMrX
1ywwKAf+K4Aypn1nnlz362E4k9FyryWFI1RwnfOBEbwvG47RUlxe1D+QawoMxTln
ZdvCvxl6c9n5dlHNhAjauGYGvohFBadcpE1imodxulmEnj3u7GjnrgJbS9E4cYQW
uOf6L7WV52/crMsfhNTfqbTRwD+zN694FvcXYWOX9599KFzJ+tmV07aIZjc5y0Ik
x0Pyo9v0FZYUfxo/LMO954LhT15+N/VO6XzIkAxFcybDG98SXwnyYTetAAwqp6f5
bG0wwae24leJPy0r1jQyUSdec4tawJ4lCokfCT94Jp7mt7Lfktq3jUAq3WRkRuXk
d8BpllFrZGpqUA0gisvSaeFCPtQ2iQ==
=gxAI
-----END PGP SIGNATURE-----

--/16QqovfCfoBuKIR--

