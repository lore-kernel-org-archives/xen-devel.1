Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0FCC83000
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 15:52:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F2C205C9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 15:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F2C205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSWU-00081d-M5; Tue, 28 Apr 2020 15:51:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DYx7=6M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTSWT-00081Y-Gy
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:51:49 +0000
X-Inumbo-ID: 2b4cbcde-8968-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b4cbcde-8968-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 15:51:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2BA73AC85;
 Tue, 28 Apr 2020 15:51:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
Date: Tue, 28 Apr 2020 17:51:44 +0200
Message-Id: <20200428155144.8253-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
of the domain's xenstore ring page and the event channel of the
domain for communicating with Xenstore.

The gfn is not really needed. It is stored in the per-domain struct
in xenstored and in case of another XS_INTRODUCE for the domain it
is tested to match the original value. If it doesn't match the
command is aborted via EINVAL.

Today there shouldn't be multiple XS_INTRODUCE requests for the same
domain issued, so the mfn/gfn can just be ignored and multiple
XS_INTRODUCE commands can be rejected without testing the mfn/gfn.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 47 ++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 5858185211..17328f9fc9 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -369,7 +369,6 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 	struct domain *domain;
 	char *vec[3];
 	unsigned int domid;
-	unsigned long mfn;
 	evtchn_port_t port;
 	int rc;
 	struct xenstore_domain_interface *interface;
@@ -381,7 +380,7 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 		return EACCES;
 
 	domid = atoi(vec[0]);
-	mfn = atol(vec[1]);
+	/* Ignore the mfn, we don't need it. */
 	port = atoi(vec[2]);
 
 	/* Sanity check args. */
@@ -390,34 +389,26 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 
 	domain = find_domain_by_domid(domid);
 
-	if (domain == NULL) {
-		interface = map_interface(domid);
-		if (!interface)
-			return errno;
-		/* Hang domain off "in" until we're finished. */
-		domain = new_domain(in, domid, port);
-		if (!domain) {
-			rc = errno;
-			unmap_interface(interface);
-			return rc;
-		}
-		domain->interface = interface;
-		domain->mfn = mfn;
-
-		/* Now domain belongs to its connection. */
-		talloc_steal(domain->conn, domain);
-
-		fire_watches(NULL, in, "@introduceDomain", false);
-	} else if ((domain->mfn == mfn) && (domain->conn != conn)) {
-		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
-		if (domain->port)
-			xenevtchn_unbind(xce_handle, domain->port);
-		rc = xenevtchn_bind_interdomain(xce_handle, domid, port);
-		domain->port = (rc == -1) ? 0 : rc;
-		domain->remote_port = port;
-	} else
+	if (domain)
 		return EINVAL;
 
+	interface = map_interface(domid);
+	if (!interface)
+		return errno;
+	/* Hang domain off "in" until we're finished. */
+	domain = new_domain(in, domid, port);
+	if (!domain) {
+		rc = errno;
+		unmap_interface(interface);
+		return rc;
+	}
+	domain->interface = interface;
+
+	/* Now domain belongs to its connection. */
+	talloc_steal(domain->conn, domain);
+
+	fire_watches(NULL, in, "@introduceDomain", false);
+
 	domain_conn_reset(domain);
 
 	send_ack(conn, XS_INTRODUCE);
-- 
2.16.4


