Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC3606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UFtrRsen
Received: from list by lists.xenproject.org with outflank-mailman.1468576.1677645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHU-0006le-0v; Mon, 02 Nov 2026 19:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468576.1677645; Mon, 02 Nov 2026 19:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHT-0006lV-UD; Mon, 02 Nov 2026 19:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1468576;
 Mon, 02 Nov 2026 19:01:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHR-0006YP-U2
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHR-00Bp4D-B2
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:17 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8ddf1-8faa-0a2a0a5109dd-0a2a4501a6be-38
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:17 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8ddfc-5984-0a2a45010019-aa0a857cb4b7-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:17 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-SQUIwsUvNE--qaZtLf92vw-1; Mon,
 02 Nov 2026 14:01:14 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA30F1802677; Mon,  2 Nov 2026 19:01:11 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AB9321955F43; Mon,  2 Nov 2026 19:01:10 +0000 (UTC)
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
	s=mimecast20190719; t=1793646075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hPW7K8e9PhjSibqn/e/tSwEgnDdS9m32/bMUTsYxbh0=;
	b=UFtrRsenlEDiaan64AciE2NgrxqKfRJ6OnoTun77Xli6EjHaZ02k2NDPDd96CfRj+9MmBd
	hQsDazaIsQoNWX8imIMzGI93bwOUr+0L6GW6jO/9b2wb15Jn4guX4jryyTL9KIVsi52Dtj
	6NSmRAJuIDRnqku+r4lh5exNCdykAhE=
X-MC-Unique: SQUIwsUvNE--qaZtLf92vw-1
X-Mimecast-MFC-AGG-ID: SQUIwsUvNE--qaZtLf92vw_1793646072
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
Subject: [PULL 03/25] trace: fix handling of char** in UST backend
Date: Mon,  2 Nov 2026 13:58:09 -0500
Message-ID: <20261102185831.1880189-4-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: gfV1ScxhUDwx-mrM-LFK8V5J76YabFFkvGvKU3NC-Qw_1793646072
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793646077-C4B45757-1D870473/35/111497
X-purgate-type: clean
X-purgate-size: 1519
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The UST trace backend fails to compile on version 2.14.0, as we
pass a "char **" arg as to ctf_string(), which only expects 'char *'.
It should instead be treated the same way as generic pointers, and
emitted as hex.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-4-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/tracetool/format/ust_events_h.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/tracetool/format/ust_events_h.py b/scripts/tracetool/format/ust_events_h.py
index cee7970a403..76c883bc5c0 100644
--- a/scripts/tracetool/format/ust_events_h.py
+++ b/scripts/tracetool/format/ust_events_h.py
@@ -72,7 +72,9 @@ def generate(events, backend, group):
             names = e.args.names()
             fmts = e.formats()
             for t,n,f in zip(types, names, fmts):
-                if ('char *' in t) or ('char*' in t):
+                if ('char **' in t) or ('char**' in t):
+                    out('       ctf_integer_hex(' + t + ', ' + n + ', ' + n + ')')
+                elif ('char *' in t) or ('char*' in t):
                     out('       ctf_string(' + n + ', ' + n + ')')
                 elif ("%p" in f) or ("x" in f) or ("PRIx" in f):
                     out('       ctf_integer_hex('+ t + ', ' + n + ', ' + n + ')')
-- 
2.56.0


