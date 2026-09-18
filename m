Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD106C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 11:40:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425181.1649283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Wws-0000Eb-NU; Fri, 18 Sep 2026 11:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425181.1649283; Fri, 18 Sep 2026 11:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Wws-0000EU-Kf; Fri, 18 Sep 2026 11:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1425181;
 Fri, 18 Sep 2026 11:40:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterx@redhat.com>) id 1x7Wwr-0000EA-LI
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:40:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Wwr-00CBMm-1x
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:40:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterx@redhat.com>)
 id 6aad2314-2eae-0a2a0a5409dd-0a2a4503d444-24
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:40:08 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterx@redhat.com>)
 id 6aad2317-fae8-0a2a45030019-aa0a857c7833-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:40:08 +0200
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-RljFhzjcNa6PdeDGbFls5A-1; Fri, 18 Sep 2026 07:40:06 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-530d028f779so7419361cf.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 04:40:05 -0700 (PDT)
Received: from localhost
 (bras-vprn-aurron9134w-lp130-03-174-91-117-74.dsl.bell.ca. [174.91.117.74])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532a19a4fa5sm11367371cf.13.2026.09.18.04.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:40:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:content-type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789731607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NkBLN6iytHxigslhO22YLF7Mj8QQdsoSIRTOupiudCQ=;
	b=BIGwUnQS4CreXwhsunC/+t8/4d28AItgbLMQ6KlnyYKtxgHr5METY5Pv7OX1cVshcan/3p
	lwMBOUweCSu+/jUcC1UhM3IRNbeIOsmPRlgHSIib45sp0EEHjp2dHVZXl8lxBBdiuI6+rA
	shP2o6IQWdamJhmgzD/Pv/K5xWhirfI=
X-MC-Unique: RljFhzjcNa6PdeDGbFls5A-1
X-Mimecast-MFC-AGG-ID: RljFhzjcNa6PdeDGbFls5A_1789731605
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731605; x=1790336405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkBLN6iytHxigslhO22YLF7Mj8QQdsoSIRTOupiudCQ=;
        b=UiTRPxJbgvORnmq8bZ+WJStkwKRsVe6/YaU/FdqaXrL8h8ERIZCRYjrDjspacT1Cs8
         4bC9saVz3Y49eXHz4M6eZhRw8QiCzOQM3up2zBK/u4OGTC9DH7gZ3XlGO1++nuyfvcza
         I9bOs0c8WAYJOhLmBm8eUARlBozNWFAOTZb57I3bm0YYAANKQYDiDuPd/qniWukJA5DM
         iYuLNveu4bMyBIenoB7qa0PXSQ9R9cjzH070raeDMSrO1mz4iYQvXSi+HQsXZHJZNr8S
         zQrTLYhm4AZUKsnQUBtUVwqK+4pcTx+b/eQNlmK6az+K0Sffll830d5xODN3gyeV96+6
         dP8A==
X-Forwarded-Encrypted: i=1; AKwUvBx3Hnto0XTCZSb2SIPT3sQ4UwJreTCnZq1aFAMvTnCoxfqx8NbMcBIQzRYi5DU3/Sc5rW52Qq5cAgs=@lists.xenproject.org
X-Gm-Message-State: AFuF++kg/JUwbzc0J8DX0/vT/ylz5JjjhWcEBvBrbGeppuBwHaLWKm7n
	0szf/o/yyun0kbB2ocDAdA8SOM7yTY4tjKxwknEk33LVBLQ0duyOY/piJPHRH0PwDT5q3yxoqFF
	JjPdn8UAtmHYisqRcibOT5Z8Yh2OJGFwwsp+1BOG8eyxv8Y8KZsK9plAlMW1OBfMznSFs
X-Gm-Gg: AYBFou3ufbauND5NNKOy+GuoZz64hDcxHRaId64MTyXOgbGcx19tx3B71j49lG2NWOq
	KL2Ccgh9vmh/tu1/GoOKHvPDp25eJln+SYpvV9qJMvMV4yLL80MhUcgUtF/njhSaeDxR52MeI5p
	bctkAzVb2RH0SZ/O957TQMGLWWenscdKdGG/fBsXTZAt7qHbPwgmNRt7DL3S62MyU9ANhNvYkdV
	prJp+WWVX+fofTTH16ch3PlDdm1+w58L+5A5aHJcn2Z8f1zT9nhg6TnY6O0eH4j7K4M/MerSEv4
	pLis4HNHuzwTrhxH2P0fOEZJ237v20NpluaN3MLM3Aep0lAtElf8QhWoLRHKuSucHHo/RAAW+tN
	86wJvvdbsDmuj900KJPijaxKpWci0QNTRs+kVX3UOr77h+GvySdJisylEuF8=
X-Received: by 2002:ac8:5dd2:0:b0:531:214b:42b with SMTP id d75a77b69052e-5329e48fed1mr32543671cf.40.1789731605274;
        Fri, 18 Sep 2026 04:40:05 -0700 (PDT)
X-Received: by 2002:ac8:5dd2:0:b0:531:214b:42b with SMTP id d75a77b69052e-5329e48fed1mr32543271cf.40.1789731604756;
        Fri, 18 Sep 2026 04:40:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 04/11] xen-mapcache: Remove 32bit support
Date: Fri, 18 Sep 2026 07:39:19 -0400
Message-ID: <20260918113926.831204-5-peterx@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113926.831204-1-peterx@redhat.com>
References: <20260918113926.831204-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rpY_kR2O1po8q49keBN0pdJ7V3BaLDxszMYA40eNPtY_1789731605
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-purgate-ID: tlsNG-33051d/1789731608-6ECCB4E9-C9A000B8/0/0
X-purgate-type: clean
X-purgate-size: 1444

QEMU has switched to 64bit-only hosts for all system emulations.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Link: https://lore.kernel.org/r/20260818172012.3052821-5-peterx@redhat.com
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/xen/xen-mapcache.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 85cf0cf359..e30c07c2ee 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -26,11 +26,7 @@
 #include <xenevtchn.h>
 #include <xengnttab.h>
 
-#if HOST_LONG_BITS == 32
-#  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
-#else
-#  define MCACHE_MAX_SIZE     (1UL<<35) /* 32GB Cap */
-#endif
+#define MCACHE_MAX_SIZE     (1UL << 35) /* 32GB Cap */
 
 /* This is the size of the virtual address space reserve to QEMU that will not
  * be use by MapCache.
@@ -151,11 +147,7 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
         exit(EXIT_FAILURE);
     }
 
-    if (HOST_LONG_BITS == 32) {
-        bucket_shift = 16;
-    } else {
-        bucket_shift = 20;
-    }
+    bucket_shift = 20;
 
     if (geteuid() == 0) {
         rlimit_as.rlim_cur = RLIM_INFINITY;
-- 
2.55.0


