Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB271606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQtqfBM5
Received: from list by lists.xenproject.org with outflank-mailman.1465825.1676299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMa-0000Vp-Gx; Fri, 30 Oct 2026 15:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465825.1676299; Fri, 30 Oct 2026 15:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMa-0000Vi-Dp; Fri, 30 Oct 2026 15:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1465825;
 Fri, 30 Oct 2026 15:17:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoMY-0000TC-Sq
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:17:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoMY-0027Pl-9a
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:17:50 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b50f-8faa-0a2a0a5109dd-0a2a45029166-22
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:50 +0100
Received: from [74.125.82.41] (helo=mail-dl1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b51c-6ca4-0a2a45020019-4a7d5229adba-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:50 +0100
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so1423108c88.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:17:49 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:47 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373468; x=1793978268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKYw1CARIGHPsFEBA2gFzPiJ4otfJ5ejgAQP620fQvg=;
        b=XQtqfBM5JEUvB0l5QxiDdCt9ac0S8BMSiyS6OCTM5u5SNkmtbFM0UY2UDGsCPjp92U
         ucdHYlkQNwYmNc+th0Mx/nTdMrWuq1N6tod7+6nassosMpxlXeqL26p+FLzBXev3qKLp
         cozphZWIctrIPIZNk98w9SHMheOHFw9xYk/uonWqOgwYQzsXcIQF9IBx0KBkuQwJGEXo
         v3GEVEn0aOqGDfjRFu72/GInUtG0A0YnWiLIKf5Uf3e1AvzgMZ25qOKGC4D38OXzaUoU
         ADfrseVZhfWsOy0oXCS64hpIZ0vXpFsV+GypsQPsV4+xs64Z3HVsmj6f6OLHoOFbW1Z/
         0KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373468; x=1793978268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKYw1CARIGHPsFEBA2gFzPiJ4otfJ5ejgAQP620fQvg=;
        b=oDP+s0ATMocZCZsUWrRGlUvthF+gXwgluG04PrEmLxCPpixuWOEMpN8Yvja0M1Vmqp
         u2FPqrPu60J2z6vYM47e8JmHN6dIL2HFMgPSZSxlkBQAuMChPaCLGmzh0Q+Js8k93oMi
         SDJQHxpJVKHXlhlIQ0KLhgK0apB8R+I7L6Kub71oqPINavs/yz/b7QKNv2gNrIT5uSR0
         pF+Q2YkQGc42Um71hEgGZi4osPMO0fVKqrd8qlbcjYzSOz2h3Gok+aE7nayOOPWyFPqp
         LsKzpYDh0/xN4dP9qNfCUxip9Ubp86KfwF25NpLqKUGGwyFMWgWkYZeiO4nTaF4GzCo9
         Wv6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLN+VdazE/tDnm3KEW7LRVqM1HJ7psuE8VPSHs+QvtURZ4p5D5zPKrWmyVruGdaBvWNcB2RFl+iKI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJJYt86n+8r3FauYRXkqxRvK4ASyrZaXYfeRvyrlW0+znQifo1F
	lxFEbNi9ETeSahOnIBsWcRNhcvz/jRpqDsrUDs9PAJSzNhKnsbX2kieP
X-Gm-Gg: AYBFou0F5k5GdYuq92VYQY+UBTynaWDWmLtqPQAPjyaBpxqT1fUlAgbKwUY4fGGLm4x
	gIrm4OG6L8pf8vwEX84kBHvKEiJD4gCQrIdd1w3V7Zw61cwLaTnHiT6NUMjf8tD8eVqNM8ZPpqK
	mDqqpZCc/K3PhzXgu+dqXp56ADCuoU/ZbEE6KhaiovIh0yJhqNAV4AqXyNUPWf7SlAsGkkVZHao
	i31+nLiWHPxTzkwsE53nCSQnUrlpGCvv5futhyppEfHmqpzCmC76UaUWaHRY55HbfbRpVI8W8qL
	OOBjIMFPdcGbx0s0JijMm1v51nVq/Wq2UQ9H1VHcJnTako4C0Bqf/BrsomaGUyWN3KVhTbSCppZ
	H9bUVsxzNAG7RQX3DrdaA//1eFr4nESEx7GTjQt38LMjct3MCyF4hqX730H/XaJ/LMc5CyrotCT
	0JugsEVgJJ4AtUHQQK5F9SxmpIfgRrEnh3OgBlnyi4NudwZVRxDE+b8TNKqA+j1LQcqPrSvOgsX
	Jl5quAHQLAmzpsrdI81uKyqKLxN71H8AG9LU6bGWQqE37Yq6hjmKgx2WIhB+ixTQX8fQfw2FUxI
	corwngVC5HbHpQNZ8N/CTGNhIo/N3b+TJrpx8NX+xbk39+SB
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr3802599c88.34.1793373467893;
        Fri, 30 Oct 2026 08:17:47 -0700 (PDT)
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
Subject: [PATCH 10/15] hw/sh4: expand DEFINE_MACHINE in r2d.c
Date: Fri, 30 Oct 2026 23:15:31 +0800
Message-ID: <20261030151539.1872-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793373470-315CD2AC-82E857BE/0/0
X-purgate-type: clean
X-purgate-size: 1362
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/sh4/r2d.c to r2d_machine_typeinfo and
r2d_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/sh4/r2d.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 99afe3618e8..fb80c935ea6 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -378,8 +378,10 @@ static void r2d_init(MachineState *machine)
                        SDRAM_BASE + BOOT_PARAMS_OFFSET);
 }
 
-static void r2d_machine_init(MachineClass *mc)
+static void r2d_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "r2d-plus board";
     mc->init = r2d_init;
     mc->block_default_type = IF_IDE;
@@ -387,4 +389,16 @@ static void r2d_machine_init(MachineClass *mc)
     mc->default_nic = "rtl8139";
 }
 
-DEFINE_MACHINE("r2d", r2d_machine_init)
+static const TypeInfo r2d_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("r2d"),
+    .parent     = TYPE_MACHINE,
+    .class_init = r2d_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void r2d_machine_register_types(void)
+{
+    type_register_static(&r2d_machine_typeinfo);
+}
+
+type_init(r2d_machine_register_types)
-- 
2.55.0.windows.3


