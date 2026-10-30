Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68321606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f9y5VfKT
Received: from list by lists.xenproject.org with outflank-mailman.1465860.1676334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoR0-0003sl-NL; Fri, 30 Oct 2026 15:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465860.1676334; Fri, 30 Oct 2026 15:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoR0-0003se-Kd; Fri, 30 Oct 2026 15:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1465860;
 Fri, 30 Oct 2026 15:22:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoQz-0003rb-9E
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:22:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoQx-00EmBt-Ja
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:22:23 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b62a-2eae-0a2a0a5409dd-0a2a45038dd8-18
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:22:23 +0100
Received: from [74.125.82.42] (helo=mail-dl1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b53d-fae8-0a2a45030019-4a7d522ad4ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:23 +0100
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-1adbf62dd31so543667c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:18:22 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:20 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373501; x=1793978301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4ZF6CX3HwMSnOXWr+3Or5e7RYyQ6c3g85+NgZehtQ8=;
        b=f9y5VfKTLOpNY0D1Y2ymVsXBMw8UMj/+LeV7iUZeqtfE5yZBt6xzDlFXk0QtK961hW
         rvBqpCakhLdqqkjTE0H3E/Y8Vc9uiBIQG5drOwIFHLXoeAb6I2bQlk3pQJTx2khwoPr9
         FumUbGHJZ3YYr6JukZzgfY4xKnVTXmHkNLe5NU9oBNX2dMfEWR+D8Psrk1+MDzcwiiAq
         r7uEmTuFlNyS8lRFFid334gUupRjrIK+153EFwckwmFV7B2BzoGjKKDmF4vJmgbTeu2V
         Cc7E9EpGFsZ+e2ZW6Lh+xXps3TcfBBfdviEF2OJ1rWwKlfm2/n+aPd2mqfSdKy0OhbDN
         ntzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373501; x=1793978301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4ZF6CX3HwMSnOXWr+3Or5e7RYyQ6c3g85+NgZehtQ8=;
        b=fhVZorovghc4ZocdJANxv3z0pUpn2EkE2YOh8mmgCUSLQ5xH5uAdZaicxOXz7I8udw
         9mE0q1HzhR9znFXXoWMEUNb+F/Jbs4UwSRZc+P4Yvru+fHsam75ZjSjU41ah3u1IHRDQ
         P6O1ZbnjCoCvfS7nolmQLiyzwTEOUEIpbkQiLJscmnaSq2SV0nf6W6sVF8UG7ooaosf2
         Z/4JKQmwPL8ENKknWzorfjBum2ZCE517Sa8cD6dCrmdFzFvC/VZYx0SthE00VS1aR7IQ
         oBqbmWMQgONb3vDCGB0iDsvQmCf7ukvAlHW1v66wxNK2hdsNEm0No7eLspRSChHVymG4
         IAaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdI093K/nFjg0JI232OvOcJ47fBpuHGP3oVg75hEWzeVjeWcGcvUhp2CHFoqIWc4CVgAgVpJEtByY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJzNnEJY8hLTyUAcXN6F8BCKjS8Uihow8Z3W7Zl4cLkFdbYa0cY
	UJ23U+IHd7WEt5Avk3OPm/fs8OM2IhWgcQY5vv/H/RgRqDI6dBVb0NVW
X-Gm-Gg: AYBFou1Ca0PlzeG3J4ZiZdNUvw5jc/4/RoaXfKuxtDjctr4ShElrBSMxIeBPd/xx346
	djGY820DaICHjnh+ddbCPx0SuhwVGTqEHJXmDMn3gjz6Ks+ahtNTR9L4sUIrinlai0VWJ9mGxTg
	yqw0RSps3KfnB5Y6YJ9PqNUwOIxj/BbULngFZXWto6XZZ0a21ghhnHgdVmLQQEO5h333uG7LJff
	n6/5j3JLgzWzz+U8iuB5KgWprH8WgvLuvd3tjDljK6iIIzqonLHxt5/2Fb8M8jlHudqSS7mNl+I
	S1ObyWogQeFemDQIufHhz8O+vXUUqX4oGqlumLE0NycBEVMOXXSFv7I2sOpUIwp9m5LO258YnWz
	KrNRH1yJ3sSEgiHAhzCtjDIAVfyJbjAVC4/9GC1nL7N2yxksww/aDdU6kYdAjXcKIaLE7V22H54
	TkUUEZN+f8MKgYns3v2YvT2O2lAjQshIOkUb8flWFZLxGTIxutLkQDmJMvlCmwkxiELogLPDXUt
	xpTTu93Q1okbJrtMQqU/M6KNpZ0qXsptPm0txttA8vQA36u/tZhsUM+wcdctSwELt6PcvDCvQR+
	1UvvOtHVBBjJF9NBlqO6TndhZl+/2XuUM3IMLgb9FtULnw27jg==
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id a92af1059eb24-1ac5e6007a2mr3303536c88.41.1793373501142;
        Fri, 30 Oct 2026 08:18:21 -0700 (PDT)
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
Subject: [PATCH 13/15] hw/xtensa: expand DEFINE_MACHINE in sim.c
Date: Fri, 30 Oct 2026 23:15:34 +0800
Message-ID: <20261030151539.1872-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793373503-774F44E9-CD73F2E0/0/0
X-purgate-type: clean
X-purgate-size: 1493
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/xtensa/sim.c to xtensa_sim_machine_typeinfo
and xtensa_sim_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/sim.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 835cd04fe01..fd66009b950 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -121,8 +121,10 @@ static void xtensa_sim_init(MachineState *machine)
     xtensa_sim_load_kernel(cpu, machine);
 }
 
-static void xtensa_sim_machine_init(MachineClass *mc)
+static void xtensa_sim_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "sim machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     mc->is_default = true;
     mc->init = xtensa_sim_init;
@@ -131,4 +133,16 @@ static void xtensa_sim_machine_init(MachineClass *mc)
     mc->default_cpu_type = XTENSA_DEFAULT_CPU_TYPE;
 }
 
-DEFINE_MACHINE("sim", xtensa_sim_machine_init)
+static const TypeInfo xtensa_sim_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("sim"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xtensa_sim_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xtensa_sim_machine_register_types(void)
+{
+    type_register_static(&xtensa_sim_machine_typeinfo);
+}
+
+type_init(xtensa_sim_machine_register_types)
-- 
2.55.0.windows.3


