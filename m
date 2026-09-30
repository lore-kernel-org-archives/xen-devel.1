Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F14FCA5FCB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437550.1656526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6T-0004YJ-72; Wed, 30 Sep 2026 16:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437550.1656526; Wed, 30 Sep 2026 16:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6T-0004Y4-3a; Wed, 30 Sep 2026 16:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1437550;
 Wed, 30 Sep 2026 16:24:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6R-0004A4-3Y
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6Q-00GhY9-GY
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a8-8faa-0a2a0a5109dd-0a2a45069d94-10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:18 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b2-195a-0a2a45060019-4a7de18cdcb8-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:18 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso7623975e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:18 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785458; x=1791390258; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xiv16fYVgxMc56Axoq7ltl4tzNqcJaTaSmINYec2Vfs=;
        b=MHgrv1l8jBJvZ04KEyhFm+FNGpnKz0/oV0bZt8F3vrcHG/KDcwqNd1ElwsVx1xhWCD
         fqB5CvBy60juUXwM28wOLm+f+DDWncaOYk5rckGqQuSXtixSJZsksIL0ZLtm1JoT9UZ9
         WZpqZFa9oWecZNytvo235EGssyXznXyRzIsoTmZ7jqfGPDUqcwX+v8o24X66vTHR9LFi
         nRLOSRWY9IIrskWEI7ooeFtDIzuwf2fbngILkuSP9Ek6o/p3QXZahRnRFHdhvaJ6Dxch
         Gz8SDwZlo0/a65aPOqrcU+ts1G6cvByKo8gme1OKwuJBT0mBAmL+cggYOvkYaGYxTNRN
         79OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785458; x=1791390258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xiv16fYVgxMc56Axoq7ltl4tzNqcJaTaSmINYec2Vfs=;
        b=MXBdFJNZeXTJWVG6BaaeSlHPGwSs2Cyb/P7Yk04lQX/x8PfekGD5+gooRCIKt84My2
         jyTfcR1CKGlfvDqL7K/ajxa/+HoDV1C49sorWZ/IPL81FiblSkeBTNXF9CVwoxPul3Mb
         /w/m6sIZp7FsEASvmcd3/ADvpfpfYSGkQP30Qc+jnexjbNdN3Yj0YNs5cG0GCaGvv4Jm
         VVA1JdiVMjZlfvnS7u0lu5ai8uLfgTTX7AvKnEHw7CdquAXJGnsi263RLzYH0TiVM8Rt
         3GDrQFUXynE31wfOxFepVfQ4TDHwa80JDi2gdnvktDkb3SKK+3fL6BE4+YhKS06+Tofz
         CMUw==
X-Gm-Message-State: AFuF++l/WwJN3LiKFgSbovRqKHWErzs+fIi59C22iuOu+Pm1NWk49oSa
	nIHhwgqBmJFkrhD3zL+6uKsQsDZuzJihe0tCB83xWLADgIl6Fq/LFHNCUrhJXA==
X-Gm-Gg: AYBFou3i2ESwAs8gSq8jWwvXPMJqz5dCRJ3klPMNJG+lAVBoRnq3mi0+0L9bXJNNj5I
	fEchgpnjUehB2DZyck6h+SADocf5fVzdPPx2fsibWOyE577+OxTCywP3Vbp31CVTO5LJB2NLxfD
	l8CIB5qNHzx0oFQDIqlQJiIa2PyocS80tkJ80oA62VMy5QqRYwEgpjXXBx5euYt4hFbFeJWbck+
	gSNIuCFJS8Y7wll+Jo2xnMNT0Xl7h4/tEIPB9PLShdEHdBVbif7XSPxZPqBFgHPHqO2m3FL9shD
	ZuA4Ccjl0onSvyzv1YH+W1I99U4t+aj5kZXmQXtjCETi+ADl+b4vqW+uv6338TG/5sJPoORxnxC
	VzUsLUSSgZmgdlR0c2NHOhFtDDd29bHYiNUn78KUJkKb5Bn5idjrCpGj8DLNj7LE/MB/JwnCwUD
	Fg5J4ZAAVQdxDg0pTDjnz71VRHW9cTB53V4ENSzYr5/qe0OfSJVkPjGl0KnJGjqpbjjba0XGiJN
	59v84iQLJ4rG9Nue5X4QZGIGpYLDWUD6RfYMNk527RkJwP1O/o=
