Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C6606A31F
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mYXX4ZA
Received: from list by lists.xenproject.org with outflank-mailman.1465791.1676253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLh-000684-2h; Fri, 30 Oct 2026 15:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465791.1676253; Fri, 30 Oct 2026 15:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLg-00067p-V3; Fri, 30 Oct 2026 15:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1465791;
 Fri, 30 Oct 2026 15:16:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoLf-000633-CK
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:16:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoLe-00A70O-Ow
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:16:54 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4e2-2eae-0a2a0a5409dd-0a2a4504dee2-10
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:54 +0100
Received: from [74.125.82.49] (helo=mail-dl1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4e5-b57f-0a2a45040019-4a7d5231ac49-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:54 +0100
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1a2761c69fbso2022621c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:16:54 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:51 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373412; x=1793978212; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPp4K8SpYewvoGkZt5YpU/W5aoKsUCXebK5ekrwOnQY=;
        b=0mYXX4ZAzfh0S+h6qunm2DT+p9mGNsAqALQ2qInqaIyz9IAjVlXnLlA2L6yO2i4xsD
         4tWPQ9ECg+Q92yQaO4+KWtXnz3h0VDFLah8wDnhQiCUb0LQ6zJNmvoBBQHc8/oZaIlVo
         3GpQBSwQrYmgcGXzdhYOP/Ana6e4QxHfpBdP1SxryF94IA8kqyuMXF2qwkQ3eJlWGK/w
         lKVAWMek8PsTtdtxvRHkUXk+Poa9RlKJ3/+qhMe5WUZePFkjHsXPXLLwxOCDwOv8UKNI
         mCb2RfzxFFRIvi+HTLM3ImYIJOlJfOpXTzJKNW/dKw3NCsq37FpKR2K626x40+GqR/My
         5Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373412; x=1793978212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPp4K8SpYewvoGkZt5YpU/W5aoKsUCXebK5ekrwOnQY=;
        b=d8vi9CwOXOOskKdsIKwYtQl1xTqEP7xi3nkjQE6CS2hQbyGy/TMnDDVmgt20kv7O+W
         STFXW7E6mSHXYJTtlsuHD/sPN0BK6yub2s4fAvZPioYQfAct/zWKZApkbxS8197ZQMJ6
         rWguYluVS2mUO2KE0hfZOLl9eyFqf5esvikxkEBzOkfLgpltW/1mfU1+7gvgBPGB//e2
         8jnooYW+XuI1zxXNpQsiMVBw0Eq2x2albAitmjpaz9K2UPxNO1DmnC5Z0fP6UALGPZ7P
         u2hytZ77D7EsaQ2jW2xIvh7mWV3Gxsx3grhg4AsUeHOde3Mue7vPO7EXLoQt6e+mt+9y
         EMmA==
X-Forwarded-Encrypted: i=1; AKwUvBxbooBH2AQ886Zk369J11gb6eEx7VDyEOcvZL+1IkeFa9ZRxxUFJrTULjXbOtyiok8pwfNNlOD48sw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIDib4QuoTXeiho3MghuNbJUkXZ8L0QbNJiFP8WYnsj+H+/uqWU
	POBAyYY4+oUYoXGUPtI1L3/vXiF2p0IpXcDqzyQZw5zuG7cEVi2+4yv8
X-Gm-Gg: AYBFou2DtiRBMVBJZMrOkKW8BNE5cxt3KV7FI4LKWywEvy9NHvYmp0ROr+PXDxDiLUU
	zeVS1V/dPxbEJ2pFUgX/D8/3sFAk7U5y924iPHWA/mIRgRNHqdZBlVvLwIXlohKNcanb4zIGYDD
	OAVf3qYEI+GX6Q9nXdWWxl+ipQByll6JLBo2grNYRd6jUfI81YnT8sjzmETZbn2VjNXKEmh3RtD
	UxKjaa/OtYN7Ib7VhsIKMEzUc97XiF/f2bgMBisf7AHs9Zr2eM+k5OrjxVCXwKMRdRd8TxorSrr
	+nW0WwABR7BzA+aOlt8Ybh/Qs0d7hRQPuwWX5lYCo96V5XNhkIbjElZQuih1FjFntn+pwJgXpF6
	P+QXPbXxrLy42Zlh8Giq7fOtAda4dhtxmyMwfo/umf4Mdql9av5TC1wB5cMds+PHylscE4CQ7kg
	DNnPlRpbor1tJNvSjlz3XK5DJKLC44tqz0w0w/AhNFd19ob3CXLd1UGEav7xlGG4533fwMIMP5d
	Q0TAr90AVjdrkfUtbpOiw+c+7GhGm//ufC5wG+qX3RZg4tiMaNrX5Zq1Ae1UZKc0AF6sXUE4mlp
	dR+wU5JaZooWQMy/DmdfTfd5KArR+xOrzR8t/V4x0qHHQpfGAX7Rquh0TRZraJgu5cjAPQ==
X-Received: by 2002:a05:7022:120c:b0:164:8e14:4939 with SMTP id a92af1059eb24-1ac59dd190bmr3344211c88.10.1793373412205;
        Fri, 30 Oct 2026 08:16:52 -0700 (PDT)
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
Subject: [PATCH 05/15] hw/arm: expand DEFINE_MACHINE for ARM machines
Date: Fri, 30 Oct 2026 23:15:26 +0800
Message-ID: <20261030151539.1872-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793373414-C1ED6B50-05EB9444/0/0
X-purgate-type: clean
X-purgate-size: 21117
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() and DEFINE_MACHINE_EXTENDED() to explicit
TypeInfo and type_register_static() calls for the ARM machine types,
reusing integratorcp_register_types() in hw/arm/integratorcp.c.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/bananapi_m2u.c      | 18 +++++++++++++++---
 hw/arm/cubieboard.c        | 19 +++++++++++++++----
 hw/arm/digic_boards.c      | 18 ++++++++++++++++--
 hw/arm/imx25_pdk.c         | 18 ++++++++++++++++--
 hw/arm/imx8mm-evk.c        | 20 ++++++++++++++++----
 hw/arm/integratorcp.c      | 14 ++++++++++----
 hw/arm/kzm.c               | 18 ++++++++++++++++--
 hw/arm/max78000fthr.c      | 17 +++++++++++++++--
 hw/arm/mcimx6ul-evk.c      | 18 ++++++++++++++++--
 hw/arm/mcimx7d-sabre.c     | 20 ++++++++++++++++----
 hw/arm/msf2-som.c          | 17 +++++++++++++++--
 hw/arm/netduino2.c         | 17 +++++++++++++++--
 hw/arm/netduinoplus2.c     | 17 +++++++++++++++--
 hw/arm/olimex-stm32-h405.c | 18 ++++++++++++++++--
 hw/arm/orangepi.c          | 19 +++++++++++++++----
 hw/arm/stm32vldiscovery.c  | 18 ++++++++++++++++--
 16 files changed, 243 insertions(+), 43 deletions(-)

diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index ccf60ba2955..ad30e34d718 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -133,8 +133,9 @@ static void bpim2u_init(MachineState *machine)
     arm_load_kernel(&r40->cpus[0], machine, &bpms->bootinfo);
 }
 
