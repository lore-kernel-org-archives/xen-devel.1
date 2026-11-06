Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E975A606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=fc0Ve2Zb
Received: from list by lists.xenproject.org with outflank-mailman.1476313.1682460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0f-0007My-JN; Fri, 06 Nov 2026 08:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476313.1682460; Fri, 06 Nov 2026 08:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0f-0007Mr-GR; Fri, 06 Nov 2026 08:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1476313;
 Fri, 06 Nov 2026 08:09:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xPF0e-0007MX-LC
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:09:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPF0e-000tHV-1e
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:09:16 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b2a-8faa-0a2a0a5109dd-0a2a4509b500-4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:16 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b2b-be1a-0a2a45090019-d155dd33c02d-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:16 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so194971f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:09:15 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492ff85585esm1534507f8f.5.2026.11.06.00.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:09:14 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793952555; x=1794557355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRraAnsdRi1Ln76teebfsxImy84+5j63KoqKWqZx2lA=;
        b=fc0Ve2Zbi8PeHNvfcym1N+7QkOKBhkl+mAAp2xvZR9931YFM+klJWIDfR00XdDtzaT
         YsDg8GajtnYsUcdVvj8OqiGBO/jCaw1485oaco4GNfuFEVrXEC/2nfMMpGxDYL2dDbES
         Twn+CtlUkh/ih7d+BKBP5NQe8a8UYfy3wlnxyf4pi/J1r+sN0HXA9o95e6GkZp014n50
         SVa/HndDDGSyk3kPdiIkHCp2kecXx762eFD8fz9JOjNzd9jP3uHv64Ypw/J8gjumk1mn
         vTQEJXUHO39Eh7734DkW7RtT0HBOTAXsabpdwTDYBv3RY5/bSD0yAQliOOKyT4Tcj/jm
         veEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952555; x=1794557355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRraAnsdRi1Ln76teebfsxImy84+5j63KoqKWqZx2lA=;
        b=JpJiDprcd4QZLlarePNJs+5Yc/JZ0ICrgtF+ATnZIoi8vQFVCEjJccTFfG86qXuaYN
         B5hHOai4LdLgurH3qLe47MIScTXVYjAU6bInSqZj0D57LKkDhQqkMOMQ7FL7BgLyfLha
         K3Ap/MIAT8x0LDVbNtZaqE8eYuadDJfC0YoD+biW0tVkaMRpAzwQVveWlkkyHJ4d4fbc
         l8A9Tvf7bWMNnmBfj0xOGTeqFS+D2a6tv86fUo58jaavjqLqSddaOXmu+CMx488NS8ta
         0p8TD22lId9sJBIbr1BFSJldXAIMYYyp/O1m/9JCfWPTAYg8DhRBA3O+XRlHAZQUqMQt
         av0A==
X-Gm-Message-State: APuU4Z+Yb0lC78Ux3ayAt0sBGx9S4/0YiETSk5d2S484MCBltc9f35ee
	9w7nzovxqu0o5rPlv6fGnklWb5wEJtNv28Wxhuer6hvbD4ZP//B1oCvEBTE7rhPrDbzQ+9y8Y7Z
	sPHUQGOE=
X-Gm-Gg: AYBFou3POQguwUu5F48oynJj6NFgVp+ykkYUaWc4Y42qHkS+oO3Q/inLsi+rvBYBkzs
	D0BPbKi+gtNd5hItjCOE8Exnlh39Yo6cKhpiMPwXLp8tIAXfh4sVDNx2X2F3FMAQJ4DtDC+6eqq
	MfSAYD0LlzqUnfuR5Uh67CQATOIZ7cb3/nUpYhxpcBvHCHNTwGo8UCwyY9Yocm2BKEUdYI9R2qV
	N9eV5qvlWeTvgYnV7ebcwDZhaTPC0A3pprcEyBxRUL7Yt1BKvIdW9ZiQQk6RJa5KiNeAbWtxsry
	3uGQ+RY6UoPGYemXMKixNXb8OyWdYbVPb8f0WwwzFgcy7wWbVdmN9rQc5gWAj72aHLVp9DOtYJb
	egWkOQEHzlqwg36WD+6ZtMIPi2UQaEqxhguWqhLc5e8sVnyF2F/WSNuf3+M19WmtEFcJiOvfNHU
	htD9QuFo1qW6XZq5AWkBnA6fcHOodsHQGSPh2CZVtBDHoP3UrRxg5iMZpduX5erNTrh6vKcjdHJ
	+WuBAs+TuSPdlziPcoARJoG8TKKSFN0eLWVHnGkPmp0C1QvNfm8r7mq3iRJzOe5wGt6pMrnVNnJ
	SkqdOQ1QyFddf0hmmuqCzomrAw==
X-Received: by 2002:a05:6000:4819:b0:48e:75a1:1e38 with SMTP id ffacd0b85a97d-492784555f4mr3482395f8f.56.1793952555402;
        Fri, 06 Nov 2026 00:09:15 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/4] VT-d: round IOTLB flush ranges up to an aligned power of two
Date: Fri,  6 Nov 2026 09:08:51 +0100
Message-ID: <20261106080859.2285309-2-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106080859.2285309-1-luca@edera.dev>
References: <20261106080859.2285309-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793952556-3AAD8034-83FEFFB8/0/0
X-purgate-type: clean
X-purgate-size: 1356
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Page-selective invalidation takes only aligned power-of-two ranges, so
iommu_flush_iotlb() flushes any other range as the whole domain. A
later patch flushes one range per group of grant unmaps, which rarely
has that shape.

Round the range up to the smallest aligned power of two covering it.
Orders the IOMMU doesn't support still get a domain-selective flush,
and device TLB invalidations use the same range.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>

---
Changes in v2:
- New patch, taking the rounding out of the grant unmap batch (Teddy).
---
 xen/drivers/passthrough/vtd/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index b41a1d41c8..faf8255f26 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -742,6 +742,10 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
     {
         ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
         ASSERT(flush_flags);
+
+        /* PSI takes only aligned powers of two: cover the range with one. */
+        page_count = 1UL << flsl(dfn_x(dfn) ^ (dfn_x(dfn) + page_count - 1));
+        dfn = _dfn(dfn_x(dfn) & ~(page_count - 1));
     }
 
     /*
-- 
2.47.3


