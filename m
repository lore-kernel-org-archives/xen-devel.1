Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB7C5518F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:20:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381225.1624789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy7-0001wj-C9; Mon, 03 Aug 2026 07:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381225.1624789; Mon, 03 Aug 2026 07:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy7-0001wb-9I; Mon, 03 Aug 2026 07:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1381225;
 Mon, 03 Aug 2026 07:20:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqmy5-0001jf-Q6
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:20:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmy5-001lnU-6i
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:20:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70411b-2eae-0a2a0a5409dd-0a2a4509eaca-46
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:13 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412c-be1a-0a2a45090019-d1558036d87d-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:12 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-496b7622a83so10889715e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:20:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm254687935e9.2.2026.08.03.00.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 00:20:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785741612; x=1786346412; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ub/V0kRy79kgAjDqq6A4lupnXHVPDMBJb38IyKztucA=;
        b=m/LZlSJ73th47EW3aq+8u7uO4RvAinRPHAuSrcmRmu/VIojsArSoAzHjkOkq+woFyb
         bxzaZjEWUUgNl0UDJx9WAwo04WZ2zWpYjz+CPWH+RuEjXUeBAyQvLHnURVTdVuiFYJ9+
         iUyhdT7kCCT9n4MEBMGLzTtxr++iPB67FZmaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741612; x=1786346412;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub/V0kRy79kgAjDqq6A4lupnXHVPDMBJb38IyKztucA=;
        b=G7N9oMEKzwoxTXakgiFH+y3bXAu6dZbMLbW3LqaIUJUARQm53445XXYSp/VVrnAB8p
         7tVs4sYR83X9/oPCDBWdplFEpv6fxoVOAQdXFF+2HnH6KnnszWgafAFYA7+FUWAYK6ZP
         in6i+1NdCxToL3tMc2gQ72eiobPATjRRFDMLdRqp7uBVyC7jlxEjfxJp3B81BcRm3hJO
         OlMoVfRY2bm52UmpLuCID1Jx5tOcbxw4Orc87eouuCJSo8Vwx5z0h6Wy3EvIzHGIGM+V
         mcjgn6TjxuU+/ga8PmzfEZrfLB3iExlJ3EVwHkl7uO7UpQiCEJQOHG81EL4Oau8YxkVO
         1nzw==
X-Gm-Message-State: AOJu0YxSsbC62vZxHBECrOAZZ94UXEdxQUMX/y0H7uX0HWjAdVHIgwA3
	HdmmU7Ul/0t0baoUIK9QUv5Vlg9BFLB42dd3kc5FfLe24LMwZX+rCL51HNaK0Fzvl3taDo8GQYh
	3ppEq
X-Gm-Gg: AR+sD11ScO9Q6cCqHtxDNsg+20OL1sYXYsUc41L55IVxh4O5b05G+jolDSUmZg61dRR
	6ay9VnXYPLJN9cMI2DvsSjrtyF4V/Peoeny7lnyWr9XhUQfkHtsIoDfgk9dP/+Ia8X6sfAz87Lv
	cWPFp+dbKcMi+IJoqeKmG7enkqJIfGCFSF5pwAvHQfRE2qjkq9Bm74S1Jg6483q8kJgr/lKWCyp
	yeILcsX3fHDgW1QrYqwBF4IM4gZ3TTy2p7WSm2FudbSTQmApDVbyaS4c6jPJUrBClNKe1qx/LLZ
	x5xuN/QBNp9/L35lOECIXgVLFi8BzcCj03Peuunh+jY2A5LnP761VzRecaVyFLf1Hmc9/pc8Y7P
	wStYONuZsFlnFAT7KGXyY9aZ8qtk96orKyFUhVQcL8bJDsIffG2eEiBVa/5eSKi2KMBq6E6CzIf
	t9ihKPqGIY6pS9bdo8PK9qwOgt39St0Vd4JBcDDMth4ZIlSr0fWX3W2ERC5FRlU6JqpfWDEaodW
	nfOlq1HdE7H0R+AiwUHtGt6RPardryfnxUA6CANBdJgbG9C5g==
X-Received: by 2002:a05:600c:19cf:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4982b1fe255mr23440215e9.18.1785741611381;
        Mon, 03 Aug 2026 00:20:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 1/5] x86/emul: Introduce x86_decode_lite()
Date: Mon,  3 Aug 2026 08:20:02 +0100
Message-Id: <20260803072006.9678-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260803072006.9678-1-andrew.cooper3@citrix.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785741612-3B4D3034-D2B7BA1C/0/0
X-purgate-type: clean
X-purgate-size: 14873

