Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78BC61DCD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400926.1636602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvL-0007ly-Vm; Thu, 27 Aug 2026 15:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400926.1636602; Thu, 27 Aug 2026 15:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvL-0007ld-Ou; Thu, 27 Aug 2026 15:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1400926;
 Thu, 27 Aug 2026 15:21:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvJ-0007Oe-Rk
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvJ-00FiCE-8G
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9055fd-bab6-0a2a0a5309dd-0a2a4503983c-24
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:49 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90560d-fae8-0a2a45030019-d155802aad93-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:49 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so9201085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:49 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844109; x=1788448909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcNrz4VvoxOmwdg7GYQ3jroj3OtmNT9ZQb6a2V47tT8=;
        b=aeK+tFt0xdiOJHv9qAlGDtqdRMKrxPx/gm+M++ET2KhZEmTDUsVY8LdsEtZzaO09dh
         fmzPcaNbTeSbW8/hJwoug99HdySRRqthB/efJkBfMwMPdN8o8KWN/XD6XTG0x8BpxmFc
         H/tmztIxu2KiSckUlarqkpiB41K6NyUQ3sBXuGvOULAHLdc4TMDociak+NHoFI8Qx+8i
         Ecne27GoLBtwzmx7RGSqsWRSPyR5UooKlfMGZ9eNqp+d4PkBODULSf6+7Qmm7mepc4CO
         aK4coZLV0apLl6v69IAQkGuyCqLO216ROA1xZFbm07L3WC13/t8DByIV+aX7bT6hhE9i
         uXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844109; x=1788448909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcNrz4VvoxOmwdg7GYQ3jroj3OtmNT9ZQb6a2V47tT8=;
        b=Ut1HUP9083kvNfz8RrCShCcYgHxQAUi6QTTPb4e5ocV56FogOsbChqOeIIPEJ9Ns5e
         6ozyiceZz+9/Qxebn4Gam1xjnHCPeZhZxpHpntbX+DiYV/4uhVSTKkhShL/X5IhmZq59
         uqrxgh79OWsTH8UjW/WJbx43Mb/VCYIDzRgWyAcnUqnUk8ZC9sPBf/mJC/nBK9pqO29D
         OlSaizPFpJhWa5QmzGkaK2eXKfZ+ISdi02NoQYPgsi0NERtfQAkMIqvX4tMuOXVjRQ3N
         bOATHCLwPSAmk2djyT8Ul9U4kicOliizesoA6rXakdJqPw6xD3rv0ouSaldZ+CLmRkoO
         T4VA==
X-Gm-Message-State: AFuF++lvBP1MsyYSnovYTpMB/iLQLy4j/XK6dxXGAmwbxmMBfbuq4WtP
	NhcZgfaGP7dKaez45PqeTOxXXcXa40/uavEdAYXirG9j2DDAqpEq+cnWPhgOOQ==
X-Gm-Gg: AR+sD13vq+FE7DlNqEVgg0+FszAUC2jkFzYJErP+026+UbdlW41k9fYo+X9MY6t89RK
	J01qUhCNIy4+jERlP6OkDl5N04hrCQaRqcDT115ppz5c2tw8zeB7kB50C1wLw+earRRnziIhX9a
	J1bt56jz9qsgAeyYUdOmLbnyAqY446JvNV+GNvi2lBkxqFNvF+HtO4M6zuRGf5cvyIwIqexPI+2
	0GWggWoGtfjhFTQtB2V9mJDaqCQ6qgiFi8CLswyzmmp1o2DCA4w5WBsZ3zkQ9zkTJl/ZLI4ypj9
	CWpgW7lVW1vmJ9CHhfZpK79X3ORKNGrXHnrDzfppoO7LtrT2dfmb+IO4wQRoN2dJWC4CmLiefz6
	shGS7+ZarO8hUOxh3Po1eAb6oieGvt6cBPLVQepcvkEk4FJjL82wHMjAA3ZVBNKwNVccFtlm8Zg
	DWXA+I5h+3BxE9hsWQ28/Drlu15W8lbpqngfAoX4hJXwGtaUv3RzKKd95t70IhgLYNkTHjNm3Mr
	eHUiSF37Own0jKH4pNjtOhgjgucsvvu
X-Received: by 2002:a05:600c:c8f:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-499dc6f68b5mr163811375e9.5.1787844108307;
        Thu, 27 Aug 2026 08:21:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 07/39] xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h
Date: Thu, 27 Aug 2026 17:20:51 +0200
Message-ID: <b3e0c1a662403ea2aa84a1943223ad0885733d0f.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787844109-6EECA4E9-343351B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 5998

These definitions are required for correct decoding of APLIC MMIO
accesses and target configuration, and will be used by both the
physical and virtual APLIC implementations.

While adding them, rearrange the header in the style of x86's
asm/msr-index.h: a register's offset is immediately followed by the
definitions of that register's fields, with the blocks sorted by
offset.  This makes the relation between a register and its fields
obvious from the layout alone, so no comment is needed to express it.

No functional change is intended by this patch; it only centralises
hardware definitions that were previously missing.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Rearrange the whole header the way x86's asm/msr-index.h is laid out:
   put each register offset first and the definitions of its fields
   immediately after it (indented by an extra space), sorted by offset.
 - Describe the convention in a comment at the top of the definitions,
   mirroring the one in asm/msr-index.h.
 - Reflow APLIC_SIZE() to fit the new alignment column.
 - Fix the comment for declaration of member target in aplic_regs[]. It
   should be 0x3004.
 - s/APLIC_REG_OFFSET_MASK/APLIC_CTRL_REGION_OFFSET_MASK
