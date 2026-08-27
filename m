Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0008C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400820.1636440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtG-0005NS-KB; Thu, 27 Aug 2026 15:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400820.1636440; Thu, 27 Aug 2026 15:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtG-0005NA-FU; Thu, 27 Aug 2026 15:19:42 +0000
Received: by outflank-mailman (input) for mailman id 1400820;
 Thu, 27 Aug 2026 15:19:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtE-00051g-Oi
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtE-004jWw-5T
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905585-bab6-0a2a0a5309dd-0a2a450595fe-20
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:40 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90558b-4cb1-0a2a45050019-d155dd2ebd5f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:40 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so571747f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:40 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843979; x=1788448779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDttIDGdjdAgP27+7YeB5iYqy8JtAEAvLm+aSBcX5i8=;
        b=opzs6BThVg7mMZG84Z3pG2E2tqkYNqTAw92cY0I76HY2eX6z3M2mxktzDvrKJWEHZo
         hqkSunzEq98KegLy2Erqhu8A+o2DbQ8wJpNjWdW9Y5J1eh5DFPLXXm6pt/XcFMYv8I8i
         58ej8zFUlW66QDCxqRisp/U2yhXKhJ3oDIfkmFDpPMohEPftjHg55R0z76X+PRpD5fDx
         XktNINoRvIW7o7+I5Q3TwBRcLcEObeteFOzN5RrQ4/Ph6gVWZMcxd0KuOLFOcDYT7bkE
         yrHghgIb8gJ0qFDGdVMjmSUUFyU1Xl6UU8RrmAY9AAJI+d3IME+bS5etSInQ+O7Jjxie
         7Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843979; x=1788448779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDttIDGdjdAgP27+7YeB5iYqy8JtAEAvLm+aSBcX5i8=;
        b=l6oJbEmE6v/qYcVN6nV25aMHJ+Ox2DPf4sREy76L1BdGaoXtBK4T8v9DuSTZJ2WGpE
         rbTpzFIZw0LpBDF7+y/8E6O4hOwha3IfDfyE4MZfc26gnGKjDwXYbSp1FAwvQwH6uzY6
         d6DvujUm6+rJckNerOM6X6TiapPFanJK60CqBMfG4U1nv0LgpZrxSMayGbg+7C+xLfBi
         +gVsw3GolmNJU4vgYpuP+3+Kcgg1L9ZnaClc0f68MxysU/JWCmqausQjY2ulH0gjRP9S
         l5OpfUogZh/L8afkB10UnWGClkYjqlFtyX0y7hTTukkHZ+xJb7N75oDTjsJlWtQYyaCo
         faTA==
X-Gm-Message-State: AFuF++mIEDwGbxBta8o3F+/5kiEEEgoh5HIsqKwpuaRCC8mNq5qUVkdY
	RnUxvhvI+Smtc9eAd6Vi7L1XSHyVRF8eHDgMmgq2gHygPvU4T/85Zphb97ozOg==
X-Gm-Gg: AR+sD131zSIrrewokEwlkcRc2VroRHzVk+ntyRaA3nmEjUIrkg8K3WOrnicN4b+8lBo
	dCvTCTF2ssYt/HCpMJmVWd91Kv7vXICXvoYYM35z5HPwQAtsd2GgedAkXJ2/PU1Ado9aFBIokF1
	pXHwO3QB81wFqzGiqJrTesDmcrPxeVgD5UIjTjPJgYFeGRm5ABlLTfTOiATuYvHhjmaKtC+59C8
	sPapBx8hebbGcrzshBmUJBZdKJDQWY5MiNDvN8cG42GyQMNBQPkQRJNXUI90pus1qFeOrljJs6O
	NitVcgTiBNSIYsdcrFBkR0ZKRDvT13rJWUC9H1OpWDQAZuOBDYpUkFF0P7TRhQJEqlTz+/FXIX7
	gJeoqrC1mwM5OlSFmqFsOJG3/z4Qbcy0snPHXgKOebSmCHvC19zBrT4M+V3O0GqQMME+BFxaPZC
	epiqq7rpEz5zRDVfjK5w6mug6LXD99HxCzP5NWUYJIvdg6EIp15r+hYGj0g7kwP5Ut1r5e+tdzH
	fmx6RMCUJ5mMzRDsAjfdE7ZCX86SXCM
X-Received: by 2002:a05:6000:4285:b0:482:eaa2:7d85 with SMTP id ffacd0b85a97d-482eaa281famr11837675f8f.0.1787843979492;
        Thu, 27 Aug 2026 08:19:39 -0700 (PDT)
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
Subject: [PATCH v8 10/20] xen/riscv: introduce aia_init() and aia_usable()
Date: Thu, 27 Aug 2026 17:19:03 +0200
Message-ID: <5e536829eca21aa951ba79344a012c79182b74f0.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787843980-F76BD2A1-73A65196/10/73395122804
X-purgate-type: spam
X-purgate-size: 3240

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-8:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Update the guards in asm/aia.h according to CODING_STYLE:
   s/ASM__RISCV__AIA_H/RISCV_AIA_H.
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - s/is_aia_usable/_aia_usable to drop the is_ prefix while avoiding
   conflict with the aia_usable() function name.
---
Changes in v2:
 - s/is_aia_available/is_aia_usable.
 - Drop return value for aia_init().
 - s/aia_available()/aia_usable().
---
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/aia.c             | 23 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h | 10 ++++++++++
 xen/arch/riscv/intc.c            |  3 +++
 4 files changed, 37 insertions(+)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 2d24670dfc74..8e7a6370eee2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
new file mode 100644
index 000000000000..e31c9c2d24b6
--- /dev/null
+++ b/xen/arch/riscv/aia.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/types.h>
+
+#include <asm/cpufeature.h>
+
+static bool __ro_after_init _aia_usable;
+
+bool aia_usable(void)
+{
+    return _aia_usable;
+}
+
+void __init aia_init(void)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return;
+
+    _aia_usable = true;
+}
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
new file mode 100644
index 000000000000..aaa4bf91fc75
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef RISCV_AIA_H
+#define RISCV_AIA_H
+
+bool aia_usable(void);
+
+void aia_init(void);
+
+#endif /* RISCV_AIA_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index e63da5e22efc..2864a896b677 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -9,6 +9,7 @@
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 
+#include <asm/aia.h>
 #include <asm/intc.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
@@ -33,6 +34,8 @@ void __init intc_init(void)
 {
     ASSERT(intc_hw_init_ops && intc_hw_init_ops->init);
 
+    aia_init();
+
     if ( intc_hw_init_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
-- 
2.55.0


