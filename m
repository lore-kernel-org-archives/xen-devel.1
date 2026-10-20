Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359B606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1ZglALc
Received: from list by lists.xenproject.org with outflank-mailman.1455343.1669125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7WZ-0002QC-Or; Tue, 20 Oct 2026 10:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455343.1669125; Tue, 20 Oct 2026 10:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7WX-0002KG-R4; Tue, 20 Oct 2026 10:56:53 +0000
Received: by outflank-mailman (input) for mailman id 1455343;
 Tue, 20 Oct 2026 10:51:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xJ7Qt-00009H-TY
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:51:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ7Qt-004d7w-AO
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 12:51:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ad74790-8faa-0a2a0a5109dd-0a2a450be49e-38
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 12:51:03 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ad7471d-b7e8-0a2a450b0019-aa0a817c7943-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 12:49:02 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-GSbpLDLrPQqHZRQ94vMg0A-1; Tue,
 20 Oct 2026 10:48:59 +0000
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 401F418002AD; Tue, 20 Oct 2026 10:48:55 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4CB201800257; Tue, 20 Oct 2026 10:48:52 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792493341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqRAumP9Q4P45v+BnAaswZB9eyGK4924nboYOJbbp2E=;
	b=R1ZglALcFIqD4UxGynC9vb3nFq+Jj2YAK6AuSJmSzfD4w2F1iyswNIuVIgjY3HN0yUGVY/
	kE+GlXWLD9Q8Cl/YT5IjWsv9I8ncIITWrpbeEsMmcuf2B9CNmONYq/aSjwv76U2MnvXsra
	j5vZ5HMcWF+Fmcc1ks2hSfmwAwvSJhI=
X-MC-Unique: GSbpLDLrPQqHZRQ94vMg0A-1
X-Mimecast-MFC-AGG-ID: GSbpLDLrPQqHZRQ94vMg0A_1792493335
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 20 Oct 2026 14:45:47 +0400
Subject: [PATCH v7 30/65] whpx: convert OnOffAuto arch properties to
 QAPI-aware registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-qom-qapi-v7-30-431a86b02b58@redhat.com>
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
In-Reply-To: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>, 
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
 kvm@vger.kernel.org, Alberto Garcia <berto@igalia.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
 Junjie Cao <junjie.cao@intel.com>, Anisa Su <anisa.su@samsung.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>, 
 John Levon <john.levon@nutanix.com>, 
 Thanos Makatos <thanos.makatos@nutanix.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org, 
 linux-cxl@vger.kernel.org, qemu-s390x@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>, 
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>, 
 Xianglai Li <lixianglai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Amit Machhiwal <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org, 
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <graf@amazon.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, Ani Sinha <anisinha@redhat.com>, 
 Luc Michel <luc@lmichel.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Samuel Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>, 
 FangSheng Huang <FangSheng.Huang@amd.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Aditya Gupta <adityag@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Conor Dooley <conor@kernel.org>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>, 
 Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>, Titus Rwantare <titusr@google.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, Peter Xu <peterx@redhat.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, 
 Hendrik Brueckner <brueckner@linux.ibm.com>, xen-devel@lists.xenproject.org, 
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Fam Zheng <fam@euphon.net>, 
 Farhan Ali <alifm@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, 
 Tao Tang <tangtao1634@phytium.com.cn>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Yoshinori Sato <yoshinori.sato@nifty.com>, Jiri Pirko <jiri@resnulli.us>, 
 Eric Auger <eric.auger@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6702;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=F8HZ01XPkkBAtzYnAznI+OeIpIRAjOQCT4x6+nWcsZQ=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq10ZaNHtr+AkGnY6QtTL0vsHs6SXFQUQ8MQ6i4
 S1YABGB6XOJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCatdGWgAKCRDa6OEJdZac
 5U3+D/0bY0Yw06OplfGaxwkWeRkmM8vGPJ5F9M0cVeicCg/oXCYp+UKgC78TYi76WRGpbyL2C7S
 0KxXaqPjOuPoiru3KbrrdebJxsrbKZijDWmhlIsP9jywqVWMuCB+weipCeiSrSWcM8KYKDNl6lh
 BAGjS+eZuivN40OoVe2PxA7lKt96RrybUNJq39LwnTdm/8Lx0x5A7nOmtMf6p5zUDEy6bO9wTJ9
 /9cnmG5OgUn4fNab0GmXDPDj2/b7lDQNLOZQiOEE1aPD1CnruklCEcrbKrMXEZIYQc9JkVJVviZ
 sWu3vDJ9GCWP/JGd6P26BcaZeOw6qiIfSjJgGMcE3CyRguBdSr4ldn+yC83f6n9vVa68VDVU85t
 PoSwXa0eYL0MCuvzu1v2GPnE/oDcMkqhH7+e/tLdejjt7K9jX7qtbmGTnHtszQGZv3Bn0tfV3RM
 fJtheu+i9GFuCM5MxESNY85RUBO6acenPHsR1+nmHtqbICIGanSHvfZzCXqJL4WwAH/IRbzic4F
 sB4SZ4sCdErodKNcNWECfUhDwpvmtfzJ5r4PC9kT3qEABypAk8pdibNyUNuaX6p+KJtOwuuQsnA
 NP6Npp4aqbXBUyIW3gZUAcetZJhmn/V7jRQ/TFEG2uGqdOa3T2YNGJ9TDknE1CAeWkCjRf+IwA6
 Z2YAEk2bZvmBjgQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Xuyrt3XswhHI2RK1JKKZM-_NHEB4wC0uqSybdHo9TwU_1792493335
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1792493342-1B2DC9EA-5FBEBB9C/0/0
X-purgate-type: clean
X-purgate-size: 6704
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert the ignore-unknown-msr, intercept-msr-gp, and ssd OnOffAuto
properties from manual visitor-based callbacks to
property_add_qapi_enum().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/i386/whpx/whpx-all.c | 101 +++++++++++++++-----------------------------
 1 file changed, 34 insertions(+), 67 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 113f79afb9ab..64fa389a2f93 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -30,7 +30,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qapi/qapi-types-common.h"
