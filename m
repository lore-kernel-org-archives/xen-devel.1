Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA05C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:54:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413140.1643384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Ikg-0002fl-Da; Wed, 09 Sep 2026 13:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413140.1643384; Wed, 09 Sep 2026 13:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Ikg-0002fe-A5; Wed, 09 Sep 2026 13:54:14 +0000
Received: by outflank-mailman (input) for mailman id 1413140;
 Wed, 09 Sep 2026 13:54:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x4Ikf-0002fY-K7
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:54:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Ike-002XOx-0w
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:54:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aa164f4-8faa-0a2a0a5109dd-0a2a450bdee4-18
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:54:11 +0200
Received: from [202.12.124.148] (helo=fout-b5-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aa16502-b7e8-0a2a450b0019-ca0c7c94d141-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:54:11 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id C7D5C1D000CC;
 Wed,  9 Sep 2026 09:54:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Wed, 09 Sep 2026 09:54:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 09:54:07 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788962049;
	 x=1789048449; bh=VMvOOyY9mcnhXRYtdukfXBzrxZKMNsKzYYKcZnz3G+s=; b=
	cFdKeLDAzC9n8RycW3FnwasBMZtWVWrwPdAnAGh++ATUnInltOuq0175DlK6qgiI
	ifDQO52ZX1k6hknsu8XFZ/AIt5ufUdgLhlpzCk9Et7DmvFARShrWTknhy2hWef/b
	SsIiHsfAAr++XD+EeZMbrOMHFwpv/kp6Hj4ZjNndyvw464pQGg9Va3k1wn8kX97T
	1zyW1qSZa3S6U4OlREoH8300qTqg0j/bE9/05AgslyPDH6TuEdgyDq7rvBmR9SuO
	5I+E0yqlbjdwPxlaDFGnhud0Y7yarYiPECclV214/AeoQr4eNDYowv8DgzxZMgED
	a5nTwguAwnaB/KvQX4CEwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788962049; x=1789048449; bh=VMvOOyY9mcnhXRYtdukfXBzrxZKMNsKzYYK
	cZnz3G+s=; b=wj3UTmfX3a79OeucEgObnXUYyvflVaPAvpDJQB/nV8V3awp6Sad
	w893/LuTM6Hub7vNSOvkro2NXEBRSO4ks73oSyy0QGzfTfwEzUB3IGGMfQmA8NqQ
	A8vWeTrBU8JX4dlQyc1nKR1ksBc9iqihwGb+RAzlLlmTL5ve4tJoWdS2D6Hd4yA2
	RoSpWRLQ2mpi9AQ9rbR/si05PZuTiyzbnqPJjAq275B9TsV7M3jlseJ/iVSYQE96
	i4i3aHYK9+BchYGXNkFaFFgo2qA+qXfNzIyFLH6AeoeYxcpuqWGNvqyNAEgOHsSU
	+11hmfbYGDWCB9mJqua9qrjg5x73TYE3WqQ==
X-ME-Sender: <xms:AWWhanSsfsZj78tYC-pnCyoEzm0xlYzmIG6sMPAsqQNCAHRmz3gUNQ>
    <xme:AWWharCpneRkDAs7pUrwq9EdseWLuKrPd9vs_fb6TWhxoXx0fgx_cf2w--R2XLD3w
    cTGQu2VtWmwdSGwte6b6TY59dXPhYtWd6DHJJiLgCn6cjkjicO1>
X-ME-Received: <xmr:AWWhavE7GfeiQmdf75G7ftPaPbT4pY5xJK4rVb91JXcECQDfAI-DtSpSrIjwFWMflYRF3FYuU3-6IaQRFHPqmY6Qt72gOS6UK-o>
X-ME-Proxy-Cause: dmFkZTG1NR6sYhmdAkE1G2MkdeeKu4jVrYRkLE+37adJBo113bK+to5NDDf+ghPO9tSip/
    X+IqF6wjFEy8ucFVUFtMYO7pD1t4HhAN4Ye7ePD/gxRahrkAnsSRRks7MUyRgXSZ9iK3OD
    aMNSi69kA6RwA/DCdxuNQp4zt60RpZBXxUWWlMJNQUg/b1cpWqT3Mtp+OGROAUM5eZ4FK7
    lx8kub0cIm7J/uuT0lt2zUEWe4Hm39qm4ZejJkLoHcIEGFftyuNxT9xIWtvI6nplC9i3Qb
    +2ZQtT/snmRtEU34Olv0Xu28IR0+SmP3lOT1ZdqoeFVbhctgrsfpS1jb2oEfa1H9/DeWLr
    wy8/bEeQewVJrDGL0gs9Gl/fTIm8GAz8FTHTjwKJgsBBHJvJZNtaDm9F2gcSGgqwT41sEW
    g8LYkQiod8tAU9YsMWzMuKNAPADXuvIjZuZFm4TjyjUcqW8H52iTd3vwitGg6B7O1V879p
    PSbmu2GQTDk6tpyYdqdPk4DC89sjs7wg7nfBdptxa6TsA/DHB1/zLDmlmnM6oV3S8mF0Zu
    OiKO0UBY5LKK2hdtgUgjf4w5a8nc893IREEn2ZYWcRT0qaU2Gt8t+ZJDV1G2N2YHFcD2E8
    Ph3ijsyBocl061IoW5/JPcEdHQTPvXKinNihhI9uuZNvm/a/BQpdmpyvzgUg
X-ME-Proxy: <xmx:AWWhatB5dLBtgqTwAE650jkuLF7kC_xppoZ9VsWPc7Je4C1JMzymNA>
    <xmx:AWWhavWRfbqHFkmZGIrE3JWBq4G27SVxKpvPZO9u4jHSFxbX_m_PKQ>
    <xmx:AWWhahqjwo7sf3_P96Qxf_S_s2tet6tKKBNTvRJZS6I6loki5l3CWA>
    <xmx:AWWharQpOwNnxFWsGw5ZJuHTWFF3gEKOrI-Oh-XpdAu2TkPVWK-kWA>
    <xmx:AWWham2k7Xqpk030Pj9N7pky-SYvVO5kKrBRNPcBX2Xnhrq1A1EXr-0x>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Sep 2026 15:54:05 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/6] x86/EFI: adjust efi_multiboot2_prelude() to comply
 to Misra rule 18.2
