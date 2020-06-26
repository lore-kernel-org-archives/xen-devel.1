Return-Path: <SRS0=3C9E=AH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F193EC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2020 14:38:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91D12070A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2020 14:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C91D12070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopUO-0000uY-8W; Fri, 26 Jun 2020 14:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3dG=AH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jopUN-0000uT-25
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 14:37:59 +0000
X-Inumbo-ID: a067d4a6-b7ba-11ea-bca7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a067d4a6-b7ba-11ea-bca7-bc764e2007e4;
 Fri, 26 Jun 2020 14:37:57 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kHOFdFhBmHfCGWRLYS/vQC+VRpk9pvNHFMdXy+26e5/Hr5kIopiiSW9AtoA06h1jCoMeofpkeB
 1fZ3OEQ2pp9G0VBT+BYC6ScJWAXhTXimy+rTfgvt1yjM2l+DtMAigs+SU2UsURGp+rT5xu7ur4
 BvNuj4JTpEXCkUVmY0/b6tCUnLvb9QirAsV2LjfmiLM2yO3FiB5vESX5RM/x7tJPIQz2O3/Iqb
 lLADvuAeSA+5QWfqC2pofKvt/qK+xTo1fkhF9ym45+9rPB/ZXXkC94hiJ9dhUtVZV6uICaIoAq
 IjE=
X-SBRS: 2.7
X-MesageID: 21336657
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21336657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] changelog: Add notes about CET and Migration changes
Date: Fri, 26 Jun 2020 15:37:38 +0100
Message-ID: <20200626143738.1525-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
---
 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 43fd260156..5c3d3c791d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - New 'domid_policy', allowing domain-ids to be randomly chosen.
  - Option to preserve domain-id across migrate or save+restore.
  - Support in kdd for initial KD protocol handshake for Win 7, 8 and 10 (64 bit).
+ - Tech preview support for Control-flow Execution Technology, with Xen using
+   Supervisor Shadow Stacks for its own protection.
+
+### Changed
+ - The CPUID data seen by a guest on boot is now moved in the migration
+   stream.  A guest migrating between non-identical hardware will now no
+   longer observe details such as Family/Model/Stepping, Cache, etc changing.
+   An administrator still needs to take care to ensure the features visible to
+   the guest at boot are compatible with anywhere it might migrate.
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.11.0


