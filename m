Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0956071A0E
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sys5afgd
Received: from list by lists.xenproject.org with outflank-mailman.1472534.1680450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRO-0001fn-Ca; Wed, 04 Nov 2026 20:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472534.1680450; Wed, 04 Nov 2026 20:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRO-0001eU-1X; Wed, 04 Nov 2026 20:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1472534;
 Wed, 04 Nov 2026 20:18:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRL-0001Bx-Ka
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRL-00BuCu-1Q
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:35 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9305-2eae-0a2a0a5409dd-0a2a450acd02-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:35 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9319-f2d2-0a2a450a0019-aa0a817c96e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:34 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-OrIPcHMtNfWaL90iiMEVww-1; Wed,
 04 Nov 2026 15:18:29 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 521391800596; Wed,  4 Nov 2026 20:18:27 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 591BD39206; Wed,  4 Nov 2026 20:18:26 +0000 (UTC)
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
	s=mimecast20190719; t=1793823513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkkz7NQLFS94E1ZeoUXFtFHJe+s6Qg+c1y84IQKKE4k=;
	b=Sys5afgdNy4IFpBCjmgfoplsc2g5uw0vwptSnc9RT19Spaqr28MF9Q3LftnXN0nWkbIG6S
	M01yW8g/3i4O41UUmjXDK3/q3lfhtdgp+a0R0geXzsdzaEQQcIQSLON5GpvgeEQBnVwSKC
	Ozz8/g5finnhpv8kAxe1imRN64CCISs=
X-MC-Unique: OrIPcHMtNfWaL90iiMEVww-1
X-Mimecast-MFC-AGG-ID: OrIPcHMtNfWaL90iiMEVww_1793823507
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 13/25] trace: remove redundant headers from simple trace backend code
Date: Wed,  4 Nov 2026 15:17:49 -0500
Message-ID: <20261104201802.11556-14-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: Kbh4u2abBcGiFYqOYNCevSkVwuTW_7kTCP5QVNzVfO4_1793823507
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793823515-4B6D6CFC-EC9662FD/35/111497
X-purgate-type: clean
X-purgate-size: 2149
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The main formatter for .h/.c files for generated trace code
already includes osdep.h and control.h, so it is redundant
for the simple trace backend to add them too.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-14-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/tracetool/all.c               | 2 --
 tests/tracetool/simple.c            | 2 --
 scripts/tracetool/backend/simple.py | 4 +---
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/tracetool/all.c b/tests/tracetool/all.c
index 820ddb575b0..3b8d4d32d17 100644
--- a/tests/tracetool/all.c
+++ b/tests/tracetool/all.c
@@ -34,8 +34,6 @@ static void trace_testsuite_register_events(void)
     trace_event_register_group(testsuite_trace_events);
 }
 trace_init(trace_testsuite_register_events)
-#include "qemu/osdep.h"
-#include "trace/control.h"
 #include "trace/simple.h"
 
 void _simple_trace_test_blah(void *context, const char *filename)
diff --git a/tests/tracetool/simple.c b/tests/tracetool/simple.c
index 820ddb575b0..3b8d4d32d17 100644
--- a/tests/tracetool/simple.c
+++ b/tests/tracetool/simple.c
@@ -34,8 +34,6 @@ static void trace_testsuite_register_events(void)
     trace_event_register_group(testsuite_trace_events);
 }
 trace_init(trace_testsuite_register_events)
-#include "qemu/osdep.h"
-#include "trace/control.h"
 #include "trace/simple.h"
 
 void _simple_trace_test_blah(void *context, const char *filename)
diff --git a/scripts/tracetool/backend/simple.py b/scripts/tracetool/backend/simple.py
index b131e4fc194..e22683c7d2a 100644
--- a/scripts/tracetool/backend/simple.py
+++ b/scripts/tracetool/backend/simple.py
@@ -48,9 +48,7 @@ def generate_h_backend_dstate(event, group):
 
 
 def generate_c_begin(events, group):
-    out('#include "qemu/osdep.h"',
-        '#include "trace/control.h"',
-        '#include "trace/simple.h"',
+    out('#include "trace/simple.h"',
         '')
 
 
-- 
2.56.0