---
---
 xen/arch/riscv/include/asm/aplic.h | 90 ++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 17 deletions(-)

diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 07318aaac25d..a2af55d54fc0 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,32 +15,88 @@
 
 #include <asm/imsic.h>
 
+/*
+ * APLIC register offsets and, immediately following each of them, the
+ * definitions of the fields of the respective register:
+ *
+ * #define APLIC_$NAME                      0x$OFFSET
+ * #define  APLIC_$NAME_$FIELD1             ...
+ * #define   APLIC_$NAME_$FIELD1_$VAL       ...
+ * #define  APLIC_$NAME_$FIELD2             ...
+ *
+ * Blocks of related constants are sorted by register offset.
+ */
+
+#define APLIC_CTRL_REGION_OFFSET_MASK       0x3fff
+
+#define APLIC_DOMAINCFG                     0x0000
 /*
  * domaincfg read-only fields (AIA spec):
  *  - bits [31:24] -> read-only 0x80
  *  - bit 7        -> read-only 0
  */
-#define APLIC_DOMAINCFG_RO      (0x80U << 24)
-#define APLIC_DOMAINCFG_IE      BIT(8, U)
-#define APLIC_DOMAINCFG_DM      BIT(2, U)
-#define APLIC_DOMAINCFG_BE      BIT(0, U)
+#define  APLIC_DOMAINCFG_RO             (0x80U << 24)
+#define  APLIC_DOMAINCFG_IE             BIT(8, U)
+#define  APLIC_DOMAINCFG_DM             BIT(2, U)
+#define  APLIC_DOMAINCFG_BE             BIT(0, U)
+
+#define APLIC_SOURCECFG_BASE            0x0004
+#define APLIC_SOURCECFG_LAST            0x0ffc
+/*
+ * sourcecfg[] register fields:
+ *  - bit 10 (D) selects the layout of the remaining bits;
+ *  - D = 1: bits [9:0] hold the Child Index, i.e. the source is delegated
+ *           to a child domain (unsupported by Xen);
+ *  - D = 0: bits [2:0] hold the source mode SM (WARL).
+ */
+#define  APLIC_SOURCECFG_D              BIT(10, U)
+#define  APLIC_SOURCECFG_SM             GENMASK(2, 0)
+#define   APLIC_SOURCECFG_SM_INACTIVE   0x0
+#define   APLIC_SOURCECFG_SM_DETACH     0x1
+/* Bits 0x2 and 0x3 are reserved */
+#define   APLIC_SOURCECFG_SM_EDGE_RISE  0x4
+#define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
+#define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
+#define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
+
+#define APLIC_SMSICFGADDR               0x1bc8
+#define APLIC_SMSICFGADDRH              0x1bcc
+
+#define APLIC_SETIP_BASE                0x1c00
+#define APLIC_SETIP_LAST                0x1c7c
+#define APLIC_SETIPNUM                  0x1cdc
+
+#define APLIC_CLRIP_BASE                0x1d00
+#define APLIC_CLRIP_LAST                0x1d7c
+#define APLIC_CLRIPNUM                  0x1ddc
+
+#define APLIC_SETIE_BASE                0x1e00
+#define APLIC_SETIE_LAST                0x1e7c
+#define APLIC_SETIENUM                  0x1edc
+
+#define APLIC_CLRIE_BASE                0x1f00
+#define APLIC_CLRIE_LAST                0x1f7c
+#define APLIC_CLRIENUM                  0x1fdc
+
+#define APLIC_SETIPNUM_LE               0x2000
 
-#define APLIC_SOURCECFG_SM_INACTIVE     0x0
-#define APLIC_SOURCECFG_SM_DETACH       0x1
-#define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
-#define APLIC_SOURCECFG_SM_EDGE_FALL    0x5
-#define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
-#define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
+#define APLIC_GENMSI                    0x3000
 
-#define APLIC_TARGET_HART_IDX_SHIFT 18
+#define APLIC_TARGET_BASE               0x3004
+#define APLIC_TARGET_LAST               0x3ffc
+#define  APLIC_TARGET_HART_IDX          GENMASK(31, 18)
+#define  APLIC_TARGET_HART_IDX_SHIFT    18
+#define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
+/* Bit 11 is reserved and reads as zero */
+#define  APLIC_TARGET_EIID              GENMASK(10, 0)
 
-#define APLIC_IDC_SIZE          32
+#define APLIC_IDC_SIZE                  32
 
-#define APLIC_MIN_SIZE          0x4000
-#define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)
+#define APLIC_MIN_SIZE                  0x4000
+#define APLIC_SIZE_ALIGN(x)             ROUNDUP(x, APLIC_MIN_SIZE)
 
-#define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
-                                 APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
+#define APLIC_SIZE(nr_cpus) \
+    (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
 
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
@@ -82,7 +138,7 @@ struct aplic_regs {
     uint8_t _reserved11[4088];  /* 0x2008 */
 
     uint32_t genmsi;            /* 0x3000 */
-    uint32_t target[1023];      /* 0x3008 */
+    uint32_t target[1023];      /* 0x3004 */
 };
 
 #endif /* ASM_RISCV_APLIC_H */
-- 
2.55.0


