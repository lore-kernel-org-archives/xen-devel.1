Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B172C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:20:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430505.1653035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mty-0000Zy-EH; Wed, 23 Sep 2026 13:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430505.1653035; Wed, 23 Sep 2026 13:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mty-0000Zq-As; Wed, 23 Sep 2026 13:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1430505;
 Wed, 23 Sep 2026 13:20:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mtx-0000X9-BV
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:20:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mtw-009DAy-OY
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:20:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d22b-e002-0a2a0a5209dd-0a2a4509bc6a-8
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:20:44 +0200
Received: from [74.125.229.34] (helo=mail-dy2-f34.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d22b-be1a-0a2a45090019-4a7de5228003-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:20:44 +0200
Received: by mail-dy2-f34.google.com with SMTP id
 5a478bee46e88-33be7dfcfc1so1002987eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:20:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:20:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169642; x=1790774442; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3AfQfrqvQe4UOX8IvAjiJQ3WGlTiTKTbcrqm5A18SE=;
        b=ERv2Bmhtd/OGw4iswNS8VuVbudwdeDEy+dteW5g8OH07+r8VdTO+DrZy5IMGpfGH5g
         wPi2/FWr7NEFKYGI30l69F+C8iM+7vGzb0fpu7iPJKRms/vQInuk0lZSuDK32nNgEeCv
         FUS6YhuDniQ3BoGJiI3u/aXzKN8RIwuH3oqbGE7gyEsDJ45NRXUvwgZa2ip/eggQlzxf
         JQuczYoNnzFqyTQ0HlejshSs0qInKA4j3+WT/skq8PfLF/qKMmKhArOiz9vKnrgpiZ8T
         AcHc58Q1JuwkboAOQBVhNeaEJ12y+BwUGymlFk9zyoz97NPvOd9DbOP1CQ6/W+8oOu8M
         XtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169642; x=1790774442;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3AfQfrqvQe4UOX8IvAjiJQ3WGlTiTKTbcrqm5A18SE=;
        b=09MbbECtiG/VoKnQ0RRQkitWoWHUlRjOTcTfvX3tsJFTzi69P13wWES0HXJzVJYfjW
         O8NLosZ6KAOCBzINqzLedaMR9QVrW5umIjWxqnwMF5maVsjDBtxMqN/yxqkFFMcODg3D
         gyL/WbnrPW0brtZ9tHrxyIcFT+vlNHugxTQ4WQLoOu/9dG0onWjRMFse8Sag1WbQM2gN
         x94wwpGNln82C8D9qr2OdR/CY1sH3/T8J5mHcCLgWVIhcyBGNwJndF/3eHec/CwpwTat
         wJE+WoxmukUCRjOGkMIwUrudj1QeBXvPaobIFIeHzBKkwJmNIbecDS9AJFPR5OMpW+kb
         PrfA==
X-Forwarded-Encrypted: i=1; AKwUvBw2CcMTZhq13LMyBcGfg1Cdx9yBHdlTZusBNzmWNrqcxVRrg7PPACY/4jcXTTnc01gvuofIx9DerVs=@lists.xenproject.org
X-Gm-Message-State: AFuF++lWRIeEDBgmhrUP0tOL5oGeWlwTwa+NV8O4fElHibHzTNIU2ZDD
	WEixAyh2Jfdqq0wFFxhosn+ymzM0wqigh0FtSA2CSX+wB6Zscu4iPZMV
X-Gm-Gg: AYBFou2AYGfx8yzdrwj3oJf3Qhm1kSWpS7iaLoV200OIe63SgJNpmgaA87mU4Z6li91
	XQBpFoim/div6N1qm9WXRikwQXabbVW9kN8IxGqHhB+fICyMAca71Tsj87m++ozRhlBwNyoVz22
	V+arzPv680ySXPuP/tXPsHCFhqR1QoezdGl5RBu4HaiKxK38tWQ01ycK0Zc/HxnbaMURaSOCBGS
	708AcYFY3XQzCxarlB4cQKnKt+zuLFWZxkgHKcOULMQhUmZeQIZRsCOW1sFWBSo4skLueSjMvon
	bmFBe3nfRdfkjqiANRgUtMoQGp+VPVU/LqPbmD4gWeduuVjum0gMGLyrmrssUZfj2JgKol3Rtii
	56OwsxQVpuT0IK7rVE3aBpFYY2MzC0FcVHrM1/Q5wGr2G2GJ0mTn/zcwnH3cWcXJq9nfwCnz9r/
	Kjz5XufgAWIaH0bYpfmy9jvW8cbPytVKGP76p3YVrFL9BgLNXz58h18DYfu3lq3r3iZCcTpzGpm
	WYcx7EoDSGj7oyrQPlbNqVmQhDlXhR2lkMMqTItlg==
X-Received: by 2002:a05:693c:638c:20b0:339:7da3:a4f8 with SMTP id 5a478bee46e88-33e8d6d1242mr2659932eec.19.1790169641572;
        Wed, 23 Sep 2026 06:20:41 -0700 (PDT)
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
Subject: [PATCH v3 022/114] hw/riscv/virt: prefix ACPI helpers with riscv_virt_
Date: Wed, 23 Sep 2026 21:14:56 +0800
Message-ID: <20260923131635.1894-23-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790169644-BD4C3034-F82B072F/0/0
X-purgate-type: clean
X-purgate-size: 2396

- virt_acpi_setup and virt_is_acpi_enabled collide with ARM virt when
  both architectures are linked into one qemu-system binary.
- Rename the RISC-V helpers to riscv_virt_acpi_setup and
  riscv_virt_is_acpi_enabled. Leave file-local virt_acpi_build* names
  unchanged.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/virt-acpi-build.c | 2 +-
 hw/riscv/virt.c            | 6 +++---
 include/hw/riscv/virt.h    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 8e516ec1148..de47631852f 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -1021,7 +1021,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(RISCVVirtState *s)
+void riscv_virt_acpi_setup(RISCVVirtState *s)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 686222fa0da..0edf75fefc3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -706,8 +706,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
 
     virt_build_smbios(s);
 
-    if (virt_is_acpi_enabled(s)) {
-        virt_acpi_setup(s);
+    if (riscv_virt_is_acpi_enabled(s)) {
+        riscv_virt_acpi_setup(s);
     }
 }
 
@@ -1067,7 +1067,7 @@ static void virt_set_iommu_sys(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &s->iommu_sys, errp);
 }
 
-bool virt_is_acpi_enabled(RISCVVirtState *s)
+bool riscv_virt_is_acpi_enabled(RISCVVirtState *s)
 {
     return s->acpi != ON_OFF_AUTO_OFF;
 }
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 969aa5866ee..1cdc5840b7a 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -121,9 +121,9 @@ enum {
 #define VIRT_PLIC_SIZE(__num_context) \
     (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
-bool virt_is_acpi_enabled(RISCVVirtState *s);
+bool riscv_virt_is_acpi_enabled(RISCVVirtState *s);
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
-void virt_acpi_setup(RISCVVirtState *vms);
+void riscv_virt_acpi_setup(RISCVVirtState *vms);
 
 /*
  * The virt machine physical address space used by some of the devices
-- 
2.52.0.windows.1


