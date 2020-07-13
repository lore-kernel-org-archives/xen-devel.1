Return-Path: <SRS0=Ja2z=AY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7CEC433E2
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2020 05:26:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D12052068F
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2020 05:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D12052068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juqyE-00057I-H3; Mon, 13 Jul 2020 05:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1juqyD-00057D-Go
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 05:25:41 +0000
X-Inumbo-ID: 49459df4-c4c9-11ea-9222-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49459df4-c4c9-11ea-9222-12813bfff9fa;
 Mon, 13 Jul 2020 05:25:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9E3BAB89;
 Mon, 13 Jul 2020 05:25:39 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] docs: specify stability of hypfs path documentation
Date: Mon, 13 Jul 2020 07:16:39 +0200
Message-Id: <20200713051639.26948-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
file system are specified. Make it more clear that path availability
might change, e.g. due to scope widening or narrowing (e.g. being
limited to a specific architecture).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
This might be a candidate for 4.14, as hypfs is new in 4.14 and the
documentation should be as clear as possible.
---
 docs/misc/hypfs-paths.pandoc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index a111c6f25c..7ad4b7ba95 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -5,6 +5,9 @@ in the Xen hypervisor file system (hypfs).
 
 The hypervisor file system can be accessed via the xenhypfs tool.
 
+The availability of the hypervisor file system depends on the hypervisor
+config option CONFIG_HYPFS, which is on per default.
+
 ## Notation
 
 The hypervisor file system is similar to the Linux kernel's sysfs.
@@ -55,6 +58,11 @@ tags enclosed in square brackets.
 * CONFIG_* -- Path is valid only in case the hypervisor was built with
   the respective config option.
 
+Path availability is subject to change, e.g. a specific path specified
+for a single architecture now might be made available for other architectures
+in future, or it could be made conditional by an additional config option
+of the hypervisor.
+
 So an entry could look like this:
 
     /cpu-bugs/active-pv/xpti = ("No"|{"dom0", "domU", "PCID-on"}) [w,X86,PV]
-- 
2.26.2


