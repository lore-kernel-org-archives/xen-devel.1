Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA94606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xD+5p/lN
Received: from list by lists.xenproject.org with outflank-mailman.1465819.1676290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMP-0008Ur-5g; Fri, 30 Oct 2026 15:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465819.1676290; Fri, 30 Oct 2026 15:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMP-0008Uf-1T; Fri, 30 Oct 2026 15:17:41 +0000
Received: by outflank-mailman (input) for mailman id 1465819;
 Fri, 30 Oct 2026 15:17:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoMN-0008GK-SS
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:17:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoMN-00DIKy-92
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:17:39 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4fc-e002-0a2a0a5209dd-0a2a450791f2-42
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:39 +0100
Received: from [74.125.82.52] (helo=mail-dl1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b511-b4ea-0a2a45070019-4a7d5234cc56-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:39 +0100
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-170135e43c7so1230168c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:17:38 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:36 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373457; x=1793978257; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGfzDRU1LJ6XJUC1FoxM7ZI/nsagUrCZ0XaVKskAYMY=;
        b=xD+5p/lN7mV9RKKOYOMliDNj+ZHEQzKC8jUy6B0Z+oAUhBaKS8x93lyVYs2XsYBmZZ
         tNedX+H32itdOeQseIwp9Rv46MuR5/rwBiPX3EVWQ+GIS4eJfKyAzCuWPXFG0tyMgrMG
         5PdA3MVIf/OFtKFe8thvBFJ/M78uq+t06eiFgB9IXWJKGQUppWNMkH/E/zMQ/+g0oOFk
         3sXobGv3J4Schr7zO4NO4aPlGRWO7sq4OmBMriPhQdNMctk+y8M9ts6UyMd081P+42Mi
         zCHqyGdXf/chnW+82dOgbHuVwjBRb1z3pI7bXoG/9HKRbaZDPVU20UWYxVcYOp3Ewv15
         91gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373457; x=1793978257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGfzDRU1LJ6XJUC1FoxM7ZI/nsagUrCZ0XaVKskAYMY=;
        b=UqUEvHbO72609UURgYDbQTfLrPFc674ut8zVEEseJqUP9utBJ3GtTCUtQav2pEr6y2
         r+Na81Tl2ZA3U1UNOc+xi3ay0Cs/I08ou12fphHLRu9X7YAWMKkPqADv0lhPkiDY8Zsr
         CxyyTYSOtztIFl97ew/4qXecjhAJDkANvLyT5A+ST6irZHzKy+rS284IweVeLT9p0iKc
         6xpOrOyJ2fplGyOJZTG9rlIsVIBs5fK7ZntocQPQ5biRVRzIDv6c2qt8g4JNRnriqavM
         z3weZ7lziwVfk7cwNnPh0oA29fRvGm5A+joFSDmFK58d2iMXUamjmx6CEGu9oK0PPTse
         N+bg==
X-Forwarded-Encrypted: i=1; AKwUvBzWKh9ZwX8mT02PTtCZJOBFd46//UT/f5rpei9XywDHtvk0+w5eVjUni1AVnO2LZJX1Yc/Gb4+7lHI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL2N7OpWm/j9JR1ahK4zAnhGzb4uyJoeZ5wpYdQgcQFULbIATIG
	z6D3dbdakxN3vYTFkVuTrTjrTlmSvlMdaLw9/SYtu6tVXkoaEgNpvn5b
X-Gm-Gg: AYBFou0a0uc9qtQulGGMBdcombMeuANZ8+H2ET4ktT7qpUMlrOcUaIM1NDGbiKpHc2O
	oERvlEm5vpCaP9f2er6SKnBqQhXJ/BvcEE+CgmgaFyN52BWPFgdXQh8VcIFJQGrEaB7PP55lGD2
	d7iH1O52E5rxB2F+abNUJT16vlWfmx4/xakHVsYT9/xNOSe6VGUZir4IJWQvyVg4D8McOl8n6E7
	rAKL1BubLnz4WtDNoZ0xWM0Udiy9WIYC7FC8lgYglPe7GkwKX4Zpd78jD/XD3Il40a13ESPDAYZ
	1ZHZGvbOyfiZfq2kRakyAH5sl/bmLf2EMKDK5+9CN4N5p6wBencuyG0v1cdcWh9EMfIfn40PDAz
	+Wq3dtAaV3t+Li3spUft7dsOHRoh59YcQ0qe15yG8cSvuHYPkmxCXPvX/Fh0uZRAOZ9AbrTGKsr
	O/Cr16lpX0yEpFF5BadVtwVuJXQ0nIH+ZAO5IuCvbxBelMKxj7t1+hbU/EWMb359q8FWvxDXsFy
	r1E+GUqi5r7LigvNtwVQxq1t22VCnMxUy/DpC8vxY4jUkbPDlzHJwMT3a89m3ARNiy98ippGzYt
	DEfvByhUE+kwFg+tOO7TIAqKpwnB1Zr042SGDHHd181nPagK
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr3398481c88.10.1793373456937;
        Fri, 30 Oct 2026 08:17:36 -0700 (PDT)
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
Subject: [PATCH 09/15] hw/ppc: expand DEFINE_MACHINE for PowerPC machines
Date: Fri, 30 Oct 2026 23:15:30 +0800
Message-ID: <20261030151539.1872-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793373459-A60C5AE4-37474557/0/0
X-purgate-type: clean
X-purgate-size: 7750
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() and DEFINE_MACHINE_EXTENDED() in the PowerPC
machine files to explicit TypeInfo and type_register_static() calls,
adding the pegasos base machine to pegasos_machine_types[] in
hw/ppc/pegasos.c.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/ppc/amigaone.c      | 18 ++++++++++++++++--
 hw/ppc/pegasos.c       | 21 ++++++++++++++-------
 hw/ppc/ppc440_bamboo.c | 18 ++++++++++++++++--
 hw/ppc/prep.c          | 18 ++++++++++++++++--
 hw/ppc/sam460ex.c      | 18 ++++++++++++++++--
 hw/ppc/virtex_ml507.c  | 18 ++++++++++++++++--
 6 files changed, 94 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/amigaone.c b/hw/ppc/amigaone.c
index 2e94e80b569..3cd3e92d2d8 100644
--- a/hw/ppc/amigaone.c
+++ b/hw/ppc/amigaone.c
@@ -416,8 +416,10 @@ static void amigaone_init(MachineState *machine)
     }
 }
 
