Return-Path: <SRS0=yIgx=N7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAA8C43217
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 16:47:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBA8061100
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 16:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBA8061100
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183404.331555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCk-0005A3-TS; Thu, 09 Sep 2021 16:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183404.331555; Thu, 09 Sep 2021 16:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCk-00059x-QX; Thu, 09 Sep 2021 16:47:14 +0000
Received: by outflank-mailman (input) for mailman id 183404;
 Thu, 09 Sep 2021 16:47:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-00059V-8J
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-0002Mj-5m
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-0001R1-4j
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mONCh-0006u8-6X; Thu, 09 Sep 2021 17:47:11 +0100
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=UMqWVNP+rUg/q7PFg9vaAE7KX7sL7PFJCgDLmgRZxek=; b=TH7E17IQMBWN8yFdiE0k0D+UWL
	20iBRjJS7okhuFzAAqJkILp7G5PQ+m1CZ0rxz45y17RqHqZcP6dXwAw9WvDZt5ULureYHKJolKxyy
	Wzn6icPaJjIMp8yvgH9ADplCW2+pPr6i2/6YOa3ha45EXq30QolnhvbzDenjyFnvXtxU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/4] mfi-common: break out dom0arches variable (nfc)
Date: Thu,  9 Sep 2021 17:47:00 +0100
Message-Id: <20210909164703.19426-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will allow test choices to depend on the actual rather than
entire dom0arches.

No change to output from standalone-generate-dump-flight-runvars.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mfi-common | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mfi-common b/mfi-common
index 2834411f..70e17f7a 100644
--- a/mfi-common
+++ b/mfi-common
@@ -643,6 +643,7 @@ test_matrix_iterate () {
       *)          echo >&2 "kernbuild ?  $kern"; exit 1 ;;
       esac
 
+      dom0arches=''
       for dom0arch in i386 amd64 armhf arm64; do
 
         case ${xenarch}_${dom0arch} in
@@ -654,6 +655,11 @@ test_matrix_iterate () {
             *) continue ;;
         esac
 
+        dom0arches+=" $dom0arch"
+      done
+
+      for dom0arch in $dom0arches; do
+
         eval "
             arch_runvars=\"\$ARCH_RUNVARS_$dom0arch\"
         "
-- 
2.20.1


