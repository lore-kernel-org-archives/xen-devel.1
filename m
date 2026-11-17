Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B500606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qeoIK6DA
Received: from list by lists.xenproject.org with outflank-mailman.1491900.1692591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTDke-0006uz-Tm; Tue, 17 Nov 2026 07:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491900.1692591; Tue, 17 Nov 2026 07:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTDke-0006us-Qt; Tue, 17 Nov 2026 07:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1491900;
 Tue, 17 Nov 2026 07:37:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xTDkc-0006tg-SI
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 07:37:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTDkb-009FUS-Q5
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:37:09 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6afc0417-e002-0a2a0a5209dd-0a2a4501dfe6-32
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:37:09 +0100
Received: from [74.125.82.41] (helo=mail-dl1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6afc0424-5984-0a2a45010019-4a7d5229d5d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:37:09 +0100
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-1b244fb7fffso5218069c88.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 23:37:09 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b5031b2519sm34900721c88.13.2026.11.16.23.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 23:37:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794901027; x=1795505827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wB+MVHksxY6FBo20rR4RYQwd0UAu5+yVsD5hdbuMN6o=;
        b=qeoIK6DAzBCwq0liuYOxXN7I+4vd+EHj9JR8rTRdMMjZ6c9JuYs9qHWy+BAkFKy9mo
         fxmqJWsEMzzNjalAP5AmF5eemUGWKGQQASwEAhzcjN6FdTlFAH9LYnihc/PWoDMxnX6d
         FAr/VY7/2XgbzO89JH2Kz0UA0oW8m+Xa3LBjhC2N8EXa9maA2qpfV6jepQ+X1XrzgU35
         UOMPvm9A+Hy8qxSyyFQMipuWj/DLlrqDQPaC4wzwoGp5LTpz/DLSrkkd6gejWndP5Di2
         faDl32ayhFzOklV99aJxE04i8io8S3YaPvwDcRkga4K2QiFTvkpC9IIuRaJFjZKfRprR
         ZSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901027; x=1795505827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wB+MVHksxY6FBo20rR4RYQwd0UAu5+yVsD5hdbuMN6o=;
        b=DZThkhzrUh2sI1hhU77O0H4KZFqD27ZGWD0Q6sHlB/wLr+yWFtFRDdKiMuYsl/pp0I
         8f0G0y7Qf8RI2ze71WWbQPsClNg65V90rXexzb9bCex88hv+f5sqtpODxtI9gU4PC/31
         seQxgU0ZaFruAGU062elpwF+Q6Z3HlQ7q0YPo+JmQfdrpOdtQ/J1qdCv087tcDv+SbQB
         gI1UA59vGEhLPbLgCrsVA4/MtsKw7Zm5itfICoiz6YJvNA8EQm4CxF09vXQ8zCX/UVLV
         RJOv41eNyzOpX5eKQqb+N/Wpo6X+EON1OcnoUTwrzOD2DutIRuXPOyjcsljTVwJFidHm
         JNvw==
X-Gm-Message-State: APuU4Z8JtQtX3WHu1LrC08eRnv7jcveZT6awjIHksm5fCvQ9JT2g400a
	Pe0YRmHNK3hOGrN2k2Fny42YbPbexSQ45trNG12CZfvZd4usf5owaeNE6p5S7g==
X-Gm-Gg: AYBFou0GaJJypmgtfQvnlMEwjgKpkmnU0rea7hZ3evmVfgxT1b1WE6Bpap77UCjltWk
	Rrp+1z2NHQ2ztZI+uTo4HbzNJRoefHIrH8adrOycaa3/1+PCjoXvAMDCmrfEYPrrJ1rlLxKQyv6
	gYl9hh0IChnxyfg3PiQ3SfxVVa44POsDWZZ+p9DiU+BlKMJ5ftwgJnByv2bDbSMlWdvPxtUPjup
	1GlkAZQSSK3wouQVlA2A+zQq2B6NIlLQ7F203ze5OzI9EYnk2MgKO5df7Iq/sHYElEDeQCuJaFw
	mukvF+1yX7XwhWRPZlLBMZyrUSrmi5kfljtcab2zpO4gFvk8KJXbyxa/NME6cUHlGHSMNpjA4s3
	xV3lP+X/ae//eIvlqnEe5EuVMA4LADtzsaFkN5gw1PW6fLOgZbfEh2+CAtc1iWPwPeiqprs56jQ
	mL8418xcGtL1umstKANKyBfzi0SlFkiUicvtkOnyfuOwBMz5QcRegK00bixl83SdY7/rUeyGNSn
	bTwRFMFwJQRsjJReycBe+dPWg7iiKoG+jI/wxNckaj8xpPNQE4LH8bmBSW3YQVAXCskAxHs/wUP
	9WPc1/xPP0itOyQcsuVcrRmruNh7TsUQCdIu6DIY6M8ctHouNiLWg2wJhWSdrQh86iPM5D+DlLJ
	2vL12JYlYQ9FJEOsW8tzcYqE=
X-Received: by 2002:a05:701b:4301:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1b502fe374dmr11620773c88.0.1794901027376;
        Mon, 16 Nov 2026 23:37:07 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2] xen/dt: Skip non-RAM reserved-memory regions in make_memory_node()
