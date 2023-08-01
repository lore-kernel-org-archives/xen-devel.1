Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B26C04A94
	for <xen-devel@archiver.kernel.org>; Tue,  1 Aug 2023 09:58:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.574031.899232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8n-0002J4-6R; Tue, 01 Aug 2023 09:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574031.899232; Tue, 01 Aug 2023 09:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8n-0002Iu-3S; Tue, 01 Aug 2023 09:58:09 +0000
Received: by outflank-mailman (input) for mailman id 574031;
 Tue, 01 Aug 2023 09:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u66X=DS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qQm8l-0000wJ-Fv
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:58:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9cfcd28-3051-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:58:07 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 733144EE0737;
 Tue,  1 Aug 2023 11:58:06 +0200 (CEST)
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
X-Inumbo-ID: e9cfcd28-3051-11ee-b259-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 4/4] automation/eclair: avoid failure in case of missing merge point
Date: Tue,  1 Aug 2023 11:57:04 +0200
Message-Id: <b1b5e151a176d2644fd836eec6190f98c23894d0.1690881495.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690881495.git.simone.ballarin@bugseng.com>
References: <cover.1690881495.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the context of an auto pull request, when a common merge point
is not found the integration will continue the analysis without
failing.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/action.settings | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 528bc24c72..f96368ffc7 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -138,7 +138,9 @@ auto_pull_request)
     git remote add autoPRRemote "${autoPRRemoteUrl}"
     git fetch -q autoPRRemote
     subDir="${ref}"
-    baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD)
+    if ! baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD); then
+        baseCommitId=no_merge_point
+    fi
     jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${ref} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
     ;;
 *)
-- 
2.34.1


