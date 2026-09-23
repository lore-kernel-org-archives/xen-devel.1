Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9B1C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430593.1653133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mvc-0005nM-HV; Wed, 23 Sep 2026 13:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430593.1653133; Wed, 23 Sep 2026 13:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mvc-0005n8-Ea; Wed, 23 Sep 2026 13:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1430593;
 Wed, 23 Sep 2026 13:22:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mva-0005iw-9S
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MvZ-007xGa-MP
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d281-2eae-0a2a0a5409dd-0a2a450785e4-34
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:25 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d290-b4ea-0a2a45070019-4a7de50cb5d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:25 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664b7582so520147eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:25 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:21 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169743; x=1790774543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZLlHjgFKGd97ZAl0jDOPJ4J/L8M7/uJxBZfNAi1MwY=;
        b=UiUFYu47rAMR77AAN/2reISqmaCnNrAV0ysTYQsQMyvxcL+RwwHpI3tYEYrO6aKMQq
         7e6pJMpxdUWqeegRkbakRubPFypi+iWRnQG7WvNUy3+N5nx4qpwpcGiM6SkE0698YsGY
         EEOB7CZs3IXEuYX5C75z3XIZ9xzjc3vE9v5dcB+AdNMDxVhTSurFjyQtRrpeYXtA4E3d
         X4WuGFH5zij5hTfhrgLCecvkUBoAcT217q+wgUwPSy6ia5XrrItOckGGWzoVq1qVXokC
         CB49un/oDr/9WNzmi4i0s3iDg+d64j08cZGuiHAfdaLuhMHIuoaEwiJakvT2Wymv3n6v
         z1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169743; x=1790774543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZLlHjgFKGd97ZAl0jDOPJ4J/L8M7/uJxBZfNAi1MwY=;
        b=jr0YvlsFiySjnUHWyCwBqGRXaPkqRQoTFK0oJSONMybHT303p06y1AGv7cUoQYvBjo
         wXmRXgZBNI0TRadRpuhRX94/4iu4MVU1yXDwaQ2WtFc6gPH5Ye2Fykhoup+rJ+Avzab+
         qUNZ6BlhH+emjjKBjZbx3iB08BysRxtFXvI0PlH8ua93uSAWt28sW8cU7Efl76oYQ/dY
         sZ0tOLJ1JUeSesiWxy3JMBvXElbNRjd5rFJoOT+I/o5k2RmWNbKsCo+yMTAGqB1iEEvN
         y68JVL7PrrUE32TYGe8vpUfoKRYXMRujKG8JjABSYLIjCppzTet1tTaSrL30qRtvBOfl
         BWPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcIwE1TmYUftWzJsZUj7TPDxzOIQ6eVjVtEBqzHeWOjlhWDhigYX0tJrya/FBJpWUdR3/AfH5gvNU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mNBiLj8HzTuaxpCuZMHvgPvzBXLyzFd4OzD56izbzykaxvA2mI
	8Xbz6pUtm4nuJJoUZmJDPafxFWuyTgXc1feQ5h8sZwuA69ldPjJeJ3n3
X-Gm-Gg: AYBFou1rmWLbNaAxSw2CKOh4exO5syf/yPab8tj1cH+Ve6WS/eA6upE1uMUm19cJC2P
	ggwR8fyNnUh1eFidYfcjFGOFkgVumWllBjl4OHn40FlQ/a7A0b2ZxQXKcvYwtgpeazOfjLobAG9
	VLazudjjphKtoGFc0fFtVYNVy+9cB4btGVLUr2eqQK6YYpVAoqWpqpudgeaigQ0Fs4EF8bXB4la
	7MGx9BuynXiYtKPlKsW0A+iajGpn8lietzqL8apzZgWHKdP9f4+uxaXGLyNz2pdIbYCj56tVbmU
	hxyt4AWDOgkIdvqFZeXlmwO1lgUZpPxDHSYer5a4YzHETasUjw/XIFNejkIq/b2OQ6C/k3sRZpu
	pRY3XsqFBuFkVNZFE/enb21mSoyyz2dDaoCxHXZtBqlgYePXTuapS4bvMaOuvYx/3jdQYPGDB8u
	vaRVjktlzANSc/C11qjZueV/lPR/EOP5GmtBczWxMpG4HYfl2C6YTPWMKPNGLUghsJmOg2qYFKs
	+xES4YIW4PSZbp2XE8GqLPGSDzi//LrU5lNoKg22g==
X-Received: by 2002:a05:7301:c016:b0:33b:d4c9:561f with SMTP id 5a478bee46e88-33e8bb7c1ffmr2536095eec.5.1790169742689;
        Wed, 23 Sep 2026 06:22:22 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 033/114] hw/riscv: expand boston-aia and microblaze-v-generic to TypeInfo
Date: Wed, 23 Sep 2026 21:15:07 +0800
Message-ID: <20260923131635.1894-34-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790169745-A74D3AE4-2B8872A1/0/0
X-purgate-type: clean
X-purgate-size: 1801

Replace DEFINE_MACHINE with TypeInfo on boston-aia and
amd-microblaze-v-generic. Set is_available to target_is_base_riscv.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/microblaze-v-generic.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index 3f07ab21328..9b60a955152 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qemu/units.h"
 #include "qemu/target-info.h"
 #include "qapi/error.h"
@@ -177,8 +178,10 @@ static void mb_v_generic_init(MachineState *machine)
     create_unimplemented_device("qspi", QSPI_BASEADDR, 0x10000);
 }
 
-static void mb_v_generic_machine_init(MachineClass *mc)
+static void mb_v_generic_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "AMD Microblaze-V generic platform";
     mc->init = mb_v_generic_init;
     mc->min_cpus = 1;
@@ -188,4 +191,16 @@ static void mb_v_generic_machine_init(MachineClass *mc)
     mc->default_cpus = 1;
 }
 
-DEFINE_MACHINE("amd-microblaze-v-generic", mb_v_generic_machine_init)
+static const TypeInfo mb_v_generic_machine_class_init_typeinfo = {
+    .name = MACHINE_TYPE_NAME("amd-microblaze-v-generic"),
+    .parent = TYPE_MACHINE,
+    .class_init = mb_v_generic_machine_class_init,
+    .is_available = target_is_base_riscv,
+};
+
+static void mb_v_generic_machine_class_init_register_types(void)
+{
+    type_register_static(&mb_v_generic_machine_class_init_typeinfo);
+}
+
+type_init(mb_v_generic_machine_class_init_register_types)
-- 
2.52.0.windows.1


