Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B826606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4zbdFTS
Received: from list by lists.xenproject.org with outflank-mailman.1465805.1676272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoM3-0006zf-LY; Fri, 30 Oct 2026 15:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465805.1676272; Fri, 30 Oct 2026 15:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoM3-0006zW-Id; Fri, 30 Oct 2026 15:17:19 +0000
Received: by outflank-mailman (input) for mailman id 1465805;
 Fri, 30 Oct 2026 15:17:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoM1-0006yN-JO
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:17:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoM1-009M9t-0A
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:17:17 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4e6-e002-0a2a0a5209dd-0a2a45039a82-34
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:16 +0100
Received: from [74.125.82.43] (helo=mail-dl1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4fb-fae8-0a2a45030019-4a7d522be5d9-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:17:16 +0100
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-1931ff67a29so121237c88.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:17:16 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:13 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373435; x=1793978235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m864uzH9D1nJnXhJ32zoDB2BUw6AVK2KA1WWNZhkMsE=;
        b=e4zbdFTS1dR9004G2INreGHxjsw47iIufXODAoPsRmCC3z+YjZgR+lt+V2prIS5XhM
         vrUptCw27i2NFjMvRhbZxPQ4Tnxpv6Yape4raFihbK1zLIPzTSFLljtufKr8m+YY3LQR
         L6cE9M2HUvqhA5sT5x2v/wHMJ/NMypW7XSFVDZcZ1I8jAtqJb5F7dLo4HkrRvqeDaZAb
         C+SZd4+YNWQ8+HhIbt3GEhR4xpVB+2qAh6gK39egrIq17BGPjS6Hyvoz7BXjZ1hK5f7H
         /49iAKPuUIN3lpNJoS1+i7pTS2ISKNTstrYm+nebYjTOHl3HNngIV14Bkqavd+v+Uh0F
         K5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373435; x=1793978235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m864uzH9D1nJnXhJ32zoDB2BUw6AVK2KA1WWNZhkMsE=;
        b=sKtyckpoHw854z+01VAHShe5bMlIZ2xoAR/horxc5dw8hobLjkIZ/8Xp9wGnlPQtxl
         ASyf9JOeh7BtlPCeBID2KWpJVT8pjs0uQHLhSa+IG3UBjZO6HrBSEEYVZvJgvZ2a42+t
         ZARZHlMDjfDpFLIHCMCf51wYaGzzAU1PRUXcTuu6zTgp/APGT8xpU8xGPYDmed6uBB7V
         jiJWp2IZtBeqXqu2mj1YKh5s9GRiKK+aRsEvz+IjzOyWcmRHHjkcOk4qLAyMp7GsdRLT
         QTmOrC93UOpo49Z70O885IxRJJnOqMaM10TyMWSxNlyIFCo/NJVd0H/eQK6+2NDuY8hw
         rL/w==
X-Forwarded-Encrypted: i=1; AKwUvByb1owKLyQWIdiCxIjbkEVZk4fNATbGXtuEUUAI6t2skXr0bFg1xNMd//ntF3w0EfNRH4YpmDL2W10=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIJnZw36lcVM2RZmIr7abtgPEm9BTTxnVRjloB0XE0uNXLvAswx
	qUVMfq7c6aNmTwADQidQ/VVn+6rodfVYTJnnws6FmwE8KGZ1H7+v7ipf
X-Gm-Gg: AYBFou3gGYyE5A4246rOzbAK0Rc16HxYN4FqaQVAYD5UajvJT66CXXyAFy2moC9vN0R
	YkZ65UyCYLnk7ltkNI3LPUtVzcOH7mqv1SDQQThpKSZbMxAp51tKPuO49LYMRd47s0HPysVpYCU
	SCUPEFRlPko9MofF7GNVAHC0JnBMIsTqA2N80n4wkCzq+tE4fWXxBQopP4Hs8s4WGSm4EO1c9H7
	yFnyK82Ku3u/CAi8f+yTbZbdSPxZWaUR5qmUISSCz5T9y63xzIghL18cU10b7xe2WmQRcJBMJZh
	yLb69r5RNc3zUn5eQB/6HUHzj6lhz91ju2tE3h3T6hmEh7uDXtkRCzuG1xQK4qTlqtdwh/aKmZr
	Eo1rRNWmy+3zn5FlbusS4gRJ1z2zgjpas5NkM6OjZO4ZtfdVrkSn6Lv++qKNI6CmwJRirJwfPZ2
	J6yKLo5466jAj2F7scCjUsD7mJl9Daw+7qfTwzUY2dMWmhNQ4FP4T1FI7pzHA7MJCs0RMd48ge2
	WmvkFIXMVb1j6liOM0jDvztZaw2gng8V6+truZFEhINAWgHWU8jsVNczWlm7X/0Y+KO1EdMzXVz
	bhJ/Kmkwn6sBz8xL3JRU8F6G+oeKBP6U1w==
X-Received: by 2002:a05:701b:4512:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1ac5b7e21fdmr3546543c88.29.1793373434663;
        Fri, 30 Oct 2026 08:17:14 -0700 (PDT)
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
Subject: [PATCH 07/15] hw/core/null-machine: expand DEFINE_MACHINE
Date: Fri, 30 Oct 2026 23:15:28 +0800
Message-ID: <20261030151539.1872-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793373436-74C884E9-92BF7DB9/0/0
X-purgate-type: clean
X-purgate-size: 1451
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() for the none machine to
machine_none_machine_typeinfo and
machine_none_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/core/null-machine.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 60254913019..1f35b9169d1 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -42,8 +42,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void machine_none_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -55,4 +57,16 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo machine_none_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("none"),
+    .parent     = TYPE_MACHINE,
+    .class_init = machine_none_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void machine_none_machine_register_types(void)
+{
+    type_register_static(&machine_none_machine_typeinfo);
+}
+
+type_init(machine_none_machine_register_types)
-- 
2.55.0.windows.3


