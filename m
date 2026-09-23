Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1BFC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430541.1653061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MuS-00028d-90; Wed, 23 Sep 2026 13:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430541.1653061; Wed, 23 Sep 2026 13:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MuS-00028U-5k; Wed, 23 Sep 2026 13:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1430541;
 Wed, 23 Sep 2026 13:21:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MuR-00026E-IH
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:21:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MuQ-006PU6-VW
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d241-bab6-0a2a0a5309dd-0a2a4506e044-44
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:14 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d249-195a-0a2a45060019-4a7de50cd6a8-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:14 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-32dbbe82e13so794109eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:14 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169673; x=1790774473; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aW7Q/4+ozQSDE0PZQ7E9tHZoVUU6eb45JG6HfJcLS94=;
        b=XQ5zYR1YF4Mch1mAi3R+9eR4DVKvZs9BsBo3ic79SdjEUi15Zb9pxtffber1XrPIyo
         xfJtY9DowFJYrh/hagxcOwdnLYIOdwvq7YL4/PTrfuQFd2I1xnw/G8GwDM5B+H4yFBMh
         QuZFq5GoAHf2Ic6/fqrW2BeKvOjrM5Yor4L6lIfRr5l5UQOZC2EWLqu8sDkw8rMv67zJ
         cRtilbTs0MEks5LruC1pruDzgyVoXkIKRyRhhr60cyD4KNA9g4COtcKUx6ExA18EFKUg
         oHPIiWNMa7zqjDgfOE7Wt5diovM0pUFe33B6U7fbzuBII85SV68jOi9ruNqcyLKdMD9P
         J4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169673; x=1790774473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aW7Q/4+ozQSDE0PZQ7E9tHZoVUU6eb45JG6HfJcLS94=;
        b=aVkPdUN2DNlO7uhHT5vA38k/Ls7Cp/Ga01dchXCddgtX5FWJyJSatJvoolTO5qtPl4
         FvK0vHM59k27vhfXy+TmkEnKKo5tXXIy9WtOM3AKw/DyMGm+W5mk6u7sD8oT866bixOu
         8xTlHT6ghusKB5nTCbc17aJ84E2ny2iWJecdzGk5c9yLmTXcHmAcRbqDRVldqI9iGxqH
         ErgD/Phl93sIHD2cJKSIs9kmUJIlWjvAoKS5MHlyr/7X1ZselXOy/kJeYxqNMw2nMHp5
         9qfq1u1eaNDZGtGyp8tMLCo+IiFn++YQduJRTYalBcug/LGqogr/gR89FKEj9qbiA1Hr
         flPA==
X-Forwarded-Encrypted: i=1; AKwUvBxmRP/SNvWn/aLboIXyQ0C3Blb5LMpBg3c8M4vuUYCGtcYhDw2RMxR7CjK9CwyYR42JgGHCejNCwCk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kbDGgJXlW1xjDD9IjulTBONutAk3XSOVrfemKmyDsRh1J+hoJo
	B2gTPhlIjKFAanWGrRg8eHh9tcTjxlSNN1iZmH0L/CRm1z1A9A6EmqyQ
X-Gm-Gg: AYBFou3bCCOGJaNDbtu5QjrSE3+TFZtiHa9QlktARLCSSR/P4EOu/mvhzaOcqdvRol9
	GFG/5ClxSjJuZqqSKhIpxC+0vYqS61HyPdMDKey+C6MeyPOlv2K50LFQHXMOy3J2XQOKy1V7JLp
	bS824m5SwzF0jPEOKKFzfkj92MSnc16YeqaYhOaZQY3qqyJBQAlxNiwis16GrQZT3kWHavrThYv
	1JzbosUhUwpWp9VhkZGnUneNppbhDuLe0BDVaQKX7f8HZyJrNCOgpbwI3DiS872eVycZ+JHYA+p
	b+uSLEOeLLogvjhZm0MgxDhgIiQviNvXeLopgC8/AFY3tZxib9pwC5mRFsPM6+V0jy9CyIFxMVg
	qIYBxV78jDkEDPABjDyJAbchzzazaYX+NoemKAawHvEdG6VDo95z20XBnUeJFMwOL9NKUr2sfEH
	pczqMZnORRr6i6UmBNSbkxIJWomZgo1sJ/tqm83S5+YC6yt74PLfD6Btk4+8Ladv1D7Uffxx01K
	6kxa2cAm8eraYklolue9oloKHMYDwEwD2f9EWFcUJAKIRFDKFZJJA==
X-Received: by 2002:a05:7300:cca4:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-33e8d2ebd99mr2512374eec.21.1790169672443;
        Wed, 23 Sep 2026 06:21:12 -0700 (PDT)
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
Subject: [PATCH v3 025/114] hw/riscv: gate boards with target_is_base_riscv
Date: Wed, 23 Sep 2026 21:14:59 +0800
Message-ID: <20260923131635.1894-26-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790169674-F7ECC77B-C89AFAC8/0/0
X-purgate-type: clean
X-purgate-size: 6241

- Set TypeInfo.is_available to target_is_base_riscv on RISC-V machines
  so a combined qemu-system lists them only for riscv32/riscv64.
