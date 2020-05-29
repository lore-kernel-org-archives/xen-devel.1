Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4601C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:34:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAAE2074D
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAAE2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHP-0002Fi-K3; Fri, 29 May 2020 11:34:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHO-0002Eo-Qn
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:26 +0000
X-Inumbo-ID: 3fffa68c-a1a0-11ea-81bc-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fffa68c-a1a0-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:33:43 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3b-0003xZ-Ey; Fri, 29 May 2020 12:20:11 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 48/49] buster 20_linux_xen: Only load policy in
 XSM-enabled builds
Date: Fri, 29 May 2020 12:19:44 +0100
Message-Id: <20200529111945.21394-49-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 overlay-buster/etc/grub.d/20_linux_xen | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/overlay-buster/etc/grub.d/20_linux_xen b/overlay-buster/etc/grub.d/20_linux_xen
index 4d3294a2..6f2a98ba 100755
--- a/overlay-buster/etc/grub.d/20_linux_xen
+++ b/overlay-buster/etc/grub.d/20_linux_xen
@@ -159,7 +159,7 @@ EOF
 	${module_loader}	--nounzip   ${rel_dirname}/${initrd}
 EOF
   fi
-  if test -n "${xenpolicy}" ; then
+  if ${xsm} && test -n "${xenpolicy}" ; then
     message="$(gettext_printf "Loading XSM policy ...")"
     sed "s/^/$submenu_indentation/" << EOF
 	echo	'$(echo "$message" | grub_quote)'
-- 
2.20.1


