Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3D4606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1n6pdO5
Received: from list by lists.xenproject.org with outflank-mailman.1463664.1674447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMB1s-0006TU-Tp; Wed, 28 Oct 2026 21:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463664.1674447; Wed, 28 Oct 2026 21:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMB1s-0006TL-Qm; Wed, 28 Oct 2026 21:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1463664;
 Wed, 28 Oct 2026 21:17:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xMB1s-0006T6-02
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 21:17:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMB1q-003Yqa-VQ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 22:17:50 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae26640-bab6-0a2a0a5309dd-0a2a4503bab2-22
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 22:17:50 +0100
Received: from [74.125.82.169] (helo=mail-dy1-f169.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae2667d-fae8-0a2a45030019-4a7d52a9dc9a-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 22:17:50 +0100
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-3535bf8b3e0so2039146eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 14:17:50 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a2393cc86sm8584319eec.19.2026.10.28.14.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:17:48 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793222269; x=1793827069; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSvwUjXL6bxIqoLGpkozD02HG93+EIbGW9TejI0a/vc=;
        b=u1n6pdO5XqjbfyQPOth64eYKHNF9aBUtid1ez89jPPPfSHCaW3hKx5+qsiKPRUZ+qB
         VyepVP+MzbxxoSrxtOdz+tMV5F4z2XFxsi7FIuC7ja1Tr2XRKhjJ26lfFGy3UUG1w4W5
         BYmRqk8nhNNlvvs/Nff221ImIrKrBVR8h8IWkYh5gX1H4jX4n56D7DeHDtjIQbj3hGSE
         BVXQwZmBY8x9MtBhxWcR0FUyaNOvXxBENoCs/t0I9pobZUbm0PeKMOMaWsdlYQZgoh6K
         HIsPX297iFepMDlYa99kL2dtbuNil3NC8ZTKPKfsWzSdrv1UikRlI6M03kyO3LJyTo59
         QxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222269; x=1793827069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSvwUjXL6bxIqoLGpkozD02HG93+EIbGW9TejI0a/vc=;
        b=b0wv68UeKuKqDYsdYHMh5ZnWU8vdyWdiJbIje7jQO8e1qAyo/3T/A6esG24mvUR16y
         TeGtFN/I9aDhb15HDIQisGp7TK5N2Oxf1L/GbBpwmihiRXoNpHstKenYgNMtVL/kkO/m
         YWxlojdchYvQFZ9pOq8WOBu7e9TfcbnNc6s/iQSxgaOU3xm0mWQnKT5kTqXpoWpsZPD0
         ab0bcku2w6s2MlvqoP7XyXut7MWXjvt5EP64h5vnG0GjOc+Wi1CxWODFfrXRoM+lbTjR
         6kUGm1Q8EPI4J2R/551CzQ3Wg19bi3KHJKmUWbKcP0EyMdOh6+EF4jGPI6NoaEu2GTz+
         ZYhw==
X-Gm-Message-State: AFq9FYKQZPmaCoKqekx9rytGTb/sCbT2CQyRfoTFr10PaqIAri1j3n/b
	By4KBedTuXKPxa8U6ah39zYnUWRes0/PpsjWLnleLQF1x7mGbTVgckJ6LSycTQ==
X-Gm-Gg: AYBFou0MIEVMPFRDju7i+oMscD30IBJT8SeE7TWj8TgpviYWgAVeuxTlXlR1z2Dp7F2
	DFC6RgqNl52993ZT2SNp/2zfWQxffn5GeC9kgyrXxIUmK5vx5fWEl00INrvXu/zH7EM+qNkwMIZ
	ncmo+fG0GBrBSz5PBRKHbA80TCqNwBpopQF1TQvA6LBz3G4lBFIDDfnW4x5CyUL922vP+DAvvPw
	0AhlQdzq7bzzzOyDLVZqa7nq89vWGgAu2wOwYjlE/DAHy62jG7gEjqlohSGyknh34T8/oJM/lmN
	msu11TsWKG/Qc7WK977+HEuPAH8gVrf9syHjfpmnhoXt9dWPrqrbywSdymK/gS7HZpSv/fMMdG8
	TkseQ+7JHWZ/INpr228rvBfGjQyNtmb2dV8IPTRiByPqX++ufhYyEeh3H57lmTUE4w/N9UOlIaA
	vZss57u1FaoVcdYxd9L5KF1m3Qb5GEI0pNfcGZAEWQTTT9yhE4eqBtJW4Rj8WJn+fGRmnkfUsMk
	K9CSGs+V0g14ESeR4/ESZw8/90Rx4ysvA0ji7e8eXtkqi6n9y8C6A82pW/buQ0oNGQDe4HjXajf
	pPO/Ya597mqLQD6famJE0ck9zIvKq6d+AkT87nDjx5/BxI0r1D1O7Ufbxy0IEXzycDJpu9FtuVZ
	xIlNoLFnv+a+RKTBczsJDqWo=
X-Received: by 2002:a05:7300:a230:b0:369:a113:7578 with SMTP id 5a478bee46e88-36a1ff4734emr4398816eec.1.1793222268607;
        Wed, 28 Oct 2026 14:17:48 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	marscheng@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] xen/dt: Skip non-RAM reserved-memory regions in make_memory_node()
Date: Wed, 28 Oct 2026 21:17:37 +0000
Message-ID: <20261028211737.17629-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793222270-6FAC44E9-1E5AC3BC/0/0
X-purgate-type: clean
X-purgate-size: 3244
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen creates a second /memory node for Dom0 from
bootinfo_get_reserved_mem() without checking whether those regions
belong to host RAM. However, /reserved-memory can also describe
on-chip SRAM or firmware regions outside system RAM. Listing them in a
/memory node causes Dom0 to register non-RAM addresses as system RAM,
conflicting with device MMIO mappings.

Skip reserved-memory banks outside the host RAM banks reported by
bootinfo_get_mem() in make_memory_node().

Fixes: 248faa637d2f ("xen/arm: add reserved-memory regions to the dom0 memory node")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Found while trying to bring up Xen on new hardware.
Tested on real silicon.

 xen/common/device-tree/domain-build.c | 42 +++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 30a59abfa7..33baf150a6 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -504,6 +504,34 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+static bool __init is_in_host_ram(const struct membank *bank)
+{
+    const struct membanks *ram = bootinfo_get_mem();
+    paddr_t start = bank->start;
+    paddr_t end = start + bank->size;
+    unsigned int i;
+
+    if ( !bank->size || end < start )
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
 int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
                             int sizecells, const struct membanks *mem)
 {
@@ -513,14 +541,20 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
     int nr_cells = 0;
     __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
     __be32 *cells;
+    bool is_resv = (mem == bootinfo_get_reserved_mem());
 
     if ( mem->nr_banks == 0 )
         return -ENOENT;
 
     /* find the first memory range that is reserved for device (or firmware) */
-    for ( i = 0; i < mem->nr_banks &&
-                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
-        ;
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        if ( mem->bank[i].type != MEMBANK_DEFAULT )
+            continue;
+        if ( is_resv && !is_in_host_ram(&mem->bank[i]) )
+            continue;
+        break;
+    }
 
     if ( i == mem->nr_banks )
         return 0;
@@ -544,6 +578,8 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
         if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
              (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
             continue;
+        if ( is_resv && !is_in_host_ram(&mem->bank[i]) )
+            continue;
 
         nr_cells += reg_size;
         BUG_ON(nr_cells > ARRAY_SIZE(reg));
-- 
2.56.0.385.gac671c819a-goog


