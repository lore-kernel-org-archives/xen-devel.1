Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890CAC4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:29:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3992078B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3992078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54484.94680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDCj-0004P9-8Q; Tue, 15 Dec 2020 16:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54484.94680; Tue, 15 Dec 2020 16:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDCj-0004P2-5B; Tue, 15 Dec 2020 16:29:37 +0000
Received: by outflank-mailman (input) for mailman id 54484;
 Tue, 15 Dec 2020 16:29:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ADE+=FT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kpDCi-0004Ow-MN
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:29:36 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.161])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52abdeaf-96af-4caf-b3ac-4297c68be352;
 Tue, 15 Dec 2020 16:29:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.8.3 DYNA|AUTH)
 with ESMTPSA id D005cbwBFGTV4WN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 15 Dec 2020 17:29:31 +0100 (CET)
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
X-Inumbo-ID: 52abdeaf-96af-4caf-b3ac-4297c68be352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608049774;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:From:
	Subject:Sender;
	bh=46DZN/VEJ99V4ZgVjeUCEK5Kzd6YvHl26d9HkIJ5Wj0=;
	b=aQeY5xTH/kFAYMQLYcHgm2JP3uY7kNJ3tTZcKEbCWESReXPwVPe+u+WaKc4JfO4Fws
	DjvfwOtpsSX3PhWxFjpVISQ9fE1sWF0Si59sm8PnDqReNOxA+1EW0ElLNsInraVLjOG+
	CBRasayLIpTRoQWd/N8p3sI+6yBXhDZCi+fGoq/jUgGsXg+6sJDnHoLLNy++L2o/f3mw
	Ebh2qZZeEj3IbMPp648jkbN2NdZuTYun5Vm7xRdyFsq5bCn1F8MnOMv98jODd1mhtSjE
	XJQ12OOVpNtTh4QD1tFfcsbmGA/Mo8xjFzFN9VYS0pCeQpiwDFosUhKC7c78yqvBSmXl
	+bVQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWOnz/A=="
X-RZG-CLASS-ID: mo00
Date: Tue, 15 Dec 2020 17:29:17 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v1 3/3] tools: add API to work with sevaral bits at once
Message-ID: <20201215172917.556071ff.olaf@aepfle.de>
In-Reply-To: <20201215162244.mln6xm5qj7pmvauc@liuwe-devbox-debian-v2>
References: <20201209155452.28376-1-olaf@aepfle.de>
	<20201209155452.28376-3-olaf@aepfle.de>
	<20201215162244.mln6xm5qj7pmvauc@liuwe-devbox-debian-v2>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pGuc=7kWgqwdQnd8HcUA8Na"; protocol="application/pgp-signature"

--Sig_/pGuc=7kWgqwdQnd8HcUA8Na
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 15 Dec 2020 16:22:44 +0000
schrieb Wei Liu <wl@xen.org>:

> What's wrong with requiring the input addr be const unsigned long *?

Probably nothing. In the end I just borrowed the prototypes from the other =
functions in this file.

I will resend with this change once I have the consumers ready.

Olaf

--Sig_/pGuc=7kWgqwdQnd8HcUA8Na
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/Y5F0ACgkQ86SN7mm1
DoAUXw/+PoC5o52SIW7bjQ+tTgh3eAQ8RU+nDiRJsV5Ym3zQfcD51XnFdQyhKlq9
dv0sKi2D4SiDObiPEesm673mF/AnOXE/PF3PMFOfu5Wi57FHy6b00L0Elj0ZzhGQ
kLCUikzkjY3bchjmnMkXKZthIXB3pVVwdW4osBBslbnB718jEYh/nHQD1U/9K1tS
Jzd9z7khJxcjSsLuHe95iva/bsXmeh1vohYSBFP8gE3sZL7z9KyJqLSHyc42NYL2
LdhY6nneTMG6O69EeazIaUUD3jdLZ2kDzGSMUaIUFHltEoKN6z+uT1CtsVVwU+ck
3rYNOaEq+MiDgxePSTg7jvwia3OrM127SNp95esBnec/yk1Ai3jjMLJLBfi/XX8B
4w3k6lX9yZG8qNDW6lXDf/z3qq9/oJ1VGwMJ8l2A5lrL3TasWlvYac/bhnWAlukt
2rxplqZP87jsIsXunGSj4OhZPL7LAY2OtOjPrCQZKMCJsNkdYFV0XHsABWd051iQ
6e6vlbwHoQnKJ6SsWHbPEAiEDoAOGdWggcV8W6nmRdPHHM7QtofKw1P0+Gb1Px4K
Bgaz4lMLD0zX9HXFgORuSHnkntNyNLbHFsTMnWb6yf0aDBJqhhH/2VWragyu58AJ
1mbhkXgSukGIjmUIoia/e55ObuYIph2UkPb18McufLE4/Q2Y3a4=
=X7kn
-----END PGP SIGNATURE-----

--Sig_/pGuc=7kWgqwdQnd8HcUA8Na--