-static void bpim2u_machine_init(MachineClass *mc)
+static void bpim2u_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-a7"),
         NULL
@@ -152,5 +153,16 @@ static void bpim2u_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE_EXTENDED("bpim2u", MACHINE, Bpim2uMachineState,
-                        bpim2u_machine_init, false, false, NULL)
+static const TypeInfo bpim2u_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("bpim2u"),
+    .parent     = TYPE_MACHINE,
+    .class_init = bpim2u_machine_class_init,
+    .instance_size = sizeof(Bpim2uMachineState),
+};
+
+static void bpim2u_machine_register_types(void)
+{
+    type_register_static(&bpim2u_machine_typeinfo);
+}
+
+type_init(bpim2u_machine_register_types)
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index e4fef9cd76b..66610d495bc 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -113,8 +113,9 @@ static void cubieboard_init(MachineState *machine)
     arm_load_kernel(&a10->cpu, machine, &cbs->bootinfo);
 }
 
-static void cubieboard_machine_init(MachineClass *mc)
+static void cubieboard_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-a8"),
         NULL
@@ -132,6 +133,16 @@ static void cubieboard_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE_EXTENDED("cubieboard", MACHINE, CubieboardMachineState,
-                        cubieboard_machine_init, false, false,
-                        NULL)
+static const TypeInfo cubieboard_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("cubieboard"),
+    .parent     = TYPE_MACHINE,
+    .class_init = cubieboard_machine_class_init,
+    .instance_size = sizeof(CubieboardMachineState),
+};
+
+static void cubieboard_machine_register_types(void)
+{
+    type_register_static(&cubieboard_machine_typeinfo);
+}
+
+type_init(cubieboard_machine_register_types)
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 90c19106ad0..49e71f71e97 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -136,8 +136,10 @@ static void canon_a1100_init(MachineState *machine)
     digic4_board_init(machine, &digic4_board_canon_a1100);
 }
 
