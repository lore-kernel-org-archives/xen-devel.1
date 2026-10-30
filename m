Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38326606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gJMOt/xQ
Received: from list by lists.xenproject.org with outflank-mailman.1465783.1676245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLU-0005Zq-Rh; Fri, 30 Oct 2026 15:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465783.1676245; Fri, 30 Oct 2026 15:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoLU-0005Yt-NR; Fri, 30 Oct 2026 15:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1465783;
 Fri, 30 Oct 2026 15:16:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoLU-0005Xr-40
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:16:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoLT-00A6wy-H6
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:16:43 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4ba-2eae-0a2a0a5409dd-0a2a4506821a-40
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:43 +0100
Received: from [74.125.82.48] (helo=mail-dl1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4da-195a-0a2a45060019-4a7d5230ac9a-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:16:43 +0100
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1a2761c69fbso2021882c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:16:42 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:40 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373401; x=1793978201; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zA4vatNcIKJhE+Eb39umMv/j/wzlc1JpQpFuLfiMq1c=;
        b=gJMOt/xQlMHXc954IX6n9hct3SgGEcs5uFlN9Os13twS8tXfFxHD2KYETHgEXrh6F4
         TV9uqZ5pwhyUowrRGVyOc4qkXiVcj6YXOvsEF4ytJMNTcPVWWA0+3BhjxTwO6CII2j+j
         v6ttYjqOuMpYogXWAVRMds9cHlzSW0e5VZriXx1vI69pKTBQyT7HKHmGwndCo/tCjVeK
         YfcUoj4m7zj/IwF2zlgRGQgayUBJJqdw4adNdLrq9L5I9NkPxHiQ0Ww0wR+xcUl/pD2m
         7jgMCGEpIXNfC9XV43bBZlbAzWZYZTDC0fCQPZ4HX2fzmwIUDSuFNeCyZ+uI1y7nXCK+
         GZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373401; x=1793978201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zA4vatNcIKJhE+Eb39umMv/j/wzlc1JpQpFuLfiMq1c=;
        b=ZpCPgrp7BUvJKp8h+EV/81LRnIzvhXUXAfIuTAawdxlX8a4GX33wQnl8D7PxNpqu11
         O/7V+Yrl4WpNN6DEjJE13h8CE1T+j6p8J6XM48xt9FBOZaTNTfXAtZ+YhvxWezJRqd+V
         1bGVzozDTxdQKDpuVhGVxLNLBVEZFMTuwors+X5trW2BkmztOteREODHFLKH2vLSmB5j
         W9GhLi9ZFz1djsU8tgEHF8sVwjMTAPbn7B4o1Js1H33s0Wq/utUbolWi5prcAGiNFr7b
         B87hCHxl/1/Zc/plIo0vkYj2P4dFZtgJEhAhQ60+74lcv+Ozyr+cYOZxEhj3dbWFXXQF
         3Q0w==
X-Forwarded-Encrypted: i=1; AKwUvBxOF5Dhju+x4qZrypiDetEGwJOYJScftnkgYFuaY57DCfZpMBoXiC6RboYqD5oVouqHb21Uyx7qcfo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKUwThs833Df5Zxiu0P0Exsy93N8iM3kMIyUuIcQCuGj22/twi3
	Mp0R6Mx+3bFs1Os3ZlIsTjxv+lbwEx99SL0X7RSymdYR8Swdsc5+IBSk
X-Gm-Gg: AYBFou1EnVgGDP/lM+FQO3nUPF3k0IDQq7hNRC1Ekh4uq8Osv1un8ETM0mwE7NS+h3U
	sA0F2o8yISMyTizZwmlEAfurenIEa7yytyPXp4cy3ItkJYtDgI7ref5KLoD43cAGLbL4wGNhSPv
	o7lTiK0tiknhetbYRhollV3ED+6UnZuhRwdLi2wv7zsg/9VnSU1GJKuPburBFt/i0ew5fV4Udk2
	CmIN6XB2DOoBa8YQbj2qXafeejMg9o1DcLhNmwldzHaKGvlzYgQQG15JmzX3HUn2CzOPqQr+/tN
	OKvjIatHVVr2HjfQF42bNV8UU2gJi3fCWYD93pPhZzzgKBb5Hd7kRAPqWQwrtIxQ/sbjU5TZvsb
	PM+UB4jO1npuYfyMF0iPHg3Ksbl+xpjxc8CaBHJ/RjK+aIhp15+B7yjqxgmj/RyLjmulLPkkJLp
	pjnpt1DfoOIci9NaaHGbuZZJ6gUGQUmI7n0Z9NHKncYuRlvFTpVM1xfgfwn65Qv9/RuTQ08fNGH
	zSWW/cdvZ0CWyCbZs/wEmNBmjUpFOm0j5gBWS6togYvNLHATfDUlxS/ar7lULSKV3jpIax0RTaz
	Id5p/XP8K529SqG0dcez/clYioFijS7tqn7nGAiS87sCDhxzSFeTCD3oe1RiOyNJsZIDGQ==
X-Received: by 2002:a05:7022:ea46:10b0:177:9a5b:a89 with SMTP id a92af1059eb24-1ac5b5f270emr4076428c88.29.1793373401184;
        Fri, 30 Oct 2026 08:16:41 -0700 (PDT)
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
Subject: [PATCH 04/15] hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
Date: Fri, 30 Oct 2026 23:15:25 +0800
Message-ID: <20261030151539.1872-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793373403-F6A7477B-EC2C353E/0/0
X-purgate-type: clean
X-purgate-size: 1433
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/tricore/tricore_testboard.c to
ttb_machine_typeinfo and ttb_machine_register_types() calling
type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/tricore/tricore_testboard.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index d5d796c8eec..2a25f090520 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -106,11 +106,25 @@ static void tricoreboard_init(MachineState *machine)
     tricore_testboard_init(machine, 0x183);
 }
 
-static void ttb_machine_init(MachineClass *mc)
+static void ttb_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "a minimal TriCore board";
     mc->init = tricoreboard_init;
     mc->default_cpu_type = TRICORE_CPU_TYPE_NAME("tc1796");
 }
 
-DEFINE_MACHINE("tricore_testboard", ttb_machine_init)
+static const TypeInfo ttb_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("tricore_testboard"),
+    .parent     = TYPE_MACHINE,
+    .class_init = ttb_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void ttb_machine_register_types(void)
+{
+    type_register_static(&ttb_machine_typeinfo);
+}
+
+type_init(ttb_machine_register_types)
-- 
2.55.0.windows.3


