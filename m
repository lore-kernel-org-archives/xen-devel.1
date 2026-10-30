Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513CE606A323
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFCeVPEI
Received: from list by lists.xenproject.org with outflank-mailman.1465800.1676263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLs-0006an-ER; Fri, 30 Oct 2026 15:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465800.1676263; Fri, 30 Oct 2026 15:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLs-0006ag-BR; Fri, 30 Oct 2026 15:17:08 +0000
Received: by outflank-mailman (input) for mailman id 1465800;
 Fri, 30 Oct 2026 15:17:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoLq-0006Y8-Ft
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:17:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoLp-000LR9-Sl
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:17:05 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4e3-bab6-0a2a0a5309dd-0a2a450bc9b2-26
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:05 +0100
Received: from [74.125.82.169] (helo=mail-dy1-f169.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4f0-b7e8-0a2a450b0019-4a7d52a9cd83-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:05 +0100
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-36a1947498bso88572eec.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:17:05 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:02 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373424; x=1793978224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8a2b4rCQZ/Ri0eDvVEGx78IoeAx/tMieqM2WVNnANN8=;
        b=PFCeVPEItUj70ljRUzuA7QP/06vk47xBYmF+w6mML+bBGMw/7AL6vI8j913GNab6cj
         IFDAoiL+NJMmqTwecnkE7jJxI2oJra8l1I7YIK4Tc3UhUlcRwpg4WFKf5eOtAGjfYCfc
         HhiI1FbSbILzpdU/g8qWEd/LEGK1iBcIwQDbt+2ZknGL4D2mRc0S9BscKAmlXzH2BJSP
         TD4d8HoO7CbwmrdMAGSYO1cPlFARqkEmKCyILeQbpszCtsU6fovUpU5oj7/6xMYHiux/
         e+t80rZwv+Wc4NcKn51ODZUIEpJhLeMCoP6prPwdAJCUltp271dhmEN5Ck5Sv+ce6sWz
         wDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373424; x=1793978224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8a2b4rCQZ/Ri0eDvVEGx78IoeAx/tMieqM2WVNnANN8=;
        b=SQo7xhfC2PehV3DT7MzFWAmJAeX134B9KTMoxWm0ie51YY7z+dpjLRmYK5xX47feZ7
         i4dKvu+BQ1LJuMaXcHD22lJWvwpZxq8ib3mN4d4CuqwBRavVPtu5hUwmYG7tVuFTDcvF
         aILs9/MNXN6GFtu/QOtd3V/V4G5Bsuih8J3jXMwdjhDMpBKiISLRYvhpOaH59sjUlMNp
         QGzm8CnZBme/WBFUwjXTr0KIFOYhRzkgLt+KUUrYsBtYCnH4fZKTDqZ1ltyqewRcdTBC
         cpRCVzxuOCLJzhM7ltB2I3eTusGMkd+U9L5qegHV8Bnkr+WY/NZNo1v4ITGeO1b94k+V
         qh9w==
X-Forwarded-Encrypted: i=1; AKwUvBzgQ/ybnpXia3eV7aQ6unRLIU4Bo7DwSHwnKxfHEY9UFFklfv5DpI12NHpjPqCgi0uvPXcDL5tWscE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKjAKnFyK/SNCjN5Mg1abUuwxoib3lR5y9LtvcwvGX/zU9AsgJ8
	19XcNQQtg0HwnF932PCSfuTGbOHgXymWxtaWisLFXewAOuBUI1Fe7qOd
X-Gm-Gg: AYBFou2UUrVFcQznpeTJHu7qQKpSlwpJws5Vqi74wySIpT4DjOetOg7XG3eqvaeMw7A
	AiCc58213rGyULDh/w9FgbloM2ffW8hSt/faBMU8qZIiDmoQnJdVIUwS88TTzUje23coq9OLzBJ
	DEIr3gUy5vve4GArjYEeTA2bkAK6bQiuVCS3xQXUDe/FkNQX8rflylED1td5r/nU4dt+D/CJuQa
	8iiYgYsjW/0C0NPQNSJk8EZ30iRAZW3UeE8iLcaroN7BNoD2iMtx1w9uJHx3LbICpNhohdSGb85
	GKW9mLAxjeaIlQvYlJAd01yMfavmfJn0uCR61qnU5mgcRDA+KDWvq7wavDPYDzPE33YGXB0m2Az
	EYgoy41dFER3gbrZB6Me5nsA+gnHgfSnhAuzKLorx4GU1BtrpJ7ijm7pqpFIk7tLwtX/kdT72xL
	fxNo4DfOb/Sbu9nVdIxF8MkIwskpM9cA8LAMYA87gIrQyTV+vt/R7Bqberkgi1ZA2lxp+8B4sX9
	8uR1hVmoKv0BSK+jaGidab17j5xq69MbDU3TwpqRgfXxUD0z5FV725XizqGWf36U0n5OQGQTfMj
	tBkAVY/Lnd4rqwJ/cPFnf4kxf5zwwh4jaMI2Uf4A9PuwJDf3Fou/yub88mT+hFw/tnu6vA==
X-Received: by 2002:a05:7022:eb50:10b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1ac9dc67142mr3312715c88.36.1793373423386;
        Fri, 30 Oct 2026 08:17:03 -0700 (PDT)
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
Subject: [PATCH 06/15] hw/riscv: expand DEFINE_MACHINE for RISC-V machines
Date: Fri, 30 Oct 2026 23:15:27 +0800
Message-ID: <20261030151539.1872-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793373425-AAAD89EA-CAE6A4E6/0/0
X-purgate-type: clean
X-purgate-size: 2807
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/riscv/boston-aia.c and
hw/riscv/microblaze-v-generic.c to explicit TypeInfo and type_init()
functions calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/boston-aia.c           | 18 ++++++++++++++++--
 hw/riscv/microblaze-v-generic.c | 18 ++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boston-aia.c b/hw/riscv/boston-aia.c
index b90da096ea8..54979eae86e 100644
--- a/hw/riscv/boston-aia.c
+++ b/hw/riscv/boston-aia.c
@@ -462,8 +462,10 @@ static void boston_mach_init(MachineState *machine)
     }
 }
 
