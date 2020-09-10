Return-Path: <SRS0=JUJE=CT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72EBC43461
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2020 12:12:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6907D2076D
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2020 12:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6907D2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGLR9-0007ha-1j; Thu, 10 Sep 2020 12:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGLR7-0007hA-AB
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 12:12:21 +0000
X-Inumbo-ID: b9b26695-187d-4c91-9414-898c5b489075
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9b26695-187d-4c91-9414-898c5b489075;
 Thu, 10 Sep 2020 12:12:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5958AFC8;
 Thu, 10 Sep 2020 12:12:34 +0000 (UTC)
Subject: [PATCH 3/6] tools/include: adjust population of public headers into
 xen/
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Message-ID: <4123c2b5-ac96-c77b-1dcb-9a052d58def4@suse.com>
Date: Thu, 10 Sep 2020 14:12:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Use a wildcard also for the subdirectories, drop XEN_PUBLIC_INCLUDES for
having a single use only, and don't pass -f to ln to allow noticing name
collisions right away, and add trailing slashes to ln's destination.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -12,15 +12,14 @@ all-y:
 xen-foreign:
 	$(MAKE) -C xen-foreign
 
-XEN_PUBLIC_INCLUDES = $(wildcard $(XEN_ROOT)/xen/include/public/*.h)
 XEN_LIB_X86_INCLUDES = $(filter-out %autogen.h, $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile $(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h))
 
 xen-dir:
 	@rm -rf xen acpi
 	mkdir -p xen/libelf acpi
-	ln -sf $(XEN_ROOT)/xen/include/public/COPYING xen
-	ln -sf $(XEN_PUBLIC_INCLUDES) xen
-	ln -sf $(addprefix $(XEN_ROOT)/xen/include/public/,arch-x86 arch-arm hvm io xsm) xen
+	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
+	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
+	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/
 	ln -sf ../xen-sys/$(XEN_OS) xen/sys
 	ln -sf $(addprefix $(XEN_ROOT)/xen/include/xen/,libelf.h elfstructs.h) xen/libelf/
 	ln -s ../xen-foreign xen/foreign


