Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3738606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=hpuowITj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JDa842Q8
Received: from list by lists.xenproject.org with outflank-mailman.1502222.1698206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBJb-0007a3-Mb; Wed, 25 Nov 2026 11:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502222.1698206; Wed, 25 Nov 2026 11:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBJb-0007Zw-JD; Wed, 25 Nov 2026 11:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1502222;
 Wed, 25 Nov 2026 11:37:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xWBJZ-0007Zo-VK
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:37:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBJY-003sqN-IF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:37:28 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6b06c872-2eae-0a2a0a5409dd-0a2a450cd6a6-24
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:37:28 +0100
Received: from [202.12.124.145] (helo=fout-b2-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6b06c877-f479-0a2a450c0019-ca0c7c91d8fd-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:37:28 +0100
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id C645E1D0063F
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 06:37:26 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Wed, 25 Nov 2026 06:37:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 06:37:25 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1795606646; x=1795693046; bh=9k
	yUCfChn8pCXHK8yebfiOWuNT9W9TxIjA9i0vqjqas=; b=hpuowITjOHN4aIO0PR
	rEyWrrQOAtDGJ3ir6bIcDK4ulKbAWaZ1h5QDmwlb3yoi9ewPJGuVsLJUupleqUwP
	c3CmNOwk851MCHhgo6YbP57+UmJqtxgDLllf1i6mJ2z9Xu56oj5fVI1BxH/oFJIg
	+6bKSBXHkReD7SoRFy77VpR3zbKpeHtBQPfZmz8D2bgLZwr1Xl47Az+R2XQa/hiJ
	xqfDUyEkhoRDZHcysfRyP+WFuJvuy+1OPeDhKwgCowDCIioSAjR6nuvRVmXLpuo0
	KZv0sv5uwMNk+hvqOL/5IgyC5I6iidYdvdKYgqmsc94TOcA7mNZpyOj/VRJdiG7V
	DGlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795606646; x=
	1795693046; bh=9kyUCfChn8pCXHK8yebfiOWuNT9W9TxIjA9i0vqjqas=; b=J
	Da842Q81UmaDDdZlcNbZKdTuSQiN3tJ8wksuAym6joeeHkmHiVHxxV/g2G0bb83b
	i0YA3STPwGjHs8M3eYIgCYJ/ci+NRhhSfQnaBblOoLFFAzMm79euBk5r+jf/2Md5
	NsK1qMkavN2Vy/swz6rXH2nmi7OHSf8HuidiWykRtPT/mfdfGqVqj5XobaqjrFSA
	d0MWHeA89vJpPnZ0waCLkAZrMke9L16iFe+Cbvdanv09fpGVbbv84jLRWU/PQPvt
	ekllUF7lYBTBbOaZoxe555T1BDuDVYHfwgNeX8HHpRN8KiyaeUFxnyS4eZ1Yd8kY
	ULXIGCZxzjFiKld0jlqaA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795606646; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm3:rsa-sha256:Jxabz/s0gFab6OgrSU7ueXCrr0RwQ9+8uXnRdsQXoseMIgd
	ERo4MYss0t1Bbl4Z47vCyG2ROT2We4u36oaD6yEkndi+A5xSJMSUQ5f22gJwMhDE
	fddeMvg4h6RLWk685gNYmTw+N9nq2a4MuHnmFwm3Jh+KsDx3BZaJ6atBuBzkrhsE
	dsREXcOMlbvjDlgoIHEXHQ8yQHej4pzXcv70tSl9CCf3nxWGzurF0BDxJG9TY/BR
	neZo8fsHZ5Wty1GExcAIH9BSBQpvRSjOMkea4NgVwvdg0A/0Sg9smqu8P+caxjQT
	OxekfS+TptIOUl+3hRpn11m6bs07zAQWfr4x3EA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:yHwUnP5w/Bq1V8pwlIGqodEbIbaTKOOc199MPDgXSIw=:ye2bjK0mgrHRU/fjaH47XDXFf57kiI31H4SKA/v08r0=;
X-ME-Sender: <xms:dsgGa4TKW2UVO4voeWx1IG31HNtt0scTduSt7FtIXSebUwarLteXWQ>
    <xme:dsgGa8q45OR4tPX3t3MVEzvRyV4aAp4zSgjQP8N1YSbwHL5upf81Ddj9zRmzbdM--
    QI0gcyZykFK3APxb9OH4fr6HnBBjtUud-ett85x2oOTz0bL2w>
X-ME-Received: <xmr:dsgGa-K8shwZiKI7XnBp1yUdkdWPj7ZZsGFRAAk_IVwghN_JmUDmv3UCAQtLJ0A_pErdY1XRLfQuklZIEM97gnndz12lKGIrcHbY6TiN1z8>
X-ME-Proxy-Cause: dmFkZTEN7JTuSK3BXL9J06e6DyHkHlK4zk89f9wWQjaGK5q69GmZf0bpLrr1DxccWaK5Y0
    SyfHLuPTM2nWzNZRKHoMsLaQsE19+rKMap3R/EJsB1mL5JPBxZtzQHWcx2tqmeABKpHqjx
    L79zz7FEYCkwn8VD5hZalLBsWmpk48GNR6/UsSxVyAoxzieXkbuQjJszERSDa5PkQqqcqE
    wolPBNtb66kqC7D5lOAVaQuKLvjPqW2Etdb4R6ac4DjXysvl9FK/Lgf0O6OS1EuFrRsMhe
    7AdHeHmWp4PrhUDUjCTc5nQXN9gdgM6sYQ+y48iDBCFmA9cfnbLp8q9sCG48xH4bcr8Zp2
    5aIt8+fstCGEyuR+uW9lwYwWEqHJlobu6nGSsydYDnQY/6j09U+/fSOLMoCOoceOBqm0zk
    C8+YPfW1uRbIR5E5y1oTh/rkr00/eFi0YUZLH9TVsQv8Oua0JpSm2TvptpAEVXaWKgkNzH
    ICqZLc7m9daV+Jx7XmOLWnAeY9RCnRtFIscjk3KTGFDLQrVIyNqopmmd4PQIdJMAIAv2qD
    QxDAqUz7AV8yxJ2BzfKT5kBliBO0Ro8P4G5ld/feLIJWh7upvqvsWdmzN2ItyxRWWd1olZ
    RzdhfnBdAkBLCgzHB9ZjjsRfwCy4br8mJkP1iD/heRamtAdBittJm27mVKpg
X-ME-Proxy: <xmx:dsgGa3qixm-2Woc0hNufI3k_57rpg4CbKGTocUoAPBn0yACz18y97w>
    <xmx:dsgGa-yGGtefqyWJA1kpRXIajnh3GadyQse7cyOeWb09MjuW5xSmqg>
    <xmx:dsgGazPUD3lOaqX71ZeFcTeZc-uPXSZkgIRwUrOljnuTVDJK9pwamg>
    <xmx:dsgGa75zoPPeSTi18TDwxoIa8ElFcUSDaPFnkDMO8kuxFepZSC823w>
    <xmx:dsgGa3k83LzwZlbh5xrsV6bsrhZriX4tCG8A025C_-irFy94_7W7q39O>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 25 Nov 2026 12:37:22 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: I/O performance regression between 9.0.2 and 11.1.3 on Xen
Message-ID: <awbIcujrsqYLGS1B@mail-itl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HkaqPo3myGkwPubi"
Content-Disposition: inline
X-purgate-ID: tlsNG-d25034/1795606648-5073FA5B-762C7535/0/0
X-purgate-type: clean
X-purgate-size: 2742
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--HkaqPo3myGkwPubi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:37:22 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: I/O performance regression between 9.0.2 and 11.1.3 on Xen

Hi,

After updating QEMU in a stubdomain on Qubes OS (Xen)[1], I got severe
performance regression. The benchmark I noticed it on is Windows
installation time - the first phase (until first reboot) went from
~7 min up to ~30 min. The version range isn't exactly trivial, but on
the other hand the issue is 100% reliable, so I easily bisected it. The
result:

123acd816dccbd358570ec7ab79c5cb2c863780b is the first bad commit
commit 123acd816dccbd358570ec7ab79c5cb2c863780b
Author: Edgar E. Iglesias <edgar.iglesias@amd.com>
Date:   Mon Apr 29 19:12:42 2024 +0200

    xen: mapcache: Unmap first entries in buckets
   =20
    When invalidating memory ranges, if we happen to hit the first
    entry in a bucket we were never unmapping it. This was harmless
    for foreign mappings but now that we're looking to reuse the
    mapcache for transient grant mappings, we must unmap entries
    when invalidated.
   =20
    Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

 hw/xen/xen-mapcache.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

And indeed, reverting it on top of 11.1.3 fixes the issue. I assume that
page gets mapped and unmapped a lot (for disk I/O?).=20
Let me know if some more information is needed, some logs to collect
maybe? Or a simplified test case?

[1] https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/77

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HkaqPo3myGkwPubi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmsGyHIACgkQ24/THMrX
1yzdOwf7B5Kq+AczMv0z9ygk2CD9DzRyle/A5QEG/cmVOphk7jyB2TahAkIb+xT5
R4Y3Az9ycSE0+jS1HM1V5NI41nLwi3eVyFJwER6bNkbZbHcmT4dbYwe36NveNbPr
ElfZ6qAaZpqfQNrI4JY71E0RbpFm/nobwF7+WZreG4pbI4shUfJ40/1nt7gLjgsa
XvzjxNH0j2KftVi1+OpKhMDgbZfv/CDlwuz33+nLzhh9suiZHAdHIirO+GnSyhY3
ZLSHB1ceyny0vMwweyzXHCAjsDDJF2gFfHmukuhgPrFeke6LXDXkW+MVkfi+EoCG
/kyy1PyEiqfeTBquI3Yt2LiFkXRAHQ==
=Plij
-----END PGP SIGNATURE-----

--HkaqPo3myGkwPubi--