X-Received: by 2002:a05:600d:864a:20b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a01eaafdb4mr3092985e9.0.1790785457829;
        Wed, 30 Sep 2026 09:24:17 -0700 (PDT)
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
Subject: [PATCH v3 16/39] xen/riscv: decouple INSN_PSEUDO_VS_* from the hypervisor's XLEN
Date: Wed, 30 Sep 2026 18:23:35 +0200
Message-ID: <198c5d8b140fb156b914eae007582ec3b0e83cba.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790785458-1FCCD77B-E65D8CB8/10/73395122804
X-purgate-type: spam
X-purgate-size: 3246

htinst reports a pseudoinstruction when a guest page fault is taken on an
implicit memory access done for VS-stage address translation. Four such
values are defined, differing in the access type (read or write) and in the
access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).

That width is the width of a VS-stage PTE, i.e. it follows the guest's
paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
to do with the XLEN Xen itself is built for. Yet only one pair is defined,
selected by Xen's XLEN and named as if it were the only one, so the 4-byte
forms, which a guest running with VSXL=32 and Sv32 in vsatp produces, can't
be named at all on RV64.

Define all four values unconditionally instead, named after the access width
they encode rather than after the build's XLEN.

Dropping the ladder loses no build-time coverage: a build for an XLEN other
than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
asm/config.h, so no replacement #error is needed here. Adding one keyed on
CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
patch removes.

This diverges from the imported version of riscv_encoding.h.

No functional change: the values have no user.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message: the values no longer have a user in this
   series, as htinst_is_pseudo() recognizes a pseudoinstruction by its
   bits[1:0].
 - Use VSXLEN=32/64 instead of RV32/64 in the comments of the
   corresponding definitions.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/riscv_encoding.h | 24 +++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 599ae3cd601a..2dbfd4d16067 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -837,25 +837,17 @@
 #define INSN_MASK_FENCE_TSO		0xffffffff
 #define INSN_MATCH_FENCE_TSO		0x8330000f
 
-#if __riscv_xlen == 64
-
-/* 64-bit read for VS-stage address translation (RV64) */
-#define INSN_PSEUDO_VS_LOAD		0x00003000
-
-/* 64-bit write for VS-stage address translation (RV64) */
-#define INSN_PSEUDO_VS_STORE	0x00003020
+/* 64-bit read for VS-stage address translation (VSXLEN=64) */
+#define INSN_PSEUDO_VS_LOAD64		0x00003000
 
-#elif __riscv_xlen == 32
+/* 64-bit write for VS-stage address translation (VSXLEN=64) */
+#define INSN_PSEUDO_VS_STORE64		0x00003020
 
-/* 32-bit read for VS-stage address translation (RV32) */
-#define INSN_PSEUDO_VS_LOAD		0x00002000
+/* 32-bit read for VS-stage address translation (VSXLEN=32) */
+#define INSN_PSEUDO_VS_LOAD32		0x00002000
 
-/* 32-bit write for VS-stage address translation (RV32) */
-#define INSN_PSEUDO_VS_STORE	0x00002020
-
-#else
-#error "Unexpected __riscv_xlen"
-#endif
+/* 32-bit write for VS-stage address translation (VSXLEN=32) */
+#define INSN_PSEUDO_VS_STORE32		0x00002020
 
 #define INSN_IS_16BIT(insn)	(((insn) & 3) != 3)
 #define INSN_IS_32BIT(insn)	(!INSN_IS_16BIT(insn) && ((insn) & 0x1c) != 0x1c)
-- 
2.55.0


