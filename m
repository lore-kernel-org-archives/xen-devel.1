Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2266C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:20:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430501.1653025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mtp-00006W-6G; Wed, 23 Sep 2026 13:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430501.1653025; Wed, 23 Sep 2026 13:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mtp-00006P-38; Wed, 23 Sep 2026 13:20:37 +0000
Received: by outflank-mailman (input) for mailman id 1430501;
 Wed, 23 Sep 2026 13:20:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mtn-0008TQ-Os
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mtn-007wnY-5D
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:20:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d21b-2eae-0a2a0a5409dd-0a2a450bc160-24
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:20:35 +0200
Received: from [74.125.229.145] (helo=mail-dl2-f17.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d221-b7e8-0a2a450b0019-4a7de591804f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:20:34 +0200
Received: by mail-dl2-f17.google.com with SMTP id
 a92af1059eb24-143859f5737so1241018c88.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:20:34 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:20:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169633; x=1790774433; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yfDI7d67qBZp7NF6DoFzOD4nojzBBuGOhVVy0hvKz60=;
        b=s++WbVN4pYoTdDQlYIu945KAjllnruHg/N9sP3ecBuD0yzBqe3NX2jbn7ecC1MIRcF
         I02xPlLAKwm/vQtmn0g2+uxZm3eOfEftbLKrBgdgTPcTQNuw+39BZh+XEeKnwWbspBGj
         j5hZwCbYK4FzLVshEsP0jQFZWGoZyXiY0E/EYxSZtK1gr0SHPOk9EYe3ixLMJTWtLZ8t
         qN2YjYUng6NJiZuhMuxB79OxVjU5h4XlaDdsVtU4PKQhZE3mpBD4dCLfX8dXN8rP8GVh
         xX6iaMnYKMlGgjt3sCUJ0R7zz8rhg4U1JwDeEKABRnvtMBi55aPlvx+ZEK7gTqLzcFwj
         eeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169633; x=1790774433;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfDI7d67qBZp7NF6DoFzOD4nojzBBuGOhVVy0hvKz60=;
        b=JuCk3B3vgf5SoRFL7Ogql8TC4OtMHBDYIRe1rbI5Etdypn4AFGdxh1K1/ks9xK4Gmm
         ZQTT31fyx2U3rGIon6n73KONa6CtAiA5QVpWCzlIYYxhoNYo+PZDYUYzvLtypc+cj4h/
         bhDe9Q29v5PauH+T3KF4i7e2mEPykFTCVer3PzaXbHuWCgbBhb3gXqN6Mm2TE5wKltb7
         aPlXIgsQiDKC72RKAGzT9njxh6luovYU7KyheyZrZcovQoUI5Ghlh/sevqF5eostOTaF
         ToKBOZ+y4Qxed/kHvGTJBs4rnDlL2iJ6m1jSD0WneO0FxatoMPT+UbdSg5TZsclfcDhi
         ncJA==
X-Forwarded-Encrypted: i=1; AKwUvBzML1gzlGt82soGcS4jwSGX1xK4jYb4cSEoV5fsMXssWwsd++kKkiCnfDoOreUQ8kCLFb+/B+Q2YLk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kqzokCG57MGE/e7a99VQinTR5/sOM0H3Ihzdn4/KUXEEyyLQS1
	BoGna71yKKIFNwzrLx9N9ZQk/1qJ68NFnuVXhXpfYdDBN8/buGTOD2Bi
X-Gm-Gg: AYBFou1MU1ycVFvmBOEbIN1Zna2QWXgAzieWO2kesHQjlHULl/lFlhIlYyRh587dpAE
	yQzM/ltmeDdOHjG9GYB3M4cM2BuxttHUphK4e58KHwTUd1mddVbdOjA+k2BDVQFaTRQeswMJSdS
	Pcx64NQAoY3yIkDVaL1phQf9iOzYsFRDVJGSZA2nczVQCHxFX5oVs5wCXrJcDVugDWkWK/z36kt
	yEEEJqZXXzogOUsPhUgKKHkPhC8gpwh5ptJuYFlGcXnGaTC8XMTd5kMA15QUVBJSvqv9bQpBigf
	EF/1KQ2y5DeV9vt7SQn2cRJbld3lIOsWy3i1bI+rJE3BPLDrAc3a2/MqpN7U/YKQUA38dhdhbta
	GxtCPYJ1RzIzq4xsfSEIr7XWvN438kbocdjP5zXL88sB/ZZ9UdrqDTUfXOi0KhuNCsS2vEBoqnE
	7F/OxXN/DIy8umGIy0KSu+MzbG4OBZaIWXLDcf0XiwO+jt84vKoxmkNQPhMjHqEeYGhlyRB3Oam
	kaUBxBaMIEDOcLl7Bx7EwRu7h+qE2HZQCEIK1E4og==
X-Received: by 2002:a05:7022:3f81:b0:144:c113:77bb with SMTP id a92af1059eb24-144f9179520mr3177544c88.26.1790169632575;
        Wed, 23 Sep 2026 06:20:32 -0700 (PDT)
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
Subject: [PATCH v3 021/114] hw/arm/virt: prefix ACPI helpers with arm_virt_
Date: Wed, 23 Sep 2026 21:14:55 +0800
Message-ID: <20260923131635.1894-22-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169635-2C59A9EA-1044DC69/0/0
X-purgate-type: clean
X-purgate-size: 4805

- virt_acpi_setup and virt_is_acpi_enabled are generic names also used
  by RISC-V and LoongArch virt. A combined binary cannot export two
  functions with the same C symbol.
- Rename the ARM helpers to arm_virt_acpi_setup and
  arm_virt_is_acpi_enabled. Leave the trace event virt_acpi_setup
  unchanged; it is a separate identifier.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/arm/virt.c            | 12 ++++++------
 include/hw/arm/virt.h    |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d368913e766..5737c3a8fa4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1559,7 +1559,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(VirtMachineState *vms)
+void arm_virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -1570,7 +1570,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(vms)) {
+    if (!arm_virt_is_acpi_enabled(vms)) {
         trace_virt_acpi_setup();
         return;
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c8ffa1ceaf4..331fae883c7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -769,7 +769,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                     &bottom_node,
                     CPU_TOPOLOGY_LEVEL_SOCKET);
             if (cache_at_topo_level) {
-                if (bottom_node == 1 && !virt_is_acpi_enabled(vms))
+                if (bottom_node == 1 && !arm_virt_is_acpi_enabled(vms))
                     error_setg(
                         &error_fatal,
                         "Cannot share L1 at socket_id %d."
@@ -809,7 +809,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                                                         top_cluster,
                                                         bottom_cluster, cpu,
                                                         &cluster_offset);
-                if (bottom_cluster == 1 && !virt_is_acpi_enabled(vms)) {
+                if (bottom_cluster == 1 && !arm_virt_is_acpi_enabled(vms)) {
                     error_setg(&error_fatal,
                         "Cannot share L1 at socket_id %d, cluster_id %d. "
                         "DT limitation on sharing at cache level = 1.",
@@ -2036,7 +2036,7 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms, DeviceState *dev,
     hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
     MachineState *ms = MACHINE(vms);
 
-    if (!(vms->bootinfo.firmware_loaded && virt_is_acpi_enabled(vms))) {
+    if (!(vms->bootinfo.firmware_loaded && arm_virt_is_acpi_enabled(vms))) {
         if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
             error_setg(errp, "SMMUv3 with accel=on not supported for DT");
             return;
@@ -2446,7 +2446,7 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
-    virt_acpi_setup(vms);
+    arm_virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
 
@@ -3210,7 +3210,7 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
-    if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+    if (aarch64 && firmware_loaded && arm_virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
         vms->generic_error_notifier.notify = virt_generic_error_req;
         notifier_list_add(&acpi_generic_error_notifiers,
@@ -3560,7 +3560,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
 }
 
 
-bool virt_is_acpi_enabled(const VirtMachineState *vms)
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms)
 {
     if (vms->acpi == ON_OFF_AUTO_OFF) {
         return false;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 383ee320948..2ee61cc5a06 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -218,8 +218,8 @@ struct VirtMachineState {
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("arm-virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
-void virt_acpi_setup(VirtMachineState *vms);
-bool virt_is_acpi_enabled(const VirtMachineState *vms);
+void arm_virt_acpi_setup(VirtMachineState *vms);
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms);
 
 #define CLIDR_CTYPE_NO_CACHE 0x00
 #define CLIDR_CTYPE_I_CACHE 0x01
-- 
2.52.0.windows.1


