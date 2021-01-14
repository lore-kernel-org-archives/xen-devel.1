Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59A6C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:25:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C1723A5F
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C1723A5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67172.119648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04UV-0000tT-8S; Thu, 14 Jan 2021 15:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67172.119648; Thu, 14 Jan 2021 15:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04UV-0000tM-55; Thu, 14 Jan 2021 15:24:51 +0000
Received: by outflank-mailman (input) for mailman id 67172;
 Thu, 14 Jan 2021 15:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04UU-0000tF-7e
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:24:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d64bccf-4697-40f1-9fa5-5421dfe3067e;
 Thu, 14 Jan 2021 15:24:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97472AC24;
 Thu, 14 Jan 2021 15:24:48 +0000 (UTC)
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
X-Inumbo-ID: 5d64bccf-4697-40f1-9fa5-5421dfe3067e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lts7CySriGzaIuo7oOl66Ck1Wo/oUcoNPO4mvay9Lyw=;
	b=NNussvVFVdHlAXlPtDqBwoNkz9+vF54NGR+LsLyjT4yzFQrKJ+fZd+7mVpQqVbDomXV0ZJ
	wDkt+TVMkVT432HE+0Oyov/bXBihGPFENGmpMqNFNvGqzeVbLrd3XPuWo1GLOM8rNKygzk
	6K0pHPpKKXZ+9jiVyvahZnQslRRN1a4=
Subject: [PATCH 3/3] Arm: don't hard-code grant table limits in create_domUs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
Message-ID: <90ddf638-500f-0697-dcf7-6e8026af6e02@suse.com>
Date: Thu, 14 Jan 2021 16:24:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I can only assume that f2ae59bc4b9b ("Rationalize max_grant_frames and
max_maptrack_frames handling") unintentionally left Arm's create_domUs()
set limits to explicit values, as at least some of the same constraints
apply here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2480,8 +2480,8 @@ void __init create_domUs(void)
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
             .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
             .max_evtchn_port = -1,
-            .max_grant_frames = 64,
-            .max_maptrack_frames = 1024,
+            .max_grant_frames = -1,
+            .max_maptrack_frames = -1,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )

