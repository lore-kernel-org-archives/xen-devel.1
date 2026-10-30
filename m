Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FA606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N61yTWMB
Received: from list by lists.xenproject.org with outflank-mailman.1465809.1676281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMD-0007QY-To; Fri, 30 Oct 2026 15:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465809.1676281; Fri, 30 Oct 2026 15:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMD-0007QR-Qp; Fri, 30 Oct 2026 15:17:29 +0000
Received: by outflank-mailman (input) for mailman id 1465809;
 Fri, 30 Oct 2026 15:17:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoMC-0007Ow-Fh
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:17:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoMB-00DIJo-Sf
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:17:27 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4e8-2eae-0a2a0a5409dd-0a2a450888e0-48
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:27 +0100
Received: from [74.125.82.41] (helo=mail-dl1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b506-f659-0a2a45080019-4a7d5229c57c-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:27 +0100
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-14394530ec6so1091624c88.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:17:27 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:24 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373446; x=1793978246; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lrMJa0QKyERxDe5fpQfZvS/Pcg04syvA9gM/OyRcBA=;
        b=N61yTWMB1ADWmkT9WJI+yaXXAiA77+DsmhIQTZnhHWjyUF1Cw52wpp17ZWE9ulGL2W
         r8+rqMKZFFjMzmx8ZaQZCaCzPTH9sW7Y+1lRmOc51o32xLVZxpKPK/k3y6SZ4Mh1bajo
         qnCMd+xIeLCe0YNtgBQTJ+HoGXrfgbbLJjqy/NO2SW447VMxWfBZe7TvTVPb+iIomFy9
         OoPC2QQqjoskruNYxjj0g/8/vyTNTr/lM2at/Tz9wDVmxTY6Gla1qufOfZzb0+9AzcoP
         KBiR/Xz5ttih8rwVZHUMwTPeNbAPGVGjVn885XpIyMw4m9jdX4chcHBRap1NET3hWcuS
         SvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373446; x=1793978246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lrMJa0QKyERxDe5fpQfZvS/Pcg04syvA9gM/OyRcBA=;
        b=oOo/l7mg+lHEE5hi07aQEMgYl1yXaSWm43Xp7lVY4LX/9wJnKFb3x+4bCJ+pZYK1tg
         V7KIVEDddIZaPPZOYDhFsD9bODU52h3x2MpM1pi1OfZ9m5kqo77ppKmbcjxzyOb8j+1k
         HXxylkWFqICQMW7+opRAIlupdGKgn2eWWZmgswevmLyXPoO70963ldbxlg5qszgx/I3r
         +CUgdeYUk87AaoJqwCdjUY8zzGS/7+6KVg/kByfI7LfrcRiqNE2QHNxCdP8u28Uj/SqD
         NxqhBjayWI638aa7kMuH2e3mWTUf8XS6Xqyzav6TUUp61wEEj+BScvbyfooqqLotzKM1
         2T2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUtzt2P9atdbp1zPSfDiqb+74F233wLOqxZ7b0nyd0gl+R/TQSgiONrahr/KZ7zjZ06/4G3MJRtEY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKXRyOgZ7knbk5ubrOfUvSCx2ESwxIUhl/zrhgCPhwheGOlmTVD
	LxlX1j11u6naTbtAWlodO4JuAsG6hMz/EVKhyd1uKKS2Xfc72Jiuke8L
X-Gm-Gg: AYBFou2xH1YA21s7q5bHzWKLPM6cvGl7uX+m1p1v82uCP9QIxRmpJ9ZX/4LIYoGOM7T
	53Wii+/OOr7VJ8m+g63bSpSIqwBKEF53+sfDLCjcYbhdf7aQ8FZ1zKYBwf4PdaFiiArxoEIpNfA
	uehv0nbIS1dXv6U3VErqzFlFeLaQs/w62k5IWwC+bpLBpuz850OJxC22SG+fa3o0Jhyc28WokRo
	jgz7IPHyLMjHtwDrZHfZQZ6CsJY6s+563CWa7OcoIpmjejKknLlFGux58TxVTFcAY5MPVGGdhte
	EQ6wEVEU4l70XOChgBLL+apEpcHlSgFfEJ2vl4IXMZEl6T46XvbqVv7A0JEapzREYXhYcBrBhvu
	h4Pz/d3npcKNurE6Sa2EevmIGKbwQeth+BGpQoqPd0J5BNW8X0EahirmpM5ruN5ns3Dmvf4d9E7
	SPfr+pH2ekXKLQNx5J/0RuN+uixpanOUrjdsZdTo1F3ew8pbbyd+YKdEucp8wyuIOxs/5EjQ61J
	rdTBR1M3ABk54vlDNsrT3aQraFX6s9sRv5gVWx8KV2BhESFlQ0dxDSWX9ImbOBL8WUkIZLfK3kr
	AaHA1GKidsJcYRfjULNgVA4+xbc9qJUo2+Zp46ZPzTszC1DC4meH/nyAH+ostFlfPP+/mQ==
X-Received: by 2002:a05:7023:a5b:10b0:160:90a3:ca8c with SMTP id a92af1059eb24-1ac5cb1c615mr3223077c88.7.1793373445630;
        Fri, 30 Oct 2026 08:17:25 -0700 (PDT)
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
Subject: [PATCH 08/15] hw/mips: expand DEFINE_MACHINE for MIPS machines
Date: Fri, 30 Oct 2026 23:15:29 +0800
Message-ID: <20261030151539.1872-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793373447-CDF4787B-A3549E4B/0/0
X-purgate-type: clean
X-purgate-size: 3959
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/mips/boston.c, hw/mips/fuloong2e.c, and
hw/mips/malta.c to explicit TypeInfo and type_register_static() calls,
reusing mips_malta_register_types() in hw/mips/malta.c.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/mips/boston.c    | 18 ++++++++++++++++--
 hw/mips/fuloong2e.c | 18 ++++++++++++++++--
 hw/mips/malta.c     | 12 ++++++++++--
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 4579df23eb7..2c6edebe257 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -839,8 +839,10 @@ static void boston_mach_init(MachineState *machine)
     }
 }
 
