Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3953C982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 18:37:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424383.1648881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Gz4-0006ij-99; Thu, 17 Sep 2026 18:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424383.1648881; Thu, 17 Sep 2026 18:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Gz4-0006ic-6A; Thu, 17 Sep 2026 18:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1424383;
 Thu, 17 Sep 2026 18:37:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x7Gz2-0006iW-Ow
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 18:37:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Gz1-00EVsp-Bh
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 20:37:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aac3329-bab6-0a2a0a5309dd-0a2a4506e348-40
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 20:37:19 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aac335d-195a-0a2a45060019-67a8ac919f23-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 20:37:18 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 50CAAEC0246;
 Thu, 17 Sep 2026 14:37:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 17 Sep 2026 14:37:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 14:37:08 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1789670237;
	 x=1789756637; bh=k0Tpt9jrFZIKZxdXfsQxY2n5bJUNuBFFI7/5Z5UdDSc=; b=
	MCyqT8NAnkCGUq8gn+uVxXIBTMq2pUT4hoOLsbuEXKvyXPQCv+pR/3XVdyu74wXI
	7+3izDP89X038UT2trt56TbUOt/9JZImJUd5VFRhRdVw8JF7LKgR6VDj6B9Y6wuA
	zaTNiHv4tzWjZ6vkmhxdvI4pXI5ToBt4p2iI3Y0F7p5dSCQegjS70b/s1NYs4c12
	iw/JgmwkBc/lLUM/8LIfqNEbccMLjATk05VWjl5T9BbuDx09h0dv/0o2nbR95mg1
	jear36vRfkb7B35UMjDuIf8P6amyIOaYkqK0MoNPH4QU4jrhpMIlFxONeaqg1LoB
	NhTwN5KF2WBM65MvcJmAHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789670237; x=1789756637; bh=k0Tpt9jrFZIKZxdXfsQxY2n5bJUNuBFFI7/
	5Z5UdDSc=; b=KwMphScEnfqRooEdLoI5Dfo6ZcilwicnDITqojMUQqru06kRque
	doo3Cugq3Jzfx+vUFZ0tZSf23a85z8KlFAwlqK7evJrznL6Kfu8mCgCp3ZpFGnOJ
	Usq1JwvjfZyAgFUNhOpKzkJuS9N9vzSo1A5/jqx1z/1gvn/h67qe2vljo9wWjWaz
	ZFDsG7+ZAnsxcGsUHNrt+O8QXVaS5Ifgcd0lAUadqoqMBBScpG52MmD4b6a53Khm
	WStlUgWhcHtC99yKh2K4h5YMgVA0nadSRjZFHrVCAGsvvE1eK1p98Zd7ql8FH8EA
	gT+sDyWW3aKLHm6QPMrJUCDLYNBNwoU7tcg==
X-ME-Sender: <xms:XDOsapz6EhJ1FTl1bKbRQOu9I345aAMPc1lhsblsqzQv-1ISm7bAew>
    <xme:XDOsagLDOSplJ0_0TlW0igGEIusWJaDCAXDoAK5s9k3fAUJmWCRSgESRSio84TLfR
    oS8t0LcPELbru1TP-et6LulD747KN9jsHncPsjuXUkKOVXGSBk>