Date: Tue, 17 Nov 2026 07:36:55 +0000
Message-ID: <20261117073655.2279142-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794901029-1F063757-7EF648EA/0/0
X-purgate-type: clean
X-purgate-size: 4376
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen creates a second /memory node for the hardware domain from
bootinfo_get_reserved_mem() without checking whether those regions
belong to host RAM. However, /reserved-memory can also describe non-RAM
regions such as on-chip SRAM outside system RAM. For example, Linux's
Documentation/devicetree/bindings/nvmem/rmem.yaml defines nvmem-rmem
nodes under /reserved-memory, and the comment in Linux's
early_init_dt_reserve_memory() notes that a no-map region may not be
part of memory. Listing them in a /memory node causes the hardware
domain to register non-RAM addresses as system RAM, conflicting with
device MMIO mappings.

Skip reserved-memory banks outside the host RAM banks reported by
bootinfo_get_mem() in make_memory_node(). Skip this check when booted
via EFI, where bootinfo_get_mem() only contains usable memory and does
not include reserved regions.

Fixes: 248faa637d2f ("xen/arm: add reserved-memory regions to the dom0 memory node")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Skip the host RAM check when booted via EFI.
- Drop the redundant !bank->size check from is_in_host_ram().
- Extract the bank-filtering logic into skip_memory_bank() and update
the stale comment in make_memory_node().
- Expand the commit message to reference Linux's nvmem-rmem binding,
early_init_dt_reserve_memory() comment, and EFI boot behavior.

 xen/common/device-tree/domain-build.c | 50 +++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 634a26946c..e58c340746 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -2,6 +2,7 @@
 
 #include <xen/bootinfo.h>
 #include <xen/domain-layout.h>
+#include <xen/efi.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -504,6 +505,42 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+static bool __init is_in_host_ram(const struct membank *bank)
+{
+    const struct membanks *ram = bootinfo_get_mem();
+    paddr_t start = bank->start;
+    paddr_t end = start + bank->size;
+    unsigned int i;
+
+    if ( end < start )
+        return false;
+
+    for ( i = 0; i < ram->nr_banks; i++ )
+    {
+        paddr_t ram_start = ram->bank[i].start;
+        paddr_t ram_end = ram_start + ram->bank[i].size;
+
+        if ( start < ram_start )
+            return false;
+
+        if ( end <= ram_end )
+            return true;
+
+        if ( start < ram_end )
+            start = ram_end;
+    }
+
+    return false;
+}
+
+static bool __init skip_memory_bank(const struct membank *bank, bool check_ram)
+{
+    if ( bank->type != MEMBANK_DEFAULT )
+        return true;
+
+    return check_ram && !is_in_host_ram(bank);
+}
+
 int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
                             int sizecells, const struct membanks *mem)
 {
@@ -513,13 +550,20 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
     int nr_cells = 0;
     __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
     __be32 *cells;
+    bool check_ram;
 
     if ( mem->nr_banks == 0 )
         return -ENOENT;
 
-    /* find the first memory range that is reserved for device (or firmware) */
+    /*
+     * When booting via EFI, bootinfo_get_mem() only holds usable memory and
+     * excludes reserved regions, so skip the host RAM check in that case.
+     */
+    check_ram = (mem == bootinfo_get_reserved_mem()) && !efi_enabled(EFI_BOOT);
+
+    /* Find the first memory bank to include in the /memory node. */
     for ( i = 0; i < mem->nr_banks &&
-                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
+                 skip_memory_bank(&mem->bank[i], check_ram); i++ )
         ;
 
     if ( i == mem->nr_banks )
@@ -541,7 +585,7 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
-        if ( mem->bank[i].type != MEMBANK_DEFAULT )
+        if ( skip_memory_bank(&mem->bank[i], check_ram) )
             continue;
 
         nr_cells += reg_size;
-- 
2.56.1.703.gf848ed807c-goog


