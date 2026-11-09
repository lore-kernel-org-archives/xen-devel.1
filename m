Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A05A606D812
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=ny9+cpqC
Received: from list by lists.xenproject.org with outflank-mailman.1479908.1683813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNh9-0003hp-P0; Mon, 09 Nov 2026 11:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479908.1683813; Mon, 09 Nov 2026 11:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNh9-0003hi-Kn; Mon, 09 Nov 2026 11:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1479908;
 Mon, 09 Nov 2026 11:37:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQNh7-0003hR-SU
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:37:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNh6-007Nat-Up
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:37:48 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af1b084-8faa-0a2a0a5109dd-0a2a450599e6-22
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:37:48 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af1b08c-4cb1-0a2a45050019-d1558034a92b-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:37:48 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so4391965e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 03:37:48 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb1b64esm237279965e9.13.2026.11.09.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:37:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794224268; x=1794829068; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAoASTY4AWCZnJUTZA1NOog22BQeqonz6ob2RJ096UE=;
        b=ny9+cpqC0RubG6AIGebiGCSpEWpAVSfXXPG3CVc1utQiJJ1l2BpfOpRCUM0jjwA+b5
         45qhW6DMnHyUcMh3m4/HkWMqZTAPqLiCJHb/4NmIlywxY7w/paYeoSXPkUvxpYBDeLL5
         ALZm32zL0Ve9gr0cQhsRErZ7SQQZJ0iRxRJ1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224268; x=1794829068;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAoASTY4AWCZnJUTZA1NOog22BQeqonz6ob2RJ096UE=;
        b=UnNPQTgHrH+Xt3pM0mqq6hQEPKS2uLLi3nvRMVbVciXG37D+ZrLTBSIFSOd6Icq15w
         7gNXh3ff1CtaA9khpVieRaxvMcBonlssrUNDsG+kLXiTnCjAt5wcWbhMzEsDZN6wFJOA
         iF0JSgucViad7YMe10tMD6hh49C65x78wBXc5mWLAs7Xku4CmskWnz07P/nj7tHZ1y87
         MmnrbTBNHeFC7xNwAzXA7HFtehD+FPMvCpIOj0KsLuueJH7Fm8TmJj5ZdqWBMN1Rcy6C
         Fk4ohxAx4moeF3iWNpFYtK5N7RFXKaKRA8tQEFBHXcMgHrfKXHuU9Xp4aBweXEFQGjFa
         uGSw==
X-Gm-Message-State: APuU4Z/SDSjYCZGD3AhhD++cic59OEZKQ7QGZ6/A6sndoZ8jEoabVCKx
	wqffDQjXd4Yf00KucPX8SA4O9S0Ug8E0QL6qLYtDQAkGsgGUXYomyVi1AZ1mIv4RQfTOAym5cVX
	mRXKT
X-Gm-Gg: AYBFou3V2w00CVr32HsHsiTic6DT1rbSILhb6hEg3yIVr30VM/yOq6sK66tVWn6mGRw
	cvbXTrJq6XyuRjWHwlPU8g7XpPYFa4JgfypEiRZx2/INuE78sQLViaxigtK4Pi1vukex9XHurpd
	Sovj1ulrgiaBpjdh5sEaMr+/8/+DB32aDYhkhj9CsyMoesViz1ur9LWtTLH7SyW3/8Pe8yj1fr+
	ae8i9fs+xPCpBiz9jjey6cuEpRv1G8Rpkc0WOs5KADMAOyVWJo6yj7SBLdTkAzpXhaC0/+M7Ucu
	/iRzlOyQKpZy0pj26sA4l3+dOa2x9d7k9RkK3yR3oBKxC4HsY0JMJL96EnJAMSjbzdBG+JaDnDU
	bEYZLyo40Q8Z/Dsz7vBmgqPbQz/hNrBl0o3+UUQfZ+9YZZKtAG14Os0ldYzZLTZ7xO7SRpzJqwQ
	BPf6hcYAtpIvrhdMfkisUlTYIJ8cTJoYuerL6+VzvJdiy3JXQD/mTY5R/lcM62yzcVhpNZJ3NjZ
	xtdgrWNhOYDBcUsaf91+p1sEmPtAR9VZuiKcSrHWeIGQPQ2LSfNPZgHtZlPKDSa0vTw/cL/8Tdw
	eBfM15OvDVQ3Z/ZdsbzxEdkt9jKhkfXrMkO9lRElksNGbxeSknjEvdB6h4ebgn8m7nIe6HkW5li
	0yYqYkQxuQbj28v+O1wtY0JuM
