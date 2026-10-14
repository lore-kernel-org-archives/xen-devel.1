Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECB5CC6B30
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:55:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449707.1665345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9l8-0005su-JU; Thu, 15 Oct 2026 00:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449707.1665345; Thu, 15 Oct 2026 00:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9l8-0005sk-Fu; Thu, 15 Oct 2026 00:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1449707;
 Thu, 15 Oct 2026 00:55:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9l8-0005sc-3b
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9l7-000UVg-Gv
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:55:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad02494-2eae-0a2a0a5409dd-0a2a4509e4e2-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:55:49 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023df-be1a-0a2a45090019-4a68bc045099-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:49 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qeZr092095
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qeeU092094;
 Wed, 14 Oct 2026 17:52:40 -0700 (PDT) (envelope-from ehem)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <3fbe613739d1fb39f25b249b8a1c20b1dabfb568.1792017109.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017109.git.ehem+xen@m5p.com>
References: <cover.1792017109.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 14 Oct 2026 15:31:49 -0700
Subject: [PATCH 3/5] tools/libxl: Tiny optimization of libxl__mac_is_default()
X-purgate-ID: tlsNG-bad1c0/1792025569-3A0C5034-912BB028/0/0
X-purgate-type: clean
X-purgate-size: 954

Date: Fri, 18 Dec 2020 14:45:02 -0800

This should result in fewer branch instructions and a small performance
gain.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/light/libxl_internal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index cd99d249bf..b5b4825619 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -347,8 +347,8 @@ _hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b)
 
 _hidden int libxl__mac_is_default(const libxl_mac *mac)
 {
-    return (!(*mac)[0] && !(*mac)[1] && !(*mac)[2] &&
-            !(*mac)[3] && !(*mac)[4] && !(*mac)[5]);
+    return !((*mac)[0] | (*mac)[1] | (*mac)[2] |
+             (*mac)[3] | (*mac)[4] | (*mac)[5]);
 }
 
 _hidden int libxl__init_recursive_mutex(libxl_ctx *ctx, pthread_mutex_t *lock)
-- 
2.47.3