In order to relocate all IP-relative fields in an alternative replacement
block, we need to decode the instructions enough to obtain their length and
any relative fields.

Full x86_decode() is far too heavyweight, so introduce a minimal form which
can make several simplifying assumptions.

This a mostly-complete decoder for integer instruction in the onebyte and
twobyte maps.  Some instructions are intentionally unrecognised, as finding
them in an alternative is more likely to be a bug than intentional.  Some
instruction groups and prefixes are unimplemented to reduce decode complexity.

This logic can decode all alternative blocks that exist in Xen right now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v3:
 * Rearrange decode tables to satisfy comment requests without splitting
 * Recognise UDB now it's used by Xen
 * Fix MISRA violations
 * Misc other changes

v2:
 * Switch to 0 on failure, rel_sz in bytes
 * Mostly complete the integer instructions; paird with userspace harness
 * Put in .init when !CONFIG_LIVEPATCH
---
 xen/arch/x86/x86_emulate/Makefile      |   6 +
 xen/arch/x86/x86_emulate/decode-lite.c | 330 +++++++++++++++++++++++++
 xen/arch/x86/x86_emulate/x86_emulate.h |  14 ++
 3 files changed, 350 insertions(+)
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

diff --git a/xen/arch/x86/x86_emulate/Makefile b/xen/arch/x86/x86_emulate/Makefile
index 295e602f6b86..679bddbb1584 100644
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -17,3 +17,9 @@ obj-y += decode.o
 obj-$(CONFIG_HVM) += fpu.o
 obj-y += util.o
 obj-y += util-xen.o
