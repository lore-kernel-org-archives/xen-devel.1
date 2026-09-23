Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874AAC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430511.1653045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mu8-00010L-MH; Wed, 23 Sep 2026 13:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430511.1653045; Wed, 23 Sep 2026 13:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mu8-00010E-II; Wed, 23 Sep 2026 13:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1430511;
 Wed, 23 Sep 2026 13:20:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mu7-0000ya-CR
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:20:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mu6-007wu5-Pd
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:20:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d22d-2eae-0a2a0a5409dd-0a2a4504b8b6-38
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:20:54 +0200
Received: from [74.125.229.170] (helo=mail-dl2-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d235-b57f-0a2a45040019-4a7de5aa9499-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:20:54 +0200
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144efd1ea76so758608c88.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:20:54 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:20:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169652; x=1790774452; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eK1WJJTOKN3JQC4zjqi0U64pp0hPplv7AhkYIkHOF98=;
        b=c07hm7wJbVpWjLf5dQk7gSN7xwuxu4qq83ilX6/p5ooCHWbGLre9Glre9ei6zBHYTc
         0MaY0TF25Hd3qSvRXGLeU02K4QfCkoMcA+hUQ/6Y7YZK+1Qwp5V5SrEGhXHAZbSZvXLB
         Gkgb5RWTrrpc6EZ83U/zDHpOqyfwa3pXheOkUxbUKia/phyzz1pr/CMskQe0D2JuiwSp
         Wm8hE6vzRG3agQ/TrZeVep6aETGcQqkjVJOt6fOMiB9AsAEp26Djt8HRF3F6e3fTK2x3
         HbpIvmsg5nrM3v+qI80JiOmCL8m9YYeFNB6m/UAmAxenJcIqeW6YeA4H9LWejMrtG6Kj
         msGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169652; x=1790774452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK1WJJTOKN3JQC4zjqi0U64pp0hPplv7AhkYIkHOF98=;
        b=aQ8FDl9p15OwRjLQemC4bmXK4cPndD3LwnmoPbrweOD1OVix+skVLML1N56YDdTr6h
         K69OVUxaCFmOniqOPOYUk69ppPsbgxwzL2mRQ4cIeUkaNikzcfbXL6cT5YoJeJT2NNsA
         0733vKEg4nkEYevNyrL5pjqrIdtpZ3koNuF0KMctI0Eh1xOIx36HGyk87bbGEP375PNZ
         8OydsR1J8aWXOzJCjszGYx730Xwfdx6IrKIWCzi5kWPIxOEO/1ed7kp/s+Q7ZRIEu/bj
         v8j+X9dxp3PCpSnSNpYJN6PhnpLVOB7Gge5GNXPOz7VwuFH5hjw3C5u8CwmYBQ+4JSM3
         nwbw==
X-Forwarded-Encrypted: i=1; AKwUvBwfvdvY6hZmVsuFOOVTxGYmzgAZi8N1RgGfoUfNqatRh+1Ch8NMn6jxnLUjOpN6X5YFQ9fxK08aZCE=@lists.xenproject.org
X-Gm-Message-State: AFuF++ll2pcQhUSSh1HmO4gp/JgJw7tQk2y8yOv+g7GU6u8TC3SECr2U
	Wzr/ogvHqEC2HBsqugMrdXN08y/oegfnmumiP4stgwlD99xuMlS4295P
X-Gm-Gg: AYBFou22zW/QebKCvDP1G/yIfjRAqxUFrMc659m/ukWgEXDecx42kl2wTwphAJz0Xu7
	R35x9ARl/CbaPOwZgF0DsJqsxhJfBrnnQtAeA7LE0X3BjmDwBB70m+p6545c0eO2GIsIVLmYK6x
	hJd64doSj/NVq/O1P+DBi0HpvdWCE8VQhYCrvTuNJ5yS0ogAWYWab6pLA+CHnRkCMC8dhI+eCl/
	oNlEudynnMcz5EMEgmgziy0RUVbCd9krY/EV9mDoB0A4WB2lBHlxUNmxKLCzb09KteTTLK6ikv4
	J9YxDVqytRK+pbTPlnDLRLBnMXC+qlm6+hN5c/UCcKYThkql2ZMqW/I59sMWuTh0n8Pq++6Ewjb
	1HxEW5R0OoKJ8sqo24AVyij2E0wbVPxp+e8ESHTxVXw0dznWw8GjxWN7Cjw+5lgldQoFYPstnA2
	Rv3sPfep7GW6Wtqs0f0CoU/QgEjRlVCMnEQ+wG0tElDuO58PaLUw1fn/BoxiLhdcvgj3cKlzGNO
	L8hnrPtaoGJVU/Cw9Tsz65r17fWMP8DWAhI5H7vXQ==
X-Received: by 2002:a05:701b:42d3:10b0:143:5c2a:e488 with SMTP id a92af1059eb24-144f8fc7b95mr2889651c88.0.1790169652322;
        Wed, 23 Sep 2026 06:20:52 -0700 (PDT)
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
Subject: [PATCH v3 023/114] hw/loongarch/virt: prefix ACPI helper with loongarch_virt_
Date: Wed, 23 Sep 2026 21:14:57 +0800
Message-ID: <20260923131635.1894-24-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790169654-528C9B50-128891B9/0/0
X-purgate-type: clean
X-purgate-size: 2868

- virt_acpi_setup is the same C symbol used by ARM and RISC-V virt.
  Rename it now so a later combined binary does not need meson -D
  prefixes for LoongArch.
- Rename the file-local virt_is_acpi_enabled to
  loongarch_virt_is_acpi_enabled to match.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt-acpi-build.c | 6 +++---
 hw/loongarch/virt.c            | 2 +-
 include/hw/loongarch/virt.h    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
index 600ef60fc58..b9df9b3a127 100644
--- a/hw/loongarch/virt-acpi-build.c
+++ b/hw/loongarch/virt-acpi-build.c
@@ -674,7 +674,7 @@ static const VMStateDescription vmstate_acpi_build = {
     },
 };
 
-static bool virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
+static bool loongarch_virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
 {
     if (lvms->acpi == ON_OFF_AUTO_OFF) {
         return false;
@@ -682,7 +682,7 @@ static bool virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
     return true;
 }
 
-void virt_acpi_setup(LoongArchVirtMachineState *lvms)
+void loongarch_virt_acpi_setup(LoongArchVirtMachineState *lvms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -692,7 +692,7 @@ void virt_acpi_setup(LoongArchVirtMachineState *lvms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(lvms)) {
+    if (!loongarch_virt_is_acpi_enabled(lvms)) {
         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 2b003443eb0..18923500fc2 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -242,7 +242,7 @@ static void virt_done(Notifier *notifier, void *data)
     LoongArchVirtMachineState *lvms = container_of(notifier,
                                       LoongArchVirtMachineState, machine_done);
     virt_build_smbios(lvms);
-    virt_acpi_setup(lvms);
+    loongarch_virt_acpi_setup(lvms);
     virt_fdt_setup(lvms);
 }
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09529de48bd..4316a414f44 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -132,7 +132,7 @@ struct LoongArchVirtMachineState {
 
 #define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("loongarch-virt")
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
-void virt_acpi_setup(LoongArchVirtMachineState *lvms);
+void loongarch_virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
 
 static inline bool virt_has_dmsi(LoongArchVirtMachineState *lvms)
-- 
2.52.0.windows.1


