Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2480EC4345F
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2024 12:46:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.714043.1115006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1QOB-0003sn-DB; Mon, 29 Apr 2024 12:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714043.1115006; Mon, 29 Apr 2024 12:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1QOB-0003sg-AM; Mon, 29 Apr 2024 12:45:47 +0000
Received: by outflank-mailman (input) for mailman id 714043;
 Mon, 29 Apr 2024 12:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7+Y=MC=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s1QOA-0003sY-Fr
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 12:45:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6475fb27-0626-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 14:45:44 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 13F634EE0738;
 Mon, 29 Apr 2024 14:45:43 +0200 (CEST)
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
X-Inumbo-ID: 6475fb27-0626-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair_enalysis: amend configuration for some MISRA rules
Date: Mon, 29 Apr 2024 14:44:50 +0200
Message-Id: <7e8f6f4e0e007656d8809c4d521e73e642747d7f.1714394212.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust ECLAIR configuration for rules: R21.14, R21.15, R21.16 by taking
into account mem* macros defined in the Xen sources as if they were
equivalent to the ones in Standard Library.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/analysis.ecl | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index a604582da3..f3b634baba 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -19,6 +19,23 @@ map_strings("scheduled-analysis",analysis_kind)
 
 -enable=B.EXPLAIN
 
+-doc_begin="These configurations serve the purpose of recognizing the 'mem*' macros as
+their Standard Library equivalents."
+
+-config=MC3R1.R21.14,call_select+=
+{"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_cast_stmts, node(string_literal)))",
+ "any()", violation, "%{__callslct_any_base_fmt()}", {{arg, "%{__callslct_arg_fmt()}"}}}
+
+-config=MC3R1.R21.15,call_args+=
+{"macro(^mem(cmp|move|cpy)$)", {1, 2}, "unqual_pointee_compatible",
+ "%{__argscmpr_culprit_fmt()}", "%{__argscmpr_evidence_fmt()}"}
+
+-config=MC3R1.R21.16,call_select+=
+{"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_stmts, type(canonical(__memcmp_pte_types))))",
+ "any()", violation, "%{__callslct_any_base_fmt()}", {{arg,"%{__callslct_arg_type_fmt()}"}}}
+
+-doc_end
+
 -eval_file=toolchain.ecl
 -eval_file=public_APIs.ecl
 if(not(scheduled_analysis),
-- 
2.25.1