X-ME-Received: <xmr:XDOsarpmtgQLXlc21KY1t2ejKsmV7vH6zpYP4tVJy3Y_1X5W2UoAxXoNiFci>
X-ME-Proxy-Cause: dmFkZTGmFKmh2HR18D4gBJZzQKUVQXL/w6zccRGNDgOFqklXxkmyrWx6/O0xAL8WgUZ068
    2T4TkmxL+ecbIs0NJQbEF9SfdF53CkKwZVL+76P++9Jro/L9AXft84OOU/HW6b88UtfbLs
    vw0C4xh/C9+C+7Y4N0atwaPkZfzt2dlIaabWnQCjZxoMPw9YYrk16vLjJirmyFcSF7Y3Lg
    oAWgkJ7aaF1FnRllKPyDyy5t5ZCAKUYRKDhLTx6k69ADZc3wBQso+xz/D6rsTsZhf0MTfy
    D8vwccVHlgYEs3Nz8AZekMROnm5WCyz792/EgrnKKQW9XsbIEXD+LoPUCjYp+G68zFLKNE
    +SMVN1CGeG6sQ+BwP+fcdC0n+iNdkQJCfXfSt4+R+9iXWNvqQgmiKt1R1lW/DAbhyE1+AI
    SyB9TcJ9pxs97D/A5U5fDPphq4gPwcQ7pQ2Zc/9hEne3+qpv7BcJi9daT7kDSftSUf/a8y
    niqL8KGr+BJerOr1fMynac9YQSDuZOIs+91+QuEcHNVOHXyaEdkrPs/aZoe5FSZeN8UMg2
    THChobW+s+gK5r2ITlZF5JMEEmrNBlx12SkBSgg9gaE6dDophzczFjirZOlWwY2GHvaBJW
    J3JphRYYPH6nJuOS/f6jTMB4JDmXNGEKghyRYaHd4iSm1Bxnek5SDk7ISlRQ
X-ME-Proxy: <xmx:XDOsanIDDmfjZcQyLRsHwMfxY0-eCWbW-2TonuSNctPL4a-X9YjKtg>
    <xmx:XDOsaoSgPbaxtF3j0-M9xxEic6iy9nQKmkjJ3Ja_ltrZ_ScGckWi5Q>
    <xmx:XDOsautJIGxT2HYsk0jYr_L28rxecgGU4chD7W9vvHX9szaRMmBWYg>
    <xmx:XDOsahbjBVFg45DU0EFe6-H6XefHwqjE6KxTYMUFPr2w7NocTLF7fQ>
    <xmx:XTOsakT2R84il-W1xfhKHKnyP9cGOzkyr5lto4GamfEn0OIlCv8Yozx->
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Sep 2026 20:36:35 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: George Dunlap <dunlapg@umich.edu>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Assisted-by tag (was: Re: [PATCH v2 1/2] EFI: avoid OOB config file
 reads)
Message-ID: <aqwzM5Cly1kSGd-O@mail-itl>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
 <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
 <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b+OdSe7mBE9SL46Q"
Content-Disposition: inline
In-Reply-To: <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
X-purgate-ID: tlsNG-16d1c6/1789670239-F7CCD77B-A3FB2BD9/0/0
X-purgate-type: clean
X-purgate-size: 1547

--b+OdSe7mBE9SL46Q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 20:36:35 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: George Dunlap <dunlapg@umich.edu>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Assisted-by tag (was: Re: [PATCH v2 1/2] EFI: avoid OOB config file
 reads)

On Wed, Sep 16, 2026 at 04:37:07PM +0200, George Dunlap wrote:
> Discovered by sashiko+Opus.

How does that influence tags on a patch fixing the issue? Should that be
Reported-by: sashiko+Opus ? Or maybe Reported-by: George + Assisted-by:
sashiko+Opus? Or something else?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--b+OdSe7mBE9SL46Q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqsMzMACgkQ24/THMrX
1ywvegf+MvYLBIY8ezEjN5y4/ObQrfq20vsvu157ZFXRxn8aNZlQHVKa1//hzEqS
nfS3KYkN2hEvl8RwU6ur6aJ1AKc4BP8pGz7uVtpxjuEf5QaYosYwoak31U1FALQx
AxyKgfvhsRXrKIDdoLiNR+wnpQDoebz/74o69j9oTHM+py07lAPNs5CQpWDggrUm
fhHWdjov8RyvNtqnLM/zMlfPwNUZoWlXl6JEu6xYtkgeDGyYfZpXY3HmYhz28Ifc
dmPwyjmyKhadnW+0D/uxxDAWjGiFoVaT6nAn430jyKLpXTHqz5cvWrEImujrcgkg
BZyMolQhzm6Us2bQiuwALHt/DDPNhQ==
=zehe
-----END PGP SIGNATURE-----

--b+OdSe7mBE9SL46Q--