X-Received: by 2002:a05:600c:4747:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b963c7e7e1mr77028475e9.17.1794224267599;
        Mon, 09 Nov 2026 03:37:47 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH] x86/svm: Rework VMCB comments
Date: Mon,  9 Nov 2026 11:37:45 +0000
Message-Id: <20261109113745.2840610-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794224268-73EB92A1-B328A532/10/78276251493
X-purgate-type: spam
X-purgate-size: 10255
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Identify the cleanbits by name as well as number.  For single reserved fields,
use an anonymous bitfield to reduce the number of res names.  Use 3-diget
offsets consistently for offsets.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Denis Mukhin <dmukhin@ford.com>

I've rebased FRED and Denis's AVIC to check how this extends, and everything
looks fine.  Both have some longer field names.
---
 xen/arch/x86/hvm/svm/vmcb.h | 152 ++++++++++++++++++------------------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 151d0f1dd1ae..9d89ce44fe55 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -385,28 +385,28 @@ typedef union
 
 struct vmcb_struct {
     /* Control area */
-    uint32_t _cr_intercepts;         /* offset 0x00 - cleanbit 0 */
-    uint32_t _dr_intercepts;         /* offset 0x04 - cleanbit 0 */
-    uint32_t _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
-    uint32_t _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
-    uint32_t _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
-    uint32_t _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
-    uint32_t res01[9];
-    uint16_t _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
-    uint16_t _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
-    uint64_t _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
-    uint64_t _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
-    uint64_t _tsc_offset;            /* offset 0x50 - cleanbit 0 */
-    uint32_t _asid;                  /* offset 0x58 - cleanbit 2 */
-    uint8_t  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
+    uint32_t _cr_intercepts;             /* 0x000 - Clean.intercepts(0) */
+    uint32_t _dr_intercepts;             /* 0x004   | */
+    uint32_t _exception_intercepts;      /* 0x008   | */
+    uint32_t _general1_intercepts;       /* 0x00c   | */
+    uint32_t _general2_intercepts;       /* 0x010   | */
+    uint32_t _general3_intercepts;       /* 0x014   | */
+    uint32_t res01[9];                   /* 0x018   | */
+    uint16_t _pause_filter_thresh;       /* 0x03c   | */
+    uint16_t _pause_filter_count;        /* 0x03e   v */
+    uint64_t _iopm_base_pa;              /* 0x040 - Clean.iopm(1) */
+    uint64_t _msrpm_base_pa;             /* 0x048   v */
+    uint64_t _tsc_offset;                /* 0x050 - Clean.intercepts(0) */
+    uint32_t _asid;                      /* 0x058 - Clean.asid(2) */
+    uint8_t  tlb_control;                /* 0x05c - TLB_CTRL_* */
     uint8_t  res07[3];
-    vintr_t _vintr;             /* offset 0x60 - cleanbit 3 */
-    intstat_t int_stat;         /* offset 0x68 */
-    uint64_t exitcode;               /* offset 0x70 */
+    vintr_t _vintr;                      /* 0x060 - Clean.tpr(3) */
+    intstat_t int_stat;                  /* 0x068 */
+    uint64_t exitcode;                   /* 0x070 */
     union {
         struct {
-            uint64_t exitinfo1; /* offset 0x78 */
-            uint64_t exitinfo2; /* offset 0x80 */
+            uint64_t exitinfo1;          /* 0x078 */
+            uint64_t exitinfo2;          /* 0x080 */
         };
         union {
             struct {
@@ -454,8 +454,8 @@ struct vmcb_struct {
             } task_switch;
         } ei;
     };
-    intinfo_t exit_int_info;    /* offset 0x88 */
-    union {                     /* offset 0x90 - cleanbit 4 */
+    intinfo_t exit_int_info;             /* 0x088 */
+    union {                              /* 0x090 - Clean.np(4) */
         struct {
             bool _np        :1;
             bool _sev       :1;
@@ -467,72 +467,72 @@ struct vmcb_struct {
         uint64_t _np_ctrl;
     };
     uint64_t res08[2];
-    intinfo_t event_inj;        /* offset 0xA8 */
-    uint64_t _h_cr3;            /* offset 0xB0 - cleanbit 4 */
-    virt_ext_t virt_ext;        /* offset 0xB8 */
-    vmcbcleanbits_t cleanbits;  /* offset 0xC0 */
-    uint32_t res09;             /* offset 0xC4 */
-    uint64_t nextrip;           /* offset 0xC8 */
-    uint8_t  guest_ins_len;     /* offset 0xD0 */
-    uint8_t  guest_ins[15];     /* offset 0xD1 */
-    uint64_t res10a[8];         /* offset 0xE0 */
-    uint16_t bus_lock_count;    /* offset 0x120 */
-    uint16_t res10b[3];         /* offset 0x122 */
-    uint64_t res10c[91];        /* offset 0x128 pad to save area */
-
-    /* State Save area */
+    intinfo_t event_inj;                 /* 0x0a8 */
+    uint64_t _h_cr3;                     /* 0x0b0 - Clean.np(4) */
+    virt_ext_t virt_ext;                 /* 0x0b8 */
+    vmcbcleanbits_t cleanbits;           /* 0x0c0 */
+    uint32_t :32;
+    uint64_t nextrip;                    /* 0x0c8 */
+    uint8_t  guest_ins_len;              /* 0x0d0 */
+    uint8_t  guest_ins[15];              /* 0x0d1 */
+    uint64_t res10a[8];
+    uint16_t bus_lock_count;             /* 0x120 */
+    uint16_t res10b[3];
+    uint64_t res10c[91];
+
+    /* State Save area, offset 0x400 */
     union {
         struct segment_register sreg[6];
         struct {
-            struct segment_register es;  /* offset 0x400 - cleanbit 8 */
-            struct segment_register cs;  /* cleanbit 8 */
-            struct segment_register ss;  /* cleanbit 8 */
-            struct segment_register ds;  /* cleanbit 8 */
-            struct segment_register fs;
-            struct segment_register gs;
+            struct segment_register es;  /* 0x400 + 0x000 - Clean.seg(8) */
+            struct segment_register cs;  /* 0x400 + 0x010   | */
+            struct segment_register ss;  /* 0x400 + 0x020   | */
+            struct segment_register ds;  /* 0x400 + 0x030   v */
+            struct segment_register fs;  /* 0x400 + 0x040 */
+            struct segment_register gs;  /* 0x400 + 0x050 */
         };
     };
-    struct segment_register gdtr; /* cleanbit 7 */
-    struct segment_register ldtr;
-    struct segment_register idtr; /* cleanbit 7 */
-    struct segment_register tr;
+    struct segment_register gdtr;        /* 0x400 + 0x060 - Clean.dt(7) */
+    struct segment_register ldtr;        /* 0x400 + 0x070 */
+    struct segment_register idtr;        /* 0x400 + 0x080 - Clean.dt(7) */
+    struct segment_register tr;          /* 0x400 + 0x090 */
     uint64_t res10[5];
     uint8_t res11[3];
-    uint8_t _cpl;               /* cleanbit 8 */
-    uint32_t res12;
-    uint64_t _efer;             /* offset 0x400 + 0xD0 - cleanbit 5 */
+    uint8_t _cpl;                        /* 0x400 + 0x0cb - Clean.seg(8) */
+    uint32_t :32;
+    uint64_t _efer;                      /* 0x400 + 0x0d0 - Clean.cr(5) */
     uint64_t res13[14];
-    uint64_t _cr4;              /* offset 0x400 + 0x148 - cleanbit 5 */
-    uint64_t _cr3;              /* cleanbit 5 */
-    uint64_t _cr0;              /* cleanbit 5 */
-    uint64_t _dr7;              /* cleanbit 6 */
-    uint64_t _dr6;              /* cleanbit 6 */
-    uint64_t rflags;
-    uint64_t rip;
+    uint64_t _cr4;                       /* 0x400 + 0x148 - Clean.cr(5) */
+    uint64_t _cr3;                       /* 0x400 + 0x150   | */
+    uint64_t _cr0;                       /* 0x400 + 0x158   v */
+    uint64_t _dr7;                       /* 0x400 + 0x160 - Clean.dr(6) */
+    uint64_t _dr6;                       /* 0x400 + 0x168   v */
+    uint64_t rflags;                     /* 0x400 + 0x170 */
+    uint64_t rip;                        /* 0x400 + 0x178 */
     uint64_t res14[11];
-    uint64_t rsp;
-    uint64_t _msr_s_cet;        /* offset 0x400 + 0x1E0 - cleanbit 12 */
-    uint64_t _ssp;              /* offset 0x400 + 0x1E8   | */
-    uint64_t _msr_isst;         /* offset 0x400 + 0x1F0   v */
-    uint64_t rax;
-    uint64_t star;
-    uint64_t lstar;
-    uint64_t cstar;
-    uint64_t sfmask;
-    uint64_t kerngsbase;
-    uint64_t sysenter_cs;
-    uint64_t sysenter_esp;
-    uint64_t sysenter_eip;
-    uint64_t _cr2;              /* cleanbit 9 */
+    uint64_t rsp;                        /* 0x400 + 0x1d8 */
+    uint64_t _msr_s_cet;                 /* 0x400 + 0x1e0 - Clean.cet(12) */
+    uint64_t _ssp;                       /* 0x400 + 0x1e8   | */
+    uint64_t _msr_isst;                  /* 0x400 + 0x1f0   v */
+    uint64_t rax;                        /* 0x400 + 0x1f8 */
+    uint64_t star;                       /* 0x400 + 0x200 */
+    uint64_t lstar;                      /* 0x400 + 0x208 */
+    uint64_t cstar;                      /* 0x400 + 0x210 */
+    uint64_t sfmask;                     /* 0x400 + 0x218 */
+    uint64_t kerngsbase;                 /* 0x400 + 0x220 */
+    uint64_t sysenter_cs;                /* 0x400 + 0x228 */
+    uint64_t sysenter_esp;               /* 0x400 + 0x230 */
+    uint64_t sysenter_eip;               /* 0x400 + 0x238 */
+    uint64_t _cr2;                       /* 0x400 + 0x240 - Clean.cr2(9) */
     uint64_t res16[4];
-    uint64_t _g_pat;            /* cleanbit 4 */
-    uint64_t _debugctlmsr;      /* cleanbit 10 */
-    uint64_t _lastbranchfromip; /* cleanbit 10 */
-    uint64_t _lastbranchtoip;   /* cleanbit 10 */
-    uint64_t _lastintfromip;    /* cleanbit 10 */
-    uint64_t _lastinttoip;      /* cleanbit 10 */
+    uint64_t _g_pat;                     /* 0x400 + 0x268 - Clean.np(4) */
+    uint64_t _debugctlmsr;               /* 0x400 + 0x270 - Clean.lbr(10) */
+    uint64_t _lastbranchfromip;          /* 0x400 + 0x278   | */
+    uint64_t _lastbranchtoip;            /* 0x400 + 0x280   | */
+    uint64_t _lastintfromip;             /* 0x400 + 0x288   | */
+    uint64_t _lastinttoip;               /* 0x400 + 0x290   v */
     uint64_t res17[9];
-    uint64_t spec_ctrl;
+    uint64_t spec_ctrl;                  /* 0x400 + 0x2e0 */
     uint64_t res18[291];
 };
 
-- 
2.39.5


