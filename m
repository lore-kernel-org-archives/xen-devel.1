Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79590606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8PacgRt
Received: from list by lists.xenproject.org with outflank-mailman.1462388.1673387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlhe-0002TL-Mb; Tue, 27 Oct 2026 18:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462388.1673387; Tue, 27 Oct 2026 18:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlhe-0002TC-In; Tue, 27 Oct 2026 18:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1462388;
 Tue, 27 Oct 2026 18:15:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xLlhd-0002SO-6t
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlhc-007ZBC-Jb
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:15:16 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0ea2e-e002-0a2a0a5209dd-0a2a4503d5c4-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:15:16 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0ea33-fae8-0a2a45030019-aa0a857cb97d-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:15:16 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-wPdDHKoBORCP-8DA1EmsCg-1; Tue,
 27 Oct 2026 14:15:09 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7DEE31956063; Tue, 27 Oct 2026 18:15:05 +0000 (UTC)
Received: from berrange.csb (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5BF2E18002B1; Tue, 27 Oct 2026 18:14:58 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793124915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0eL0OHLT754EdZ0DXSCF0DHaRsDNV6qcq8Lkd2hMBk=;
	b=X8PacgRt/jGdUd3UFkDNxCtIcM9o3Sxpxp2XqdU4pwZXgymV6TXK/gD6bAPUjuBs0JYW7/
	xTHnvukqMF0Ip5V41HujRFRPpMnC8LeRax8S8adAFN042MRjhdeiVZuY05g+H8yTnHr2uB
	VBwjY/GWY675yzSmabYSGILyRhMIUEw=
X-MC-Unique: wPdDHKoBORCP-8DA1EmsCg-1
X-Mimecast-MFC-AGG-ID: wPdDHKoBORCP-8DA1EmsCg_1793124905
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Chao Liu <chao.liu@processmission.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Amit Machhiwal <amachhiw@linux.ibm.com>,
	xen-devel@lists.xenproject.org,
	Sergio Lopez <slp@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Bibo Mao <maobibo@loongson.cn>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Xianglai Li <lixianglai@loongson.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	Alexander Graf <graf@amazon.com>,
	Song Gao <17746591750@163.com>,
	Eric Farman <farman@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 07/11] hw: mark xenpv, xenpvh, xenfv as secure machines
Date: Tue, 27 Oct 2026 18:13:56 +0000
Message-ID: <20261027181400.1752951-8-berrange@redhat.com>
In-Reply-To: <20261027181400.1752951-1-berrange@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 4MN5QMw7tgA29GbgyQ85uh06L_e1d5jV-NGk57kWAdA_1793124905
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793124916-6F6C64E9-04C91303/0/0
X-purgate-type: clean
X-purgate-size: 2273
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Xen machines are already declared secure in
docs/system/security.rst, due too their intended usage
in virtualization scenarios.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/xen-pvh.c          | 1 +
 hw/i386/pc_piix.c         | 4 ++--
 hw/i386/xen/xen-pvh.c     | 1 +
 hw/xenpv/xen_machine_pv.c | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index f05956c1662..6b85eced1bb 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -95,6 +95,7 @@ static const TypeInfo xen_arm_machine_type = {
     .class_init = xen_arm_machine_class_init,
     .instance_size = sizeof(XenPVHMachineState),
     .instance_init = xen_arm_instance_init,
+    .secure = true,
 };
 
 static void xen_arm_machine_register_types(void)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 63c4667ea37..e801325dd6e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -667,6 +667,6 @@ static void xenfv_machine_4_2_options(MachineClass *m)
     m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
 }
 
-DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
-                  xenfv_machine_4_2_options);
+DEFINE_SECURE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
+                         xenfv_machine_4_2_options);
 #endif
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
index ab90c83a830..d81575b4c9b 100644
--- a/hw/i386/xen/xen-pvh.c
+++ b/hw/i386/xen/xen-pvh.c
@@ -115,6 +115,7 @@ static const TypeInfo xen_pvh_x86_machine_type = {
     .class_init = xen_pvh_machine_class_init,
     .instance_init = xen_pvh_instance_init,
     .instance_size = sizeof(XenPVHx86State),
+    .secure = true,
 };
 
 static void xen_pvh_machine_register_types(void)
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index c406821c34c..e0620a096ee 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -69,4 +69,4 @@ static void xenpv_machine_init(MachineClass *mc)
     mc->default_machine_opts = "accel=xen";
 }
 
-DEFINE_MACHINE("xenpv", xenpv_machine_init)
+DEFINE_SECURE_MACHINE("xenpv", xenpv_machine_init)
-- 
2.56.0


