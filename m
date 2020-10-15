Return-Path: <SRS0=IsAa=DW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60253C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 08:42:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C77206C1
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 08:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="TbmAtZm1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C77206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7152.18755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyqF-0003lp-Ed; Thu, 15 Oct 2020 08:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7152.18755; Thu, 15 Oct 2020 08:42:31 +0000
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
	id 1kSyqF-0003li-AG; Thu, 15 Oct 2020 08:42:31 +0000
Received: by outflank-mailman (input) for mailman id 7152;
 Thu, 15 Oct 2020 08:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSyqD-0003la-Sa
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:42:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c34ec67-a9ae-44f0-828d-68c1cc858919;
 Thu, 15 Oct 2020 08:42:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E200ADA8;
 Thu, 15 Oct 2020 08:42:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSyqD-0003la-Sa
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:42:29 +0000
X-Inumbo-ID: 2c34ec67-a9ae-44f0-828d-68c1cc858919
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2c34ec67-a9ae-44f0-828d-68c1cc858919;
	Thu, 15 Oct 2020 08:42:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602751348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/afXgJ3BafDVXWwzXn01PQSSXilZ5CGddn4pqdyalw=;
	b=TbmAtZm1CKi9kz+eabFy74ONXhZdEYYlaGMLV+rfWAGjnAmU6yfdFoXfSmbAubl//NYcEX
	47J/NXcBXWUlOxlo3R41jALDRym6F15x1/NlFRHvmOvNwtLreZGjjZVJ0bWuv/nc955ETm
	/1uTQ6a30+JiFO6T1seADxCnojkW9nU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3E200ADA8;
	Thu, 15 Oct 2020 08:42:28 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/gdbsx: drop stray recursion into tools/include/
Message-ID: <ece6c5c2-43f8-36d2-370c-37d988baeb87@suse.com>
Date: Thu, 15 Oct 2020 10:42:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Doing so isn't appropriate here - this gets done very early in the build
process. If the directory is mean to to be buildable on its own,
different arrangements would be needed.

The issue has become more pronounced by 47654a0d7320 ("tools/include:
fix (drop) dependencies of when to populate xen/"), but was there before
afaict.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/debugger/gdbsx/xg/Makefile
+++ b/tools/debugger/gdbsx/xg/Makefile
@@ -12,7 +12,7 @@ CFLAGS += $(CFLAGS_xeninclude)
 all: build
 
 .PHONY: build
-build: xen-headers xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
+build: xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
 # build: mk-symlinks xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
 # build: mk-symlinks xg_all.a
 
@@ -21,9 +21,6 @@ xg_all.a: $(XG_OBJS) Makefile $(XG_HDRS)
 #	$(LD) -b elf32-i386 $(LDFLAGS) -r -o $@ $^
 #	$(CC) -m32 -c -o $@ $^
 
-xen-headers:
-	$(MAKE) -C ../../../include
-
 # xg_main.o: xg_main.c Makefile $(XG_HDRS)
 #$(CC) -c $(CFLAGS) -o $@ $<
 

