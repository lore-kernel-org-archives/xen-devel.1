Return-Path: <SRS0=mA2z=H4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F64C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 15:08:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD9F64EC0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 15:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD9F64EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.90391.171076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFejN-0006e3-0Z; Fri, 26 Feb 2021 15:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90391.171076; Fri, 26 Feb 2021 15:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFejM-0006dw-Sj; Fri, 26 Feb 2021 15:08:36 +0000
Received: by outflank-mailman (input) for mailman id 90391;
 Fri, 26 Feb 2021 15:08:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFejL-0006dr-1U
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:08:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 614ce6ce-a827-43ea-8fa2-428a65765be7;
 Fri, 26 Feb 2021 15:08:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FBA1AD57;
 Fri, 26 Feb 2021 15:08:33 +0000 (UTC)
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
X-Inumbo-ID: 614ce6ce-a827-43ea-8fa2-428a65765be7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614352113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x+UT5oe5lNbLyAE6e6Zv15GL0RHN4l6DYQIIJarNa28=;
	b=ur3kDYEO4Mcs2GQ3c0qc6I0sN+JXwDs4JuxNqlYDYNAeemMyuy8OX4O2923Wd2JgZ4vbQG
	u4gOL6bLTaxmDIVDeRGzf/7cb0ctbKF9DVX0FAxR7MFyinxXCdam5TZIUCMnoXyea5Fsxh
	5d23kLaIyf4itAGpC96/jId4PbgcJow=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15] x86/shadow: replace bogus return path in
 shadow_get_page_from_l1e()
Message-ID: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
Date: Fri, 26 Feb 2021 16:08:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Prior to be640b1800bb ("x86: make get_page_from_l1e() return a proper
error code") a positive return value did indicate an error. Said commit
failed to adjust this return path, but luckily the only caller has
always been inside a shadow_mode_refcounts() conditional.

Subsequent changes caused 1 to end up at the default (error) label in
the caller's switch() again, but the returning of 1 (== _PAGE_PRESENT)
is still rather confusing here, and a latent risk.

Convert to an ASSERT() instead, just in case any new caller would
appear.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -802,9 +802,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
     struct domain *owner;
 
     ASSERT(!sh_l1e_is_magic(sl1e));
-
-    if ( !shadow_mode_refcounts(d) )
-        return 1;
+    ASSERT(shadow_mode_refcounts(d));
 
     res = get_page_from_l1e(sl1e, d, d);
 

