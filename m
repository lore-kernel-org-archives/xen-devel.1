Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD73606A320
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VOtzyEFt
Received: from list by lists.xenproject.org with outflank-mailman.1462399.1673414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLli5-0003n0-Fx; Tue, 27 Oct 2026 18:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462399.1673414; Tue, 27 Oct 2026 18:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLli5-0003mm-CR; Tue, 27 Oct 2026 18:15:45 +0000
Received: by outflank-mailman (input) for mailman id 1462399;
 Tue, 27 Oct 2026 18:15:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xLli4-0003kR-MG
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:15:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLli4-004Wcg-2n
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:15:44 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0ea1b-bab6-0a2a0a5309dd-0a2a45098164-40
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:15:43 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0ea4e-be1a-0a2a45090019-aa0a857c70a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:15:43 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-cEwpYKv8NwSl2l1n83HM6Q-1; Tue,
 27 Oct 2026 14:15:32 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5AB521955F61; Tue, 27 Oct 2026 18:15:28 +0000 (UTC)
Received: from berrange.csb (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1369118002B1; Tue, 27 Oct 2026 18:15:20 +0000 (UTC)
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
	s=mimecast20190719; t=1793124942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=buIH4vNJ8worC1Ayihr2YWFbS43gZwwGin2hAsqsREk=;
	b=VOtzyEFtzKrXYlzDeYF7GYoL+u9NHQCwsj2HgIxg2cXn1Wx5ySmHfi1PbEoPL7lb2ttn72
	uwhLQtxu16hVFLsJFLhT1YgOwEgDCquwccqYaZ4tCtH77Jq0vWTpJ6X3wyUiWn2xRwwuJP
	GkhxbKOLZuGqxZGzK/5TjL680ka+ly8=
X-MC-Unique: cEwpYKv8NwSl2l1n83HM6Q-1
X-Mimecast-MFC-AGG-ID: cEwpYKv8NwSl2l1n83HM6Q_1793124928
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
Subject: [PATCH 10/11] accel/xen: mark xen accelerator as secure
Date: Tue, 27 Oct 2026 18:13:59 +0000
Message-ID: <20261027181400.1752951-11-berrange@redhat.com>
In-Reply-To: <20261027181400.1752951-1-berrange@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: FiR699LnkIG_qRnMIjHheB5xzvst3tMwKXaKthwrUcc_1793124928
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793124943-BD0CD034-07AF5424/0/0
X-purgate-type: clean
X-purgate-size: 718
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen is servicing virtualization use cases which must provide security
and actively maintained.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/xen/xen-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index bb2d02cb221..94f20e1d29a 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -147,6 +147,7 @@ static const TypeInfo xen_accel_type = {
     .name = TYPE_XEN_ACCEL,
     .parent = TYPE_ACCEL,
     .class_init = xen_accel_class_init,
+    .secure = true,
 };
 
 static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
-- 
2.56.0


