Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F04606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkgDF+fl
Received: from list by lists.xenproject.org with outflank-mailman.1465863.1676343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoRA-0004DH-WD; Fri, 30 Oct 2026 15:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465863.1676343; Fri, 30 Oct 2026 15:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoRA-0004DA-T5; Fri, 30 Oct 2026 15:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1465863;
 Fri, 30 Oct 2026 15:22:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoR9-0004B4-Jt
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoR9-00HHQX-0r
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:22:35 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b622-bab6-0a2a0a5309dd-0a2a4507a196-42
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:22:35 +0100
Received: from [74.125.82.44] (helo=mail-dl1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b549-b4ea-0a2a45070019-4a7d522ccc80-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:34 +0100
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-170135e43c7so1231775c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:18:34 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:31 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373513; x=1793978313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpRZPrdA7p4HsMufejy4KcfzX3kqDfNgpM3OElffcBU=;
        b=TkgDF+fl3ok8OLoMXP2yKewM02XPlSTlUWs+BLBIYb+QOM4OlBtAvjMO+Ezx93Grep
         OQVQ2ERtMyvf+Z7haJz/iQxJBlCcNxdZje9dOhSOWYwVdAVeGJ2AOyLxwVju+XZydiFj
         BohBlQp1KBiCgWR1q2/AXgsQtEnYyMgI5A6q85smL/EJusfZ2OOzBzVhlKMWoBIGeIWq
         d7oo6Lq/93bgFCJ+2EhWWKmHAnvzudDNrjz9QtKiHen+t6VEQo2e1DNhIrmBCqR/6LAm
         rowicR7hExYqdPDERD2gR8h5bGwoUqmwWyZqF1XSsXzurqsjYvyh1ASQzCfMyOlMiEeq
         2NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373513; x=1793978313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpRZPrdA7p4HsMufejy4KcfzX3kqDfNgpM3OElffcBU=;
        b=s7mfVM58lvibfjWlAx4uRMsNgqK/Q0zXVVEDngYlU92ugBRm0uM0awM+sax5jHS3Q4
         cZt9Rsir8gsXYhqbKURGzkD8Ee2Q3paEptvbfVMytnbchGG5TMsM+fpmmfm4w2yNyepC
         pLhA4rZjKl1IVGVdbnJ5koFKQ90OzxaK+ncrPZnhqDRQmwYmthdVcRZlYwxK4BGG2XcC
         FvtWWeXVgynX+R6CWk+4lGhrYHmPJ7yM9pceZ9EU+yMoAZ5ubQNru+tXFIcAh7syBhix
         +6zrapomU0ijgFqHQ1rL6A8ECRcvdiwd34XDwYRfFLJhs7f2p6gc6ej6UZPOsmU0ZoyA
         +dgA==
X-Forwarded-Encrypted: i=1; AKwUvByPbTQKdLWoaGfV4oe7CJOGtxvZ+r+zspkkUeY+PyvR2EM2I5VXyrUtjSlHGkS3AIagbErxTZkHpRs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYICNGLYh2fYBORxseYLk4KdqY9eSsIzc8AfVm30Vwf0ceESt6Ey
	AA+ZhKENMfqnP/ZXNt7iT/IV/R9HuawXdBZYIJ+iCd7QDVaMov9MThzN
X-Gm-Gg: AYBFou24KY75ZQG2COLjXywzrToH1Ae8rzNMBeiB0XUqnkHGca1m3CGlZTSaBLdTRb0
	f1KB+GzeR9hJSKlJTFy/6yRfVXQ08HC0ewJipwtN47BShYWvaSOpHvpX7SA/7DZtvuQeKlnXN5A
	7H5c75ExeDOwEgaC1eM+aqZ0PiNM4Gx+1+jYmzb8C/YfZyqavEAes+gPcYai+DPnde01Cj9yj50
	qqgtllOTi8NzoR/S7nMnH9e7445tGs6J6BfCnwTY0TRMI1Mg8IBF6to5FpqbUuQpSFClRXVTj9U
	rwgutEX7/F3+vRl9wm9ELFqpKFTKrKAmxt/CmK1ZG/IprVC8GBn1ApoUOjsd7zGr2/VsXqcvbfg
	vaL5LeT+ih01kQ9fMrr0ZDZIybV3C8zQUhiAJ1L7L4o4MM5ewxveavdkeq2hObhbq7wuq0HbErr
	wZIBuutmsCJclIlwkpsMI8tOzPZH7k3tlcC157lvKlMBi97D8A48AuOeFrISvdFZ5fCVLJbtz43
	HPZ9fXTHTgWWeNzeZqHVn2SqR1yWwnCVOzHS7KPpx64DZtzi6xfpWnjztLXwNWqaoPi4kEYnbqT
	hKt/Q48e8LedEWxNzQTgX+C1x5H0sX9ponU0sdkAHlEXoAgCnhsnLPj1S9GYI5I4vQvOww==
X-Received: by 2002:a05:701b:2082:b0:143:271a:3df2 with SMTP id a92af1059eb24-1ac5eea21f1mr3303233c88.44.1793373512457;
        Fri, 30 Oct 2026 08:18:32 -0700 (PDT)
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
Subject: [PATCH 14/15] hw/xtensa: expand DEFINE_MACHINE in virt.c
Date: Fri, 30 Oct 2026 23:15:35 +0800
Message-ID: <20261030151539.1872-15-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793373514-3C411AE4-EA0D7EC6/0/0
X-purgate-type: clean
X-purgate-size: 1499
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/xtensa/virt.c to xtensa_virt_machine_typeinfo
and xtensa_virt_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..8c8fdad72f0 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -115,8 +115,10 @@ static void xtensa_virt_init(MachineState *machine)
     xtensa_sim_load_kernel(cpu, machine);
 }
 
-static void xtensa_virt_machine_init(MachineClass *mc)
+static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
@@ -124,4 +126,16 @@ static void xtensa_virt_machine_init(MachineClass *mc)
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+static const TypeInfo xtensa_virt_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("virt"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xtensa_virt_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xtensa_virt_machine_register_types(void)
+{
+    type_register_static(&xtensa_virt_machine_typeinfo);
+}
+
+type_init(xtensa_virt_machine_register_types)
-- 
2.55.0.windows.3