-static void amigaone_machine_init(MachineClass *mc)
+static void amigaone_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Eyetech AmigaOne/Mai Logic Teron";
     mc->init = amigaone_init;
     mc->block_default_type = IF_IDE;
@@ -427,4 +429,16 @@ static void amigaone_machine_init(MachineClass *mc)
     mc->default_ram_size = 512 * MiB;
 }
 
-DEFINE_MACHINE("amigaone", amigaone_machine_init)
+static const TypeInfo amigaone_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("amigaone"),
+    .parent     = TYPE_MACHINE,
+    .class_init = amigaone_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void amigaone_machine_register_types(void)
+{
+    type_register_static(&amigaone_machine_typeinfo);
+}
+
+type_init(amigaone_machine_register_types)
diff --git a/hw/ppc/pegasos.c b/hw/ppc/pegasos.c
index fba2a558905..ffa63456320 100644
--- a/hw/ppc/pegasos.c
+++ b/hw/ppc/pegasos.c
@@ -732,8 +732,9 @@ static bool pegasos_setprop(MachineState *ms, const char *path,
     return true;
 }
 
-static void pegasos_machine_init(MachineClass *mc)
+static void pegasos_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     PPCVirtualHypervisorClass *vhc = PPC_VIRTUAL_HYPERVISOR_CLASS(mc);
     VofMachineIfClass *vmc = VOF_MACHINE_CLASS(mc);
 
@@ -787,13 +788,19 @@ static void pegasos2_machine_class_init(ObjectClass *oc, const void *data)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7457_v1.2");
 }
 