-static void canon_a1100_machine_init(MachineClass *mc)
+static void canon_a1100_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Canon PowerShot A1100 IS (ARM946)";
     mc->init = &canon_a1100_init;
     mc->ignore_memory_transaction_failures = true;
@@ -145,4 +147,16 @@ static void canon_a1100_machine_init(MachineClass *mc)
     mc->default_ram_id = "ram";
 }
 
-DEFINE_MACHINE("canon-a1100", canon_a1100_machine_init)
+static const TypeInfo canon_a1100_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("canon-a1100"),
+    .parent     = TYPE_MACHINE,
+    .class_init = canon_a1100_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void canon_a1100_machine_register_types(void)
+{
+    type_register_static(&canon_a1100_machine_typeinfo);
+}
+
+type_init(canon_a1100_machine_register_types)
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index a33050788c3..546d8002662 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -140,8 +140,10 @@ static void imx25_pdk_init(MachineState *machine)
     }
 }
 
-static void imx25_pdk_machine_init(MachineClass *mc)
+static void imx25_pdk_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "ARM i.MX25 PDK board (ARM926)";
     mc->init = imx25_pdk_init;
     mc->ignore_memory_transaction_failures = true;
@@ -149,4 +151,16 @@ static void imx25_pdk_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE("imx25-pdk", imx25_pdk_machine_init)
+static const TypeInfo imx25_pdk_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("imx25-pdk"),
+    .parent     = TYPE_MACHINE,
+    .class_init = imx25_pdk_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void imx25_pdk_machine_register_types(void)
+{
+    type_register_static(&imx25_pdk_machine_typeinfo);
+}
+
+type_init(imx25_pdk_machine_register_types)
diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
index 6de0d9c4a2e..ba1b603081b 100644
--- a/hw/arm/imx8mm-evk.c
+++ b/hw/arm/imx8mm-evk.c
@@ -122,8 +122,10 @@ static const char *imx8mm_evk_get_default_cpu_type(const MachineState *ms)
     return ARM_CPU_TYPE_NAME("cortex-a53");
 }
 
-static void imx8mm_evk_machine_init(MachineClass *mc)
+static void imx8mm_evk_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "NXP i.MX 8MM EVK Board";
     mc->init = imx8mm_evk_init;
     mc->max_cpus = FSL_IMX8MM_NUM_CPUS;
@@ -133,6 +135,16 @@ static void imx8mm_evk_machine_init(MachineClass *mc)
     mc->get_default_cpu_type = imx8mm_evk_get_default_cpu_type;
 }
 
-DEFINE_MACHINE_EXTENDED("imx8mm-evk", MACHINE, Imx8mmEvkMachineState,
-                        imx8mm_evk_machine_init, false, false,
-                        NULL)
+static const TypeInfo imx8mm_evk_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("imx8mm-evk"),
+    .parent     = TYPE_MACHINE,
+    .class_init = imx8mm_evk_machine_class_init,
+    .instance_size = sizeof(Imx8mmEvkMachineState),
+};
+
+static void imx8mm_evk_machine_register_types(void)
+{
+    type_register_static(&imx8mm_evk_machine_typeinfo);
+}
+
+type_init(imx8mm_evk_machine_register_types)
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index b766edeeee1..9736795b243 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -691,8 +691,10 @@ static void integratorcp_init(MachineState *machine)
     arm_load_kernel(cpu, machine, &icms->bootinfo);
 }
 
-static void integratorcp_machine_init(MachineClass *mc)
+static void integratorcp_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "ARM Integrator/CP (ARM926EJ-S)";
     mc->init = integratorcp_init;
     mc->ignore_memory_transaction_failures = true;
@@ -703,9 +705,12 @@ static void integratorcp_machine_init(MachineClass *mc)
     machine_add_audiodev_property(mc);
 }
 
