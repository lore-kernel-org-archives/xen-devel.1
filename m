Return-Path: <SRS0=9kTy=JC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368DEC43462
	for <xen-devel@archiver.kernel.org>; Mon,  5 Apr 2021 16:14:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB64B61025
	for <xen-devel@archiver.kernel.org>; Mon,  5 Apr 2021 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB64B61025
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105455.201885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsB-0005Y0-Nf; Mon, 05 Apr 2021 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105455.201885; Mon, 05 Apr 2021 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsB-0005Xf-E2; Mon, 05 Apr 2021 16:14:43 +0000
Received: by outflank-mailman (input) for mailman id 105455;
 Mon, 05 Apr 2021 16:14:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRs8-0005UO-TX
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 16:14:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRs6-0003ew-KW; Mon, 05 Apr 2021 16:14:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbV-00053b-Vi; Mon, 05 Apr 2021 15:57:30 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=sR7NYKPgQAvYGz7bA4ItKG/zjd8QeLXKq9gu3Bw4Bo0=; b=6Lhk6beOV2W/H6rvRwFqdqbM7
	xp78Qoz4oBW2SFdz8d8l3y2Paat0sOf9+y7S1K12LJJE49qqmdANkIOT+xghkfXeTTbEOYkhjGGB5
	uAfW2i7iNvKAEdJnXHGnCjneTV67dMcXpnMTecvO+Ok96QJlUL0Mmz6CdHJXKkzFiL3sQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Tim Deegan <tim@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 10/14] tools/kdd: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:09 +0100
Message-Id: <20210405155713.29754-11-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to shore a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/debugger/kdd/kdd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
index a7d0976ea4a8..17513c26505e 100644
--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -67,7 +67,7 @@ typedef struct {
     uint32_t build;             
     int w64;
     int mp;
-    char *name;
+    const char *name;
     uint64_t base;              /* KernBase: start looking here */
     uint32_t range;             /* |         and search an area this size */
     uint32_t version;           /* +-> NtBuildNumber */
@@ -237,7 +237,7 @@ static size_t blocking_write(int fd, const void *buf, size_t count)
 }
 
 /* Dump the contents of a complete serial packet into a log file. */
-static void kdd_log_pkt(kdd_state *s, char *name, kdd_pkt *p)
+static void kdd_log_pkt(kdd_state *s, const char *name, kdd_pkt *p)
 {
     uint32_t sum = 0;
     unsigned int i, j;
@@ -504,8 +504,8 @@ static int check_os(kdd_state *s)
  * @return -1 on failure to find the section name
  * @return 0 on success
  */
-static int get_pe64_sections(kdd_state *s, uint64_t filebase, char *sectname,
-        uint64_t *vaddr, uint32_t *vsize)
+static int get_pe64_sections(kdd_state *s, uint64_t filebase,
+        const char *sectname, uint64_t *vaddr, uint32_t *vsize)
 {
     uint64_t pe_hdr = 0;
     uint64_t sect_start = 0;
@@ -781,7 +781,7 @@ static void kdd_send_cmd(kdd_state *s, uint32_t subtype, size_t extra)
 }
 
 /* Cause the client to print a string */
-static void kdd_send_string(kdd_state *s, char *fmt, ...)
+static void kdd_send_string(kdd_state *s, const char *fmt, ...)
 {
     uint32_t len = 0xffff - sizeof (kdd_msg);
     char *buf = (char *) s->txb + sizeof (kdd_hdr) + sizeof (kdd_msg);
-- 
2.17.1