---
 hw/riscv/k230.c            | 1 +
 hw/riscv/microchip_pfsoc.c | 1 +
 hw/riscv/opentitan.c       | 1 +
 hw/riscv/shakti_c.c        | 1 +
 hw/riscv/sifive_e.c        | 1 +
 hw/riscv/sifive_u.c        | 1 +
 hw/riscv/spike.c           | 1 +
 hw/riscv/tt_atlantis.c     | 1 +
 hw/riscv/virt.c            | 1 +
 hw/riscv/xiangshan_kmh.c   | 1 +
 10 files changed, 10 insertions(+)

diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 79715265da6..3890cb6357d 100644
--- a/hw/riscv/k230.c
+++ b/hw/riscv/k230.c
@@ -557,6 +557,7 @@ static void k230_machine_class_init(ObjectClass *oc, const void *data)
 static const TypeInfo k230_machine_typeinfo = {
     .name       = TYPE_RISCV_K230_MACHINE,
     .parent     = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = k230_machine_class_init,
     .instance_init = k230_machine_instance_init,
     .instance_size = sizeof(K230MachineState),
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index cc4b6bc3529..103c0d7f7ca 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -756,6 +756,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc,
 static const TypeInfo microchip_icicle_kit_machine_typeinfo = {
     .name       = MACHINE_TYPE_NAME("microchip-icicle-kit"),
     .parent     = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = microchip_icicle_kit_machine_class_init,
     .instance_init = microchip_icicle_kit_machine_instance_init,
     .instance_size = sizeof(MicrochipIcicleKitState),
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 9e3db34eed9..db1fb3e3347 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -337,6 +337,7 @@ static const TypeInfo open_titan_types[] = {
     }, {
         .name           = TYPE_OPENTITAN_MACHINE,
         .parent         = TYPE_MACHINE,
+        .is_available   = target_is_base_riscv,
         .instance_size  = sizeof(OpenTitanState),
         .class_init     = opentitan_machine_class_init,
         .is_available   = target_is_riscv32,
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 0f96258b764..e8ae770f7ca 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -95,6 +95,7 @@ static void shakti_c_machine_class_init(ObjectClass *klass, const void *data)
 static const TypeInfo shakti_c_machine_type_info = {
     .name = TYPE_RISCV_SHAKTI_MACHINE,
     .parent = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = shakti_c_machine_class_init,
     .instance_init = shakti_c_machine_instance_init,
     .instance_size = sizeof(ShaktiCMachineState),
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 1b6f9ab4fee..087d0c48e1e 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -165,6 +165,7 @@ static void sifive_e_machine_class_init(ObjectClass *oc, const void *data)
 static const TypeInfo sifive_e_machine_typeinfo = {
     .name       = MACHINE_TYPE_NAME("sifive_e"),
     .parent     = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = sifive_e_machine_class_init,
     .instance_init = sifive_e_machine_instance_init,
     .instance_size = sizeof(SiFiveEState),
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 344f3d915d7..d5cc9255da6 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -679,6 +679,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, const void *data)
 static const TypeInfo sifive_u_machine_typeinfo = {
     .name       = MACHINE_TYPE_NAME("sifive_u"),
     .parent     = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = sifive_u_machine_class_init,
     .instance_init = sifive_u_machine_instance_init,
     .instance_size = sizeof(SiFiveUState),
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 63cf77e1de3..4bb58ec6203 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -292,6 +292,7 @@ static void spike_machine_class_init(ObjectClass *oc, const void *data)
 static const TypeInfo spike_machine_typeinfo = {
     .name       = MACHINE_TYPE_NAME("spike"),
     .parent     = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = spike_machine_class_init,
     .instance_init = spike_machine_instance_init,
     .instance_size = sizeof(SpikeState),
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 086e95bd2d1..6e7272d705c 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -699,6 +699,7 @@ static const TypeInfo tt_atlantis_types[] = {
     }, {
         .name       = MACHINE_TYPE_NAME("tt-atlantis"),
         .parent     = TYPE_MACHINE,
+        .is_available = target_is_base_riscv,
         .class_init = tt_atlantis_machine_class_init,
         .instance_size = sizeof(TTAtlantisState),
         .is_available = target_is_riscv64,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0edf75fefc3..2240a516d85 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1202,6 +1202,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 static const TypeInfo virt_machine_typeinfo = {
     .name       = TYPE_RISCV_VIRT_MACHINE,
     .parent     = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .class_init = virt_machine_class_init,
     .instance_init = virt_machine_instance_init,
     .instance_finalize = virt_machine_instance_finalize,
diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
index 6bc669421fe..9578a11aee6 100644
--- a/hw/riscv/xiangshan_kmh.c
+++ b/hw/riscv/xiangshan_kmh.c
@@ -220,6 +220,7 @@ static void xiangshan_kmh_machine_class_init(ObjectClass *klass, const void *dat
 static const TypeInfo xiangshan_kmh_machine_info = {
     .name = TYPE_XIANGSHAN_KMH_MACHINE,
     .parent = TYPE_MACHINE,
+    .is_available = target_is_base_riscv,
     .instance_size = sizeof(XiangshanKmhState),
     .class_init = xiangshan_kmh_machine_class_init,
     .is_available = target_is_riscv64,
-- 
2.52.0.windows.1