+
+ifeq ($(CONFIG_LIVEPATCH),y)
+obj-y += decode-lite.o
+else
+obj-bin-y += decode-lite.init.o
+endif
diff --git a/xen/arch/x86/x86_emulate/decode-lite.c b/xen/arch/x86/x86_emulate/decode-lite.c
new file mode 100644
index 000000000000..131cc07d5516
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/decode-lite.c
@@ -0,0 +1,330 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifdef __XEN__
+# include <xen/init.h>
+# include <xen/livepatch.h>
+#endif
+
+#include "private.h"
+
+#undef ModRM
+
+/*
+ * Bare minimum x86 instruction decoder to parse the alternative replacement
+ * instructions and locate the IP-relative references that may need updating.
+ *
+ * These are:
+ *  - disp8/32 from near direct branches
+ *  - RIP-relative memory references
+ *
+ * The following simplifications are used:
+ *  - All code is 64bit, the instruction stream is well formed and safe to
+ *    read.
+ *  - Instruction groups and prefixes not used by Xen's current alternatives
+ *    are not implemented in order to reduce the decode complexity.
+ *  - Certain instructions are intentionally not recognised, when it is more
+ *    likely for their presence to be an error than intentional.
+ *
+ * Inputs:
+ *  @ip  The position to start decoding from.
+ *  @end End of the replacement block.  Exceeding this is considered an error.
+ *
+ * Returns: x86_decode_lite_t
+ *  - On failure, length of 0.
+ *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
+ *    field in the instruction stream.
+ */
+x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
+{
+#define Imm8   (1 << 0)
+#define Imm    (1 << 1)
+#define Moffs  (1 << 2)
+#define Branch (1 << 5) /* Near direct branches, which have a displacement */
+#define ModRM  (1 << 6)
+#define Known  (1 << 7)
+
+    static const uint8_t init_or_livepatch_const onebyte[256] = {
+
+#define ALU_OPS(x)                              \
+        [(x) + 0] = (Known|ModRM),              \
+        [(x) + 1] = (Known|ModRM),              \
+        [(x) + 2] = (Known|ModRM),              \
+        [(x) + 3] = (Known|ModRM),              \
+        [(x) + 4] = (Known|Imm8),               \
+        [(x) + 5] = (Known|Imm)
+
+        ALU_OPS(0x00) /* ADD */, ALU_OPS(0x08) /* OR  */,
+        ALU_OPS(0x10) /* ADC */, ALU_OPS(0x18) /* SBB */,
+        ALU_OPS(0x20) /* AND */, ALU_OPS(0x28) /* SUB */,
+        ALU_OPS(0x30) /* XOR */, ALU_OPS(0x38) /* CMP */,
+
+#undef ALU_OPS
+
+        [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
+
+        [0x62]          = 0,                   /* BOUND, but also EVEX prefix, not implemented. */
+        [0x63]          = (Known|ModRM),       /* MOVSxd */
+
+        [0x68]          = (Known|Imm),         /* PUSH $imm */
+        [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm */
+        [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
+        [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8 */
+        [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
+        [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
+        [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
+        [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
+
+        [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
+        [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA */
+        [0x8f]          = 0,                   /* Grp1A - POP but also XOP prefix, not implemented. */
+        [0x90 ... 0x99] = (Known),             /* NOP/XCHG %rAX/CLTQ/CQTO */
+
+        [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
+        [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
+        [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
+        [0xa8]          = (Known|Imm8),        /* TEST %al */
+        [0xa9]          = (Known|Imm),         /* TEST %rAX */
+        [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
+        [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
+        [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
+        [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
+
+        [0xc3]          = (Known),             /* RET */
+        [0xc4 ... 0xc5] = 0,                   /* LES/LDS but also VEX prefixes, not implemented. */
+        [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
+        [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
+
+        [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
+        [0xcd]          = (Known|Imm8),        /* INT $imm8 */
+
+        [0xd0 ... 0xd3] = (Known|ModRM),       /* Grp2 (ROL..SAR {$1,%cl}, %reg) */
+
+        [0xd6]          = (Known),             /* UDB */
+
+        [0xe4 ... 0xe7] = (Known|Imm8),        /* IN/OUT $imm8 */
+        [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
+
+        [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
+        [0xec ... 0xef] = (Known),             /* IN/OUT %dx */
+
+        [0xf1]          = (Known),             /* ICEBP */
+
+        [0xf4]          = (Known),             /* HLT */
+        [0xf5]          = (Known),             /* CMC */
+        [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3, Further ModRM decode */
+        [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
+        [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
+    };
+    static const uint8_t init_or_livepatch_const twobyte[256] = {
+        [0x00 ... 0x03] = (Known|ModRM),       /* Grp6/Grp7/LAR/LSL */
+
+        [0x0b]          = (Known),             /* UD2 */
+
+        [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
+        [0x20 ... 0x23] = (Known|ModRM),       /* MOV %cr/%dr */
+
+        [0x30 ... 0x33] = (Known),             /* WRMSR/RDTSC/RDMSR/RDPMC */
+
+        [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
+
+        [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
+        [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
+
+        [0xa0 ... 0xa2] = (Known),             /* PUSH/POP %fs/CPUID */
+        [0xa3]          = (Known|ModRM),       /* BT */
+        [0xa4]          = (Known|ModRM|Imm8),  /* SHLD $imm8 */
+        [0xa5]          = (Known|ModRM),       /* SHLD %cl */
+
+        [0xa8 ... 0xa9] = (Known),             /* PUSH/POP %gs */
+
+        [0xab]          = (Known|ModRM),       /* BTS */
+        [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
+        [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl/Grp15/IMUL */
+
+        [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/UD1 */
+        [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
+        [0xbb ... 0xbf] = (Known|ModRM),       /* BTC/BSF/BSR/MOVSX */
+        [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */
+        [0xc7]          = (Known|ModRM),       /* Grp9 */
+        [0xc8 ... 0xcf] = (Known),             /* BSWAP */
+    };
+
+    void *start = ip, *rel = NULL;
+    unsigned int opc, rel_sz = 0;
+    uint8_t b, d, rex = 0, osize = 4;
+
+#define OPC_TWOBYTE (1 << 8)
+
+    /* Mutates IP, uses END. */
+#define FETCH(ty)                                       \
+    ({                                                  \
+        ty _val;                                        \
+                                                        \
+        if ( (ip + sizeof(ty)) > end )                  \
+            goto overrun;                               \
+        _val = *(ty *)ip;                               \
+        ip += sizeof(ty);                               \
+        _val;                                           \
+    })
+
+    for ( ;; ) /* Prefixes */
+    {
+        switch ( b = FETCH(uint8_t) )
+        {
+        case 0x26: /* ES override */
+        case 0x2e: /* CS override */
+        case 0x36: /* DS override */
+        case 0x3e: /* SS override */
+        case 0x64: /* FS override */
+        case 0x65: /* GS override */
+        case 0xf0: /* LOCK */
+        case 0xf2: /* REPNE */
+        case 0xf3: /* REP */
+            break;
+
+        case 0x66: /* Operand size override */
+            osize = 2;
+            break;
+
+        /* case 0x67: Address size override, not implemented */
+
+        case 0x40 ... 0x4f: /* REX */
+            rex = b;
+            continue;
+
+        default:
+            goto prefixes_done;
+        }
+        rex = 0; /* REX cancelled by subsequent legacy prefix. */
+    }
+ prefixes_done:
+
+    if ( rex & REX_W )
+        osize = 8;
+
+    /* Fetch the main opcode byte(s) */
+    if ( b == 0x0f )
+    {
+        b = FETCH(uint8_t);
+        opc = OPC_TWOBYTE | b;
+
+        d = twobyte[b];
+    }
+    else
+    {
+        opc = b;
+        d = onebyte[b];
+    }
+
+    if ( unlikely(!(d & Known)) )
+        goto unknown;
+
+    if ( d & ModRM )
+    {
+        uint8_t modrm = FETCH(uint8_t);
+        uint8_t mod = modrm >> 6;
+        uint8_t reg = (modrm >> 3) & 7;
+        uint8_t rm = modrm & 7;
+
+        /* ModRM/SIB decode */
+        if ( mod == 0 && rm == 5 ) /* RIP relative */
+        {
+            rel = ip;
+            rel_sz = 4;
+            FETCH(int32_t);
+        }
+        else if ( mod != 3 && rm == 4 ) /* SIB */
+        {
+            uint8_t sib = FETCH(uint8_t);
+            uint8_t base = sib & 7;
+
+            if ( mod == 0 && base == 5 )
+                goto disp32;
+        }
+
+        if ( mod == 1 ) /* disp8 */
+            FETCH(int8_t);
+        else if ( mod == 2 ) /* disp32 */
+        {
+        disp32:
+            FETCH(int32_t);
+        }
+
+        /* ModRM based decode adjustements */
+        switch ( opc )
+        {
+        case 0xc7: /* Grp11 XBEGIN is a near direct branch. */
+            if ( modrm == 0xf8 )
+                d |= Branch;
+            break;
+
+        case 0xf6: /* Grp3 TEST(s) have extra Imm8 */
+            if ( reg == 0 || reg == 1 )
+                d |= Imm8;
+            break;
+
+        case 0xf7: /* Grp3 TEST(s) have extra Imm */
+            if ( reg == 0 || reg == 1 )
+                d |= Imm;
+            break;
+        }
+    }
+
+    if ( d & Branch )
+    {
+        /*
+         * We don't tolerate 66-prefixed call/jmp in alternatives.  Some are
+         * genuinely decoded differently between Intel and AMD CPUs.
+         *
+         * We also don't implement APX instructions, so don't have to cope
+         * with JMPABS which is the first branch to have an 8-byte immediate.
+         */
+        if ( osize < 4 )
+            goto bad_osize;
+
+        rel = ip;
+        rel_sz = (d & Imm8) ? 1 : 4;
+    }
+
+    if ( d & (Imm | Imm8 | Moffs) )
+    {
+        if ( d & Imm8 )
+            osize = 1;
+        else if ( d & Moffs )
+            osize = 8;
+        else if ( osize == 8 && !(opc >= 0xb8 && opc <= 0xbf) )
+            osize = 4;
+
+        switch ( osize )
+        {
+        case 1: FETCH(uint8_t);  break;
+        case 2: FETCH(uint16_t); break;
+        case 4: FETCH(uint32_t); break;
+        case 8: FETCH(uint64_t); break;
+        default: goto bad_osize;
+        }
+    }
+
+    return (x86_decode_lite_t){ ip - start, rel_sz, rel };
+
+ bad_osize:
+    printk(XENLOG_ERR "%s() Bad osize %u in %*ph\n",
+           __func__, osize,
+           (int)(unsigned long)(end - start), start);
+    return (x86_decode_lite_t){ 0, 0, NULL };
+
+ unknown:
+    printk(XENLOG_ERR "%s() Unknown opcode in %*ph <%02x> %*ph\n",
+           __func__,
+           (int)(unsigned long)(ip - 1 - start), start, b,
+           (int)(unsigned long)(end - ip), ip);
+    return (x86_decode_lite_t){ 0, 0, NULL };
+
+ overrun:
+    printk(XENLOG_ERR "%s() Decode overrun, got %*ph\n",
+           __func__,
+           (int)(unsigned long)(end - start), start);
+    return (x86_decode_lite_t){ 0, 0, NULL };
+
+#undef FETCH
+}
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 0fd20747dc43..566a8297d8a5 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -835,4 +835,18 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
     ctxt->event = (struct x86_event){};
 }
 
+/*
+ * x86_decode_lite().  Very minimal decoder for managing alternatives.
+ *
+ * @len is 0 on error, or nonzero on success.  If the instruction has a
+ * relative field, @rel_sz is nonzero, and @rel points at the field.
+ */
+typedef struct {
+    uint8_t len;
+    uint8_t rel_sz; /* bytes: 0, 1 or 4 */
+    void *rel;
+} x86_decode_lite_t;
+
+x86_decode_lite_t x86_decode_lite(void *ip, void *end);
+
 #endif /* __X86_EMULATE_H__ */
-- 
2.39.5


