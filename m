Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3943FC4363A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 13:51:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD8F2223C
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 13:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="aL4nBGm6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD8F2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9634.25285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUs2u-0007O8-44; Tue, 20 Oct 2020 13:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9634.25285; Tue, 20 Oct 2020 13:51:24 +0000
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
	id 1kUs2t-0007O1-WA; Tue, 20 Oct 2020 13:51:23 +0000
Received: by outflank-mailman (input) for mailman id 9634;
 Tue, 20 Oct 2020 13:51:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUs2r-0007Nw-UL
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:51:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6823dc1-6fd6-42a7-a395-0e39f7d329d5;
 Tue, 20 Oct 2020 13:51:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1755EAD12;
 Tue, 20 Oct 2020 13:51:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUs2r-0007Nw-UL
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:51:21 +0000
X-Inumbo-ID: d6823dc1-6fd6-42a7-a395-0e39f7d329d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d6823dc1-6fd6-42a7-a395-0e39f7d329d5;
	Tue, 20 Oct 2020 13:51:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603201879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pJbgg5ny64DMvi9s/cG7CeqWeW1h4zTksNkoqgt5ArI=;
	b=aL4nBGm6EmXyyxFWz6YAYvoCmjsCmS3KcLf5NB3P184WiKfLxDBrkUNc5Or+ZI77EIOgVg
	YAediLBuSpKrLQNs3MPZ7O14lSeoK9kYAqhtZaRwn3xHIa58SXAhug9wyQ6oMPZpJAqmZ2
	XwHlOrxnEfLb1qQlo7vrLhvcVK5de2c=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1755EAD12;
	Tue, 20 Oct 2020 13:51:19 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: avoid playing with directmap when self-snoop can be
 relied upon
Message-ID: <33f7168c-b177-eed5-14e8-5e7a38dee853@suse.com>
Date: Tue, 20 Oct 2020 15:51:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The set of systems affected by XSA-345 would have been smaller is we had
this in place already: When the processor is capable of dealing with
mismatched cacheability, there's no extra work we need to carry out.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -795,6 +795,9 @@ static int update_xen_mappings(unsigned
     unsigned long xen_va =
         XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
 
+    if ( boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) )
+        return 0;
+
     if ( unlikely(alias) && cacheattr )
         err = map_pages_to_xen(xen_va, _mfn(mfn), 1, 0);
     if ( !err )
@@ -802,6 +805,7 @@ static int update_xen_mappings(unsigned
                      PAGE_HYPERVISOR | cacheattr_to_pte_flags(cacheattr));
     if ( unlikely(alias) && !cacheattr && !err )
         err = map_pages_to_xen(xen_va, _mfn(mfn), 1, PAGE_HYPERVISOR);
+
     return err;
 }
 

