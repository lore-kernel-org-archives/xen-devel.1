Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9A606EF34
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=GUsQ6se2
Received: from list by lists.xenproject.org with outflank-mailman.1505172.1700061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwtm-00027I-Ry; Fri, 27 Nov 2026 14:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505172.1700061; Fri, 27 Nov 2026 14:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwtm-00027B-Of; Fri, 27 Nov 2026 14:26:02 +0000
Received: by outflank-mailman (input) for mailman id 1505172;
 Fri, 27 Nov 2026 14:26:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d660b520004767@swg.vates.tech>)
 id 1xWwtl-000275-Pw
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:26:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWwtk-00CAV2-O6
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:26:00 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d660b520004767@swg.vates.tech>)
 id 6b0992e1-8faa-0a2a0a5109dd-0a2a4501b37c-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:26:00 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d660b520004767@swg.vates.tech>)
 id 6b0992f8-5bcc-0a2a45010019-b9ff1c22a947-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:26:00 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d660b520004767.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 14:25:56 +0000
Received: from localhost.localdomain (82-67-99-167.subs.proxad.net
 [82.67.99.167]) (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8759580891;
 Fri, 27 Nov 2026 15:25:55 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=pbFNGEjWkEqvrYbfPy9yzlMLyip0TRtUsDm/b7zS/bg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GUsQ6se2eEPsVnpxigXzngnj6vYBzjEAc4PfC0IaStmg85B+em7ZKlTG8Zvfhx7cNGsEbU/bu
 T5YKbl6CbV6c/TyjiRjnVIFrjuFfMyqu/qogB4oRdPdS3cCVUvMFHiiYREVaxyRpYeEOFmt+CBd
 q0SlcV7Z2a2lSzF96y6Kvbm+n4eU3pdkEGOpP3TwzxqI/Nb9aaZbLELSAvt//Jp/9L0J7EXAB6J
 JZEs8uTp19+agxTFjqsdW7jtybgzS18hDWO4aWMntSgPjZpGXPXSEm9yjkz3RI4UKUDDfWUMYJ5
 67EbZSypezAK7FERl/rA0z1jh5ZmY2ViEM3jnAeKb1yg==
X-Zone-Loop: 39bc06b65b6a1331b1856706d2c4a24f9ccd510fa671
x-campaign-type: default
x-transaction-id: ac2b72a2-cdf8-442e-ab0f-3b8726b1daf3
x-swg-uid: 01-7018c679-f689-4c9c-819d-99d4c2409fbc
X-Mailer: Sweego
Message-ID:
 <1795789556.8631fc262581453bbf619ec5b2062170.1a21d660b520004767@vates.tech>
x-swg-bid: 1795789556.8631fc262581453bbf619ec5b2062170.1a21d660b520004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] libxl: wait for QEMU exit before restarting a
 domain
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Penny Zheng <penny.zheng@amd.com>
In-Reply-To: <20261116064658.980330-1-Zhao.Jiaqing@amd.com>
References: <20261116064658.980330-1-Zhao.Jiaqing@amd.com>
Date: Fri, 27 Nov 2026 15:25:50 +0100
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.200.fe8c60ff14c11e43.1a21d660825.296ce4ee684c52cf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795789555749
X-purgate-ID: tlsNG-d62444/1795789560-BC4E75FD-709051B6/0/0
X-purgate-type: clean
X-purgate-size: 1012
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.200.fe8c60ff14c11e43.1a21d660825.296ce4ee684c52cf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jiaqing,

On Mon, 16 Nov 2026 14:46:57 +0800, Jiaqing Zhao <Zhao=2EJiaqing@amd=2Ecom=
> wrote:
> The PID-based device model destruction path returns immediately after
> sending SIGHUP, before QEMU has necessarily exited=2E When an HVM guest
> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
> port because the old process still holds it=2E
>=20
> Wait for QEMU to exit in a child process after signaling it for at most
> 60 seconds=2E If waiting fails or times out, log the error and retain th=
e
> existing domain destruction behaviour=2E
>=20
> [=2E=2E=2E]

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.200.fe8c60ff14c11e43.1a21d660825.296ce4ee684c52cf=---

