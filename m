Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA4606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzQBRbVz
Received: from list by lists.xenproject.org with outflank-mailman.1502840.1698747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWKDm-0002ab-0I; Wed, 25 Nov 2026 21:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502840.1698747; Wed, 25 Nov 2026 21:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWKDl-0002aU-TN; Wed, 25 Nov 2026 21:08:05 +0000
Received: by outflank-mailman (input) for mailman id 1502840;
 Wed, 25 Nov 2026 21:08:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xWKDl-0002aO-7L
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 21:08:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWKDk-00EPpA-DF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 22:08:04 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6b074e21-2eae-0a2a0a5409dd-0a2a45048a48-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 22:08:04 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6b074e34-b57f-0a2a45040019-d155dd29b905-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 22:08:04 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-491846221ffso5406223f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:08:04 -0800 (PST)
Received: from ws-fedora.tail006fee.ts.net ([139.47.58.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa397asm37017630f8f.48.2026.11.25.13.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 13:08:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795640884; x=1796245684; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1MawNlSam8zSbb7cg5w2x3Obanm5Mr+hbGCyovO3G4=;
        b=zzQBRbVz+Iyc5HfvCDPa6ehAUTqU4r2COvtLX+U60dPOuAE9HNOxvzkX4qKkVkrdln
         Db+TYcL62M6Zml69MI6HVbVY9ufgIHxg3GX66QiahuFaZ3TMlpvM3d/FGx/Uf4wy6tqr
         AsUBFl8B7JWXIP/6fD4Nbi+VoQPvVHLQW+cnY1S/2PKOTEhQMAfUPuCY79l9iFqXtwww
         BSeyhSjuZ4F73x72WWxCTk8kIZCkg9oHIQLTsmWbcaOXNIBmKkLd7JjVEomO6agUEi+A
         Bqx9lCsvuTLUW1aYPqlLJO/VnxmyZHXV2bFlCB2VyfsT11Y9jalF45q30kA3ZsKGODqO
         v1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640884; x=1796245684;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f1MawNlSam8zSbb7cg5w2x3Obanm5Mr+hbGCyovO3G4=;
        b=oeRHgT3rObApHugDDHDC5NSseBwuCWJUls/qJTd1lU8GnP7mh20nGuzjDgcTi7X1tU
         sEZ5JW0Esw7onUCGtqNIm1qul3CLmmM7TYCbcNBUwTiWJNbKkcq8uPL9AUgzcETe8ibB
         bKEjG86U71W+DSzRjyd7taIVbAalgSlZEu58NNIZ0sQqUYe4iW398LR+JnskzusPeDDt
         hqnBQskynddlq76c+7fqlCUIz4wueseluopaxRkOCeZtooJTimp5DVVSNDCwFMIzjw+j
         U9Y+/pxB1pQRDHsq9VAtsYnEyFk9YM8aeK5OCM0KVNsp9xlIeiEZZ96T7svSwbFkKVcQ
         SZ7A==
X-Gm-Message-State: APuU4Z8DKAluXC8Q3rixWUYmdzklVDUGdt3qjmCO7Ed+uGOEYt94TdVd
	EHdR8QOkb2x9yTubqG5vU2zYkMFO5+wyiMlMd3LUCpDakUR3p2kB8HuSVf2iMPre
X-Gm-Gg: AZFdTZf85H0k6mdVATj6s3JpoH+0DwIyiEkrqrM0O9jtAc38/Bv8M3VRetul6bwU+H9
	vD5tHc8DAwS5pT1DnX5en46+XCodVWLYB8uzLyvVTXE/IkyRvAKzJl3R2VFx4zALQUya3pakPgG
	z3j89T+MT5z4eY0ZY33X7/UVTulPNp+Dxl4A/eo3tEE43belicDggSXZSXY4NVeaVV1OptLq7Mg
	WOLLvtRVk4YbN5uNDmcCXF1J260ChX4gC92IzZ85y5BLlCtSHVlYWmlES+rfYIcs0c4NqF1YMJ6
	dOJtG29S8Dx7SYQYB/RR3d3P71l3rxuVrmxQH+CYwwpj0DWymNe58d5cUZXlSpb9M2UzYUo8kCT
	QWzWn4E5Jeoo1Oqf9RhvpQYNf/9zuO6rMogNYU1/918UukjQR1pJk9rfnQGRIBSlcYnSO7GnWRE
	IhyeUuOvRwDw3c82BXUM3QAx6L7fZRJyBCaIcJITi12WaiuRi0jGEcOR7/BZ2lGV9/kG7VrDHCd
	+eLRbmdTKDy27939B3y2qQ9reP1CyIajXslny1IRLPzYuqiTkQAsLhxICv7xb68d+88d5YIUF1n
	SIJjZatoSS3p7KaxZMG3dy9K4LNPauG/fbWPWDecW13VHECYFbuqLW49vetoTnFfgsGmiy07
X-Received: by 2002:a05:6000:290d:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4abaac57d04mr42463953f8f.7.1795640883721;
        Wed, 25 Nov 2026 13:08:03 -0800 (PST)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	julien@xen.org,
	bertrand.marquis@arm.com,
	sstabellini@kernel.org,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v5] xen/arm: validate non-common page-table ranges
Date: Wed, 25 Nov 2026 22:06:23 +0100
Message-ID: <20261125210623.69098-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1795640884-C3EC6B50-FFB3D060/0/0
X-purgate-type: clean
X-purgate-size: 2435
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On arm32, all the Xen mappings are common to all the CPUs, except for the
domheap mapping, which is per-CPU.

The xen_pt_update function assumed that only the common mappings would be
modified, but did not check this assumption.

Add a check to reject modifications to the domheap mapping.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
v5:
 - Moved the check back to pt.c under #ifdef CONFIG_ARM_32.
 - Only check the domheap area.
 - Added a comment explaining why only Arm32 needs it.

v4:
 - Rebased onto staging (v3 was diffed against v2).

v3:
 - Dropped accidentally tracked patch file from commit.

v2:
- Inverted polarity of xen_pt_range_is_non_common() as suggested.
- Moved xen_pt_range_is_common() implementation to arch-specific headers
(arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
IS_ENABLED() for DCE, but ARM64 lacks definitions for
DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
- Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
---
 xen/arch/arm/mmu/pt.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 81fe121..b463c85 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -13,6 +13,7 @@
 
 #include <asm/current.h>
 #include <asm/fixmap.h>
+#include <asm/mmu/layout.h>
 
 #ifdef NDEBUG
 static inline void
@@ -601,14 +602,21 @@ static int xen_pt_update(unsigned long virt,
     unsigned long vfn = virt >> PAGE_SHIFT;
     unsigned long left = nr_mfns;
 
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
+
+#ifdef CONFIG_ARM_32
     /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
-     *
-     * XXX: Add a check.
+     * Only Arm32 needs this check, as updating the domheap mapping here
+     * would only affect the current CPU. On Arm64, all the CPUs share the
+     * same page-tables.
      */
-    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
+    if ( virt >= DOMHEAP_VIRT_START ||
+         nr_mfns * PAGE_SIZE > DOMHEAP_VIRT_START - virt )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+#endif
 
     if ( flags_has_rwx(flags) )
     {
-- 
2.56.0


