Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40C606A337
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=A6AIn4nS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DO2cQbgQ
Received: from list by lists.xenproject.org with outflank-mailman.1474486.1681597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvhf-00083u-RY; Thu, 05 Nov 2026 11:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474486.1681597; Thu, 05 Nov 2026 11:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvhf-00083n-O0; Thu, 05 Nov 2026 11:32:23 +0000
Received: by outflank-mailman (input) for mailman id 1474486;
 Thu, 05 Nov 2026 11:32:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOvhe-00083h-6b
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:32:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOvhd-003ZAB-CF
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 12:32:21 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aec6936-2eae-0a2a0a5409dd-0a2a450a8ba8-46
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:32:21 +0100
Received: from [202.12.124.148] (helo=fout-b5-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aec693f-f2d2-0a2a450a0019-ca0c7c9498cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:32:16 +0100
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id 0BDD71D000C9
 for <xen-devel@lists.xenproject.org>; Thu,  5 Nov 2026 06:32:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Thu, 05 Nov 2026 06:32:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:32:13 -0500 (EST)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793878334;
	 x=1793964734; bh=a1JRX2cbKbfVTWq2yjK/5KKyBmq9J7XoKfZMuwx0m0I=; b=
	A6AIn4nSZVovPDbMY0bW3flqtSmZiX584wVkSp4HBaCgntIvFu1ddLJJ8VviXlt4
	HGFshRDNT19Pdm6ata0TUGnGJYuRGESHSMhuiWMm6K4iFWUMNrUZtGcFL+zkqfSl
	RmuIjIfwDxXVLP6OuI9Tkw6EA7l8GYOHtZWIdCAEdu+CrjnNWB2DM9Xa6tlDKVng
	eI8T9SDTxok0kv/N0HwuWM0Cw0aJqSNrpuDb/sJx2UcgPCHAGpOYzGuTo2Mz7j4n
	Mrhuc+XWG+1doq/n4QB2KEJ6zUAwU/5s1Za692E5KyR0QtAnKMUw8xIMgd2ecjUw
	WQbFZUhU+715nATr22kifA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793878334; x=1793964734; bh=a1JRX2cbKbfVTWq2yjK/5KKyBmq9J7XoKfZ
	Muwx0m0I=; b=DO2cQbgQtCnIoeP2KaJBlCj6ejbQ5B+F5unMRLjDVNzIHbmRsRx
	l85xdFIELX2FAVSC33FTRxZrn57hlCicoy8kl9F7AWTSxviQWUsHrxNkwPHZcHx7
	LsHDQdW40HhSSPVu1gfDrTFkAtNwlNYb4sTiwbq8dEqsiqL3e8DUsEU8bQ+/Ebwl
	XoPWO2c2w+QYCCy9CZEEewfR6vZYKPE5H0umQBE63RMXtz2a2KRd788guiNwSZ+0
	oMYZ2849mg6TlusimkPyB5vIdxYAH6w0+QDBBTlUiT0wCfIC0gxzZpU6AuiToRuR
	g9oeaI0V+csbE3AyNCVdK3ub3EEqBUgzGQg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878334; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:mw3oQwluO7QsJpMm59FJDYWB+mOEfkNrfB2m5h9vUsyLW15
	PslJI2sjCIfF6cXvGg8rj4IEFPlpIT6z9/3WW1V56+A3yI6qcLrcl1DXeaQoHv3p
	Sc+2tZpp+Tio9hM/H7V1g0FTSG90ot9bdeht+Fge9qIn9F3UOPLM3sheif4e8/wJ
	Z59OvXkBxgdGxYYNWPLL6T3EY2rqlS8ZOiIlSiHtWq/FYq1ct2MrqCFEA0kB786L
	jUiuW4eJ+Dn2bV1/m6VkppHtT3tGH52/6SkMBsWKei9MBDa7nTuuqY4zGsTXFd3z
	OsfYA7U+3LdHEWpVwM7XY9KfBZmgW6S35/PgavQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:UT8tmUnCCBPVRQ9fzzCQr7dVIIWmjg3FP9Vive8QbHw=:uNueO9dY+F6vF5MRz5lv03CYPr0zlaCrPkPBi3Ed49E=;
X-ME-Sender: <xms:Pmnsat5IjkW1dVShlKhqCLpKCQvCsU7PFBskDpVtQ-PvfuC5u0EOzg>
    <xme:PmnsatJ-giKlyO8PpeVkt_z9wPsMhl5Pom8I2xsw8R1Vck6cvxhMSt2iGavYpaOSo
    iLME8fpwxgoQklLc8DXgeieshgcl6MKgnIoFn1AGRTV4U3IMg>
X-ME-Received: <xmr:PmnsamuHXOACVVAv7VcrAopvnJyN0YGS0Dql2szqlBE1OK2iOTtDeSn-f6NbFN-V8PVfRDJ_QUr6AsHCjUUIcNUYy7m-n7t845LJt8oGGcE>
X-ME-Proxy-Cause: dmFkZTFCu93y14GmrmgAZ0vJGPo4iklgQsRmaz3FnJ0EzxxDDS07rYte67xnn/PPzTzpiD
    +JBxCj+npRTTWUnEflBJ4iYtVkE1wvV43M/4/zW/eSbMiMchv1QECnwWGYELqwwy/6v8z+
    YTqlXBL5W9QcyUQ6uzfKZhDAKQNScSdXS8KMGUpmQY7XCA8OI3aD2QQtA6qWDNcXuDQ0d+
    z/vwsWOKlkg9ZQDNEimtUuu270H09tMhXBOu3aBu1zlAnUoCHeckQzZkwvE4PhXi2/gBrA
    +cZkVn+e9mYAm5+abNdlptorXRoyj18cBThNex0QQMLYsh80/8WjnJyL+Z2lN3kxMnEDKP
    +IAWqO/EOKqHGVNPq9N1PNCQ7w3dcgW7tDvmuC1pOK4ja+F5uKkh5f3wib0nwTUtoTs4X/
    HgzEyOTYUmdS0uWu1RaBv61ylIGjINsZQF7YKr27g4LIXDTuiXQ8gjV4AvSKFwJOipjR8Z
    YBdyPxja3XY9LYGzPSPzdfQu8eaEge8Cik4K2B37kBFy3gCrLtNCbwep7pprBgTyaa9xLM
    nFnisbvQNR0xzLSyVuAf1vZSUMIwHQ4UXTCF7tfssNFEJo0u0Pl65TfASWbi6L7bKku1Yr
    MnotRLW7RqpmRu3uHhbhjPtZFLsgsaQaw71P5h76SdQelqLZCZrYxLSQ0TLA
X-ME-Proxy: <xmx:PmnsasI4Y9i86MKDdzeGUnYfJT-faAifWsgpBCHIlBDlZikfUcZhQg>
    <xmx:Pmnsav9Kyh3sHV_eacSIPd25iBc120r3JgxvmMi6gko_g4QFNGKgFw>
    <xmx:Pmnsalxo5AUnKOnm19uOSVb3mR2-sRoAhkPLdohCojCocDABmbcCJA>
    <xmx:Pmnsas5yrSjYq5W7VWGCrAst1HZNL9VoOcOa5csBNyk9mDJfIcCdGQ>
    <xmx:PmnsaswB0LtLEfNaRiplNeHqt--X7rJW9i2RK5Fm-Z-XGThJ43GlFSHZ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 5 Nov 2026 12:32:11 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: George Dunlap <gwd@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 01/15] x86/EFI: guard against oversized modules
