Return-Path: <SRS0=JVsS=MF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E56C11F66
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 18:06:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808B661374
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 18:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808B661374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155538.287124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnV-000332-Hz; Tue, 13 Jul 2021 18:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155538.287124; Tue, 13 Jul 2021 18:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MnV-00032r-Et; Tue, 13 Jul 2021 18:06:21 +0000
Received: by outflank-mailman (input) for mailman id 155538;
 Tue, 13 Jul 2021 18:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MnT-0002UL-Fo
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:19 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b883459d-473c-4d3c-a22e-a01fa3628ede;
 Tue, 13 Jul 2021 18:06:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6CtAk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:12 +0200 (CEST)
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
X-Inumbo-ID: b883459d-473c-4d3c-a22e-a01fa3628ede
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199572;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4WYZHRcGpgtt0AApxzyOy4HkByS6ppN/3uviqFvGNT0=;
    b=gtSK6ABErb1YI8s+5/58wut9xJISpnDjs25U6sS+QGQDeyPNXkZ2MM7VY3ekmJt/uC
    22VYTQ7goGuzoXZTubM2lITtegcQrARH5NGJjB4y2OZRCzsvWozHG1MrMkNzEvkhaYZG
    nAhHQb6CquW7HEh+HiwJ+9u0UaT9AF7pOuOJ34r94KSsnCq8YK2mN7zXNrh8abNFPP/l
    j1iLhqTykQ0MSmpJRpVgFUzDOC5kgKb2EkgXmb3E9bqg2mQ0LOU0/XygzaaTQj/hnmDz
    gtG/FG+CGug5iv5YyOxWtbDwXjTFlgsmULXQDowbOx9qUkpuFfLABMmSiqlAguK0hHFM
    lGdg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 03/31] tools: add API to work with sevaral bits at once
Date: Tue, 13 Jul 2021 20:05:37 +0200
Message-Id: <20210713180605.12096-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new API to test if a fixed number of bits is clear or set,
and clear or set them all at once.

The caller has to make sure the input bitnumber is a multiple of BITS_PER_LONG.

This API avoids the loop over each bit in a known range just to see
if all of them are either clear or set.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v02:
- change return type from int to bool (jgross)
---
 tools/libs/ctrl/xc_bitops.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index f0bac4a071..8e8c6efb45 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -3,6 +3,7 @@
 
 /* bitmap operations for single threaded access */
 
+#include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
 
@@ -77,4 +78,31 @@ static inline void bitmap_or(void *_dst, const void *_other,
         dst[i] |= other[i];
 }
 
+static inline bool test_bit_long_set(unsigned long nr_base, const void *_addr)
+{
+    const unsigned long *addr = _addr;
+    unsigned long val = addr[nr_base / BITS_PER_LONG];
+
+    return val == ~0;
+}
+
+static inline bool test_bit_long_clear(unsigned long nr_base, const void *_addr)
+{
+    const unsigned long *addr = _addr;
+    unsigned long val = addr[nr_base / BITS_PER_LONG];
+
+    return val == 0;
+}
+
+static inline void clear_bit_long(unsigned long nr_base, void *_addr)
+{
+    unsigned long *addr = _addr;
+    addr[nr_base / BITS_PER_LONG] = 0;
+}
+
+static inline void set_bit_long(unsigned long nr_base, void *_addr)
+{
+    unsigned long *addr = _addr;
+    addr[nr_base / BITS_PER_LONG] = ~0;
+}
 #endif  /* XC_BITOPS_H */

