Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1C2C9830C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:19:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430464.1652973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Msk-0004LM-Bf; Wed, 23 Sep 2026 13:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430464.1652973; Wed, 23 Sep 2026 13:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Msk-0004LE-6b; Wed, 23 Sep 2026 13:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1430464;
 Wed, 23 Sep 2026 13:19:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Msi-0004Jd-Pf
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:19:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Msi-00Dqip-61
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:19:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1d6-bab6-0a2a0a5309dd-0a2a4505bf10-12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:28 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1de-4cb1-0a2a45050019-4a7de50cd27f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:27 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664c2da6so544677eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:19:27 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:19:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169566; x=1790774366; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwD9DuwZG4f9q5/deLy+Fa9fAvUmV5QMi6qQxOTBcxg=;
        b=mGNSdVNjy4qSMPtWxo/di0gCMLmK+6vc2Ux+Rdy+e/3PTaUcdvH5CxeN8VjprwhYSv
         aySMVCdoQsdbSuiO5dt+IfHVo1wSpQr8/sXRjGViIIq7y7VYl3CbwNz2TFxCwLnd0TLa
         GeBJaWcmEnmePKM2TuiGyu4T1i6sfrJK6ZzMaxqvsuQ+5Fhz0gH0FGPhOKcUYzyM7fXx
         MRyfKgFADxdRZve5XHiqYd8QQxjZyrFBNzcf8JQD3pqGPibatUXS6wrJ6B9dA6em7ybG
         0gTiHHE4ObOdEQ+CfT04e7RrmJMO+g2nn2nTjCqBRp+cr8NufJJyVd47EY2oro20uCG9
         eH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169566; x=1790774366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwD9DuwZG4f9q5/deLy+Fa9fAvUmV5QMi6qQxOTBcxg=;
        b=Jg3mSB0y57J+Pq5RwTqv4SxeFSYTHnU+LZ8oloIQ/fRuLPQbJJYoJ8HMKJZ79UZSEO
         jvSRqcFP2fLpvdfeDeuT++Td4Ew0kk/Vu/xTDe2SWEDp+xJ0hNK/5/bvXsMG83R+0KR6
         ZgArP/LdyDwQig+8xKrYlQWusz9pLfTsrxNmwqR/Byroehn0Gp2PcitOPDwpaAayYzXk
         1VGaOthMrwSMvD6dQNXMwqQl9I0XIu38oSd7kmAr3O2e8Vs0opDFxser4Rw27ot2OKbz
         yEeFffwZwNcgnN+uX2/IMdn3P7mSPTfXPnj77HEOayuyXJbl/Eg1FIqCF0aMyOKlYVos
         3j7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUO/8BlomB4p+Fs2ZUKJV+f7D8UflQN8FZ7tn9qGZjvHkdSzWQssipTcJhOtlaSZoVIBSJoaA+4v8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kOTC4DaSyMQ1M9o7xwZiDwCBsb4lZNxaUpb5Pik+IEk9Yoa75A
	xFuQKzGiJaDB9ftfHw7GAhyXoDQ7lO0kNxXQwyw+4pRsV8fs4V1luXZj
X-Gm-Gg: AYBFou3/k255MiI3snzD+bk5/+djqR6TdiW60h9j4xcIlHVGJJuDnxuKsG10A0il6xa
	pKpkBN7ipEBKgw4JUZ1z1l7IPThFKl39yDzjxPtanI8i3Z3yqHbcFx/7d8C2vImri+0vhdE9YlG
	D+TPtul+8Z/GAIcLAfT6W6iZO3mLgvZ5qNcKUSljcPveCSz3JoSO2kxZ0JbAPKoS8QC0mDgp5vK
	GQ97eJdKI9iOg2jrdPXDLwYoOUM9sXwzdLfH5IRG2jS2m3lafjc0SCs4Z32Ugy8iv3FH1gbFjNM
	A7dv3v/xzzipNIxsqG4j0eYOXCdI0icRgODioYI03UQiphHxarOi6hh61j8a2hm5od0/fxwJorq
	AYqhwGFrpQ5e2gjFjWiIHyjpkvpk/xak2cx+kt5o1j/OfcF+D1eOZhNy2iyx9kURHJ2fBuzJ27P
	e53t3jeurXl7nIfYrQ2oE2e7mocHNhICITcsJ3BJ9wXU1WHv4U96Wi8qMa4mrIVp/CPWrFXG50c
	MR0M35EcZM93gfda3YzZpZiFSybjco=
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr2514746eec.18.1790169565697;
        Wed, 23 Sep 2026 06:19:25 -0700 (PDT)
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
Subject: [PATCH v3 015/114] qom: pass TargetInfo to is_available
Date: Wed, 23 Sep 2026 21:14:49 +0800
Message-ID: <20260923131635.1894-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790169568-F44A42A1-D7525A03/0/0
X-purgate-type: clean
X-purgate-size: 13264

