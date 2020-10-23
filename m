Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233C2C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:23:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14782192A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="4XEB77K0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A14782192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11170.29669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzr2-0000DE-An; Fri, 23 Oct 2020 16:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11170.29669; Fri, 23 Oct 2020 16:23:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzr2-0000Cv-5Y; Fri, 23 Oct 2020 16:23:48 +0000
Received: by outflank-mailman (input) for mailman id 11170;
 Fri, 23 Oct 2020 16:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzr1-00081e-D3
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:47 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45b5f1c7-5366-42f6-873d-8647cb949167;
 Fri, 23 Oct 2020 16:23:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqh-0008Jp-K8; Fri, 23 Oct 2020 16:23:27 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqh-000376-Ce; Fri, 23 Oct 2020 16:23:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzr1-00081e-D3
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:47 +0000
X-Inumbo-ID: 45b5f1c7-5366-42f6-873d-8647cb949167
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 45b5f1c7-5366-42f6-873d-8647cb949167;
	Fri, 23 Oct 2020 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=DQUDwHY5sR5Fv3fHlALRKj3/AMe6ExqKLpToY1+yr+I=; b=4XEB77K0rvyyg7sYB7vvSU002
	m5vvIMhMYWkEkxgA3OUrYmsAz5r7IvJn5KOC5wnt+15IN9KZVH+eGmW0RFrMUOr3Z4HFw0LJvje0t
	S0LixHDPrZLZuD6eOnsjpucaEGxejpQY/CCgvFhBd6RM6W7DhjM8sl0BT9wy+XKiuTTcQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqh-0008Jp-K8; Fri, 23 Oct 2020 16:23:27 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqh-000376-Ce; Fri, 23 Oct 2020 16:23:27 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 09/25] libxl: remove unnecessary check from libxl__device_pci_add()
Date: Fri, 23 Oct 2020 16:22:58 +0000
Message-Id: <20201023162314.2235-10-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

The code currently checks explicitly whether the device is already assigned,
but this is actually unnecessary as assigned devices do not form part of
the list returned by libxl_device_pci_assignable_list() and hence the
libxl_pci_assignable() test would have already failed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index f74203100d..0be1b21185 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1535,8 +1535,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 {
     STATE_AO_GC(aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    libxl_device_pci *assigned;
-    int num_assigned, rc;
+    int rc;
     int stubdomid = 0;
     pci_add_state *pas;
 
@@ -1575,19 +1574,6 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         goto out;
     }
 
-    rc = get_all_assigned_devices(gc, &assigned, &num_assigned);
-    if ( rc ) {
-        LOGD(ERROR, domid,
-             "cannot determine if device is assigned, refusing to continue");
-        goto out;
-    }
-    if ( is_pci_in_array(assigned, num_assigned, pci->domain,
-                         pci->bus, pci->dev, pci->func) ) {
-        LOGD(ERROR, domid, "PCI device already attached to a domain");
-        rc = ERROR_FAIL;
-        goto out;
-    }
-
     libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
-- 
2.11.0


