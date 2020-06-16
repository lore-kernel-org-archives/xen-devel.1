Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AB3C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 17:02:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7021D208E4
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 17:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7021D208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEyf-0002by-Dc; Tue, 16 Jun 2020 17:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HLj8=75=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jlEye-0002ar-Qu
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:02:24 +0000
X-Inumbo-ID: 2028ce7c-aff3-11ea-bb8b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2028ce7c-aff3-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 17:02:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jlEyT-00084x-HW; Tue, 16 Jun 2020 18:02:13 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 3/4] standalone: Do not complain about ssh if
 AP_FETCH_PLACEHOLDERS=y
Date: Tue, 16 Jun 2020 17:58:11 +0100
Message-Id: <20200616165812.25380-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
References: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In this case, there is no need to ssh anywhere.

No change other than in dev-debugging setups.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 standalone | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/standalone b/standalone
index b51acf7b..9553d6c9 100755
--- a/standalone
+++ b/standalone
@@ -136,7 +136,7 @@ if [ ! -r "$WebspaceLog" ] ; then
     echo "WARNING: Cannot read apache logs at $WebspaceLog. Some tests may fail" >&2
 fi
 
-if ! ssh-add -l >/dev/null ; then
+if [ "x$AP_FETCH_PLACEHOLDERS" != x ] && ! ssh-add -l >/dev/null ; then
     echo "WARNING: Unable to access ssh-agent. Some tests may fail" >&2
 fi
 
-- 
2.20.1