-#include "qapi/qapi-visit-common.h"
+#include "qapi/qapi-type-infos-common.h"
 #include "migration/blocker.h"
 #include "host-cpu.h"
 #include "accel/accel-cpu-target.h"
@@ -1875,6 +1875,7 @@ void whpx_apply_breakpoints(
     }
 }
 
+
 void whpx_arch_destroy_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
@@ -1955,7 +1956,7 @@ static int whpx_handle_hyperv_guestidle(CPUState *cpu)
     return whpx_handle_halt(cpu);
 }
 
-static void whpx_vcpu_kick_out_of_hlt(CPUState *cpu) 
+static void whpx_vcpu_kick_out_of_hlt(CPUState *cpu)
 {
     WHV_REGISTER_VALUE reg;
     whpx_get_reg(cpu, WHvRegisterInternalActivityState, &reg);
@@ -2059,7 +2060,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
                 .Vector = irq,
             };
             reg_count += 1;
-            /* 
+            /*
              * When the Hyper-V APIC is enabled, to get out of HLT we
              * either have to request an interrupt or manually get it away
              * from HLT.
@@ -2359,7 +2360,7 @@ int whpx_vcpu_run(CPUState *cpu)
             WHV_REGISTER_VALUE reg_values[3] = {0};
             WHV_REGISTER_NAME reg_names[3];
             UINT32 reg_count;
-            bool is_known_msr = 0; 
+            bool is_known_msr = 0;
             bool raises_gpf = false;
             uint64_t val;
 
@@ -2911,120 +2912,86 @@ void whpx_cpu_instance_init(CPUState *cs)
  * Partition support
  */
 