-DEFINE_MACHINE_EXTENDED("pegasos", MACHINE, PegasosMachineState,
-                        pegasos_machine_init, true, false,
-                        (const InterfaceInfo[]) {
-                        { TYPE_PPC_VIRTUAL_HYPERVISOR },
-                        { TYPE_VOF_MACHINE_IF }, { } })
-
 static const TypeInfo pegasos_machine_types[] = {
+    {
+        .name          = MACHINE_TYPE_NAME("pegasos"),
+        .parent        = TYPE_MACHINE,
+        .class_init    = pegasos_machine_class_init,
+        .instance_size = sizeof(PegasosMachineState),
+        .abstract      = true,
+        .interfaces    = (const InterfaceInfo[]) {
+            { TYPE_PPC_VIRTUAL_HYPERVISOR },
+            { TYPE_VOF_MACHINE_IF },
+            { }
+        },
+    },
     {
         .name          = MACHINE_TYPE_NAME("pegasos1"),
         .parent        = TYPE_PEGASOS_MACHINE,
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 2dde008b0e4..401f7bee572 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -256,8 +256,10 @@ static void bamboo_init(MachineState *machine)
     }
 }
 
-static void bamboo_machine_init(MachineClass *mc)
+static void bamboo_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "bamboo";
     mc->init = bamboo_init;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("440epb");
@@ -265,4 +267,16 @@ static void bamboo_machine_init(MachineClass *mc)
     mc->default_nic = "e1000";
 }
 
-DEFINE_MACHINE("bamboo", bamboo_machine_init)
+static const TypeInfo bamboo_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("bamboo"),
+    .parent     = TYPE_MACHINE,
+    .class_init = bamboo_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void bamboo_machine_register_types(void)
+{
+    type_register_static(&bamboo_machine_typeinfo);
+}
+
+type_init(bamboo_machine_register_types)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 2672eb9e7a7..4afc4e20c67 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -441,8 +441,10 @@ static void ibm_40p_init(MachineState *machine)
     }
 }
 
-static void ibm_40p_machine_init(MachineClass *mc)
+static void ibm_40p_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "IBM RS/6000 7020 (40p)",
     mc->init = ibm_40p_init;
     mc->max_cpus = 1;
@@ -456,4 +458,16 @@ static void ibm_40p_machine_init(MachineClass *mc)
     machine_add_audiodev_property(mc);
 }
 
-DEFINE_MACHINE("40p", ibm_40p_machine_init)
+static const TypeInfo ibm_40p_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("40p"),
+    .parent     = TYPE_MACHINE,
+    .class_init = ibm_40p_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void ibm_40p_machine_register_types(void)
+{
+    type_register_static(&ibm_40p_machine_typeinfo);
+}
+
+type_init(ibm_40p_machine_register_types)
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index b13dd224ba1..934ae3874c3 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -509,8 +509,10 @@ static void sam460ex_init(MachineState *machine)
     boot_info->entry = entry;
 }
 
-static void sam460ex_machine_init(MachineClass *mc)
+static void sam460ex_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "aCube Sam460ex";
     mc->init = sam460ex_init;
     mc->block_default_type = IF_IDE;
@@ -519,4 +521,16 @@ static void sam460ex_machine_init(MachineClass *mc)
     mc->default_ram_id = "ppc4xx.sdram";
 }
 
-DEFINE_MACHINE("sam460ex", sam460ex_machine_init)
+static const TypeInfo sam460ex_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("sam460ex"),
+    .parent     = TYPE_MACHINE,
+    .class_init = sam460ex_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void sam460ex_machine_register_types(void)
+{
+    type_register_static(&sam460ex_machine_typeinfo);
+}
+
+type_init(sam460ex_machine_register_types)
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 09686360e16..2a4c8c9fc93 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -281,12 +281,26 @@ static void virtex_init(MachineState *machine)
     env->load_info = &boot_info;
 }
 
-static void virtex_machine_init(MachineClass *mc)
+static void virtex_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xilinx Virtex ML507 reference design";
     mc->init = virtex_init;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("440-xilinx");
     mc->default_ram_id = "ram";
 }
 
-DEFINE_MACHINE("virtex-ml507", virtex_machine_init)
+static const TypeInfo virtex_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("virtex-ml507"),
+    .parent     = TYPE_MACHINE,
+    .class_init = virtex_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void virtex_machine_register_types(void)
+{
+    type_register_static(&virtex_machine_typeinfo);
+}
+
+type_init(virtex_machine_register_types)
-- 
2.55.0.windows.3


