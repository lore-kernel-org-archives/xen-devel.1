Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA8606A333
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=JmD1+RW/
Received: from list by lists.xenproject.org with outflank-mailman.1464918.1675853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSS6-0004N7-6j; Thu, 29 Oct 2026 15:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464918.1675853; Thu, 29 Oct 2026 15:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSS6-0004N0-2O; Thu, 29 Oct 2026 15:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1464918;
 Thu, 29 Oct 2026 15:54:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1885e42e1000f79f@swg.vates.tech>)
 id 1xMSS5-0004Mu-Kt
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:54:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMSS4-00Euja-UU
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:54:04 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1885e42e1000f79f@swg.vates.tech>)
 id 6ae36bfd-8faa-0a2a0a5109dd-0a2a4502e680-48
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:54:04 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1885e42e1000f79f@swg.vates.tech>)
 id 6ae36c1c-6ca4-0a2a45020019-b9ff1c2385af-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:54:04 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1885e42e1000f79f.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 15:54:01 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9D52183212;
 Thu, 29 Oct 2026 16:54:00 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=5EN3g4eSq9t2R26JbFIwREzN/mlROd8whpSwM9ewidQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=JmD1+RW/mQqxArLVZ/igF2aoVjxbFWpPtZBjrD7uGEr5Ap9XihCibJnDagb8NQW8oOKsIR2g+
 WJXI4cM7CQDnfJJMzINj6Nt/6PZXdN9af1yCXsuBz80Rc6OQIIpNq46l1PEm5XHXxCci/TGvFV7
 ynGyYWvcx9BWzjTHPo2yxfClN+HtfL6p92yrLjJLGdmquPdlxbQpN2IZZe+af9QjAKInJnittL0
 92Dp+hKJGxHnDM87+mgy/72dFeb/fqzagxzLiQFSGtzFeCx7cQ30+9A0qS/JSF1020LxTOTzX9d
 +h3BSsWul7Ttf/+a+mSli5lMvYbQDalrKL44+SzkUiqg==
X-Zone-Loop: 83320cd67f0472e6071d55278b3be32d0324810c584a
x-campaign-type: default
x-transaction-id: 233a624e-97cb-4be8-85ed-50a4e803b0dc
x-swg-uid: 01-5e64bc01-88e5-4178-a10d-09283474c89b
X-Mailer: Sweego
Message-ID:
 <1793289241.8631fc262581453bbf619ec5b2062170.1a1885e42e1000f79f@vates.tech>
x-swg-bid: 1793289241.8631fc262581453bbf619ec5b2062170.1a1885e42e1000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] Add a QTB container to run the Xen riscv64
 tests
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1793183387.8631fc262581453bbf619ec5b2062170.1a1820f0ebb000f79f@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@vates.tech>
 <846f2ec6-da73-4f12-b46f-5e9f841e35ad@gmail.com>
 <1793183387.8631fc262581453bbf619ec5b2062170.1a1820f0ebb000f79f@vates.tech>
Date: Thu, 29 Oct 2026 16:53:54 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793289234; l=1020;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=TpS0kwmVGyAMREpXKkM9XXoS2RsXmZGzw1xGuxkXm80=;
 b=VsGARp1pXgB23sRA2CN1srJQ61nbcr9GFfmpZRViu9U/Pk0Gu8NGz29VLm4c+BMZG17UFyH2u
 rPxRGZW10XlDbYr9RKCDo49uBYEOTAuufcaxavvXcF+84zoQUD8KE2x
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793289240797
X-purgate-ID: tlsNG-720697/1793289244-31FD62AC-80FF3A96/0/0
X-purgate-type: clean
X-purgate-size: 1020
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 11:29 +0100, Anthony PERARD wrote:
> [ ... 17 lines skipped ... ]
> > Having it as automation/build/debian/13-qtb-riscv64.dockerfile in
> > xen.git would keep the container next to its only user, avoid the new
> > ARTIFACTS_REGISTRY variable and the image: override in patch 6, and
> > drop the "must land first" ordering between two repositories.
> 
> Indeed, the new container would fit better in the `xen.git` tree.
> 
> And can you rename the container? I think the format is
> "$distrib/$release-$arch-$comments"
I'd rather keep riscv64 as the $arch part. The existing
debian/12-riscv64.dockerfile and debian/13-riscv64.dockerfile are also
built with --platform=linux/amd64, yet they are named after the arch they
target, not the one they run on. Naming this one x86_64 would break that
convention.

Following "$distrib/$release-$arch-$comments", how about
debian/13-riscv64-qtb.dockerfile (and the debian:13-riscv64-qtb image)?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