-static void boston_mach_class_init(MachineClass *mc)
+static void boston_mach_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MIPS Boston";
     mc->init = boston_mach_init;
     mc->block_default_type = IF_IDE;
@@ -850,4 +852,16 @@ static void boston_mach_class_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("I6400");
 }
 
-DEFINE_MACHINE("boston", boston_mach_class_init)
+static const TypeInfo boston_mach_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("boston"),
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
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 9a712ee9309..96610ec1fdd 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -328,8 +328,10 @@ static void mips_fuloong2e_init(MachineState *machine)
     network_init(pci_bus);
 }
 
-static void mips_fuloong2e_machine_init(MachineClass *mc)
+static void mips_fuloong2e_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Fuloong 2e mini pc";
     mc->init = mips_fuloong2e_init;
     mc->block_default_type = IF_IDE;
@@ -339,4 +341,16 @@ static void mips_fuloong2e_machine_init(MachineClass *mc)
     machine_add_audiodev_property(mc);
 }
 
-DEFINE_MACHINE("fuloong2e", mips_fuloong2e_machine_init)
+static const TypeInfo mips_fuloong2e_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("fuloong2e"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mips_fuloong2e_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void mips_fuloong2e_machine_register_types(void)
+{
+    type_register_static(&mips_fuloong2e_machine_typeinfo);
+}
+
+type_init(mips_fuloong2e_machine_register_types)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 38c71f66f2e..0a10a2fea13 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1285,8 +1285,10 @@ GlobalProperty malta_compat[] = {
 };
 const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
 
-static void mips_malta_machine_init(MachineClass *mc)
+static void mips_malta_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MIPS Malta Core LV";
     mc->init = mips_malta_init;
     mc->block_default_type = IF_IDE;
@@ -1301,11 +1303,17 @@ static void mips_malta_machine_init(MachineClass *mc)
     compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
 }
 
-DEFINE_MACHINE("malta", mips_malta_machine_init)
+static const TypeInfo mips_malta_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("malta"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mips_malta_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
 
 static void mips_malta_register_types(void)
 {
     type_register_static(&mips_malta_device);
+    type_register_static(&mips_malta_machine_typeinfo);
 }
 
 type_init(mips_malta_register_types)
-- 
2.55.0.windows.3


