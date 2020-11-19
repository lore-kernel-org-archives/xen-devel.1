Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E82C6369E
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 15:58:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F672083B
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 15:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hcz8iPQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F672083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31027.61239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmJm-0005Pw-6y; Thu, 19 Nov 2020 15:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31027.61239; Thu, 19 Nov 2020 15:57:54 +0000
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
	id 1kfmJm-0005Pn-2N; Thu, 19 Nov 2020 15:57:54 +0000
Received: by outflank-mailman (input) for mailman id 31027;
 Thu, 19 Nov 2020 15:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfmJk-0005PP-T5
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:57:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9d09f8e-56a3-4b2e-ad32-3239d9e8e902;
 Thu, 19 Nov 2020 15:57:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EA8EAC2F;
 Thu, 19 Nov 2020 15:57:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfmJk-0005PP-T5
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:57:52 +0000
X-Inumbo-ID: d9d09f8e-56a3-4b2e-ad32-3239d9e8e902
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d9d09f8e-56a3-4b2e-ad32-3239d9e8e902;
	Thu, 19 Nov 2020 15:57:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605801471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PhGDpB0MqrnKBH+bcl0t0R5vWKSRquPeRxsvi08pE9U=;
	b=hcz8iPQzdswUwBLQQY9fWG4FEVKy4XFCKQY0Suf8WCg+XUJTZgbL3IVH2b269Pay47R4y3
	Ieobun5eDPjVBuKzYugdgZ8rqOdqU8vg5GJ3EGFwgePr8zBVZz4UVPfb07FZyce/YfETV1
	K3tzottQGWXKssItzp4kY+Qh27hzyHs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8EA8EAC2F;
	Thu, 19 Nov 2020 15:57:51 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: avoid UB with NMI watchdog on family 15 CPUs
Message-ID: <63500eb6-b1da-ce08-52e2-00b30ffe2c26@suse.com>
Date: Thu, 19 Nov 2020 16:57:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Found by looking for patterns similar to the one Julien did spot in
pci_vtd_quirks().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -132,7 +132,7 @@ int nmi_active;
 #define P4_ESCR_EVENT_SELECT(N)	((N)<<25)
 #define P4_CCCR_OVF_PMI0	(1<<26)
 #define P4_CCCR_OVF_PMI1	(1<<27)
-#define P4_CCCR_OVF		(1<<31)
+#define P4_CCCR_OVF		(1u << 31)
 #define P4_CCCR_THRESHOLD(N)	((N)<<20)
 #define P4_CCCR_COMPLEMENT	(1<<19)
 #define P4_CCCR_COMPARE		(1<<18)

