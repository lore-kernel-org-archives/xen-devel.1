Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA0CC4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:13:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404DB2065C
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404DB2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54408.94505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCxP-0001gd-52; Tue, 15 Dec 2020 16:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54408.94505; Tue, 15 Dec 2020 16:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCxP-0001gW-20; Tue, 15 Dec 2020 16:13:47 +0000
Received: by outflank-mailman (input) for mailman id 54408;
 Tue, 15 Dec 2020 16:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpCxN-0001gM-MU
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:13:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b89ad5-9c23-443d-a2fd-7608b9909f61;
 Tue, 15 Dec 2020 16:13:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D39CACE0;
 Tue, 15 Dec 2020 16:13:44 +0000 (UTC)
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
X-Inumbo-ID: d0b89ad5-9c23-443d-a2fd-7608b9909f61
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608048824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjhJIfeNseaLG2JlvheRvbbm4A5PwnvWoBdioI/zkZw=;
	b=k9WPy3H5athXiIOEqdNn1bIlhrHmdgHt6i7PFpcmc3iOIxo8ryVEOQIvvH36g3+0zWfgPe
	xEx9xGiTucisRRG2ojiFLiqILkvVqweXoShO5ublbxdG/KFfbUZBNMvMmGpeNwoZgz0K3M
	UH8IHYUHD8OSyoIOrWUtbMrYNyEUIvw=
Subject: [PATCH v2 4/4] livepatch: adjust a stale comment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Message-ID: <659b188d-d26e-3351-2285-3e75197e2c5f@suse.com>
Date: Tue, 15 Dec 2020 17:13:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As of 005de45c887e ("xen: do live patching only from main idle loop")
the comment ahead of livepatch_do_action() has been stale.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1392,8 +1392,8 @@ static inline bool was_action_consistent
 }
 
 /*
- * This function is executed having all other CPUs with no deep stack (we may
- * have cpu_idle on it) and IRQs disabled.
+ * This function is executed having all other CPUs with no deep stack (when
+ * idle) and IRQs disabled.
  */
 static void livepatch_do_action(void)
 {


