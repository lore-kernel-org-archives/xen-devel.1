Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6089A606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFLJsk9W
Received: from list by lists.xenproject.org with outflank-mailman.1465773.1676218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoKy-0004T6-2o; Fri, 30 Oct 2026 15:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465773.1676218; Fri, 30 Oct 2026 15:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoKy-0004Sz-04; Fri, 30 Oct 2026 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1465773;
 Fri, 30 Oct 2026 15:16:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoKw-0004ST-Jy
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:16:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoKw-000LGV-0l
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:16:10 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b49b-bab6-0a2a0a5309dd-0a2a4505a864-36
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:10 +0100
Received: from [74.125.82.47] (helo=mail-dl1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4b8-4cb1-0a2a45050019-4a7d522fa441-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:09 +0100
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-1438d9363fbso657325c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:16:09 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:06 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373368; x=1793978168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etdm1aeawsytO27AD2qjJhqW2J7wH4UjI2RO2JWtCa8=;
        b=eFLJsk9WcHEneflZ+0FDNYor5aRmZAt13+fgbMrfmx5U7rBnHqS3C83HCduFtLSc0w
         oqDWdHD0QnV6D+77G005TzkJ2fxFkJV0hejcX0FPFtrFkcXOYcAm10KfXRksEMAjLlu6
         5CQu1HMZsBeR7zKMo6IErmZqOhcSk0bZyalzITYaarNkCTD5jGtF6cxSfWe/ARiIfuJs
         7rglUhps3IFD8o2FfPu1OsX+Mn91gzbK176scd28LH7hnoF7AmLcu6N2mHZ6stDtiqqr
         +/Wu8kzKveFb7Y6wuPqsfYD3/oRit5vtriXvxZPR2JXtS5j+Uu4FJDOhkqDgfBn+tOID
         NtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373368; x=1793978168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=etdm1aeawsytO27AD2qjJhqW2J7wH4UjI2RO2JWtCa8=;
        b=w4qdOVZx8qf2GQsVdbu0KgVRJs5pG0db62jdDVDLQtnN+sTq9er3M2A0admQKbnueb
         9wtcVoQJW1jSgy+G1qRrP4xZfSdLJLoZF/6gK4Xjn87t+jcVnhjch7OZ3iQu7tIgAYyF
         X5C+J0WnO3ZcmI60E7fOwgH+dpkQY+cUCKp8BqpzVfKiHt0LAD5cy6guW6oZpW/iY3bK
         yKnXiyxYxh6k4uZe0svd6Em+YVJik9PRjHKWMYKyMIgtRXC+Z+Wd6ztNjmTlTrI7Q/i/
         rli37ulhnHvtHgSDYRLz+oAj09ywFcXQXZk49A2MES8PTaPMfMwuGBqTdOQB1Exol2qb
         cYdw==
X-Forwarded-Encrypted: i=1; AKwUvBxI1kZQ+T2vxKMWRSprvAoWsMgasfkeDHONY/Chjj9DAXSzxMtP4lE6RagPqqtI8z91kOirxWEglUE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK3AeaVfRZb1kBcPZfn+WT3LF+qSN48tjvizB6d6qMk9JbLctGM
	Pj2YceD0nYwbun/87NirhnjFe//XW7L20xPIo920b9v0AyCcWomAf62k
X-Gm-Gg: AYBFou10h+TqQZ3O6mwky41QRGJ7MIHDIrjQOwykPOWo1BL2pUJlw3npyykhyUVYErY
	FchbeTJFooSIXrccasGFd+1uVrfCkqvhg55k7wmT08DWbNcmNo55wsdqhW7G3zH60aVOp+sgxA8
	QOfVBWFAOATZUIi4/oBPY/439NXTNzPue4kSYno2Gwap3et4B7QvdZ9BmivG0ipb6vwUrZSauBJ
	rCmD7+MW+jC3WKHbkm2oEXxRssnwmJ8Jo9qSfUHm188CCLRj9VUXw4yVN/bPs8fZhzZ4SlHR8y3
	mIiTDKc6Pz7U9jXGWYL1IXSYR5so3bjlMdmJAWxu/M92fjBcl010ULsTXBRTCnC69VwKy8/uFMc
	QCDwqoPqAc36NiZXhKAeQktnDYgrjJoY6ADGXP8I0qGfQL4ZkBFBlsHK/OAbaUeU9DZY+B1x6+M
	aHg0pF2bVtXyoU+TyxCFxW/AvNSNTg319GAjVn5owXUOyxVBe4V0/eBOVBXwBJnyqCB7evsgstZ
	3PV51Tt2KALjKHAZLopXtrQ9nXsud4mohQz+3A6peNtHuIj4lHan40yE5ucSkLuchTSV/QH147m
	7F9C3wibprk2bdUc4pHfyiImG6O890hwbJXSxBVs7G7lSAk20d0pDO/mgYeXKV9/7FzH0Q==
X-Received: by 2002:a05:7022:ea57:b0:190:716:4822 with SMTP id a92af1059eb24-1ac599f506cmr3074840c88.8.1793373367717;
        Fri, 30 Oct 2026 08:16:07 -0700 (PDT)
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
Subject: [PATCH 01/15] hw/alpha: expand DEFINE_MACHINE in dp264.c
Date: Fri, 30 Oct 2026 23:15:22 +0800
Message-ID: <20261030151539.1872-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793373369-F64B42A1-01679BC7/0/0
X-purgate-type: clean
X-purgate-size: 1402
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() for the clipper machine to clipper_machine_typeinfo
and clipper_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/alpha/dp264.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f928e0cee82..83e9a0853c1 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -201,8 +201,10 @@ static void clipper_init(MachineState *machine)
     }
 }
 
-static void clipper_machine_init(MachineClass *mc)
+static void clipper_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Alpha DP264/CLIPPER";
     mc->init = clipper_init;
     mc->block_default_type = IF_IDE;
@@ -213,4 +215,16 @@ static void clipper_machine_init(MachineClass *mc)
     mc->default_nic = "e1000";
 }
 
-DEFINE_MACHINE("clipper", clipper_machine_init)
+static const TypeInfo clipper_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("clipper"),
+    .parent     = TYPE_MACHINE,
+    .class_init = clipper_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void clipper_machine_register_types(void)
+{
+    type_register_static(&clipper_machine_typeinfo);
+}
+
+type_init(clipper_machine_register_types)
-- 
2.55.0.windows.3


