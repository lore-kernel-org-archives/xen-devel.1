Return-Path: <SRS0=yhtS=OY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6217C433FE
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 17:07:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9382D61159
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 17:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9382D61159
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.201611.356202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-0002vI-Im; Mon, 04 Oct 2021 17:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201611.356202; Mon, 04 Oct 2021 17:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-0002tI-CG; Mon, 04 Oct 2021 17:07:05 +0000
Received: by outflank-mailman (input) for mailman id 201611;
 Mon, 04 Oct 2021 17:07:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0002oh-RD
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0000LB-QO
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0005gN-PZ
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQc-0006NI-1i; Mon, 04 Oct 2021 18:07:02 +0100
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
	bh=CZXTOm6EiFeioottqvohyfKjfSXSIATOkpOGe8mezEE=; b=bRVCG2xceg36dY5Ziea5BA1UwM
	u8N3hPp7ABP2aVmijg+wFH0CUv/sVafcOAyIoIkwI2BhUjOO+em/1jOEk3/a0XU+IJnVzHO1ZkiXI
	GMDeXQFB/qK+2IMUdSLAYVVhpPsB0drP5t/xZvvVMVHGnnP7GDyoRTOUeTazpbOVHiG8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/6] mg-repro-setup: Promote an error test to before builds (nfc)
Date: Mon,  4 Oct 2021 18:06:50 +0100
Message-Id: <20211004170654.21864-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004170654.21864-1-iwj@xenproject.org>
References: <20211004170654.21864-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-repro-setup | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/mg-repro-setup b/mg-repro-setup
index 374176f03..56d27d4ef 100755
--- a/mg-repro-setup
+++ b/mg-repro-setup
@@ -253,6 +253,15 @@ while [ $# -ne 0 ]; do
 	esac
 done
 
+if [ "${alloc_idents[*]}" ]; then
+        if [ x"$OSSTEST_TASK" = x ]; then
+                # We would have to make a dynamic task and hold the
+                #  fd for it in this script.  Would be quite awkward.
+                echo >&2 'cannot hand-allocate in a way that will free'
+                exit 1
+        fi
+fi
+
 flight=$(./cs-adjust-flight new:$blessing)
 progress "new flight is $flight"
 
@@ -281,13 +290,6 @@ if $statictask; then
 fi
 
 if [ "${alloc_idents[*]}" ]; then
-        if [ x"$OSSTEST_TASK" = x ]; then
-                # We would have to make a dynamic task and hold the
-                #  fd for it in this script.  Would be quite awkward.
-                echo >&2 'cannot hand-allocate in a way that will free'
-                exit 1
-        fi
-
 	progress "allocating ${alloc_idents[*]} ..."
 	alloc_output=tmp/$flight.allocations
 	./mg-allocate \
-- 
2.20.1


