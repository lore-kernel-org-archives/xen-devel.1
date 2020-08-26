Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5833AC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 15:14:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD8220707
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 15:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="G/w0nlZq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD8220707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAx7T-0003sG-VS; Wed, 26 Aug 2020 15:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uE3y=CE=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kAwiA-0001Sw-KF
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 14:47:38 +0000
X-Inumbo-ID: 65d8fe96-9908-4b6f-a595-d21ec1f1159c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65d8fe96-9908-4b6f-a595-d21ec1f1159c;
 Wed, 26 Aug 2020 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=4NrNIKnKnaYVGFhhhA3EI3mKDzwQjUb2g//yizSZzBk=; b=G/w0nlZqSCAni9Y6MwaaTtHTga
 K7JJsa+RwXZbztPtzBp8lqoN2pgn/wfUFA/snCmxprPhTEjWXJZi4c5rQpU/mtCGnYHd4mWksAd2e
 x543gJEjFaUAJPn0DxwHn6O/d7yQNOxo9dpgMFgUwQfSO9BwPqo/tOH1f+Y0BOJrKayU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kAwi9-000525-L1
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 14:47:37 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kAwi9-0000UU-JC
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 14:47:37 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kAwi7-00071h-S0; Wed, 26 Aug 2020 15:47:35 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH] MAINTAINERS: Update my email address
Date: Wed, 26 Aug 2020 15:47:19 +0100
Message-Id: <20200826144719.7091-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Aug 2020 15:13:47 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I am changing my email address.  (My affiliation to Citrix remains
unchanged.)  See
   https://xenbits.xen.org/people/iwj/2020/email-transition.txt
for a signed confirmation with full details.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 978fc2fe72..ffe2310294 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -353,7 +353,7 @@ F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
 LIBXENLIGHT
-M:	Ian Jackson <ian.jackson@eu.citrix.com>
+M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
@@ -413,7 +413,7 @@ S:	Supported
 F:	tools/python
 
 QEMU-DM
-M:	Ian Jackson <ian.jackson@eu.citrix.com>
+M:	Ian Jackson <iwj@xenproject.org>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
 
@@ -465,7 +465,7 @@ F:	xen/arch/arm/tee/
 F:	xen/include/asm-arm/tee
 
 TOOLSTACK
-M:	Ian Jackson <ian.jackson@eu.citrix.com>
+M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 S:	Supported
 F:	autogen.sh
@@ -602,7 +602,7 @@ F:	docs/misc/xsm-flask.txt
 THE REST
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
 M:	George Dunlap <george.dunlap@citrix.com>
-M:	Ian Jackson <ian.jackson@eu.citrix.com>
+M:	Ian Jackson <iwj@xenproject.org>
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Julien Grall <julien@xen.org>
 M:	Stefano Stabellini <sstabellini@kernel.org>
-- 
2.20.1


