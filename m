Return-Path: <SRS0=2i39=LL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D3AC2B9F4
	for <xen-devel@archiver.kernel.org>; Thu, 17 Jun 2021 23:40:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EA461184
	for <xen-devel@archiver.kernel.org>; Thu, 17 Jun 2021 23:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3EA461184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.144277.265597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1cO-0001nM-1s; Thu, 17 Jun 2021 23:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144277.265597; Thu, 17 Jun 2021 23:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1cN-0001nF-V9; Thu, 17 Jun 2021 23:40:15 +0000
Received: by outflank-mailman (input) for mailman id 144277;
 Thu, 17 Jun 2021 23:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1cM-0001n8-7d
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:40:14 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 890392b8-d5c2-4a42-9d0a-01b9182b5493;
 Thu, 17 Jun 2021 23:40:13 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623973207647594.6141898175358;
 Thu, 17 Jun 2021 16:40:07 -0700 (PDT)
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
X-Inumbo-ID: 890392b8-d5c2-4a42-9d0a-01b9182b5493
ARC-Seal: i=1; a=rsa-sha256; t=1623973209; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NqOK/dtVWgvW5rJAHaWWyYT/CY/cxgWWpSbhhr8oYJx4PrY+5JhN5rCQHExK4ff12J6yRHZMx0TOsUJ2T77fDFNKn5TYJq4xQKPplgDasYcWKIcLx/eUkntbtdUXkqkOOo15BO6UGSNMeKQLExSP2UMe+t7nZhNOO9i8fgYf8mA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623973209; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=VG1SGMVtfqvSMcYTyx1bi1ZC6g4jlfGXeSVq6Hbovbc=; 
	b=nxOGT6hQmUw11dwWCGvhVQzYQd5nXZKxeQT0URNxnlyRtqzBMB2Plx8tMNZzPYRQ4e8sa755rlFB840b3e++EGl9BrNefoYchmJnJw+Rt3Hw5cHgHCOdbzj7/RDpm1TYabmYfKfuUc7OJ2mwfzO/XX58M5M9nwiXsgNlTlvjTaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623973209;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=VG1SGMVtfqvSMcYTyx1bi1ZC6g4jlfGXeSVq6Hbovbc=;
	b=e5xXvQE55vtOHfAF/4iXJVuvv6f7pixgtACEX6wfrkhti0ekkgVYJQMICKnu0Pi1
	WYK/WkOetR8l/fzhPPBeOVhz2d/4L+5hUvyHR9qt3NIqfbxZHLp8g6kfH04qFVAsUdM
	qDcjZjqANn0Qd45McKxzUh76qv+lQwnFIo2Mt9Bw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] maintainers: adding new reviewer for xsm
Date: Thu, 17 Jun 2021 19:49:55 -0400
Message-Id: <20210617234955.18489-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Would like to add myself as a reviewer for XSM.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d46b08a0d2..4f759867dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -622,6 +622,7 @@ F:	xen/include/xen/trace.h
 
 XSM/FLASK
 M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
+R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Supported
 F:	tools/flask/
 F:	xen/include/xsm/
-- 
2.20.1