-static void boston_mach_class_init(MachineClass *mc)
+static void boston_mach_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MIPS Boston-aia";
     mc->init = boston_mach_init;
     mc->block_default_type = IF_IDE;
@@ -473,4 +475,16 @@ static void boston_mach_class_init(MachineClass *mc)
     mc->default_cpu_type = TYPE_RISCV_CPU_MIPS_P8700;
 }
 
-DEFINE_MACHINE("boston-aia", boston_mach_class_init)
+static const TypeInfo boston_mach_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("boston-aia"),
+    .parent     = TYPE_MACHINE,
+    .class_init = boston_mach_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void boston_mach_register_types(void)
+{
+    type_register_static(&boston_mach_typeinfo);
+}
+
+type_init(boston_mach_register_types)
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index b0494b1ac50..b0f837b6ee7 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -176,8 +176,10 @@ static void mb_v_generic_init(MachineState *machine)
     create_unimplemented_device("qspi", QSPI_BASEADDR, 0x10000);
 }
 
-static void mb_v_generic_machine_init(MachineClass *mc)
+static void mb_v_generic_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "AMD Microblaze-V generic platform";
     mc->init = mb_v_generic_init;
     mc->min_cpus = 1;
@@ -186,4 +188,16 @@ static void mb_v_generic_machine_init(MachineClass *mc)
     mc->default_cpus = 1;
 }
 
-DEFINE_MACHINE("amd-microblaze-v-generic", mb_v_generic_machine_init)
+static const TypeInfo mb_v_generic_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("amd-microblaze-v-generic"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mb_v_generic_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void mb_v_generic_machine_register_types(void)
+{
+    type_register_static(&mb_v_generic_machine_typeinfo);
+}
+
+type_init(mb_v_generic_machine_register_types)
-- 
2.55.0.windows.3


