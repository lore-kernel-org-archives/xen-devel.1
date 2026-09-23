Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F467C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:19:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430460.1652963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Msc-0003w8-15; Wed, 23 Sep 2026 13:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430460.1652963; Wed, 23 Sep 2026 13:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Msb-0003vx-U2; Wed, 23 Sep 2026 13:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1430460;
 Wed, 23 Sep 2026 13:19:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Msa-0003qZ-4E
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:19:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MsZ-001trX-HC
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:19:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1d2-e002-0a2a0a5209dd-0a2a45088f0e-20
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:19 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1d5-f659-0a2a45080019-4a7de50cb91f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:19 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664ef783so542420eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:19:18 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:19:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169557; x=1790774357; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoknbnXiPKVvZXfcQ8PLlr7Gz40KHcVsCzqNeg5MeQU=;
        b=Pmlgkad40Nj6bAPahIrsidj6q9oS1RfMbbtINWjj3+hY5XI7iY/f+OjwPJlGJa6QOQ
         mGWq/OhQBB96I62sjSz+6AqCe8NKa79nLzxPQsdpo2IXk3O4ycntzR7KE0zy2NmGkX8a
         /wtq4oKunwoPzB/5uoQddaeQy1+SYZM3OYcmJIl0Lu88fvqvnbCzeEi/WjXtHDZ1MvAL
         KZhJ0G/FAP5/op+RCebeFoYnEBTQVaLZRFgtksbhHKaEAS6GbjKCNV0kyJJpYUo/r+6I
         QIS7bmrOC3LwN2DnhtQloRq/aSYgc/T2cMRa7Lt/MYxBel5dzecquK0U51qRO2vlChcJ
         sQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169557; x=1790774357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZoknbnXiPKVvZXfcQ8PLlr7Gz40KHcVsCzqNeg5MeQU=;
        b=bSt+Vi65MeX6DFI2rUaPHXuA4oT220Zg+PKdOMwPAF6jD/zn0XDebzdOEjB93Jcm2L
         wsjS4CPnrVpCM5D8NfbbAaL4JNvtY82vXKzazmYly62LHw2aj3QVIwwHypKdcT23Q0Gx
         ajRLkh+LuAGbE0rbuUO0BR4A5RFh7961hWxl4gvisqTHe545Q0ShpVXdNrapU7Tm1wb0
         y9VMbg4hioWYkMO0+x7bYxbK0gLVmEbD6CKuw0463Kf0/R5qr4wnSGxgVJD8sBXZHuoa
         7DMoC0KdN7FZfiDkKk4IcKYO8MBH0oPveEbyQSIZTHnFWtWVW10GBbIvLNbgAP1kW5E6
         U14g==
X-Forwarded-Encrypted: i=1; AKwUvBw0IJE1piMIDn7mC6cEykr7hIMgi5op21DZr+eyp3XSKb0hvNdZlHv5QFI6jE5AzP6uPB2/2tyQJfo=@lists.xenproject.org
X-Gm-Message-State: AFuF++m7DAy4rpdr9+kGt65fs27ZzCGax/QpXcLMF2nXeezBSxUnstBR
	YAt17NMP86pI4UWV0USs6K1qipuVdI6EFL6okBp30H5quegvmR+IUx73
X-Gm-Gg: AYBFou3NVTuaYRFdE6APzDLrsvoS9e9RcQzhCRltVeyo+zvShvFLgEkSlb2Nmn2MuML
	2xktF7e0aFYTRMS057FhhU32cW1B17BkqdH/1xMbAihK/irYzUqwZPOG0lmnhe3kABC+hQGlbMk
	4G1ksB43oT+9lgdl/WsN84ZYnN3S1lKOR9ATQB0RdTQdPqkO+xyGE2krc/vzvQgJC6t5SMRtVJr
	V4OsN0VaDM495m1RYEovRmAc+z6ZP9E15LidfbVr8JQIBaCWIlHLIzIYpGsQAtMDvpInnGcsbrc
	50BF6DRyz3Q92jF1tE6FHAcbXG+8ssYnhvAKU3Jm/v4FqYKVIqSGc3fvyxK95C7sf39TQs2rbLg
	PULRdaZYKiZs9YgSHfQ5S/toUvldM+YHAiGpVpCvec1F8F5vTAKxaNeI+ey+MBNYDlV8F82L8Th
	bREDIfHM57o9xdKEbDKS5EcRnVTwretrnyoWhdkRw7WyqAxrUcc5vTyI5jRvksJDTcH8Qxj5RxT
	aFyT/k33B86ZcPZqe0fnZqMG6d6QHVX4JZ9oeERBg==
X-Received: by 2002:a05:7300:dd05:b0:33b:eea2:cbfe with SMTP id 5a478bee46e88-33e8dec5b02mr2370454eec.32.1790169556543;
        Wed, 23 Sep 2026 06:19:16 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 014/114] target-info: add i386 and x86_64 helpers
Date: Wed, 23 Sep 2026 21:14:48 +0800
Message-ID: <20260923131635.1894-15-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790169559-D497287B-E0D0FD19/0/0
X-purgate-type: clean
X-purgate-size: 2573

This is added for latter use with is_available.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 45 ++++++++++++++++++++++++++++++++++++++
 target-info.c              | 36 ++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 89656da1ca4..440da63e6cf 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -98,6 +98,51 @@ bool target_is_aarch64(const TargetInfo *ti);
  */
 bool target_aarch64(void);
 
+/**
+ * target_is_base_i386:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is i386 or x86_64.
+ */
+bool target_is_base_i386(const TargetInfo *ti);
+
+/**
+ * target_base_i386:
+ *
+ * Returns whether the target architecture is i386 or x86_64.
+ */
+bool target_base_i386(void);
+
+/**
+ * target_is_i386:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is i386 (32-bit, not x86_64).
+ */
+bool target_is_i386(const TargetInfo *ti);
+
+/**
+ * target_i386:
+ *
+ * Returns whether the target architecture is i386 (32-bit, not x86_64).
+ */
+bool target_i386(void);
+
+/**
+ * target_is_x86_64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is x86_64.
+ */
+bool target_is_x86_64(const TargetInfo *ti);
+
+/**
+ * target_x86_64:
+ *
+ * Returns whether the target architecture is x86_64.
+ */
+bool target_x86_64(void);
+
 /**
  * target_is_base_ppc:
  * @ti: TargetInfo to inspect
diff --git a/target-info.c b/target-info.c
index 6d57cad5d33..36f75ece36f 100644
--- a/target-info.c
+++ b/target-info.c
@@ -132,6 +132,42 @@ bool target_aarch64(void)
     return target_is_aarch64(target_info());
 }
 
+bool target_is_base_i386(const TargetInfo *ti)
+{
+    switch (ti->target_arch) {
+    case SYS_EMU_TARGET_I386:
+    case SYS_EMU_TARGET_X86_64:
+        return true;
+    default:
+        return false;
+    }
+}
+
+bool target_base_i386(void)
+{
+    return target_is_base_i386(target_info());
+}
+
+bool target_is_i386(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_I386;
+}
+
+bool target_i386(void)
+{
+    return target_is_i386(target_info());
+}
+
+bool target_is_x86_64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_X86_64;
+}
+
+bool target_x86_64(void)
+{
+    return target_is_x86_64(target_info());
+}
+
 bool target_is_base_ppc(const TargetInfo *ti)
 {
     switch (ti->target_arch) {
-- 
2.52.0.windows.1