-DEFINE_MACHINE_EXTENDED("integratorcp", MACHINE, IntegratorcpMachineState,
-                        integratorcp_machine_init, false, false,
-                        NULL)
+static const TypeInfo integratorcp_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("integratorcp"),
+    .parent     = TYPE_MACHINE,
+    .class_init = integratorcp_machine_class_init,
+    .instance_size = sizeof(IntegratorcpMachineState),
+};
 
 static const Property core_properties[] = {
     DEFINE_PROP_UINT32("memsz", IntegratorCMState, memsz, 0),
@@ -760,6 +765,7 @@ static const TypeInfo icp_ctrl_regs_info = {
 
 static void integratorcp_register_types(void)
 {
+    type_register_static(&integratorcp_machine_typeinfo);
     type_register_static(&icp_pic_info);
     type_register_static(&core_info);
     type_register_static(&icp_ctrl_regs_info);
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index e9cc53ce017..6196d40cb2e 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -129,12 +129,26 @@ static void kzm_init(MachineState *machine)
     }
 }
 
-static void kzm_machine_init(MachineClass *mc)
+static void kzm_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "ARM KZM Emulation Baseboard (ARM1136)";
     mc->init = kzm_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_ram_id = "kzm.ram";
 }
 
-DEFINE_MACHINE("kzm", kzm_machine_init)
+static const TypeInfo kzm_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("kzm"),
+    .parent     = TYPE_MACHINE,
+    .class_init = kzm_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void kzm_machine_register_types(void)
+{
+    type_register_static(&kzm_machine_typeinfo);
+}
+
+type_init(kzm_machine_register_types)
diff --git a/hw/arm/max78000fthr.c b/hw/arm/max78000fthr.c
index ed50bb91979..33c1ccbd3c8 100644
--- a/hw/arm/max78000fthr.c
+++ b/hw/arm/max78000fthr.c
@@ -35,8 +35,9 @@ static void max78000_init(MachineState *machine)
                        0x00000000, FLASH_SIZE);
 }
 
-static void max78000_machine_init(MachineClass *mc)
+static void max78000_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m4"),
         NULL
@@ -47,4 +48,16 @@ static void max78000_machine_init(MachineClass *mc)
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("max78000fthr", max78000_machine_init)
+static const TypeInfo max78000_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("max78000fthr"),
+    .parent     = TYPE_MACHINE,
+    .class_init = max78000_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void max78000_machine_register_types(void)
+{
+    type_register_static(&max78000_machine_typeinfo);
+}
+
+type_init(max78000_machine_register_types)
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 53d221b4a9a..a4cdaac1176 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -68,8 +68,10 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
 }
 
-static void mcimx6ul_evk_machine_init(MachineClass *mc)
+static void mcimx6ul_evk_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Freescale i.MX6UL Evaluation Kit (Cortex-A7)";
     mc->init = mcimx6ul_evk_init;
     mc->max_cpus = FSL_IMX6UL_NUM_CPUS;
@@ -78,4 +80,16 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE("mcimx6ul-evk", mcimx6ul_evk_machine_init)
+static const TypeInfo mcimx6ul_evk_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("mcimx6ul-evk"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mcimx6ul_evk_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void mcimx6ul_evk_machine_register_types(void)
+{
+    type_register_static(&mcimx6ul_evk_machine_typeinfo);
+}
+
+type_init(mcimx6ul_evk_machine_register_types)
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 55c23061b0a..5a868af6c1f 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -76,8 +76,10 @@ static void mcimx7d_sabre_init(MachineState *machine)
     }
 }
 
-static void mcimx7d_sabre_machine_init(MachineClass *mc)
+static void mcimx7d_sabre_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex-A7)";
     mc->init = mcimx7d_sabre_init;
     mc->max_cpus = FSL_IMX7_NUM_CPUS;
@@ -87,6 +89,16 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE_EXTENDED("mcimx7d-sabre", MACHINE, Mcimx7dSabreMachineState,
-                        mcimx7d_sabre_machine_init, false, false,
-                        NULL)
+static const TypeInfo mcimx7d_sabre_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("mcimx7d-sabre"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mcimx7d_sabre_machine_class_init,
+    .instance_size = sizeof(Mcimx7dSabreMachineState),
+};
+
+static void mcimx7d_sabre_machine_register_types(void)
+{
+    type_register_static(&mcimx7d_sabre_machine_typeinfo);
+}
+
+type_init(mcimx7d_sabre_machine_register_types)
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 1372d7f628a..938ccab05c4 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -96,8 +96,9 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
                        0, soc->envm_size);
 }
 
-static void emcraft_sf2_machine_init(MachineClass *mc)
+static void emcraft_sf2_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m3"),
         NULL
