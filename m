Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87E0C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 10:22:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5844D61445
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 10:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5844D61445
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114350.217928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9zf-0000Ee-Ie; Wed, 21 Apr 2021 10:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114350.217928; Wed, 21 Apr 2021 10:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9zf-0000EX-F6; Wed, 21 Apr 2021 10:22:03 +0000
Received: by outflank-mailman (input) for mailman id 114350;
 Wed, 21 Apr 2021 10:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9zd-0000CV-Tw
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:22:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29f292c2-12b8-4b73-a043-96f0b458684c;
 Wed, 21 Apr 2021 10:22:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D7D2B2D6;
 Wed, 21 Apr 2021 10:21:59 +0000 (UTC)
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
X-Inumbo-ID: 29f292c2-12b8-4b73-a043-96f0b458684c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619000519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5M9d5K4NLQWhUZlujnEzlcEHndQ3mZdWLs+EcPv7cUs=;
	b=LiTZgKOV0cGIYWbwtAyYwhRHVlHGf0zNvaQx+eCjdjPRthTRpsL3ZfRvEPyXYOFb2mg0aS
	seCBVKOA5k8RbN2qS2AxzrACD2V6H27a2dTKv0Z4jR8TxfO7ZgwZdijWiCmkje8silTwml
	uvSGUN8w1EOm+EN7c/xZyaB2Jy0XF6s=
Subject: [PATCH v4 2/3] xen/decompress: drop STATIC and INIT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Message-ID: <a5737138-b112-0b4a-e79a-4fc49e91f195@suse.com>
Date: Wed, 21 Apr 2021 12:21:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Except for one last instance, all users have been removed in earlier
changes.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v3: New.

--- a/xen/arch/arm/efi/efi-dom0.c
+++ b/xen/arch/arm/efi/efi-dom0.c
@@ -28,7 +28,7 @@
 #include <asm/setup.h>
 #include <asm/acpi.h>
 #include "../../../common/decompress.h"
-#define XZ_EXTERN STATIC
+#define XZ_EXTERN static
 #include "../../../common/xz/crc32.c"
 
 /* Constant to indicate "Xen" in unicode u16 format */
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -7,9 +7,6 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 
-#define STATIC static
-#define INIT __init
-
 #define malloc xmalloc_bytes
 #define free xfree
 
@@ -18,9 +15,6 @@
 
 #else
 
-#define STATIC static
-#define INIT
-
 #undef __init /* tools/libs/guest/xg_private.h has its own one */
 #define __init
 #define __initdata