Change TypeInfo.is_available to TypeIsAvailable taking const
TargetInfo *. Store the callback on TypeImpl and add
object_class_get_is_available. ARM and RISC-V machines use
target_is_aarch64(), target_is_riscv32(), and target_is_riscv64().
object.h includes target-info.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/aspeed_ast27x0-fc.c  |  2 +-
 hw/arm/aspeed_ast27x0_evb.c |  4 ++--
 hw/arm/raspi.c              |  4 ++--
 hw/arm/raspi4b.c            |  2 +-
 hw/riscv/boston-aia.c       |  4 ++--
 hw/riscv/k230.c             |  4 ++--
 hw/riscv/microchip_pfsoc.c  |  4 ++--
 hw/riscv/opentitan.c        |  4 ++--
 hw/riscv/shakti_c.c         |  4 ++--
 hw/riscv/tt_atlantis.c      |  4 ++--
 hw/riscv/xiangshan_kmh.c    |  4 ++--
 include/qom/object.h        | 27 ++++++++++++++++++++++++---
 qom/object.c                | 11 ++++++++++-
 13 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index 73362b60d2a..8a7c6a116ac 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -234,7 +234,7 @@ static const TypeInfo ast2700fc_types[] = {
         .parent         = TYPE_MACHINE,
         .class_init     = ast2700fc_class_init,
         .instance_size  = sizeof(Ast2700FCState),
-        .is_available   = target_aarch64,
+        .is_available   = target_is_aarch64,
     },
 };
 
diff --git a/hw/arm/aspeed_ast27x0_evb.c b/hw/arm/aspeed_ast27x0_evb.c
index 460c9ff0d2e..02a8cff1d9d 100644
--- a/hw/arm/aspeed_ast27x0_evb.c
+++ b/hw/arm/aspeed_ast27x0_evb.c
@@ -75,13 +75,13 @@ static const TypeInfo aspeed_ast27x0_evb_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2700a1-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a1_evb_class_init,
-        .is_available  = target_aarch64,
+        .is_available  = target_is_aarch64,
     },
     {
         .name          = MACHINE_TYPE_NAME("ast2700a2-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a2_evb_class_init,
-        .is_available  = target_aarch64,
+        .is_available  = target_is_aarch64,
     }
 };
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index fadbacb2534..22b06c6ca22 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -403,12 +403,12 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3ap_machine_class_init,
-        .is_available   = target_aarch64,
+        .is_available   = target_is_aarch64,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
-        .is_available   = target_aarch64,
+        .is_available   = target_is_aarch64,
     }, {
         .name           = TYPE_RASPI_MACHINE,
         .parent         = TYPE_RASPI_BASE_MACHINE,
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 566d64572db..a1dc477f25e 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -121,7 +121,7 @@ static const TypeInfo raspi4b_machine_type = {
     .parent         = TYPE_RASPI_BASE_MACHINE,
     .instance_size  = sizeof(Raspi4bMachineState),
     .class_init     = raspi4b_machine_class_init,
-    .is_available   = target_aarch64,
+    .is_available   = target_is_aarch64,
 };
 
 static void raspi4b_machine_register_type(void)
diff --git a/hw/riscv/boston-aia.c b/hw/riscv/boston-aia.c
index ba16b7dbc69..2618b424efe 100644
--- a/hw/riscv/boston-aia.c
+++ b/hw/riscv/boston-aia.c
@@ -468,14 +468,14 @@ static const TypeInfo boston_types[] = {
         .name          = TYPE_MIPS_BOSTON_AIA,
         .parent        = TYPE_SYS_BUS_DEVICE,
         .instance_size = sizeof(BostonState),
-        .is_available  = target_riscv64,
+        .is_available  = target_is_riscv64,
     },
     {
         .name          = MACHINE_TYPE_NAME("boston-aia"),
         .parent        = TYPE_MACHINE,
         .class_init    = boston_mach_class_init,
         .instance_size = sizeof(MachineState),
-        .is_available  = target_riscv64,
+        .is_available  = target_is_riscv64,
     },
 };
 
diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 43b6ae6d2f2..79715265da6 100644
--- a/hw/riscv/k230.c
+++ b/hw/riscv/k230.c
@@ -421,7 +421,7 @@ static const TypeInfo k230_soc_type_info = {
     .instance_size = sizeof(K230SoCState),
     .instance_init = k230_soc_init,
     .class_init = k230_soc_class_init,
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void k230_soc_register_types(void)
@@ -560,7 +560,7 @@ static const TypeInfo k230_machine_typeinfo = {
     .class_init = k230_machine_class_init,
     .instance_init = k230_machine_instance_init,
     .instance_size = sizeof(K230MachineState),
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void k230_machine_init_register_types(void)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b2991e5a710..cc4b6bc3529 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -505,7 +505,7 @@ static const TypeInfo microchip_pfsoc_soc_type_info = {
     .instance_size = sizeof(MicrochipPFSoCState),
     .instance_init = microchip_pfsoc_soc_instance_init,
     .class_init = microchip_pfsoc_soc_class_init,
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void microchip_pfsoc_soc_register_types(void)
@@ -759,7 +759,7 @@ static const TypeInfo microchip_icicle_kit_machine_typeinfo = {
     .class_init = microchip_icicle_kit_machine_class_init,
     .instance_init = microchip_icicle_kit_machine_instance_init,
     .instance_size = sizeof(MicrochipIcicleKitState),
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void microchip_icicle_kit_machine_init_register_types(void)
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c3a563db926..9e3db34eed9 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -333,13 +333,13 @@ static const TypeInfo open_titan_types[] = {
         .instance_size  = sizeof(LowRISCIbexSoCState),
         .instance_init  = lowrisc_ibex_soc_init,
         .class_init     = lowrisc_ibex_soc_class_init,
-        .is_available   = target_riscv32,
+        .is_available   = target_is_riscv32,
     }, {
         .name           = TYPE_OPENTITAN_MACHINE,
         .parent         = TYPE_MACHINE,
         .instance_size  = sizeof(OpenTitanState),
         .class_init     = opentitan_machine_class_init,
-        .is_available   = target_riscv32,
+        .is_available   = target_is_riscv32,
     }
 };
 
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 76cfe30918a..0f96258b764 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -98,7 +98,7 @@ static const TypeInfo shakti_c_machine_type_info = {
     .class_init = shakti_c_machine_class_init,
     .instance_init = shakti_c_machine_instance_init,
     .instance_size = sizeof(ShaktiCMachineState),
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void shakti_c_machine_type_info_register(void)
@@ -188,7 +188,7 @@ static const TypeInfo shakti_c_type_info = {
     .class_init = shakti_c_soc_class_init,
     .instance_init = shakti_c_soc_instance_init,
     .instance_size = sizeof(ShaktiCSoCState),
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void shakti_c_type_info_register(void)
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index f54eb942f37..086e95bd2d1 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -695,13 +695,13 @@ static const TypeInfo tt_atlantis_types[] = {
         .instance_size = sizeof(TTAtlantisSoCState),
         .instance_init = tt_atlantis_soc_init,
         .class_init = tt_atlantis_soc_class_init,
-        .is_available = target_riscv64,
+        .is_available = target_is_riscv64,
     }, {
         .name       = MACHINE_TYPE_NAME("tt-atlantis"),
         .parent     = TYPE_MACHINE,
         .class_init = tt_atlantis_machine_class_init,
         .instance_size = sizeof(TTAtlantisState),
-        .is_available = target_riscv64,
+        .is_available = target_is_riscv64,
     },
 };
 
diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
index f2383c53993..6bc669421fe 100644
--- a/hw/riscv/xiangshan_kmh.c
+++ b/hw/riscv/xiangshan_kmh.c
@@ -158,7 +158,7 @@ static const TypeInfo xiangshan_kmh_soc_info = {
     .instance_size = sizeof(XiangshanKmhSoCState),
     .instance_init = xiangshan_kmh_soc_instance_init,
     .class_init = xiangshan_kmh_soc_class_init,
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void xiangshan_kmh_soc_register_types(void)
@@ -222,7 +222,7 @@ static const TypeInfo xiangshan_kmh_machine_info = {
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(XiangshanKmhState),
     .class_init = xiangshan_kmh_machine_class_init,
-    .is_available = target_riscv64,
+    .is_available = target_is_riscv64,
 };
 
 static void xiangshan_kmh_machine_register_types(void)
diff --git a/include/qom/object.h b/include/qom/object.h
index 4c0645817a5..f2dc22f0eb0 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -16,6 +16,7 @@
 
 #include "qapi/qapi-builtin-types.h"
 #include "qemu/module.h"
+#include "qemu/target-info.h"
 
 struct TypeImpl;
 typedef struct TypeImpl *Type;
@@ -117,6 +118,15 @@ typedef void (ObjectUnparent)(Object *obj);
  */
 typedef void (ObjectFree)(void *obj);
 
+/**
+ * typedef TypeIsAvailable:
+ * @ti: TargetInfo to test.
+ *
+ * Returns whether a type is available for @ti. Typical implementations
+ * are target_is_*().
+ */
+typedef bool (TypeIsAvailable)(const TargetInfo *ti);
+
 #define OBJECT_CLASS_CAST_CACHE 4
 
 /**
@@ -473,8 +483,10 @@ struct Object
  * @class_data: Data to pass to the @class_init,
  *   @class_base_init. This can be useful when building dynamic
  *   classes.
- * @is_available: callback invoked at registration time, to dynamically check if
- *   this type should be available or not.
+ * @is_available: Optional callback. Unset inherits the parent type's
+ *   callback in the MODULE_INIT_QOM after pass (parents are not all
+ *   registered at type_register time). After inherit the callback is
+ *   never NULL. Callers may also invoke it with a chosen TargetInfo.
  * @interfaces: The list of interfaces associated with this type.  This
  *   should point to a static array that's terminated with a zero filled
  *   element.
@@ -498,7 +510,7 @@ struct TypeInfo
     void (*class_base_init)(ObjectClass *klass, const void *data);
     const void *class_data;
 
-    bool (*is_available)(void);
+    TypeIsAvailable *is_available;
     const InterfaceInfo *interfaces;
 };
 
@@ -1087,6 +1099,15 @@ bool object_class_is_abstract(ObjectClass *klass);
  */
 bool object_class_is_secure(ObjectClass *klass);
 
+/**
+ * object_class_get_is_available:
+ * @klass: The class to obtain TypeInfo.is_available for.
+ *
+ * Returns: The availability callback (own or inherited from a parent).
+ * Never %NULL after MODULE_INIT_QOM inherit.
+ */
+TypeIsAvailable *object_class_get_is_available(ObjectClass *klass);
+
 /**
  * object_class_by_name:
  * @typename: The QOM typename to obtain the class for.
diff --git a/qom/object.c b/qom/object.c
index 96498f3d001..a3e75927e82 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -15,6 +15,7 @@
 #include "qom/compat-properties.h"
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
+#include "qemu/target-info-qapi.h"
 #include "qemu/cutils.h"
 #include "qemu/memalign.h"
 #include "qapi/visitor.h"
@@ -71,6 +72,8 @@ struct TypeImpl
     bool abstract;
     bool secure;
 
+    TypeIsAvailable *is_available;
+
     const char *parent;
     TypeImpl *parent_type;
 
@@ -126,6 +129,7 @@ static TypeImpl *type_new(const TypeInfo *info)
 
     ti->abstract = info->abstract;
     ti->secure = info->secure;
+    ti->is_available = info->is_available;
 
     for (i = 0; info->interfaces && info->interfaces[i].type; i++) {
         ti->interfaces[i].typename = g_strdup(info->interfaces[i].type);
@@ -167,7 +171,7 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
         abort();
     }
 
-    if (info->is_available && !info->is_available()) {
+    if (info->is_available && !info->is_available(target_info())) {
         return NULL;
     }
 
@@ -1153,6 +1157,11 @@ bool object_class_is_secure(ObjectClass *klass)
     return klass->type->secure;
 }
 
+TypeIsAvailable *object_class_get_is_available(ObjectClass *klass)
+{
+    return klass->type->is_available;
+}
+
 const char *object_class_get_name(ObjectClass *klass)
 {
     return klass->type->name;
-- 
2.52.0.windows.1


