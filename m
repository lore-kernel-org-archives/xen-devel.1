Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CE2C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 16:29:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 185F36508B
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 16:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 185F36508B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93885.177336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDK1-0003WL-UA; Fri, 05 Mar 2021 16:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93885.177336; Fri, 05 Mar 2021 16:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDK1-0003WE-R4; Fri, 05 Mar 2021 16:29:01 +0000
Received: by outflank-mailman (input) for mailman id 93885;
 Fri, 05 Mar 2021 16:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lIDJz-0003W9-SY
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:28:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdba039f-2591-41cb-b087-f5625414504c;
 Fri, 05 Mar 2021 16:28:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43FDAACBF;
 Fri,  5 Mar 2021 16:28:58 +0000 (UTC)
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
X-Inumbo-ID: fdba039f-2591-41cb-b087-f5625414504c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614961738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/dFvgRp6OwKzIedO5BBFy/xt22+KtFLnejFnN6oawMY=;
	b=rokApWnhAxI+Pvw36mHyKEuyFmJDq2kA9/J7CFbNQyDEIyB4ivPLQ2dGVpC0h58sqkW4oz
	L1LhxxiHXKBnn8rJyzIDvQuKQVpcfbU8qwPtF4cA5U+2+T7uZyaFs/xhY/Vx5GHP2sQrGI
	TylL4WLRu1gUGrVtw+VbI4HKOkAmqaE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15?] libxl/ACPI: add missing build dependency
Message-ID: <dcba50ca-59da-b7e8-f60a-7efd8ecd052e@suse.com>
Date: Fri, 5 Mar 2021 17:28:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Just like all other object files - wherever *.o is mentioned, *.opic
also needs mentioning to yield consistent behavior. Otherwise make may
decide to (re)build the object before recursion into $(ACPI_PATH)/ (to
update $(DSDT_FILES-y) and ssdt_*.h) was actually finished.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
A related but separate issue is that build.o* get rebuilt even if none
of their file dependencies changed, merely - aiui - because of their
dependency on the phony "acpi" target. It may be possible to limit this
rebuilding by making both depend on $(DSDT_FILES-y) instead, but then
they would still get rebuilt for no reason when that file (if any)
changed (but ssdt_*.h didn't).

--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -32,7 +32,7 @@ ACPI_PATH  = $(XEN_ROOT)/tools/libacpi
 DSDT_FILES-$(CONFIG_X86) = dsdt_pvh.c
 ACPI_OBJS  = $(patsubst %.c,%.o,$(DSDT_FILES-y)) build.o static_tables.o
 ACPI_PIC_OBJS = $(patsubst %.o,%.opic,$(ACPI_OBJS))
-$(DSDT_FILES-y) build.o: acpi
+$(DSDT_FILES-y) build.o build.opic: acpi
 vpath build.c $(ACPI_PATH)/
 vpath static_tables.c $(ACPI_PATH)/
 

