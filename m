Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B72606A324
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1ksLwSV
Received: from list by lists.xenproject.org with outflank-mailman.1465834.1676307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMl-00010b-NX; Fri, 30 Oct 2026 15:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465834.1676307; Fri, 30 Oct 2026 15:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoMl-00010U-KQ; Fri, 30 Oct 2026 15:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1465834;
 Fri, 30 Oct 2026 15:18:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoMj-0000yN-Ou
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:18:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoMj-000LaV-5e
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:18:01 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b51a-bab6-0a2a0a5309dd-0a2a4508ed70-40
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:01 +0100
Received: from [74.125.82.48] (helo=mail-dl1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b527-f659-0a2a45080019-4a7d5230b4a6-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:00 +0100
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1a3c08d6928so1021752c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:18:00 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:58 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373479; x=1793978279; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unXNvMdiHSqKZbW2yjBCaHIctKeqs2ATJiqxjlNdZQs=;
        b=Z1ksLwSV57ikCDfurudLxGHfpduqJw9V9E1ZVvIivCvEoI43ci9UlvMn2soi94t5pN
         KhOymbsvqw2g2eb9/AAtfBeXUF/zqIOD2BRi/iLrTyufqJtDYROP8fU+s0UnkC6TlA1/
         wmrjyWQySmrQsvvckJfZ2vy3ZAuh8My/7bX+tIzMiZmJiv6rtYF2gstgWVggJrn46OUe
         VmJLyLTdseUATgQ/P7zvVCcJqkk09/K9WS7aV0t/uzgisGsyjoGvti3RnmnegdG9Tx2P
         l+tFS9uVWExdU/6XYPya2XRWCD9VYxyvg3RCQLJjy2RDysEbLPr5+isZJ1mKRb+PZIIw
         SMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373479; x=1793978279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unXNvMdiHSqKZbW2yjBCaHIctKeqs2ATJiqxjlNdZQs=;
        b=1ioegHY8pz0Asa9uCnmduIgFVx9TDnX/mMLUbFuWZv8wkfZVZ0AamU1kgy9oZTsKB6
         xonh/kO3L49lAWpix0hCtycNpTReILDas4aOyVorXQkmUWBsr68UKIhkFJM7kmYjs1bi
         4Uk1AaqqoJCXCqj/rvk/+YTOvTyNMn7aFEqxFVJ3dLBP9oBQ3Kj4qQMq4dZCpaz3iIFA
         EXiKErAMYbr/QVtlyiXm+7t+abs6sLIW2+pnycCXecKI4n5/WvmUTuGnLfVGZARtH/eh
         1fdXIXA4bssyRbRvwnFvBWHlJI9ZXHBjXSrAZsCSAcIxmL40ajqtBhXm7AoIaspFYRiv
         QP8g==
X-Forwarded-Encrypted: i=1; AKwUvBzYorreJ+1lrMxI9K0MuWb8aMp8ofh2zsM5aRrZ9bYGx0HFn1V+wzgwcYdFfGW9CrbU1PywX+1RWCo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLSf82/NVoomJxM0TynHyMEDfu/CvFrgQkdqm55OIzP0cixNY6j
	2K0rslhVZPddyBBgLuBDKb2w03Jt+PGCgM8ChnSaN/ww4dORzFFT8Ff/
X-Gm-Gg: AYBFou11FqHMa3SctHdxNv+gXm1/Hd5nJqDgjFG8Vnb7acwPw3VAAsl5a0WFNLgn2zl
	7RPsaFtggbA/h9orTDBLW/tRu49Rr3M9FN5CBYlMPNROVn/Tt00Qgpi1fk+tAl0/SacQ9qta5KS
	EPvnfzrxQD0k9a+ga2OuCg5FOP7qf25NK4d3TAcvlx/lKUAus4QBfZTQk8mtifHbyrlpFcxKwx1
	aQEHa2WkRBRqqBM5y+YUHVQHv3/jn8jFUDrhwEVc7ZXxukZ+GW0luGbb1T/xqV7Bq8P3FFUr8eV
	8pNsgTfLGbREV1ZwrLNAqQn3gdpafn4TJB2fvW/eXIULK3w3zGzThNksy4z3ywsNT6OD9lVdt6O
	tyfMmAoQjai3CWEQxctx4suZsk4NcMzEwTngxhUbKaQ8/8agxvCMxrOquCfB0zzSGd+027NsPV0
	tp+HwDc1eYjHQ33flwSVCP34vrJ9Bgn7aFllo7ZSOB6rrtBg3Q2FAoijs7cbTmBajsgQxsdNyMu
	GTmiBzlPsSeshJrXBPlmBLBCtZRYSJje/yxhjUgV9uthOIo47Zb+qvzDkU94d1uN6yajf833Aea
	3/dKNXwsykchl72BKBG8OJtqnKAU7y4BAonasSTWuHqTM+mh
X-Received: by 2002:a05:7022:ea8e:b0:1ac:f84d:4036 with SMTP id a92af1059eb24-1acf84d43f8mr2092732c88.9.1793373478878;
        Fri, 30 Oct 2026 08:17:58 -0700 (PDT)
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
Subject: [PATCH 11/15] hw/sparc: expand DEFINE_MACHINE in leon3.c
Date: Fri, 30 Oct 2026 23:15:32 +0800
Message-ID: <20261030151539.1872-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793373481-D775B87B-D41EE646/0/0
X-purgate-type: clean
X-purgate-size: 1565
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/sparc/leon3.c to
leon3_generic_machine_typeinfo and leon3_generic_machine_register_types()
calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/sparc/leon3.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index d4a6e917598..ddc25f528ff 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -434,8 +434,10 @@ static void leon3_generic_hw_init(MachineState *machine)
                             LEON3_UART_IRQ, GRLIB_APBIO_AREA);
 }
 
-static void leon3_generic_machine_init(MachineClass *mc)
+static void leon3_generic_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Leon-3 generic";
     mc->init = leon3_generic_hw_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("LEON3");
@@ -443,4 +445,16 @@ static void leon3_generic_machine_init(MachineClass *mc)
     mc->max_cpus = MAX_CPUS;
 }
 
-DEFINE_MACHINE("leon3_generic", leon3_generic_machine_init)
+static const TypeInfo leon3_generic_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("leon3_generic"),
+    .parent     = TYPE_MACHINE,
+    .class_init = leon3_generic_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void leon3_generic_machine_register_types(void)
+{
+    type_register_static(&leon3_generic_machine_typeinfo);
+}
+
+type_init(leon3_generic_machine_register_types)
-- 
2.55.0.windows.3