Message-ID: <auxpO1GTRFnei45o@mail-itl>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <bc140f68-a6a8-48be-950d-813ea33de071@suse.com>
 <CAFLBxZaruHp0XzV-8iJvfTwgLNaiALjFHNxL7jJMjtnWivf0KA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aO8RRs/B/E5vsFXN"
Content-Disposition: inline
In-Reply-To: <CAFLBxZaruHp0XzV-8iJvfTwgLNaiALjFHNxL7jJMjtnWivf0KA@mail.gmail.com>
X-purgate-ID: tlsNG-4011c0/1793878341-512C8CFC-3F0EEDC4/10/78276251493
X-purgate-type: spam
X-purgate-size: 2125
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--aO8RRs/B/E5vsFXN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Nov 2026 12:32:11 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: George Dunlap <gwd@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 01/15] x86/EFI: guard against oversized modules

On Mon, Oct 12, 2026 at 11:12:44AM +0100, George Dunlap wrote:
> [Re-sending from @xenproject.org, since my other email bounced]
>=20
> On Mon, Oct 12, 2026 at 9:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> w=
rote:
> >
> > x86/EFI: guard against oversized modules
>=20
> Nit: This repeats the subject line.  `git am` of this has two identical l=
ines.
>=20
> > module_t's mod_end field (which we repurpose to hold a module's size)
> > cannot hold values 4Gb and up. Don't let truncation go silently.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> With the repeated subject line fixed:
>=20
> Reviewed-by: George Dunlap <gwd@xenproject.org>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aO8RRs/B/E5vsFXN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmrsaTsACgkQ24/THMrX
1yyOXgf+OqB5fjGY/hqFc5mZnv+qtAtmYEc4k14K8OIT0jJHnU0TNaKo6xYdmXyg
JcyD6DU62OsW3SFzeN8/paS86/8OhbzybRgb6Sh5p1wVAnvZBjvN7rMfayQJzf4z
v+lBhmVwFKAvHRcPWuARa42ZZcbcbxjxeD+qgGO061T/yec6H/F36eAAlpdJBC19
007zNc1zicH2dKBiAdYqkPhHCGrsuTJy/1J1jWHvDd5Cyz1NHjSTvZpvou23hAUE
cLzdWGHs4KF2MkXsEk0R4dffVAvv2DAye+jdhi/Ob/1DFFIIzbI5i8CQCjXlQRY8
NEcu/UZ7WY7QJ8Th0N1Pr27czDzjjA==
=1E4D
-----END PGP SIGNATURE-----

--aO8RRs/B/E5vsFXN--

