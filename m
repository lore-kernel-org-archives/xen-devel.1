Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FA9606A31F
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lte/W50H
Received: from list by lists.xenproject.org with outflank-mailman.1465847.1676316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoNT-0001pu-VB; Fri, 30 Oct 2026 15:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465847.1676316; Fri, 30 Oct 2026 15:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoNT-0001pn-SW; Fri, 30 Oct 2026 15:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1465847;
 Fri, 30 Oct 2026 15:18:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoNS-0001pb-EX
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:18:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoNR-00DxRe-Rc
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:18:45 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b545-e002-0a2a0a5209dd-0a2a450bab4e-36
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:45 +0100
Received: from [74.125.82.46] (helo=mail-dl1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b554-b7e8-0a2a450b0019-4a7d522eb453-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:18:45 +0100
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-1a3c08d6928so1023241c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:18:45 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:42 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793373524; x=1793978324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D80p8QWI+5BbGopzHjtSexJQceQpYTApqX3mxRXadD8=;
        b=lte/W50HDHQmg9hoME9uX4Ndkx6TaUqTn0FQchh/oOGzjsdWKebPI1KLWK21RfKlj0
         eogxTcmXoq45++FiS6bISmWpVJJ+P67WgxaIRxQ/5srgwazBewZBqsztXc1/nr5cQLqO
         yJa5WsUyExjsD+DMSSdnhSS3BbZ+9t86GDja8UiUBYPFMaD2bxiqYc7kr+ZG35OdllKh
         cL1UKXJISNB3gTDlU/VPmRZj2n9+qHG3QcWTpEfX72QgQ9BtdgfenmmG2n/qDce8uIci
         a84MDh+GAacWNlIRxpjL9/+hANSU+GI3n2KidgX/pS9ZWUly8facV0Z3ZaN+A/fCmrkE
         lRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373524; x=1793978324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D80p8QWI+5BbGopzHjtSexJQceQpYTApqX3mxRXadD8=;
        b=o1KRHyUliIeQqOjKe7mTRd42ELmJSy5/KGkuK8Lcxmj9zXA0NfQkEj3JVVzl1jAOCG
         HcweabjAQl97sRBD/hPovka+gvf6/sifawg3XXHTYEvrV9fO3Kz/kAFra01elNNGDdRT
         jLwOlN26PM0QF17HLPhKaE7uyKLNhLHTTfR2NtoF/1tOI7tPpN8s8cnXafYGcl55GR3z
         lld19MSQhzGTvxAD3l1K+wKX8jViXL8OFIFWDyFfwnEq6xQFWTtuqmYDmcRawXZ3nG2W
         mX1AIqS0Uf5UCeta64NboUIyisjN1lch9ldnDkh21SQhJf8mOVRReFEkXBbNLnj3gcLP
         mxdw==
X-Forwarded-Encrypted: i=1; AKwUvBza634LJLZ4QZ3hlFIMyJ3NaoVulWxIjXwAzzcK18CNJmupshmDWGp/fLp5trh1cnBrDWX/yF34Bu4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJHjdCBF3C8JEBKZ7PQT4jg9KNBXT3fAhI8SxEQlCFWgUTPSCEa
	diXvP/asLLvxoc1vHAw3sS0y5KnCgxOaXh3yXMmGU0L8HcxU5QabGgkG
X-Gm-Gg: AYBFou3SY3TdBb97ydfZlOus+vVpjkvsWLa6bYHe6DuaO6FyGIGbDZ8QwP3JNLXgvm6
	r8/UtY1WRviauFIEVIzVBpk4S8nUjQ+ncb3PwYpcg74iGqo9D21h2JQMz0pPfpAKNJfzTvLyRwC
	9u+L8BoXNWYNLwAHkuV9zbpXMcMQatEKVzbpEmETz8BKh9yBbo2ODbAoZc+D5O+xg8OgXb0TkdB
	AYyT3QsrWHTx5koSEW7/LuS1DAQs9/CgN8B1c8zQ3YYtOYppwZGCVKmTlaZjQHqN9rH9nWLw6w1
	wgaxsLypU5NFHxm1hb7YMDoFzqNw9mWWT09FPwmaJYkwy5kZm3b9mS5LcsFou0+uDvEk+jCv96o
	FMlYBc2UZRaEKaa6+Cw5Mpx5WTdaiZ4uFuMqc1geIQrmw0CRrTVgae0+5hAiSpyF8in7lFo6ZBu
	H6HEsM8MAc2W6gDFo3bjMCOfs7BAVSrv+aLSuddB0YS+TAPaSzhTPf8vFByqtGUOnJ31gqSXqae
	VKTkxTMFVzBsGoxd0RWRxkutY7AZKrBe7Zw8dyZOVhEj6ncYDyOxXwZSBA1IfJvMbRjx2GNqlYp
	jKIGR01Hv5Uju+YYuI75UuKMiMm9mlpnqiMsn8/EiO48CO44
X-Received: by 2002:a05:7022:7f13:b0:195:76af:b810 with SMTP id a92af1059eb24-1ac5bf91b35mr3525078c88.25.1793373523578;
        Fri, 30 Oct 2026 08:18:43 -0700 (PDT)
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
Subject: [PATCH 15/15] hw/core/boards: remove unused DEFINE_MACHINE* macros
Date: Fri, 30 Oct 2026 23:15:36 +0800
Message-ID: <20261030151539.1872-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793373525-A96C29EA-45DE13B9/0/0
X-purgate-type: clean
X-purgate-size: 3060
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED callers have been
expanded to explicit TypeInfo definitions, leaving DEFINE_MACHINE* and
DEFINE_SECURE_MACHINE* in include/hw/core/boards.h unused. Remove them.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/hw/core/boards.h | 48 ----------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index d0e4ad98201..8af927e9b7c 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -513,54 +513,6 @@ struct MachineState {
  *      DEFINE_VIRT_MACHINE_IMPL(false, major, minor, micro, _, tag)
  */
 
-#define DEFINE_MACHINE_EXTENDED(namestr, PARENT_NAME, InstanceName, \
-                                machine_initfn, ABSTRACT, SECURE, ifaces...) \
-    static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
-    { \
-        MachineClass *mc = MACHINE_CLASS(oc); \
-        machine_initfn(mc); \
-    } \
-    static const TypeInfo machine_initfn##_typeinfo = { \
-        .name       = MACHINE_TYPE_NAME(namestr), \
-        .parent     = TYPE_##PARENT_NAME, \
-        .class_init = machine_initfn##_class_init, \
-        .instance_size = sizeof(InstanceName), \
-        .abstract = ABSTRACT, \
-        .secure     = SECURE, \
-        .interfaces = ifaces, \
-    }; \
-    static void machine_initfn##_register_types(void) \
-    { \
-        type_register_static(&machine_initfn##_typeinfo); \
-    } \
-    type_init(machine_initfn##_register_types)
-
-/* Implicitly insecure */
-#define DEFINE_MACHINE(namestr, machine_initfn) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, false, NULL)
-
-#define DEFINE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, ifaces...) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, false, ifaces)
-
-#define DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ...)    \
-    DEFINE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, \
-                                        (const InterfaceInfo[]) { __VA_ARGS__ })
-
-
-#define DEFINE_SECURE_MACHINE(namestr, machine_initfn) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, true, NULL)
-
-#define DEFINE_SECURE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, ifaces...) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, true, ifaces)
-
-#define DEFINE_SECURE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ...) \
-    DEFINE_SECURE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, \
-                                               (const InterfaceInfo[]) { __VA_ARGS__ })
-
 /*
  * Helper for dispatching different macros based on how
  * many __VA_ARGS__ are passed. Supports 1 to 5 variadic
-- 
2.55.0.windows.3