@@ -108,4 +109,16 @@ static void emcraft_sf2_machine_init(MachineClass *mc)
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
+static const TypeInfo emcraft_sf2_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("emcraft-sf2"),
+    .parent     = TYPE_MACHINE,
+    .class_init = emcraft_sf2_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void emcraft_sf2_machine_register_types(void)
+{
+    type_register_static(&emcraft_sf2_machine_typeinfo);
+}
+
+type_init(emcraft_sf2_machine_register_types)
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 0db8798b4bd..3f95672670e 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -52,8 +52,9 @@ static void netduino2_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void netduino2_machine_init(MachineClass *mc)
+static void netduino2_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m3"),
         NULL
@@ -65,4 +66,16 @@ static void netduino2_machine_init(MachineClass *mc)
     mc->ignore_memory_transaction_failures = true;
 }
 
-DEFINE_MACHINE("netduino2", netduino2_machine_init)
+static const TypeInfo netduino2_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("netduino2"),
+    .parent     = TYPE_MACHINE,
+    .class_init = netduino2_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void netduino2_machine_register_types(void)
+{
+    type_register_static(&netduino2_machine_typeinfo);
+}
+
+type_init(netduino2_machine_register_types)
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 5ac0eb81637..169e7b80b3c 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -53,8 +53,9 @@ static void netduinoplus2_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void netduinoplus2_machine_init(MachineClass *mc)
+static void netduinoplus2_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m4"),
         NULL
@@ -65,4 +66,16 @@ static void netduinoplus2_machine_init(MachineClass *mc)
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("netduinoplus2", netduinoplus2_machine_init)
+static const TypeInfo netduinoplus2_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("netduinoplus2"),
+    .parent     = TYPE_MACHINE,
+    .class_init = netduinoplus2_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void netduinoplus2_machine_register_types(void)
+{
+    type_register_static(&netduinoplus2_machine_typeinfo);
+}
+
+type_init(netduinoplus2_machine_register_types)
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
index de9ac4978ce..4e415a420c4 100644
--- a/hw/arm/olimex-stm32-h405.c
+++ b/hw/arm/olimex-stm32-h405.c
@@ -56,8 +56,10 @@ static void olimex_stm32_h405_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void olimex_stm32_h405_machine_init(MachineClass *mc)
+static void olimex_stm32_h405_machine_class_init(ObjectClass *oc,
+                                                 const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m4"),
         NULL
@@ -71,4 +73,16 @@ static void olimex_stm32_h405_machine_init(MachineClass *mc)
     mc->default_ram_size = 0;
 }
 
-DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)
+static const TypeInfo olimex_stm32_h405_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("olimex-stm32-h405"),
+    .parent     = TYPE_MACHINE,
+    .class_init = olimex_stm32_h405_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void olimex_stm32_h405_machine_register_types(void)
+{
+    type_register_static(&olimex_stm32_h405_machine_typeinfo);
+}
+
+type_init(olimex_stm32_h405_machine_register_types)
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 18ed174032b..ec1d19b6034 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -111,8 +111,9 @@ static void orangepi_init(MachineState *machine)
     arm_load_kernel(&h3->cpus[0], machine, &opms->bootinfo);
 }
 
-static void orangepi_machine_init(MachineClass *mc)
+static void orangepi_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-a7"),
         NULL
@@ -132,6 +133,16 @@ static void orangepi_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE_EXTENDED("orangepi-pc", MACHINE, OrangePiMachineState,
-                        orangepi_machine_init, false, false,
-                        NULL)
+static const TypeInfo orangepi_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("orangepi-pc"),
+    .parent     = TYPE_MACHINE,
+    .class_init = orangepi_machine_class_init,
+    .instance_size = sizeof(OrangePiMachineState),
+};
+
+static void orangepi_machine_register_types(void)
+{
+    type_register_static(&orangepi_machine_typeinfo);
+}
+
+type_init(orangepi_machine_register_types)
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index d899a134b38..ab9116ccc1d 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -56,8 +56,10 @@ static void stm32vldiscovery_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void stm32vldiscovery_machine_init(MachineClass *mc)
+static void stm32vldiscovery_machine_class_init(ObjectClass *oc,
+                                                const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m3"),
         NULL
@@ -68,4 +70,16 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
+static const TypeInfo stm32vldiscovery_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("stm32vldiscovery"),
+    .parent     = TYPE_MACHINE,
+    .class_init = stm32vldiscovery_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void stm32vldiscovery_machine_register_types(void)
+{
+    type_register_static(&stm32vldiscovery_machine_typeinfo);
+}
+
+type_init(stm32vldiscovery_machine_register_types)
-- 
2.55.0.windows.3


