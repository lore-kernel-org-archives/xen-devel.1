Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED0606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MXaQ6834
Received: from list by lists.xenproject.org with outflank-mailman.1468623.1677802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxI2-0003U5-HH; Mon, 02 Nov 2026 19:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468623.1677802; Mon, 02 Nov 2026 19:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxI1-0003R4-IJ; Mon, 02 Nov 2026 19:01:53 +0000
Received: by outflank-mailman (input) for mailman id 1468623;
 Mon, 02 Nov 2026 19:01:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHy-0002xk-LQ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHy-00BpBR-2D
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de04-bab6-0a2a0a5309dd-0a2a4507a9a8-46
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:50 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de1c-b4ea-0a2a45070019-aa0a817c60c5-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:49 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-3BTEOu_1OvuJtXdIogW4JA-1; Mon,
 02 Nov 2026 14:01:45 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 86ADB1955EAE; Mon,  2 Nov 2026 19:01:43 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 380E81955F73; Mon,  2 Nov 2026 19:01:43 +0000 (UTC)
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
	s=mimecast20190719; t=1793646108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzIJc3V05DowmcLi7i1y5B9HyXtVMAI3zmPBHgeliGU=;
	b=MXaQ68344H6uaqwPbfDibYI6uN02o13ySmejZEhKdO9jq52+kYf5FBEoxPBzSPMdCVKmSi
	oxCUOLN67TPAzVeQD0upYEraYCfR8YnDqZ0BIZyc6tA0/7HzKGqN/YNSt/ELMeGVLbf+wb
	Q9+rwBayr16PhNcItksquA6GyhY8KEg=
X-MC-Unique: 3BTEOu_1OvuJtXdIogW4JA-1
X-Mimecast-MFC-AGG-ID: 3BTEOu_1OvuJtXdIogW4JA_1793646103
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Helge Deller <deller@gmx.de>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 22/25] trace: remove "disable" property from trace files
Date: Mon,  2 Nov 2026 13:58:28 -0500
Message-ID: <20261102185831.1880189-23-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: fjCMY9ltxs5OlxDNd9CD4S6f0FgqfH4ABkLbgJ9gD6Q_1793646103
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793646110-A4AC8AE4-44547FC5/35/111497
X-purgate-type: clean
X-purgate-size: 4924
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The scenarios are not significant enough to justify its use

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-23-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/display/trace-events  |  2 +-
 target/hppa/trace-events | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index c5e7e42af23..223a085922b 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -60,7 +60,7 @@ virtio_gpu_dec_inflight_fences(uint32_t inflight) "in-flight- %u"
 virtio_gpu_cmd_suspended(uint32_t cmd) "cmd 0x%x"
 
 # qxl.c
-disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
+qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
 qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=0x%" PRIx64 " %u,%u"
 qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t flags) "%d %d,%d,%d"
 qxl_destroy_primary(int qid) "%d"
diff --git a/target/hppa/trace-events b/target/hppa/trace-events
index 9514f039f2d..9fd37b1e2cb 100644
--- a/target/hppa/trace-events
+++ b/target/hppa/trace-events
@@ -1,19 +1,19 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # mem_helper.c
-disable hppa_tlb_flush_ent(void *env, void *ent, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p va_b=0x%" PRIx64 " va_e=0x%" PRIx64 " pa=0x%" PRIx64
-disable hppa_tlb_find_entry(void *env, void *ent, int valid, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p valid=%d va_b=0x%" PRIx64 " va_e=0x%" PRIx64 " pa=0x%" PRIx64
-disable hppa_tlb_find_entry_not_found(void *env, uint64_t addr) "env=%p addr=0x%" PRIx64
-disable hppa_tlb_get_physical_address(void *env, int ret, int prot, uint64_t addr, uint64_t phys) "env=%p ret=%d prot=%d addr=0x%" PRIx64 " phys=0x%" PRIx64 ""
-disable hppa_tlb_fill_excp(void *env, uint64_t addr, int size, int type, int mmu_idx) "env=%p addr=0x%" PRIx64 " size=%d type=%d mmu_idx=%d"
-disable hppa_tlb_fill_success(void *env, uint64_t addr, uint64_t phys, int size, int type, int mmu_idx) "env=%p addr=0x%" PRIx64 " phys=0x%" PRIx64 " size=%d type=%d mmu_idx=%d"
-disable hppa_tlb_itlba(void *env, void *ent, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p va_b=0x%" PRIx64 " va_e=0x%" PRIx64 " pa=0x%" PRIx64
-disable hppa_tlb_itlbp(void *env, void *ent, int access_id, int u, int pl2, int pl1, int type, int b, int d, int t) "env=%p ent=%p access_id=0x%x u=%d pl2=%d pl1=%d type=%d b=%d d=%d t=%d"
-disable hppa_tlb_ptlb(void *env) "env=%p"
-disable hppa_tlb_ptlb_local(void *env) "env=%p"
-disable hppa_tlb_ptlbe(void *env) "env=%p"
-disable hppa_tlb_lpa_success(void *env, uint64_t addr, uint64_t phys) "env=%p addr=0x%" PRIx64 " phys=0x%" PRIx64 ""
-disable hppa_tlb_lpa_failed(void *env, uint64_t addr) "env=%p addr=0x%" PRIx64 ""
+hppa_tlb_flush_ent(void *env, void *ent, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p va_b=0x%" PRIx64 " va_e=0x%" PRIx64 " pa=0x%" PRIx64
+hppa_tlb_find_entry(void *env, void *ent, int valid, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p valid=%d va_b=0x%" PRIx64 " va_e=0x%" PRIx64 " pa=0x%" PRIx64
+hppa_tlb_find_entry_not_found(void *env, uint64_t addr) "env=%p addr=0x%" PRIx64
+hppa_tlb_get_physical_address(void *env, int ret, int prot, uint64_t addr, uint64_t phys) "env=%p ret=%d prot=%d addr=0x%" PRIx64 " phys=0x%" PRIx64 ""
+hppa_tlb_fill_excp(void *env, uint64_t addr, int size, int type, int mmu_idx) "env=%p addr=0x%" PRIx64 " size=%d type=%d mmu_idx=%d"
+hppa_tlb_fill_success(void *env, uint64_t addr, uint64_t phys, int size, int type, int mmu_idx) "env=%p addr=0x%" PRIx64 " phys=0x%" PRIx64 " size=%d type=%d mmu_idx=%d"
+hppa_tlb_itlba(void *env, void *ent, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p va_b=0x%" PRIx64 " va_e=0x%" PRIx64 " pa=0x%" PRIx64
+hppa_tlb_itlbp(void *env, void *ent, int access_id, int u, int pl2, int pl1, int type, int b, int d, int t) "env=%p ent=%p access_id=0x%x u=%d pl2=%d pl1=%d type=%d b=%d d=%d t=%d"
+hppa_tlb_ptlb(void *env) "env=%p"
+hppa_tlb_ptlb_local(void *env) "env=%p"
+hppa_tlb_ptlbe(void *env) "env=%p"
+hppa_tlb_lpa_success(void *env, uint64_t addr, uint64_t phys) "env=%p addr=0x%" PRIx64 " phys=0x%" PRIx64 ""
+hppa_tlb_lpa_failed(void *env, uint64_t addr) "env=%p addr=0x%" PRIx64 ""
 
 # op_helper.c
-disable hppa_tlb_probe(uint64_t addr, int level, int want) "addr=0x%" PRIx64 " level=%d want=%d"
+hppa_tlb_probe(uint64_t addr, int level, int want) "addr=0x%" PRIx64 " level=%d want=%d"
-- 
2.56.0


