Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7B606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qThnziT9
Received: from list by lists.xenproject.org with outflank-mailman.1465775.1676227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoL9-0004ld-Cz; Fri, 30 Oct 2026 15:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465775.1676227; Fri, 30 Oct 2026 15:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoL9-0004lW-AN; Fri, 30 Oct 2026 15:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1465775;
 Fri, 30 Oct 2026 15:16:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoL8-0004kn-5P
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:16:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoL7-000LJS-I8
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:16:21 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4bc-bab6-0a2a0a5309dd-0a2a45078a10-30
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:21 +0100
Received: from [74.125.82.44] (helo=mail-dl1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4c4-b4ea-0a2a45070019-4a7d522ccd2d-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:21 +0100
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-15943c9c005so1423761c88.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:16:20 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:18 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373379; x=1793978179; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLhsKCTjuKy4eSFshqKS/+IjBjdCXZJ8by/9qMkJXhQ=;
        b=qThnziT9fh2r9pq9dhjXhrvKofvJ5+uG3t+1kR98TlJD0fvzgAfi1ZejBPtOxvN6Vh
         zpGWHsQba1zbwX5tDpmjIBW1DOjh2fOkR6e00/94vt2h/1KYSFP2Xdx4A9wTAqCvm+S7
         TkmLVCc0ZoWIC1/neKEDITKlrUJO1TwICVEKtBY1316ZfVrIfcc4kJiUD/9nzFOHRVDd
         s7Bqg77tbWAqwg8WI0ssRpOAS01AZUVMdA60g8iaAFbGOnx+KydzeER7SdeArxaZtTdP
         tB+wqX8MogNwHYExnK9ZZhdZoaozOdocsUFMCn3synsj84hCf982pmOaSd4uZOyTsKH7
         2IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373379; x=1793978179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eLhsKCTjuKy4eSFshqKS/+IjBjdCXZJ8by/9qMkJXhQ=;
        b=KQzdPwxUTmSZUd8P3PD0ZDkqQpTAgc62rmAddQQv4Vtl8AeRXeQyw0pz/bcLK79nHW
         mdKA67qgrXG4bc974OPWjhZC1et9Ft40JH8RErB9iPIvoKAkSUETIH0LCdARWzAVehdq
         QnzqOPTIkFLd2egwUyqgv7cW8PxWHyQKKVxJjadyJ8jCQ3zLFDcjTk9AhwrVPw/lvRRK
         itcX2mqeLc8yM7AtNcayjP5GvpzcF8LF1iBCG/M7zCFUPenBFCPSsnZtqwUWgfk31LSe
         LuoGNGQEJt/akkEd+DyyhwDhgdK5Sfrxzl0d00gld1hU4JgIXhwialixymjz+72fXE+E
         /fUg==
X-Forwarded-Encrypted: i=1; AKwUvBz963+0fFSK+noPAVbE6Qw01T2BzIGDi697uW3gQjaBvDxOo0GzzSYCrkh4oN9YZd8rU1xAR+UZc+o=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIw7tMRRPEmDBT7vDkWGGeSh1YcpDhMyTWHdj+n9dNppM/XZwKA
	HmP4tsfhKU5P+daJJIYmOfUPCaLNhNfeqPRPaA3HKSg3DYE4Cnpm9Ahn
X-Gm-Gg: AYBFou1oKodPlhlci9rnH5M6888ZPVA4Ym8/A//QJJs3oo4W2G69R3IrIP5IsmQlXGV
	QfXkNr90boDDmcfGNqEDmDcetsHnuEyHSQW9+cQwrfMugPp45wQmEvUkEJpP3nehjaagAeJLhFi
	8TGNroen5CJhOI8cVmryAHoSkFC1WdQOEW1qPLg0NbWB6MAW9r94bt5v3t9N9Kbnuzpcs5bGzcO
	620ZWtPqPfZoh4yxJewvaOglMj3L+fagbDDFMwU+eNQ5uXM/3B5HroODdxs48Q9pWUa/LcY0xt5
	LDVXTcSMz6dGCSVsIy7s29whi0pjqBVl+R5dKSsaJ24/39XSXZj15k8Of2K7pKxhS/I1LqUPB+S
	z4gmtEgeoeVnfxslWLWl45amMuySrZKV0vc1JKm6MzERZrpUfM1QW8GzK8ckGynPn2ELMLvcDBZ
	UD/TSQa23HQVkr9P1es4kEn13DY8qdxx8fWs3x3W4qAyl07wWhcCiBjzul3QCF4ONuczW1rrH6Q
	kbk7JEtF8RmGmHAu0nCp4XJ4FFDItVZfzLyZEAunpQpKQQ7/dHc90FtRjsh3GmAcwS7FRoI/3GB
	oZoJPdjiDR7Z41rgw/fhsyV0h9dH9bV4bxJIixdhl7TEckEplZsCbR+t5Lm3jmJnTtiEhw==
X-Received: by 2002:a05:7022:e27:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1ac5e8e1e4bmr4866883c88.41.1793373379151;
        Fri, 30 Oct 2026 08:16:19 -0700 (PDT)
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
Subject: [PATCH 02/15] hw/m68k: expand DEFINE_MACHINE for M68K machines
Date: Fri, 30 Oct 2026 23:15:23 +0800
Message-ID: <20261030151539.1872-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793373381-34ECEAE4-5F473C3B/0/0
X-purgate-type: clean
X-purgate-size: 2520
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/m68k/an5206.c and hw/m68k/mcf5208.c to
explicit TypeInfo and type_init() functions calling
type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/m68k/an5206.c  | 18 ++++++++++++++++--
 hw/m68k/mcf5208.c | 18 ++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index 1acd2fbdfb3..8838563cb3e 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -93,12 +93,26 @@ static void an5206_init(MachineState *machine)
     env->pc = entry;
 }
 
-static void an5206_machine_init(MachineClass *mc)
+static void an5206_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Arnewsh 5206";
     mc->init = an5206_init;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m5206");
     mc->default_ram_id = "an5206.ram";
 }
 
-DEFINE_MACHINE("an5206", an5206_machine_init)
+static const TypeInfo an5206_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("an5206"),
+    .parent     = TYPE_MACHINE,
+    .class_init = an5206_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void an5206_machine_register_types(void)
+{
+    type_register_static(&an5206_machine_typeinfo);
+}
+
+type_init(an5206_machine_register_types)
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index a8068c91f24..5c3ab48ddde 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -389,8 +389,10 @@ static void mcf5208evb_init(MachineState *machine)
     env->pc = entry;
 }
 
-static void mcf5208evb_machine_init(MachineClass *mc)
+static void mcf5208evb_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MCF5208EVB";
     mc->init = mcf5208evb_init;
     mc->is_default = true;
@@ -398,4 +400,16 @@ static void mcf5208evb_machine_init(MachineClass *mc)
     mc->default_ram_id = "mcf5208.ram";
 }
 
-DEFINE_MACHINE("mcf5208evb", mcf5208evb_machine_init)
+static const TypeInfo mcf5208evb_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("mcf5208evb"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mcf5208evb_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void mcf5208evb_machine_register_types(void)
+{
+    type_register_static(&mcf5208evb_machine_typeinfo);
+}
+
+type_init(mcf5208evb_machine_register_types)
-- 
2.55.0.windows.3


