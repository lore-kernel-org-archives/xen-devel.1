Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5B4C982CC
	for <xen-devel@archiver.kernel.org>; Sat, 19 Sep 2026 07:50:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1426080.1649627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7pq9-0007U2-MN; Sat, 19 Sep 2026 07:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1426080.1649627; Sat, 19 Sep 2026 07:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7pq9-0007Tv-JZ; Sat, 19 Sep 2026 07:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1426080;
 Sat, 19 Sep 2026 07:46:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <enelsonmoore@gmail.com>) id 1x7pmi-0006L5-JQ
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2026 07:46:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7pmi-006jXm-0V
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2026 09:46:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <enelsonmoore@gmail.com>)
 id 6aae3def-2eae-0a2a0a5409dd-0a2a4503cc38-2
 for <xen-devel@lists.xenproject.org>; Sat, 19 Sep 2026 09:46:56 +0200
Received: from [74.125.227.136] (helo=mail-pj2-f8.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <enelsonmoore@gmail.com>)
 id 6aae3dee-fae8-0a2a45030019-4a7de3889794-3
 for <xen-devel@lists.xenproject.org>; Sat, 19 Sep 2026 09:46:55 +0200
Received: by mail-pj2-f8.google.com with SMTP id
 d9443c01a7336-2d8fcda61c8so6253305ad.1
 for <xen-devel@lists.xenproject.org>; Sat, 19 Sep 2026 00:46:55 -0700 (PDT)