Message-ID: <aqFk_TWlwE6yHO9N@mail-itl>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
 <25c71873-9043-40c7-a514-c7cd557f91d1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YnbfIwn8Kgs20i6B"
Content-Disposition: inline
In-Reply-To: <25c71873-9043-40c7-a514-c7cd557f91d1@suse.com>
X-purgate-ID: tlsNG-42698a/1788962051-196C29EA-3D851B37/0/0
X-purgate-type: clean
X-purgate-size: 2089

--YnbfIwn8Kgs20i6B
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Sep 2026 15:54:05 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/6] x86/EFI: adjust efi_multiboot2_prelude() to comply
 to Misra rule 18.2

On Wed, Sep 09, 2026 at 03:00:21PM +0200, Jan Beulich wrote:
> While casting to pointer types may be more natural there, the subtraction
> then ends up violating "Subtraction between pointers shall only be applied
> to pointers that address elements of the same array". Use unsigned long
> arithmetic instead.
>=20
> No functional change intended.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I was going to propose pre-calculating mbi_raw + mbi->total_size and
checking against that, but then checking for overflow would need to be
explicit. So, your version indeed looks better.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YnbfIwn8Kgs20i6B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqhZP0ACgkQ24/THMrX
1yzFPAf/Yt2/hgR5XfVVB9l3qHX9tFd58Y5hGtiiG3nk0GLhIXfp8aaYuz0FDgRB
2Je1t408daMmm4euc5vqzCjtrq2ie5hE7HAoO9zEU7v7jRtTjjh4yzbGQxrqiekG
/6mySuCGS3S7xReQhj/ZnWP3NHA5phNLSuZyMiFso/80FaYn92ffeTmjRvPy5t0e
VUZWN07Od14OkcXIw7EPZl98/06k837cPmXgTyxb2jAv4ajP0fhV1ssPmFZyIRNe
vp8m9Vmobq9tQC7Lbnos9Gy/G1bsjSeKIzXrF6Eyqj9A/eyA8bpOy1vNpVesG/YB
rKbviNmnQEvCb/+9H8+3nKfRwi6Jvg==
=K9n7
-----END PGP SIGNATURE-----

--YnbfIwn8Kgs20i6B--

