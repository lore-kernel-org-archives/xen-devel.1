Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CB606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M7WrjErZ
Received: from list by lists.xenproject.org with outflank-mailman.1465859.1676325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoQo-0003bu-Du; Fri, 30 Oct 2026 15:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465859.1676325; Fri, 30 Oct 2026 15:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoQo-0003bn-B4; Fri, 30 Oct 2026 15:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1465859;
 Fri, 30 Oct 2026 15:22:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoQn-0003bh-8j
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoQm-009Msc-DW
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:22:12 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b618-e002-0a2a0a5209dd-0a2a4503a4e0-32
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:22:12 +0100
Received: from [74.125.82.53] (helo=mail-dl1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b532-fae8-0a2a45030019-4a7d5235d5f3-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:11 +0100
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-18cdcfc05ffso1080352c88.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:18:11 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:09 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373490; x=1793978290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGbrF5LygDW3ceui1OfwylCKsorUyXpzXpw3dzNJEUs=;
        b=M7WrjErZBdQVPtqNLc0u6+pd3tptF9VvkiJCx0lk2I+y3WqcgxGaODm/EUejlHMNYv
         BJ7roWVmOCwc3PckDnld7R1/KLgcy9oI9aLktSSNytbZTPzWeWAoKxwzQgsHFT3QQLUI
         34ELeyndIimhUGaIQ10j9xhwFfEgJjLlOV45DcovpGyegv7yWGKXUrSxpWcTGfWhcdCm
         ut5dXr/job0DvQIzifiAw7SbabWV/zZOuic3EccUzwCNePz+QNj80mFFVxrsiKvotBiz
         Nzj1nTi1lClG238LHaJKvRIf9VuPJ8FcgY71cxVkLECtwygUZevnMaajynOLOxsdQ0sy
         2lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373490; x=1793978290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGbrF5LygDW3ceui1OfwylCKsorUyXpzXpw3dzNJEUs=;
        b=t7U5o5wkSPtBi3zSaZTDyxDtfDUaAau1bH26PP6r8VLavhxriDDYF9qjvrZj63K8an
         SUv5txf7EDyWRFyBw3jipLO9yK0wrj+l6OvBj2ZsRWWPvDOrVPr5mm7LEgbybrbesZ4n
         m3Pv+1qp6dNxOcCOeTasAPaN/fzUaHX/UHvjFm19h+Lb5qDkt8NgzpRtfOJghZDSOXTC
         ZMe2mLyAEh1K7TsSiVX8USzp0YujOvv5PudJ39xoUEF2srNboy1o7XdBb1VjchzL4JLs
         x+L9712QeRrucvC8AXrKrQG7Htj9z/u4HiRl81E+E59qUwRaz5wr+Rpv3UJvFR4zPa4C
         f69Q==
X-Forwarded-Encrypted: i=1; AKwUvBwqg65mmyEHwVo+5JBodxTAvoWyebzm7rxDSH/fd3IjCUMGCUja1U1aN9jE8G3uwxjbONcDji53xuY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL3kCA3zdwchSAPKhBkY3AIf0lo2yRqiZ9opfZQ4VWSBAgXtVgX
	0KX3ORPo06ofR34TaI270Iy2Xv4lZYQYDNqgZP0nE8ufRfEUVfExIAm5
X-Gm-Gg: AYBFou3yEDod24RlMaeG+e90vijkdZxSLcjaaBFkEsYY9dgwnH1rs0BR/82Xt1677vL
	n7EfS1ZufscMk64C6Uyhzcqm72wrsC7rZQGz2HcSxbHLUDyEM1WWJpA8yLCVaZmO/N87RAtZ/h2
	pxlRIs7/FnL8WdFsLBZFeitlPrX+7joXvNT9sGR9PHwPLP1/foED4qEoV5f0Rawb3NM/Aa+1EX8
	7reOKtF2WFPP5THOb+rKiBPT/jPeMHkEf9N5JEwtsVA8PYLHXXz6jmadakYr9kamf9/dHJRqOZp
	RvjiOu525ULtOMi4KV5zkSF7BJCW+w/sV5oXCaDp5RuWdEZgDYT/37gajgwpAGeZl4UnZb03oP5
	lKOakfZxYUGqIY+rNiIEmcywrddgjcMHD9P7tvN2HjT0xCZF4IdNVXmyHWXPoceejscdxsYzckr
	eWYih0X4VxXzLX4OcKF/XlAG5KQ6ZX/Fv5OC1WBZNN9u6tcT5uzaU7w14ffUzUEbORqZj3n43yz
	qnB4VwNcBuErzWE5bbyuoJOcC6pXht2l/p1/M/fylZzfsT9e7zrnziWyMNSlEqrOJWexFU9dd8M
	K1hpngMCIAr0KdQ6QbwYkvkrnHeKvigzPEH6JqoEHl2n1xvGwRH2EfuRwURCbk/Wl3py/A==
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr4400234c88.47.1793373489939;
        Fri, 30 Oct 2026 08:18:09 -0700 (PDT)
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
Subject: [PATCH 12/15] hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
Date: Fri, 30 Oct 2026 23:15:33 +0800
Message-ID: <20261030151539.1872-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793373492-758824E9-47F12364/0/0
X-purgate-type: clean
X-purgate-size: 1381
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/xenpv/xen_machine_pv.c to
xenpv_machine_typeinfo and xenpv_machine_register_types() calling
type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xenpv/xen_machine_pv.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index c406821c34c..85ba65a3243 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -61,12 +61,26 @@ static void xen_init_pv(MachineState *machine)
     atexit(xen_config_cleanup);
 }
 
-static void xenpv_machine_init(MachineClass *mc)
+static void xenpv_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xen Para-virtualized PC";
     mc->init = xen_init_pv;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
 }
 
-DEFINE_MACHINE("xenpv", xenpv_machine_init)
+static const TypeInfo xenpv_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("xenpv"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xenpv_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xenpv_machine_register_types(void)
+{
+    type_register_static(&xenpv_machine_typeinfo);
+}
+
+type_init(xenpv_machine_register_types)
-- 
2.55.0.windows.3


