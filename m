Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C2F606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hoMBiosl
Received: from list by lists.xenproject.org with outflank-mailman.1465778.1676237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLK-00058q-Kt; Fri, 30 Oct 2026 15:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465778.1676237; Fri, 30 Oct 2026 15:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLK-00058j-HL; Fri, 30 Oct 2026 15:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1465778;
 Fri, 30 Oct 2026 15:16:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoLJ-00056d-36
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:16:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoLI-0027EM-GM
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:16:32 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4c3-8faa-0a2a0a5109dd-0a2a4509a714-20
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:32 +0100
Received: from [74.125.82.54] (helo=mail-dl1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4ce-be1a-0a2a45090019-4a7d5236ec05-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:32 +0100
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so1347362c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:16:31 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:29 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373390; x=1793978190; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnMqBd/JBHGwVaxrghEFIqcYT1aAnIXyDuq/h1Z92iw=;
        b=hoMBioslhG2WYzQgz1XhDQBar5iuZHBzBgFBo4QD8tk9TiMCzoH4ocX7T1IENh0jpa
         AwpagGC55yVqnb0WQAOe5ikxpCawZK43RMR3hM5j/f1R2EZERyYrBEBMLrtDMGc/FsDZ
         ypX2SW+XRi70OYuurpSQB9Fa/lHzS3YovNYgV/rx791F8skwVXqkU6Yqg9CRDPyqdXQF
         VUvwHDF/IVUtMQjByTAkaLzZLwAhu8K6MLyFLpyJHNXUwOqqzIpj8MK0id0uIGhhUp8P
         PdujZL1O4YuE9WoVIPicd38E7YuN4Q9/JB+l+kzfqdo8IULG9pcvfc95hSqZf6SIoVJf
         rUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373390; x=1793978190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CnMqBd/JBHGwVaxrghEFIqcYT1aAnIXyDuq/h1Z92iw=;
        b=FpN6mlJXNFug/BzbAV5wI2cXuz5CbQxEmXSjszdynwUY6Vd7T6hBSP3Dk1XDPdNoP8
         bU84ALbolu9JMXxVAj52WgThd5zoSAw2OcDBF4KxgQnZpzUXqhNU13qHSz0CuoNPJpPE
         fXlLfPuOVgW4zOdKZ/9yx+9k0F6QA+1nICKtRSbTsFCgVSB5NDE4ls6H8+uA4NQVI1x7
         9mNLar+IetNVad9ILpQOs8fJ+zWEO2jj05+FY/Y/afJUQ3EwEzkgp8IefJ3But4MrzdF
         GIESDC2IQc/xrFEJ5LkrHxqLDP2YWqhnqeN3J291AfePHZOVyfS3ZlbDD291HZou1kgk
         oPsw==
X-Forwarded-Encrypted: i=1; AKwUvByAr3owYrTbgZrztq1om9OzMmasunSA0OGsE97S/JpUeHa6gkwG+MK/yUC8Q/nWHTCUFEDppDSaYBE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKZfhzVTYh9j2eE2D3X3z4Z9odk4BFv8QQRVbJ+2mGVOKTRqCeF
	1s7qdIk+LwFk9FVIAJ6hjg6Nh6ZHVXdjFOd3rAeAuOf6g5Cy8vWXg0iA
X-Gm-Gg: AYBFou3pAe5Pmjcv9AwEy2syOfnnS9yvmRYUNqle/c7dtxP2D2VwKdMx2+cBgxdHvgL
	GkNY8jMP5Fau5JtKOC6yglBz75BSy0xOSbGtJ/3ZSrI3r0rbwhmZ5MTvGfAImXBJ0yyNjQRz3Sz
	UvvVsyUUGc3OtwQkz4iDwfOlax/xR3fE9jr0XLR6WWh1uZtmV5mN5PSdIDoyYL/wAb1mJHTxzLt
	ZTURjvwNahJHMLUtz/OoXO/OGJC8b+0aXQGwH6OHz0JlbCrOdrHXQYPBCNCck/M4OXt7ixVVzWh
	jRYwhHFo9hjb00wc7KdEkNBORbwsg3gxEJERQqFp+/QFbuaFkXaEVRhUH8yXNTVQJaPodRaAA3N
	B9BgwJtSwbWKSSY7kH1kt8o+J8iRW84WnHR2hzN9VkA/AurDoz/+n3pAWUd6in75OiGvxXKV3NW
	NPPvHoshkh5puWxfylH5Wb6cI9TEC8i66dvAfKjDv5MoAeTK3cpUoWkDKIZ92tTz+ebpDiVOWFy
	2xcCd6r7T6RIhSaX2z0a7/fOixxAM+ixyJ5kDs37TcItEbOF1LH8cpgbVuSsGesCZoSSeeZzx6k
	rpjvAi4SU1t3g51amRI9KozJtOmnz2dbtNlEKqFqpGj71FX2
X-Received: by 2002:a05:701b:4502:10b0:163:fd28:5658 with SMTP id a92af1059eb24-1ac5b02289fmr3445161c88.22.1793373390156;
        Fri, 30 Oct 2026 08:16:30 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Felipe Balbi <balbi@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Philippe Mathieu-Daude <philmd@mailo.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-ppc@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Thomas Huth <th.huth+qemu@posteo.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chao Liu <chao.liu@processmission.com>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Alistair Francis <alistair@alistair23.me>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Gaurav Sharma <gaurav.sharma_7@nxp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PATCH 03/15] hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
