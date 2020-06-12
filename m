Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973F5C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 11:05:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C70207D8
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 11:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C70207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhVE-0005T3-TO; Fri, 12 Jun 2020 11:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjhVD-0005Sy-Ta
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:05:39 +0000
X-Inumbo-ID: a5e57af6-ac9c-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e57af6-ac9c-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 11:05:39 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ciLDfLLVW4KC2YidnuKDXb5ozQH/geSuIQfi+ZmYjF7OmZ2dEr39mQFqLnzAJ4F+MLM2vORDuu
 p6c8I7Ud/8QIRQLED6ecRK/zhgrZ13bF2kPrY6MRmHkXatl4gthAulEQKX0dNp9vF/TrulqTsj
 SCNpK4zoFfUQU/pm1/ylwANu++dXgorHKGZ0V1svQDvwEUffpMO04A7TS8mVX/SUfTJYqiB4Il
 Yo+27VaXjgl4q53ykBoTm8Vyl3LyoI65fLmYaibDtK8YnWe7kfDsnuDijmxfomiHxcqbxLCREP
 NJw=
X-SBRS: 2.7
X-MesageID: 20239744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20239744"
To: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: libxl dirty in tree after libxl build
Message-ID: <439f3d92-2e18-1868-2b4b-2747973fbe3b@citrix.com>
Date: Fri, 12 Jun 2020 12:05:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

Hello,

A build of libxl has just dirtied the tree with:

index 05f7ac74a0..94a4438666 100644
--- a/tools/libxl/libxlu_disk_l.c
+++ b/tools/libxl/libxlu_disk_l.c
@@ -10,221 +10,11 @@
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
 #define YY_FLEX_MINOR_VERSION 6
-#define YY_FLEX_SUBMINOR_VERSION 4
+#define YY_FLEX_SUBMINOR_VERSION 1
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif

and a whole slew of other changes in the generated code.  It looks like
the version of Flex has just been updated in Jessie.

Given the flex and bison are strictly required for the libxl build, why
is this temporary file checked in?

~Andrew

