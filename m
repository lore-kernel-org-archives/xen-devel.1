Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C7EC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 14:42:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1628221F8
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 14:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1628221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64918.114815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyOR-0007yo-OR; Mon, 11 Jan 2021 14:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64918.114815; Mon, 11 Jan 2021 14:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyOR-0007yh-LT; Mon, 11 Jan 2021 14:42:03 +0000
Received: by outflank-mailman (input) for mailman id 64918;
 Mon, 11 Jan 2021 14:42:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyyOQ-0007yb-Ig
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:42:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a70bde51-f51b-4938-bdfc-614c83c60314;
 Mon, 11 Jan 2021 14:42:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 856CEAB7A;
 Mon, 11 Jan 2021 14:42:00 +0000 (UTC)
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
X-Inumbo-ID: a70bde51-f51b-4938-bdfc-614c83c60314
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610376120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YxHRjHUHZb14utf88L4bDa88RQFxDB389B01fMfneQc=;
	b=VlLjfx3j6RcGubqPG0Pxx8cU9wi6lyyaPW7b/0ixwQu12dmeqsrlpVKTxxhN5iIad4WANz
	xD3PUHRK2lnqhGlumqGAGI4BljXM4sFz7BNoYHSLcrYIjmOM1RQWa/tUMNcKAqGACD+yNO
	OPo0PAL3LgZV89IKl494SZMnvVUGUyI=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] kconfig: ensure strndup() declaration is visible
Message-ID: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
Date: Mon, 11 Jan 2021 15:42:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Its guard was updated such that it is visible by default when POSIX 2008
was adopted by glibc. It's not visible by default on older glibc.

Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/tools/kconfig/parser.y
+++ b/xen/tools/kconfig/parser.y
@@ -4,6 +4,7 @@
  */
 %{
 
+#define _GNU_SOURCE
 #include <ctype.h>
 #include <stdarg.h>
 #include <stdio.h>

