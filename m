Return-Path: <SRS0=ERFX=CN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BB3C433E2
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 21:12:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D262087C
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 21:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kh2E3pFR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D262087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEIzw-00044h-Qm; Fri, 04 Sep 2020 21:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJ5a=CN=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1kEIzw-00044c-5G
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 21:11:52 +0000
X-Inumbo-ID: bf6c73fe-3394-4bd5-a4e7-9a533994c092
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf6c73fe-3394-4bd5-a4e7-9a533994c092;
 Fri, 04 Sep 2020 21:11:51 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y2so4529539lfy.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 14:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=//KXuylVvthkDJr5aVQkUH3yamZO89ultIey67juH/k=;
 b=kh2E3pFRqSejH/ZqsyUyLkjTHTADLExdRzlhCqHGP01HatEp9cQsJv7y7cBFHwUcgC
 14ynFwVxuastsGnWYMwHcGJEgaG25NKGS1hC8K9nRwDyfqZCiovpr4zr+cA4kotjWmAS
 1UFhlnRaFWqFHeonaeIB61T9mQNwYdq7SGxJnt8gqxCVkUI8I9cAOeSv7D2R6qmgPgeT
 bmsMvf4wGSqD0u1rIWGEaxDVvvxKMc9HcS5Aiu1l8w/fvjziZk56FNQGq2ege+KRkkG6
 F6ippZXwLVejGo9uLjyr3mNbQoQzts0+uQe9pEJsNv89F5EoylyCjxyjf9gU1QTpffUq
 8BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=//KXuylVvthkDJr5aVQkUH3yamZO89ultIey67juH/k=;
 b=Pzryi5ilWk8B4DOCIsSKSE5EOdZr8oxOHM68vgX9BnKfEQ7r8isdqC/QXVitcpu2Wn
 PQ2XfyzRzOTilNNw2W/13y4SltsZ/QdYzwjGS2QHDqFQ8WfA8G4OfvQT2knCMc0Qm07p
 3ghuRPr9wH4xSvezmm7L45lg+mDDu8/ZDsB9vEE6e28bXrCDRmjQaD8kszh0A36S1dgn
 njIfnRYJbjciVE6YD4IdZTw84hShkm1LXSuwLbPGG4b/JncwQNHIJuZl/k6XmOKOk8dY
 hp4A2yB8zkHo3gLg5MTK6bF36n346BkbghBVxYBmnDO/mf99LNHibFrCc2BBDQ9836Es
 f22w==
X-Gm-Message-State: AOAM531MuLBAFFh+ndeEYgsce32NRFPjGgCYFO9ANPKIUcZ8W5ysB06X
 eNzQn6PNemz9VeVTSUbusrdUuPv+dKGE6g==
X-Google-Smtp-Source: ABdhPJytt+h7hUnNAlIjXGn1gnOAiIeAJVkciJ+Tfud5YBvXrahetapMuG51DPHMdd4fXhOjHcFtUA==
X-Received: by 2002:a19:42c4:: with SMTP id p187mr4703915lfa.149.1599253909658; 
 Fri, 04 Sep 2020 14:11:49 -0700 (PDT)
Received: from PRECISION-M4800.localdomain (109-252-108-19.nat.spd-mgts.ru.
 [109.252.108.19])
 by smtp.googlemail.com with ESMTPSA id n8sm721542lji.1.2020.09.04.14.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 14:11:48 -0700 (PDT)
From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Sergey Temerkhanov <s.temerkhanov@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
Date: Sat,  5 Sep 2020 00:11:40 +0300
Message-Id: <20200904211140.9875-1-s.temerkhanov@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This helps overcome problems observed with some UEFI implementations
which don't set the Attributes field in memery descriptors properly

Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
---
 xen/common/efi/boot.c    | 19 ++++++++++++++++++-
 xen/include/efi/efidef.h |  3 +++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5a520bf21d..05cfbf4de0 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1100,7 +1100,9 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     {
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
 
-        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
+        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
+              desc->Type == EfiRuntimeServicesCode  ||
+              desc->Type == EfiRuntimeServicesData )
             desc->VirtualStart = desc->PhysicalStart;
         else
             desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
@@ -1510,6 +1512,21 @@ void __init efi_init_memory(void)
                desc->PhysicalStart, desc->PhysicalStart + len - 1,
                desc->Type, desc->Attribute);
 
+        if (efi_enabled(EFI_RS) &&
+             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
+                (desc->Type == EfiRuntimeServicesCode ||
+                 desc->Type == EfiRuntimeServicesData))) {
+            printk(XENLOG_WARNING "Fixing memory attributes for area %013"
+                                   PRIx64 "-%013" PRIx64 "\n",
+                   desc->PhysicalStart, desc->PhysicalStart + len - 1);
+            desc->Attribute |= EFI_MEMORY_RUNTIME;
+            if ( !(desc->Attribute & EFI_MEMORY_CACHEABILITY_MASK) ) {
+                desc->Attribute |= (desc->Type == EfiRuntimeServicesCode) &&
+                                   (efi_bs_revision >= EFI_REVISION(2, 5)) ?
+                                        EFI_MEMORY_WP : EFI_MEMORY_UC;
+            }
+        }
+
         if ( (desc->Attribute & (EFI_MEMORY_WB | EFI_MEMORY_WT)) ||
              (efi_bs_revision >= EFI_REVISION(2, 5) &&
               (desc->Attribute & EFI_MEMORY_WP)) )
diff --git a/xen/include/efi/efidef.h b/xen/include/efi/efidef.h
index 86a7e111bf..05170da2db 100644
--- a/xen/include/efi/efidef.h
+++ b/xen/include/efi/efidef.h
@@ -158,6 +158,9 @@ typedef enum {
 #define EFI_MEMORY_UCE          0x0000000000000010  
 #define EFI_MEMORY_WP           0x0000000000001000
 
+#define EFI_MEMORY_CACHEABILITY_MASK \
+                                0x000000000000101F
+
 // physical memory protection on range 
 #define EFI_MEMORY_RP           0x0000000000002000
 #define EFI_MEMORY_XP           0x0000000000004000
-- 
2.26.2


