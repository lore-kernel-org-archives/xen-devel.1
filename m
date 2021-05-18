Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185ADC433B4
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 15:22:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3BC861185
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 15:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3BC861185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129350.242811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1Xq-0006zY-Tt; Tue, 18 May 2021 15:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129350.242811; Tue, 18 May 2021 15:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1Xq-0006zR-Qn; Tue, 18 May 2021 15:22:06 +0000
Received: by outflank-mailman (input) for mailman id 129350;
 Tue, 18 May 2021 15:22:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj1Xp-0006xj-Cg
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 15:22:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj1Xo-0005X2-Av; Tue, 18 May 2021 15:22:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj1Xo-0000Pi-28; Tue, 18 May 2021 15:22:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=bihKm/0I5e2904VEtD9FhHuR9ZFEzgsDrIr7s+Qg+Yk=; b=cJvMU+dWy3WYOLAX3QmAGWVAsW
	YIjXBbrZMB+RqlTqkxKeCMWLT1c1oeGC82Opkw4UrTTsSLTSpf4cqT0fTB9/vlCeVqVx8BSbOcwW5
	y6X5qlbHOu+Q65DSz5OteY4d2u3ycNHJkvaK7sdFZlyjS2UmERmBJFy6tqi9genSwIHY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Remove unused parameter in check_domains()
Date: Tue, 18 May 2021 16:21:57 +0100
Message-Id: <20210518152157.6481-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The parameter of check_domains() is not used within the function. In fact,
this was a left over of the original implementation as the version merged
doesn't need to know whether we are restoring.

So remove it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 2 +-
 tools/xenstore/xenstored_domain.c  | 4 ++--
 tools/xenstore/xenstored_domain.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8e470f2b2056..07458d7b48d0 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -589,7 +589,7 @@ void lu_read_state(void)
 	 * have died while we were live-updating. So check all the domains are
 	 * still alive.
 	 */
-	check_domains(true);
+	check_domains();
 }
 
 static const char *lu_activate_binary(const void *ctx)
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 3d4d0649a243..0e4bae9a9dd6 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -220,7 +220,7 @@ static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
 	       dominfo->domid == domid;
 }
 
-void check_domains(bool restore)
+void check_domains(void)
 {
 	xc_dominfo_t dominfo;
 	struct domain *domain;
@@ -277,7 +277,7 @@ void handle_event(void)
 		barf_perror("Failed to read from event fd");
 
 	if (port == virq_port)
-		check_domains(false);
+		check_domains();
 
 	if (xenevtchn_unmask(xce_handle, port) == -1)
 		barf_perror("Failed to write to event fd");
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index dc9759171317..cc5147d7e747 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -21,7 +21,7 @@
 
 void handle_event(void);
 
-void check_domains(bool restore);
+void check_domains(void);
 
 /* domid, mfn, eventchn, path */
 int do_introduce(struct connection *conn, struct buffered_data *in);
-- 
2.17.1


