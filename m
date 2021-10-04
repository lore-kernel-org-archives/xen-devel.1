Return-Path: <SRS0=yhtS=OY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BEDC43219
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 17:07:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BECA6124F
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 17:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BECA6124F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.201612.356211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQg-00038L-4C; Mon, 04 Oct 2021 17:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201612.356211; Mon, 04 Oct 2021 17:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-000351-Rv; Mon, 04 Oct 2021 17:07:05 +0000
Received: by outflank-mailman (input) for mailman id 201612;
 Mon, 04 Oct 2021 17:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0002oo-3n
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0000LF-33
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0005gf-26
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQc-0006NI-9c; Mon, 04 Oct 2021 18:07:02 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=XYt2DosNXLq9+lZ570jI4CtVdnLCG9pQnFvcIZ+ueg4=; b=TctHtNUxXO6WZdZxl2JaSU4qcZ
	NP1PRUnxPEoYmd7c8KS5Ml5kXT6L+SG8zhTXOpcUKq+FOW3ZXlqPP8KpZZvIX9MSf+3Bna0nxM18B
	kABMUYs2lb7TBINH66HOtBQ0RNCnvcv8mpqfw1/RYvkn1Qf9PMoqZgCsCCYMUpPz5Ty0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/6] mg-allocate: Break out sub precheck (nfc)
Date: Mon,  4 Oct 2021 18:06:51 +0100
Message-Id: <20211004170654.21864-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004170654.21864-1-iwj@xenproject.org>
References: <20211004170654.21864-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-allocate | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/mg-allocate b/mg-allocate
index 14c46e0cc..8eca59e2c 100755
--- a/mg-allocate
+++ b/mg-allocate
@@ -647,14 +647,16 @@ if (defined $donate_spec) {
 	if grep { m/^!/ } @ARGV;
 }
 
+sub precheck () {
+    logm("pre-checking resources (dry run)...");
+    local $Osstest::TestSupport::logm_prefix = $logm_prefix.' (precheck)';
+    execute(1);
+}
+
 if ($duration) {
     die "--donate and --steal are incompatible with the planning system\n"
-	if @steal_specs || defined $donate_spec;
-    {
-	logm("pre-checking resources (dry run)...");
-	local $Osstest::TestSupport::logm_prefix = $logm_prefix.' (precheck)';
-	execute(1);
-    };
+        if @steal_specs || defined $donate_spec;
+    precheck();
     plan();
 } else {
     execute();
-- 
2.20.1