-static void whpx_set_unknown_msr(Object *obj, Visitor *v,
-                                   const char *name, void *opaque,
-                                   Error **errp)
+static void whpx_set_unknown_msr(Object *obj, int value, Error **errp)
 {
     struct whpx_state *whpx = &whpx_global;
-    OnOffAuto mode;
 
-    if (!visit_type_OnOffAuto(v, name, &mode, errp)) {
-        return;
-    }
-
-    switch (mode) {
+    switch (value) {
     case ON_OFF_AUTO_ON:
         whpx->ignore_unknown_msr = true;
         break;
-
     case ON_OFF_AUTO_OFF:
         whpx->ignore_unknown_msr = false;
         break;
-
     case ON_OFF_AUTO_AUTO:
         whpx->ignore_unknown_msr = true;
         break;
     default:
-        /*
-         * The value was checked in visit_type_OnOffAuto() above. If
-         * we get here, then something is wrong in QEMU.
-         */
-        abort();
+        g_assert_not_reached();
     }
 }
 
-static void whpx_set_intercept_msr_gp(Object *obj, Visitor *v,
-                                   const char *name, void *opaque,
-                                   Error **errp)
+static void whpx_set_intercept_msr_gp(Object *obj, int value, Error **errp)
 {
     struct whpx_state *whpx = &whpx_global;
-    OnOffAuto mode;
 
-    if (!visit_type_OnOffAuto(v, name, &mode, errp)) {
-        return;
-    }
-
-    switch (mode) {
+    switch (value) {
     case ON_OFF_AUTO_ON:
         whpx->intercept_msr_gp = true;
         break;
-
     case ON_OFF_AUTO_OFF:
         whpx->intercept_msr_gp = false;
         break;
-
     case ON_OFF_AUTO_AUTO:
         whpx->intercept_msr_gp = false;
         break;
     default:
-        /*
-         * The value was checked in visit_type_OnOffAuto() above. If
-         * we get here, then something is wrong in QEMU.
-         */
-        abort();
+        g_assert_not_reached();
     }
 }
 
-static void whpx_set_ssd(Object *obj, Visitor *v,
-                                   const char *name, void *opaque,
-                                   Error **errp)
+static void whpx_set_ssd(Object *obj, int value, Error **errp)
 {
     struct whpx_state *whpx = &whpx_global;
-    OnOffAuto mode;
 
-    if (!visit_type_OnOffAuto(v, name, &mode, errp)) {
-        return;
-    }
-
-    switch (mode) {
+    switch (value) {
     case ON_OFF_AUTO_ON:
         whpx->separate_security_domain = true;
         break;
-
     case ON_OFF_AUTO_OFF:
         whpx->separate_security_domain = false;
         break;
-
     case ON_OFF_AUTO_AUTO:
         whpx->separate_security_domain = true;
         break;
     default:
-        /*
-         * The value was checked in visit_type_OnOffAuto() above. If
-         * we get here, then something is wrong in QEMU.
-         */
-        abort();
+        g_assert_not_reached();
     }
 }
 
 
 void whpx_arch_accel_class_init(ObjectClass *oc)
 {
-    object_class_property_add(oc, "ignore-unknown-msr", "OnOffAuto",
-        NULL, whpx_set_unknown_msr,
-        NULL, NULL);
-    object_class_property_set_description(oc, "ignore-unknown-msr",
-        "Configure unknown MSR behavior");
-    object_class_property_add(oc, "intercept-msr-gp", "OnOffAuto",
-        NULL, whpx_set_intercept_msr_gp,
-        NULL, NULL);
-    object_class_property_set_description(oc, "intercept-msr-gp",
-        "Intercept #GP to log erroring MSR accesses.");
-    object_class_property_add(oc, "ssd", "OnOffAuto",
-        NULL, whpx_set_ssd,
-        NULL, NULL);
-    object_class_property_set_description(oc, "ssd",
-        "Separate security domain");
+    object_class_property_add_qapi_enum(oc, QAPI_ENUM_PROP(
+        .name = "ignore-unknown-msr",
+        .description = "Configure unknown MSR behavior",
+        .qapi_type = &OnOffAuto_type_info,
+        .set = whpx_set_unknown_msr,
+    ));
+
+    object_class_property_add_qapi_enum(oc, QAPI_ENUM_PROP(
+        .name = "intercept-msr-gp",
+        .description = "Intercept #GP to log erroring MSR accesses.",
+        .qapi_type = &OnOffAuto_type_info,
+        .set = whpx_set_intercept_msr_gp,
+    ));
+
+    object_class_property_add_qapi_enum(oc, QAPI_ENUM_PROP(
+        .name = "ssd",
+        .description = "Separate security domain",
+        .qapi_type = &OnOffAuto_type_info,
+        .set = whpx_set_ssd,
+    ));
 }
 
 int whpx_accel_init(AccelState *as, MachineState *ms)

-- 
2.56.0.116.g6de20f6092dc


