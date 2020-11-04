Return-Path: <SRS0=nsPS=EK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F50FC388F9
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 07:57:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C0E22384
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 07:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fLKbCdap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C0E22384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18816.43825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDf4-0006Ni-5j; Wed, 04 Nov 2020 07:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18816.43825; Wed, 04 Nov 2020 07:56:54 +0000
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
	id 1kaDf4-0006Nb-2i; Wed, 04 Nov 2020 07:56:54 +0000
Received: by outflank-mailman (input) for mailman id 18816;
 Wed, 04 Nov 2020 07:56:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaDf2-0006NW-PG
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 07:56:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d472ea04-9487-49d3-8532-0a5c26d382ae;
 Wed, 04 Nov 2020 07:56:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A4E2AC8C;
 Wed,  4 Nov 2020 07:56:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaDf2-0006NW-PG
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 07:56:52 +0000
X-Inumbo-ID: d472ea04-9487-49d3-8532-0a5c26d382ae
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id d472ea04-9487-49d3-8532-0a5c26d382ae;
	Wed, 04 Nov 2020 07:56:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604476611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3gUC3iqXwFKmZS0Iit4je3TNjjqFocBQB9Zcxo+jsaI=;
	b=fLKbCdapDKvrkv6pnuRbpNE5a4mkOG7zywFRokAR74bAIVIXx/tT9gplQrY1lzzgcAkNbb
	RX5xQokRRT0Kq0i4Rg9+bPobPSwCwryrj2tHHOwnmC0GtqakeiTev/XFT96KfPWUb0ea4+
	2X/3TzjlnXQu5SeIQP1cMnGrDtQBCKI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4A4E2AC8C;
	Wed,  4 Nov 2020 07:56:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: make post-migration page state consistent
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
Date: Wed, 4 Nov 2020 08:56:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When a page table page gets de-validated, its type reference count drops
to zero (and PGT_validated gets cleared), but its type remains intact.
XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
such pages. An intermediate write to such a page via e.g.
MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
return. In libxc the decision which pages to normalize / localize
depends solely on the type returned from the domctl. As a result without
further precautions the guest won't be able to tell whether such a page
has had its (apparent) PTE entries transitioned to the new MFNs.

Add a check of PGT_validated, thus consistently avoiding normalization /
localization in the tool stack.

Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
open coding it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Don't change type's type.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -215,7 +215,7 @@ long arch_do_domctl(
 
         for ( i = 0; i < num; ++i )
         {
-            unsigned long gfn = 0, type = 0;
+            unsigned long gfn = 0, type = XEN_DOMCTL_PFINFO_NOTAB;
             struct page_info *page;
             p2m_type_t t;
 
@@ -255,6 +255,8 @@ long arch_do_domctl(
 
                 if ( page->u.inuse.type_info & PGT_pinned )
                     type |= XEN_DOMCTL_PFINFO_LPINTAB;
+                else if ( !(page->u.inuse.type_info & PGT_validated) )
+                    type = XEN_DOMCTL_PFINFO_NOTAB;
 
                 if ( page->count_info & PGC_broken )
                     type = XEN_DOMCTL_PFINFO_BROKEN;

