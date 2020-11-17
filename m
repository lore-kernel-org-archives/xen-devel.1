Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29968C2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 09:43:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F0B2465B
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 09:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dzLzw5cd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F0B2465B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.28834.57962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexVh-0005Tk-Km; Tue, 17 Nov 2020 09:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28834.57962; Tue, 17 Nov 2020 09:42:49 +0000
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
	id 1kexVh-0005Td-Go; Tue, 17 Nov 2020 09:42:49 +0000
Received: by outflank-mailman (input) for mailman id 28834;
 Tue, 17 Nov 2020 09:42:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kexVg-0005TV-7L
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:42:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1d86cb7-9a1f-4d8b-883b-96994cb29806;
 Tue, 17 Nov 2020 09:42:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CFE6AD07;
 Tue, 17 Nov 2020 09:42:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kexVg-0005TV-7L
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:42:48 +0000
X-Inumbo-ID: b1d86cb7-9a1f-4d8b-883b-96994cb29806
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b1d86cb7-9a1f-4d8b-883b-96994cb29806;
	Tue, 17 Nov 2020 09:42:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605606165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jQxi+KVV7edey7RTByntwQOR6fraNIOxshEf9K269PM=;
	b=dzLzw5cdhAJAJ87E2/J9YR2KRjiuHLQ9/gZYtMAar5pguhR2GndXSgWGQ0oJaFLzzjS7xI
	2s3OhAWe5IMBBmuVuQMJ7qdoZi0cIacAUSOHVg35h2ks33otUVzRV8jBfrG5IgHgpoJXWn
	Aboe60/H33MY1GPdW16jWKWfYkwcM5o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5CFE6AD07;
	Tue, 17 Nov 2020 09:42:45 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Olaf Hering <olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxenstat: avoid build race
Message-ID: <273da46e-2a56-f53c-f137-f6fc411ad8db@suse.com>
Date: Tue, 17 Nov 2020 10:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Olaf reported observing

xenstat_qmp.c:26:10: fatal error: _paths.h: No such file or directory
.../tools/libs/stat/../../../tools/Rules.mk:153: xenstat_qmp.opic] Error 1

Obviously _paths.h, when included by any of the sources, needs to be
created in advance of compiling any of them, not just the non-PIC ones.

Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
A similar issue (at the time of the report) in the building of
libxenstore was addressed by Jürgen's 9af5e2b31b4e ("tools/libs/store:
don't use symbolic links for external files").

--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -30,7 +30,7 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(LIB_OBJS): _paths.h
+$(LIB_OBJS) $(PIC_OBJS): _paths.h
 
 PYLIB=bindings/swig/python/_xenstat.so
 PYMOD=bindings/swig/python/xenstat.py

