Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7078BC4727F
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:01:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029DE2173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029DE2173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3609.10355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDk9-0003yN-5Y; Wed, 07 Oct 2020 18:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3609.10355; Wed, 07 Oct 2020 18:00:49 +0000
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
	id 1kQDk9-0003yC-2J; Wed, 07 Oct 2020 18:00:49 +0000
Received: by outflank-mailman (input) for mailman id 3609;
 Wed, 07 Oct 2020 18:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDk7-0003r9-Qh
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:47 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cb581d4-7b5f-471f-8c85-c3e369bc8064;
 Wed, 07 Oct 2020 18:00:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjs-0007CF-2P; Wed, 07 Oct 2020 19:00:32 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDk7-0003r9-Qh
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:47 +0000
X-Inumbo-ID: 6cb581d4-7b5f-471f-8c85-c3e369bc8064
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6cb581d4-7b5f-471f-8c85-c3e369bc8064;
	Wed, 07 Oct 2020 18:00:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjs-0007CF-2P; Wed, 07 Oct 2020 19:00:32 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/82] README.planner: Document magic job hostflags
Date: Wed,  7 Oct 2020 18:59:05 +0100
Message-Id: <20201007180024.7932-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 README.planner | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/README.planner b/README.planner
index c33aae11..f134d716 100644
--- a/README.planner
+++ b/README.planner
@@ -203,6 +203,66 @@ that shared systems get regrooved occasionally even if nothing decides
 to unshare them.
 
 
+ts-hosts-allocate-Executive and hostflags
+----------------------------------------
+
+Within a job, the allocations are actually done by
+ts-hosts-allocate-Executive.  It is told what to do by its command
+line arguments, which are (usually) simply IDENTs.
+
+The IDENTs provide the key for runvars which control the host
+allocation algorithm.  Principally, these are the runvars which define
+the job's hostflags
+    all_hostflags
+    IDENT_hostflags
+    runtime_IDENT_hostflags
+(all of these are comma-separated lists).
+
+Each such hostflag must, in general, be set for a particular host, for
+that host to be eligible.  But there are some special forms of job
+hostflag:
+
+  share-SHARING
+
+    The host may be shared with other jobs.  Typically used for
+    builds.  SHARING is a string which denotes the "scope" of the
+    sharing - jobs with the same SHARING should set the host up
+    identically.  The osstest test harness revision is automatically
+    appended and therefore does not need to be included.
+
+  equiv-FORMALTOKEN
+
+    For each equiv-FORMALTOKEN job flag set on one or more IDENTs, a
+    corresponding equiv-ACTUALTOKEN host flag must be set on the
+    corresponding hosts.  So, for example, if the IDENTs src_host and
+    dst_host both have equiv-1 specified, then the two hosts chosen
+    for src_host and dst_host will have an actual hostflag in common
+    which matches the pattern equiv-*.
+
+  diverse-FORMATLTOKEN
+
+    For each diverse-FORMALTOKEN flag, the selected host will *not* be
+    the same as any other allocation with the same diverse-FORMALTOKEN
+    flag in the same *flight*.
+
+  CONDNAME:CONDARGS...
+
+    Looks up CONDNAME as Osstest::ResourceCondition::PROPNAME.
+    The selected host must match the appropriate condition.
+    CONDNAMEs are:
+
+  PropEq:HOSTPROP:VAL
+
+    Require the host property HOSTPROP to be equal to VAL,
+    according to string comparison.  (Unset properties are
+    match an empty VAL.)
+
+  PropMinVer:HOSTPROP:VAL
+
+    Require the host property HOSTPROP to be at least VAL, according
+    to version number comparison (as implemented by dpkg and
+    coreutils).
+
 Flights
 -------
 
-- 
2.20.1


