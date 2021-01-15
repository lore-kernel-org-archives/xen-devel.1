Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD7BC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:30:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BAE5221ED
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BAE5221ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68663.122980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbU-0006DO-GW; Fri, 15 Jan 2021 22:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68663.122980; Fri, 15 Jan 2021 22:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbU-0006D7-2c; Fri, 15 Jan 2021 22:30:00 +0000
Received: by outflank-mailman (input) for mailman id 68663;
 Fri, 15 Jan 2021 22:29:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XbT-00062b-8E
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:29:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2e3b80d-86da-4705-9edf-f9c045ca9bf7;
 Fri, 15 Jan 2021 22:29:49 +0000 (UTC)
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
X-Inumbo-ID: d2e3b80d-86da-4705-9edf-f9c045ca9bf7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lWsFTTbEVFGdoUm4Dgm9YQNeIr4pWQkbL4RlcMnain4=;
  b=aWmEMoSXP/SabntwWj72+ReS/+rpbPyvcUEcyfpo2i4lPxppW7T29ZcK
   6oGbtCUqMZt+kKNgK67XQY3e+AMtVeEHNpPjKEZpgKx4cDbQLddWZN797
   ZwlNgS2+grx9pow5cQJeaLA6+WCYsxSmPAQyE4QJmScM7SC//ix4MRw2E
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LqKnSJ01Vz6NbkjT5eTnpYW+v22/ib/w2FzMRwcnWFDPte6Sd4HtlfQTyfBwsBVBIQZ2qh6kQk
 K+U55Ebwd+zjAnMAvMtKufyGG8tRxQxG+n+7fzAe7QLe1KQNiKL8lTNKvnbUNm3sa+dTdnYcxm
 rqNxYp/2M3RSN2qY9gjVu4rqSjQCTiU/1xK4d43qADXtD3rupDpkjOIPOGSbm0d7OsDQRKxrEt
 HMqy15LOrIzhFMQB/YmFw068xVMF3mzDj50jggF/XSSTuMzI8YlwDunw6N89eHV08kNmYfY4yv
 U4k=
X-SBRS: 5.1
X-MesageID: 35434450
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35434450"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Pau Ruiz Safont <pau.safont@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: [PATCH v2 2/8] Add workaround for xenstore-control flood issues
Date: Fri, 15 Jan 2021 22:28:44 +0000
Message-ID: <b7a673dd12b56674c79d1ee23b9809fb91caad23.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are alternative fixes for this, e.g. do the entire live update
inside oxenstored and reply OK from the next oxenstored or an error.
This requires some asynchronous handling there.

Once that code is available we can revert this one.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
Reviewed-by: Christian Lindig <christian.lindig@citrix.com>
---
Changed since V1:
* post publicly now that the XSA is out
---
 tools/xenstore/xenstore_control.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/xenstore/xenstore_control.c b/tools/xenstore/xenstore_control.c
index 5ca015a07d..611e8b4fdd 100644
--- a/tools/xenstore/xenstore_control.c
+++ b/tools/xenstore/xenstore_control.c
@@ -42,6 +42,10 @@ static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
         len = add_to_buf(&buf, "-F", len);
     if (len < 0)
         return 1;
+    /* +1 for rounding issues
+     * +1 to give oxenstored a chance to timeout and report back first
+     */
+    to += 2;
 
     for (time_start = time(NULL); time(NULL) - time_start < to;) {
         ret = xs_control_command(xsh, "live-update", buf, len);
@@ -49,6 +53,15 @@ static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
             goto err;
         if (strcmp(ret, "BUSY"))
             break;
+        /* TODO: use task ID for commands, avoid busy loop polling
+here
+         * oxenstored checks BUSY condition internally on every main
+loop iteration anyway.
+         * Avoid flooding xenstored with live-update requests.
+         * The flooding can also cause the evtchn to overflow in
+xenstored which makes
+         * xenstored enter an infinite loop */
+        sleep(1);
     }
 
     if (strcmp(ret, "OK"))
-- 
2.29.2


