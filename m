Return-Path: <SRS0=Pc9a=EP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FD7C2D0A3
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 10:54:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CAB20679
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 10:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="U8/5xU2N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0CAB20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.22365.48655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4oM-00017q-Mu; Mon, 09 Nov 2020 10:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22365.48655; Mon, 09 Nov 2020 10:54:10 +0000
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
	id 1kc4oM-00017j-Iz; Mon, 09 Nov 2020 10:54:10 +0000
Received: by outflank-mailman (input) for mailman id 22365;
 Mon, 09 Nov 2020 10:54:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kc4oL-00017c-5L
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b0b5df8-e315-4844-aceb-5b5334fa445d;
 Mon, 09 Nov 2020 10:54:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BF44AD77;
 Mon,  9 Nov 2020 10:54:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kc4oL-00017c-5L
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:09 +0000
X-Inumbo-ID: 6b0b5df8-e315-4844-aceb-5b5334fa445d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6b0b5df8-e315-4844-aceb-5b5334fa445d;
	Mon, 09 Nov 2020 10:54:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604919246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J+KNAgfWHHkbYSPigebmygyg//op4KQC2wP1eeaKmCo=;
	b=U8/5xU2Ne6GXgfhWbNxl2mAHoynn+iHR0mSLFBKZE/9aFDaKiutvu8L/0oe6NaRi12wx9Z
	YdRh+FoA2cT5gLOU32X+QRksStUJYGYsZYetyxfhPNWRXqCcJcMt92rRjZbKrjQDQ81gIJ
	m0DN05hybDtwWuD3HdeCUHEeM8AP8Cs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9BF44AD77;
	Mon,  9 Nov 2020 10:54:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
Message-ID: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
Date: Mon, 9 Nov 2020 11:54:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Now that the IOMMU for guests can't be enabled "on demand" anymore,
there's also no reason to expose the related CPUID bit "just in case".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1050,7 +1050,8 @@ void cpuid_hypervisor_leaves(const struc
          * Indicate that memory mapped from other domains (either grants or
          * foreign pages) has valid IOMMU entries.
          */
-        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+        if ( is_iommu_enabled(d) )
+            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
 
         /* Indicate presence of vcpu id and set it in ebx */
         res->a |= XEN_HVM_CPUID_VCPU_ID_PRESENT;