Date: Fri, 30 Oct 2026 23:15:24 +0800
Message-ID: <20261030151539.1872-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793373392-BE4DB034-EFC43F42/0/0
X-purgate-type: clean
X-purgate-size: 2804
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/microblaze/petalogix_ml605_mmu.c and
hw/microblaze/xlnx-zynqmp-pmu.c to explicit TypeInfo and type_init()
functions calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/microblaze/petalogix_ml605_mmu.c | 19 +++++++++++++++++--
 hw/microblaze/xlnx-zynqmp-pmu.c     | 19 +++++++++++++++++--
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 8f9f54ff1e2..393eeba76f5 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -214,10 +214,25 @@ petalogix_ml605_init(MachineState *machine)
 
 }
 
-static void petalogix_ml605_machine_init(MachineClass *mc)
+static void petalogix_ml605_machine_class_init(ObjectClass *oc,
+                                               const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "PetaLogix linux refdesign for xilinx ml605 (little endian)";
     mc->init = petalogix_ml605_init;
 }
 
-DEFINE_MACHINE("petalogix-ml605", petalogix_ml605_machine_init)
+static const TypeInfo petalogix_ml605_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("petalogix-ml605"),
+    .parent     = TYPE_MACHINE,
+    .class_init = petalogix_ml605_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void petalogix_ml605_machine_register_types(void)
+{
+    type_register_static(&petalogix_ml605_machine_typeinfo);
+}
+
+type_init(petalogix_ml605_machine_register_types)
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 00154236bf8..d3ade9faeee 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -179,10 +179,25 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
                            NULL);
 }
 
-static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
+static void xlnx_zynqmp_pmu_machine_class_init(ObjectClass *oc,
+                                               const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xilinx ZynqMP PMU machine (little endian)";
     mc->init = xlnx_zynqmp_pmu_init;
 }
 
-DEFINE_MACHINE("xlnx-zynqmp-pmu", xlnx_zynqmp_pmu_machine_init)
+static const TypeInfo xlnx_zynqmp_pmu_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("xlnx-zynqmp-pmu"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xlnx_zynqmp_pmu_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xlnx_zynqmp_pmu_machine_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_pmu_machine_typeinfo);
+}
+
+type_init(xlnx_zynqmp_pmu_machine_register_types)
-- 
2.55.0.windows.3