Received: from ethan-latitude5420..
 (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144d54af4d5sm4304553c88.2.2026.09.19.00.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 00:46:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789804014; x=1790408814; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WlyPHwpsJQj7McTxWFAv7Df5j2tDpqRuiibzqiyHFE=;
        b=Qwwyw/ZZmqMR0PxYYr2KKao/ek/X5UotKqX+ADCMf2ewhvmIiOBCOPrGqUT0J9JqeD
         uHSURA9Y+iItjVEf3801x/+84lWK1KH34nQY1ttjlhz+KbGpIu7Laa2JaIbGhIE782Cr
         u79SF90IFfIqTFX+i2Z72ZMf/cPRTvhGfSaORj9PrcnRXWKd9N5Qf53VXjW8rw/Vp/Vl
         buefrb0SWsqZlFYYDxqYtdO0fy8xILt2Ha/omNmwHdlV7BUsXScHzcaDP/Pv+Tvw4azQ
         Vs3RENV/31hJY3BrmXWbRvtttSknSQ1PR4WNGw3/R7pCzY8dTNT4hyZdCi27Whdd4rAn
         veXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789804014; x=1790408814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WlyPHwpsJQj7McTxWFAv7Df5j2tDpqRuiibzqiyHFE=;
        b=oRs74ZePGTTok9h1c27e+a9b+udttEEkQBHHLqI/hMbbL57wKGodE7Fqn/IbMBdmj1
         ZNMhwrHrrS6upeWdUaxrb8vcXcWR9ZSGNbY5cDZZvYyeN59CiV9t2adHjMErf1q8RgiM
         LvlfbvBu5boJYCvfUDd/Ex8uJBVmV7rwP1RNE8EmMRQHmau8hyf9HJkI5R5gJuCF9RlI
         2ZssldqIili8HdPTHXlAb+NQsl5zby6pjVbuvpDNjIv8UMqj5oPmc5ot1V3CgqoJf474
         ecVPv8CDXXtKuHufDDOu14pEQylSDxV+QQhf24EPxDtslGashBcLdNIPOffP4q3GofGI
         nhNw==
X-Forwarded-Encrypted: i=1; AKwUvBya8ztYZVfSbFSg2ti/2MtAC4TDqyGnN0BHS2c5HqxZKzPp9u/Vruo+nhMW0tiXt5I0kc3qTam3z3I=@lists.xenproject.org
X-Gm-Message-State: AFuF++kR3X2KfTe7X3EXp9GZ7T0mDBAQkMjWShEhgO3iZI6DsJKeLGMH
	BPogDmDVk/ORvcJAgYTp6hYxYM97bRDvvO7zEMru6wMXBA7qcIgXTEsF
X-Gm-Gg: AYBFou1Hu+6IilAEvaHiG5NWlek5A9xS8fG5fjHya1PSElUc8KWfQmOLXb9LGfx5D5u
	8w6tkMKPyw8KEoJVlHotXOc4R4YzuFhitSFp+Lopl/XNsBrJRSeXJXdkTxUE0xNKr5icThJtqJf
	g5moFVh2KR64JcagTxBrLAjOpuR+Mojq/A/4BIw0oKK5u+ilWo05nZpsD3iR03AuFsxHyGK/YNu
	9RBk3WnG++vfUPGHVjnSXnIESzkaUPCtKubuts9bhfflfUZyFIaXvyQrQ4sLbMHBY12aVpq+Yuf
	22qEa/bamaBeK/Oz1JVHAKP2Grffr4QLOfBIP2IcUq/bqKpDH2jxkXZfo4muQuBbgjCeBYTcLXI
	spUM548mONuVvDH8fCUUPT5EkOPJBj5B8QI9ZPZucDrXepZrQ+it4fKiWHAphsFJ2+pfaBm4OGZ
	7WYD2rpmTT9Ty2SlolxycNAhJMAMFkYsa3GDus7OSfQ8xan8iMpPrw7Sr6gSVj1MwpYMGh2WGzD
	MtvHCmnq8ge511L7KZgLoGK5ghiPhcJvgyQVRjugG+jIVsuFB0f2d/ytshR9QDTz0M7LSumdfsH
	RYnoVawps47IDJ1l6LSQqKDcXJTckTx/A/vsAAhNuP6zWYk2Oxp6p1ZUYWyNSMQm
X-Received: by 2002:a05:6a21:6816:b0:3dd:55f2:9785 with SMTP id adf61e73a8af0-3dd8c565ca5mr10244270637.26.1789804013834;
        Sat, 19 Sep 2026 00:46:53 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: remove unused hvm_vcpu.h header
Date: Sat, 19 Sep 2026 00:46:43 -0700
Message-ID: <20260919074650.453007-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1789804015-7488A4E9-C63DE999/0/0
X-purgate-type: clean
X-purgate-size: 3743

The <xen/interface/hvm/hvm_vcpu.h> header appears to have been unused
ever since it was added to the kernel in commit cee2cfb7d18d ("xen/pvh:
Import PVH-related Xen public interfaces"). Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 include/xen/interface/hvm/hvm_vcpu.h | 116 ---------------------------
 1 file changed, 116 deletions(-)
 delete mode 100644 include/xen/interface/hvm/hvm_vcpu.h

diff --git a/include/xen/interface/hvm/hvm_vcpu.h b/include/xen/interface/hvm/hvm_vcpu.h
deleted file mode 100644
index cbf93493275c..000000000000
--- a/include/xen/interface/hvm/hvm_vcpu.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright (c) 2015, Roger Pau Monne <roger.pau@citrix.com>
- */
-
-#ifndef __XEN_PUBLIC_HVM_HVM_VCPU_H__
-#define __XEN_PUBLIC_HVM_HVM_VCPU_H__
-
-#include "../xen.h"
-
-struct vcpu_hvm_x86_32 {
-    uint32_t eax;
-    uint32_t ecx;
-    uint32_t edx;
-    uint32_t ebx;
-    uint32_t esp;
-    uint32_t ebp;
-    uint32_t esi;
-    uint32_t edi;
-    uint32_t eip;
-    uint32_t eflags;
-
-    uint32_t cr0;
-    uint32_t cr3;
-    uint32_t cr4;
-
-    uint32_t pad1;
-
-    /*
-     * EFER should only be used to set the NXE bit (if required)
-     * when starting a vCPU in 32bit mode with paging enabled or
-     * to set the LME/LMA bits in order to start the vCPU in
-     * compatibility mode.
-     */
-    uint64_t efer;
-
-    uint32_t cs_base;
-    uint32_t ds_base;
-    uint32_t ss_base;
-    uint32_t es_base;
-    uint32_t tr_base;
-    uint32_t cs_limit;
-    uint32_t ds_limit;
-    uint32_t ss_limit;
-    uint32_t es_limit;
-    uint32_t tr_limit;
-    uint16_t cs_ar;
-    uint16_t ds_ar;
-    uint16_t ss_ar;
-    uint16_t es_ar;
-    uint16_t tr_ar;
-
-    uint16_t pad2[3];
-};
-
-/*
- * The layout of the _ar fields of the segment registers is the
- * following:
- *
- * Bits   [0,3]: type (bits 40-43).
- * Bit        4: s    (descriptor type, bit 44).
- * Bit    [5,6]: dpl  (descriptor privilege level, bits 45-46).
- * Bit        7: p    (segment-present, bit 47).
- * Bit        8: avl  (available for system software, bit 52).
- * Bit        9: l    (64-bit code segment, bit 53).
- * Bit       10: db   (meaning depends on the segment, bit 54).
- * Bit       11: g    (granularity, bit 55)
- * Bits [12,15]: unused, must be blank.
- *
- * A more complete description of the meaning of this fields can be
- * obtained from the Intel SDM, Volume 3, section 3.4.5.
- */
-
-struct vcpu_hvm_x86_64 {
-    uint64_t rax;
-    uint64_t rcx;
-    uint64_t rdx;
-    uint64_t rbx;
-    uint64_t rsp;
-    uint64_t rbp;
-    uint64_t rsi;
-    uint64_t rdi;
-    uint64_t rip;
-    uint64_t rflags;
-
-    uint64_t cr0;
-    uint64_t cr3;
-    uint64_t cr4;
-    uint64_t efer;
-
-    /*
-     * Using VCPU_HVM_MODE_64B implies that the vCPU is launched
-     * directly in long mode, so the cached parts of the segment
-     * registers get set to match that environment.
-     *
-     * If the user wants to launch the vCPU in compatibility mode
-     * the 32-bit structure should be used instead.
-     */
-};
-
-struct vcpu_hvm_context {
-#define VCPU_HVM_MODE_32B 0  /* 32bit fields of the structure will be used. */
-#define VCPU_HVM_MODE_64B 1  /* 64bit fields of the structure will be used. */
-    uint32_t mode;
-
-    uint32_t pad;
-
-    /* CPU registers. */
-    union {
-        struct vcpu_hvm_x86_32 x86_32;
-        struct vcpu_hvm_x86_64 x86_64;
-    } cpu_regs;
-};
-typedef struct vcpu_hvm_context vcpu_hvm_context_t;
-
-#endif /* __XEN_PUBLIC_HVM_HVM_VCPU_H__ */
-- 
2.43.0


