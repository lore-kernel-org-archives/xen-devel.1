Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62765C4363C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:27:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D472168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D472168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3699.10955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEA1-0002pX-2v; Wed, 07 Oct 2020 18:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3699.10955; Wed, 07 Oct 2020 18:27:32 +0000
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
	id 1kQE9z-0002oK-PO; Wed, 07 Oct 2020 18:27:31 +0000
Received: by outflank-mailman (input) for mailman id 3699;
 Wed, 07 Oct 2020 18:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2b-00072Q-Hn
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:53 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ecb5c37-fa98-4803-bc1c-312631f56aa1;
 Wed, 07 Oct 2020 18:19:24 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkB-0007CF-8n; Wed, 07 Oct 2020 19:00:51 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2b-00072Q-Hn
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:53 +0000
X-Inumbo-ID: 1ecb5c37-fa98-4803-bc1c-312631f56aa1
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1ecb5c37-fa98-4803-bc1c-312631f56aa1;
	Wed, 07 Oct 2020 18:19:24 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkB-0007CF-8n; Wed, 07 Oct 2020 19:00:51 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 73/82] host reuse: sg-run-job: Reanme post-test-ok parameter
Date: Wed,  7 Oct 2020 19:00:15 +0100
Message-Id: <20201007180024.7932-74-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This is more accurate.

No overall functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-run-job    | 2 +-
 ts-host-reuse | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 1e2fcfee..2feb67d9 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -124,7 +124,7 @@ proc run-job {job} {
        set ok 0
     }
 
-    if {$ok} { per-host-ts .  =            { ts-host-reuse post-test }    }
+    if {$ok} { per-host-ts .  =            { ts-host-reuse post-test-ok } }
     if {$ok} { setstatus pass                                             }
 
     if {[llength $need_build_host] && $ok} { jobdb::preserve-task 90 }
diff --git a/ts-host-reuse b/ts-host-reuse
index 85beb51e..aad45bdd 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -152,7 +152,7 @@ sub act_start_test () {
     host_shared_mark_ready($ho, $sharetype, \%oldstate, 'mid-test');
 }
 
-sub act_post_test () {
+sub act_post_test_ok () {
     compute_test_sharetype();
     $ho = selecthost($whhost);
     return unless $ho->{Shared};
-- 
2.20.1


