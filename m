Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FEF606A329
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hm39QIWA
Received: from list by lists.xenproject.org with outflank-mailman.1468577.1677655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHX-000711-7R; Mon, 02 Nov 2026 19:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468577.1677655; Mon, 02 Nov 2026 19:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHX-00070s-4M; Mon, 02 Nov 2026 19:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1468577;
 Mon, 02 Nov 2026 19:01:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHV-0006z4-U1
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHV-000wMH-Al
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:21 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8dddf-2eae-0a2a0a5409dd-0a2a450793c4-44
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:21 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de00-b4ea-0a2a45070019-aa0a857c9a01-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:21 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-676-HuUp_AYBPzS_FAxpXoe8Qw-1; Mon,
 02 Nov 2026 14:01:15 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D629E195606A; Mon,  2 Nov 2026 19:01:13 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B5F621800446; Mon,  2 Nov 2026 19:01:12 +0000 (UTC)
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
	s=mimecast20190719; t=1793646080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsdKm1LSZTE764H3BvnnumzwQKzcHlHW/sITvbevc3A=;
	b=hm39QIWA+rJyjbSL7zyaOUUVBrz2juEAiCcyU2LUDmYs9r5LDntZSz7uox6kO3mTGln+Ft
	WFbPeFmTvV1RRN0wIqBO8Hx9OgsDPimC0i+LKS5quYY66TvHQw6HQRa9vNoMvp7YqVj5M+
	yQPzUkqUM5QM1n8HfAX3A6M0ce74hJ4=
X-MC-Unique: HuUp_AYBPzS_FAxpXoe8Qw-1
X-Mimecast-MFC-AGG-ID: HuUp_AYBPzS_FAxpXoe8Qw_1793646074
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PULL 04/25] hw/xen: replace "long unsigned int" with "unsigned long " for dtrace
Date: Mon,  2 Nov 2026 13:58:10 -0500
Message-ID: <20261102185831.1880189-5-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: B1qHtLydD2Ac02RTogxkSlMBa3TnzUz2BjYaCPPqiSQ_1793646074
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793646081-A54C3AE4-D4F8B571/35/111497
X-purgate-type: clean
X-purgate-size: 1986
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

dtrace (or at least systemtap's fake "dtrace" binary) doesn't like to
see "int" and "long" together in the typename, it just wants the
bare "long".

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-5-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/xen/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index b67942d07b4..a31983ce1d3 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -57,8 +57,8 @@ cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uin
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_get_ioreq_from_shared_memory_req_not_ready(int state, int data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O request not ready: 0x%x, ptr: 0x%x, port: 0x%"PRIx64", data: 0x%"PRIx64", count: %u, size: %u"
 xen_main_loop_prepare_init_cpu(int id, void *cpu) "cpu_by_vcpu_id[%d]=%p"
-xen_map_ioreq_server_shared_page(long unsigned int ioreq_pfn) "shared page at pfn 0x%lx"
-xen_map_ioreq_server_buffered_io_page(long unsigned int ioreq_pfn) "buffered io page at pfn 0x%lx"
+xen_map_ioreq_server_shared_page(unsigned long ioreq_pfn) "shared page at pfn 0x%lx"
+xen_map_ioreq_server_buffered_io_page(unsigned long ioreq_pfn) "buffered io page at pfn 0x%lx"
 xen_map_ioreq_server_buffered_io_evtchn(int bufioreq_evtchn) "buffered io evtchn is 0x%x"
 destroy_hvm_domain_cannot_acquire_handle(void) "Cannot acquire xenctrl handle"
 destroy_hvm_domain_failed_action(const char *action, int sts, char *errno_s) "xc_domain_shutdown failed to issue %s, sts %d, %s"
-- 
2.56.0


