Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F13EF47CB5
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2026 19:18:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247048.1545952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDM-0004Nf-W8; Thu, 05 Mar 2026 19:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247048.1545952; Thu, 05 Mar 2026 19:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDM-0004NW-Si; Thu, 05 Mar 2026 19:18:28 +0000
Received: by outflank-mailman (input) for mailman id 1247048;
 Thu, 05 Mar 2026 19:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBnC=BF=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyEDM-00048o-5F
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 19:18:28 +0000
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [2607:f8b0:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 160136eb-18c8-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 20:18:27 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so55057095ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 11:18:27 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4d3113e0sm142965715ad.79.2026.03.05.11.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:18:25 -0800 (PST)
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
X-Inumbo-ID: 160136eb-18c8-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738305; x=1773343105; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1/nQgfr9Bh0trNj7y8yRO+57dFcCvGHPGgpaYkXq6U=;
        b=HJdbkhe1wjVAeM7agCKt8K8Dyt6hz6N2q5WGlfh5ra09qoRDIW532Exl+npy6NlsSy
         PyYqlrN1XXbtGY0G/PsQMKsNbKU3ZyCftNP7o8+iCRBd6Sj//dvzBTjF5ChO3Xs36YVs
         J5nDmtiYpY2tE2tkoWtnOHEFnkAa+MGcA1HkpEKZOmrAeGEcXG+6FMwZVtQT3Z0I8lCt
         MTGQrDGYUx2CqTtY51aIhvjDORvabOfVk27ltHR9dikLVfPgeYTJhOtJ2oHuo7vRCTA5
         VkF4nsSNJfv9OhWBwuYb3nSQls5U5CZAv6jEWH0HQeMhnUX85mLo3JzcpkXTAEpBOmaA
         TA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738305; x=1773343105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R1/nQgfr9Bh0trNj7y8yRO+57dFcCvGHPGgpaYkXq6U=;
        b=fAnY12wsSfKh+enJ66gCkxL0nCvs3qZhJjFv0wGbZShv6eUQI+yJymCjmHjiXCycSe
         B0f71Zy3sIruTGlk8xeL6tk4o1O8u3/9HgLaqTk2xBw7HN037f6sHWQ6WToHlCiqCBDO
         FHiVQ2qKK3lDRS536sf19mB5GObptcdOhRgBIxFp15F3126Wz4KQw28ekyGkIREevHvT
         mkGRJBZUq6jeIqwRIxK5gexbq+n04kdXc+cy+KRTbhc9s5tMO/pCoT3g6ORhYjER7C5y
         QWwvONerZAJXWLv5CesD9JshsPW0cNOhhd1IQPuCa2qWX5IOR9+yJKcNSxhSSS2t/0BN
         W07Q==
X-Gm-Message-State: AOJu0YwIGdFrpCGaPkOwAmHyOxIKtAtfS69U9yP/dzcubGCh6sby/3/0
	nEMOe5tUbAdeePqD1vq2HETCZOIL0w5ibK2KTs2mCaRiYmPnOgHatAhEss5jFQ4/
X-Gm-Gg: ATEYQzwOXqemoK7gp5t3NNtiZCDxzl0UQxczI0HI/X+i57+MNUgqdDDliDJI47tN2zR
	yu/h4x59zpszsACObBP5IoNPidc/pnS2UfVLe+KVkimf4TDrsM/Sdxn0SZIC0/3BGGt8HkCploQ
	PWaXymf1d/9WtM58qg/T1iHwXv0p8dmC8ad0YXdgC4Ks8yzzQEpoT+qR0iW6zj4JQxCDEHbP0HH
	9y64Ee5Y5FMDUA3Y2PJI4Ibgv6zb4kI2GGEkFxhCSI3q+sC1jU53Yl/cuVwmw8ZEXQNdSr6z6oD
	sCpcJPQVBqbTL0fOqsWKxYTFNc3NKgO7I6KYKgLWnsGgSKRgLAO3fULn/JX2CL3jUNY6RwIAiJi
	sEfrVEiuZnli/g7kIDVn5P1fD9Q0u55/RT0g1GIRAwBbk9tPlOBUnvww24eKcJ7h2oEnAEcsyI+
	PxflHBJfp0FO9/SEyN3zx7GXmJiuuQor/3v7a8/Y/l6w9NgPWupzLaJbyRLkfhbRi814BqLQB3V
	0C9JzMmygcnVGQ3fMBFJC9frphY+nUrBFxuNPICOlbLmCfbbEotqVdb/nDQRCVsuMj0qahddA==
X-Received: by 2002:a17:903:2a86:b0:2ae:6887:5c13 with SMTP id d9443c01a7336-2ae6ab408dfmr64671365ad.48.1772738305562;
        Thu, 05 Mar 2026 11:18:25 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH 2/3] x86/acpi: Remove BGRT invalidation code
Date: Fri,  6 Mar 2026 00:48:09 +0530
Message-ID: <20260305191810.31033-3-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that BGRT images are preserved during EFI boot (via
EfiACPIReclaimMemory allocation), the invalidation code in
acpi_parse_bgrt() is no longer needed. The BGRT table remains
valid throughout boot.

This removes the code that was marking BGRT invalid when the
image memory was detected as unavailable, which was causing
ACPI warnings in Linux dom0.

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/acpi/boot.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 1ca2360e00..fc88b559e6 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -327,27 +327,6 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
 	return 0;
 }

-static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
-{
-	struct acpi_table_bgrt *bgrt_tbl =
-		container_of(table, struct acpi_table_bgrt, header);
-
-	if (table->length < sizeof(*bgrt_tbl))
-		return -1;
-
-	if (bgrt_tbl->version == 1 && bgrt_tbl->image_address
-	    && !page_is_ram_type(PFN_DOWN(bgrt_tbl->image_address),
-				 RAM_TYPE_CONVENTIONAL))
-		return 0;
-
-	printk(KERN_INFO PREFIX "BGRT: invalidating v%d image at %#"PRIx64"\n",
-	       bgrt_tbl->version, bgrt_tbl->image_address);
-	bgrt_tbl->image_address = 0;
-	bgrt_tbl->status &= ~1;
-
-	return 0;
-}
-
 #define acpi_fadt_copy_address(dst, src, len) do {			\
 	if (fadt->header.revision >= FADT2_REVISION_ID &&		\
 	    fadt->header.length >= ACPI_FADT_V2_SIZE)			\
@@ -752,7 +731,5 @@ int __init acpi_boot_init(void)

 	acpi_hest_init();

-	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
-
 	return 0;
 }
--
2.53.0


