Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF75C4727F
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:19:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3CC2177B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3CC2177B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3654.10639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE2N-0007rg-Li; Wed, 07 Oct 2020 18:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3654.10639; Wed, 07 Oct 2020 18:19:39 +0000
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
	id 1kQE2N-0007rT-Gn; Wed, 07 Oct 2020 18:19:39 +0000
Received: by outflank-mailman (input) for mailman id 3654;
 Wed, 07 Oct 2020 18:19:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2M-00072Q-HJ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:38 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ab6bdfe-1e35-4786-853d-05b06a8fc6dc;
 Wed, 07 Oct 2020 18:19:15 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjv-0007CF-E1; Wed, 07 Oct 2020 19:00:35 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2M-00072Q-HJ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:38 +0000
X-Inumbo-ID: 8ab6bdfe-1e35-4786-853d-05b06a8fc6dc
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8ab6bdfe-1e35-4786-853d-05b06a8fc6dc;
	Wed, 07 Oct 2020 18:19:15 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjv-0007CF-E1; Wed, 07 Oct 2020 19:00:35 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 13/82] target setup refactoring: Move target_kernkind_console_inittab
Date: Wed,  7 Oct 2020 18:59:15 +0100
Message-Id: <20201007180024.7932-14-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We move this earlier.  This is OK because it depends only on the
console runvar (inside the sub; this is set by target_kernkind_check),
$ho and $gho (which are set by this point); and $mountpoint$ (which is
set by access().

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-debian-fixup | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ts-debian-fixup b/ts-debian-fixup
index 34051137..2184212b 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -79,10 +79,9 @@ END
 }
 
 our $extra;
+our $console;
 
 sub console () {
-    my $console=
-        target_kernkind_console_inittab($ho,$gho,"$mountpoint");
     return unless length $console;
     
     my $xextra= "console=$console earlyprintk=xen";
@@ -211,6 +210,7 @@ savecfg();
 ether();
 access();
 target_kernkind_check($gho);
+$console = target_kernkind_console_inittab($ho,$gho,"$mountpoint");
 
 debian_overlays($ho, \&overlay);
 target_cmd_root($ho, <<END.debian_overlays_fixup_cmd($ho, $mountpoint));
-- 
2.20.1


