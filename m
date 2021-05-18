Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999C7C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 12:04:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD046124C
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 12:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AD046124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129128.242412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liySO-0006f0-U6; Tue, 18 May 2021 12:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129128.242412; Tue, 18 May 2021 12:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liySO-0006et-R5; Tue, 18 May 2021 12:04:16 +0000
Received: by outflank-mailman (input) for mailman id 129128;
 Tue, 18 May 2021 12:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1liySN-0006dQ-N2
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:04:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fa726d3-bca4-4850-bbbc-4a5f223fb383;
 Tue, 18 May 2021 12:04:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A3A9B06A;
 Tue, 18 May 2021 12:04:14 +0000 (UTC)
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
X-Inumbo-ID: 7fa726d3-bca4-4850-bbbc-4a5f223fb383
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621339454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0LOPcwSGuMwwumFleyNeVrr2U7rfzgFVjivAhaw7nFo=;
	b=OL3mT7/6I2YER8HlvagwVM7uEqzxX/TjmpmeQkICLX+2lr2gUhavv5AD1znFJNyXqUt2+U
	klN3PrzI9CRjDOUJ4FQwGw80YjC0QXND7/lhxawll6f+Qo8WA2+ra9OA+CUeCa1K+K1RAR
	Qg/g95OHWBTVn3D4vmMZ96PBfovN3J8=
Subject: [PATCH 2/2] automation: fix dependencies on openSUSE Tumbleweed
 containers
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 14:04:13 +0200
Message-ID: <162133945335.25010.4601866854997664898.stgit@Wayrath>
In-Reply-To: <162133919718.25010.4197057069904956422.stgit@Wayrath>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dario Faggioli <dario@Solace.fritz.box>

Fix the build inside our openSUSE Tumbleweed container by using
the proper python development packages (and adding zstd headers).

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
---
 .../build/suse/opensuse-tumbleweed.dockerfile      |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 8ff7b9b5ce..5b99cb8a53 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -45,6 +45,7 @@ RUN zypper install -y --no-recommends \
         libtasn1-devel \
         libuuid-devel \
         libyajl-devel \
+        libzstd-devel \
         lzo-devel \
         make \
         nasm \
@@ -56,10 +57,8 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
-        python \
         python-devel \
-        python3 \
-        python3-devel \
+        python38-devel \
         systemd-devel \
         tar \
         transfig \



