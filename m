Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A847DCCA466
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451118.1666307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdt-0001kO-Bp; Thu, 15 Oct 2026 21:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451118.1666307; Thu, 15 Oct 2026 21:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdt-0001kG-8M; Thu, 15 Oct 2026 21:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1451118;
 Thu, 15 Oct 2026 21:05:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHSdr-0001Xc-Fk
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:05:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHSdq-003e3Q-Sx
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 23:05:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad13ffb-2eae-0a2a0a5409dd-0a2a4503a4b8-20
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:34 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad1401e-fae8-0a2a45030019-d155dd29a90a-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:34 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48dfdd431dcso13316f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:05:34 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm501163f8f.35.2026.10.15.14.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:05:33 -0700 (PDT)
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
        d=citrix.com; s=google; t=1792098334; x=1792703134; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I7s5tVz0MwtGzZyVlACkfNL1uI1i80HieuLj+FjBvBc=;
        b=LsrovbqZmN4bJySFxUh2OwqTSt5LmP9VSt5Hlt7nT7y9OrA1nxMRUAKFV2Us3egD5e
         OOtkbHtfzOqwptnfr+yDOdNH0R/aqTpfsRwKJlIWVseur6CKWLlRXcK05x7fpB3C9D5/
         NCyztAeApxrACSWLouJzhdlInB6s8D5UtUAQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098334; x=1792703134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7s5tVz0MwtGzZyVlACkfNL1uI1i80HieuLj+FjBvBc=;
        b=PRYbj+DFC3qEV8i91nMBM2BHhd6AkXuZFtPpLRW8rqjntIpA87WWM6Z3Uo5CwKR60k
         DCvKTAkjVe9rEGFzGKrmCP2vNGi9bKhnx/LasjimyxZoi8JJyyXA034ID1k1q1QN9mxv
         6Z44dOAVFz/bFwpJ5kC3hiCc8qU16ycv6PNSQ1GPkx7sVm2kGTkpDBqJTA9122INBrpJ
         cK4LLJRRQ4MpUcgy8bMHdxErCW4lv3zFLl346Q/IGpPkA/FtN8zTsLIaDyjbkN37kXpl
         c4iznDwZbqRZ27sDD5wM7uWHCzUFCqhIK5yuHabsW2pTgHVz7kA6VCg9bZbCCoyPnxHI
         wMaw==
X-Gm-Message-State: AFq9FYKJP+lt0isLMavCQCk+xk9LYdS7D7xQF5pr8B1Wi4j45yfwiEsq
	BRoqNgN9vbDKiif+gnB6vHHa+iQOeM/UrmrgZMezKNT9diggJU+E1oJFOGQd9wBNeBKaMxTZfHa
	J0rRl/BQ=
X-Gm-Gg: AYBFou3FWeZYugf6A32ynjqqBcPKJrjNU52tWAB18Aldoe8fXWtJmMfqd2m/1qOjPzy
	jqrR7JGezH369Ggd/V/gYW/59KjwY8LFCqwFd2J84305vnyc1aclhnTnoT6ISne+BsZhgB5h14/
	Jz/qNZ/AMzbtvsaCT3GobvUD83PISWzzo/G+UYO1sZ4E5bYo1kPhYuiLAA/aiqkXzPKLxUnDsCk
	IGb3GIyM/+LC9FfpyS4JPsNVeGi7/oldzdMrWsamr+BaMINk52+5B0ykq6WaX82ferOp378iGZL
	6rhiudeHa/DFsg2i4VHSYLQ1UwRq2itWiIK/1VpjCy6SZsN+67z36bfkICBMkiouTiT3YaWxEkq
	pTN3PXRD7bmB46/RTGXQ+rorg018IY+lTigG55ch40uEIllSBQ2sht3L/sCyq2qwA5j05BRqCVB
	/Lyn19BlAOnIo0Tk2+DjtxpyRoP16r007/hpfB6ehwgMT3oRyB/Zqu+agPVqEalskU9chkWBIRk
	NmFcaHSUHrlwMxUHKc5S1WJzvHnKP7UIt2WCUmUesQlAFGy
X-Received: by 2002:a05:6000:250f:b0:488:8566:9986 with SMTP id ffacd0b85a97d-48dfadf3358mr3057663f8f.2.1792098334102;
        Thu, 15 Oct 2026 14:05:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 1/5] x86/emul: Introduce x86_decode_lite()
Date: Thu, 15 Oct 2026 22:05:26 +0100
Message-Id: <20261015210530.786604-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015210530.786604-1-andrew.cooper3@citrix.com>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1792098334-77EC24E9-77D37672/10/78276251493
X-purgate-type: spam
X-purgate-size: 14993

In order to relocate all IP-relative fields in an alternative replacement
block, we need to decode the instructions enough to obtain their length and
any relative fields.

Full x86_decode() is far too heavyweight, so introduce a minimal form which
can make several simplifying assumptions.

This a mostly-complete decoder for integer instruction in the onebyte and
twobyte maps.  Some instructions are intentionally unrecognised, as finding
them in an alternative is more likely to be a bug than intentional.  Some
instruction groups and prefixes are unimplemented to reduce decode complexity,
as this will be a fasthpath during patching.

This logic can decode all alternative blocks that exist in Xen right now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v4:
 * Optimise switch ( osize )
 * Optimise SIB
 * Don't mention "replacement block" in function comment.

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
 xen/arch/x86/x86_emulate/decode-lite.c | 331 +++++++++++++++++++++++++
 xen/arch/x86/x86_emulate/x86_emulate.h |  14 ++
 3 files changed, 351 insertions(+)
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
index 000000000000..f0ab4d38c81b
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/decode-lite.c
@@ -0,0 +1,331 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifdef __XEN__
+# include <xen/init.h>
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
+ *  @end End of the code block.  Exceeding this is considered an error.
+ *
+ * Returns: x86_decode_lite_t
+ *  - On failure, length of 0.
+ *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
+ *    field in the instruction stream.
+ */
+x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, const void *end)
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
+                FETCH(int32_t);
+        }
+
+        if ( mod == 1 ) /* disp8 */
+            FETCH(int8_t);
+        else if ( mod == 2 ) /* disp32 */
+            FETCH(int32_t);
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
+        case 1:
+        case 2:
+        case 4:
+        case 8:
+            if ( ip + osize > end )
+                goto overrun;
+            ip += osize;
+            break;
+
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
index 4539b14c1534..a2f9b5e2a2cf 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -769,4 +769,18 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
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
+x86_decode_lite_t x86_decode_lite(void *ip, const void *end);
+
 #endif /* __X86_EMULATE_H__ */
-- 
2.39.5


