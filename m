Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E85C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 06:09:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC86D23788
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 06:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC86D23788
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72543.130665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2pd1-0007db-0O; Fri, 22 Jan 2021 06:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72543.130665; Fri, 22 Jan 2021 06:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2pd0-0007dU-TV; Fri, 22 Jan 2021 06:09:02 +0000
Received: by outflank-mailman (input) for mailman id 72543;
 Fri, 22 Jan 2021 06:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2lNi=GZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2pcz-0007cd-UI
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 06:09:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc871b13-5dcf-4746-84de-ccb6e7e24edc;
 Fri, 22 Jan 2021 06:09:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D22B0AB9F;
 Fri, 22 Jan 2021 06:08:59 +0000 (UTC)
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
X-Inumbo-ID: fc871b13-5dcf-4746-84de-ccb6e7e24edc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611295739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=npWm2ufDHo1SLGAKlP/JV2/SYQCR5k4DEE1eplOjovA=;
	b=ja3GSPkPxgarCuiko7uJgdrCgJ31N+xV2WooTOnFpMP/h3PH5B29H8D1wTbXwnzwLTngCY
	PC90Rg6NRHU4v4s5kAyVjbTSdxEltrYo58L5Gt7kpe0ttunDrl5VPvIYiffrnWeIlxWxbG
	yfvYhWx5IZaVgzRhAhEeW42sijcxjTk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/xenstore: fix unsigned < 0 compare in xenstore_control
Date: Fri, 22 Jan 2021 07:08:57 +0100
Message-Id: <20210122060857.30273-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7f97193e6aa858df ("tools/xenstore: add live update command to
xenstore-control") introduced testing an unsigned value to be less
than 0. Fix that.

Fixes: 7f97193e6aa858df ("tools/xenstore: add live update command to
xenstore-control")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstore_control.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstore_control.c b/tools/xenstore/xenstore_control.c
index 6031f216c7..0c95cf767c 100644
--- a/tools/xenstore/xenstore_control.c
+++ b/tools/xenstore/xenstore_control.c
@@ -313,8 +313,8 @@ int main(int argc, char **argv)
     struct xs_handle *xsh;
     char *par = NULL;
     char *ret;
-    unsigned int p, len = 0;
-    int rc = 0;
+    unsigned int p;
+    int rc = 0, len = 0;
 
     if (argc < 2) {
         fprintf(stderr, "Usage:\n"
-- 
2.26.2


