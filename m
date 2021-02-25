Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47776C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 15:39:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2F7F64F18
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 15:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2F7F64F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89834.169607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIjI-0008Ck-QR; Thu, 25 Feb 2021 15:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89834.169607; Thu, 25 Feb 2021 15:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIjI-0008Cd-NR; Thu, 25 Feb 2021 15:39:04 +0000
Received: by outflank-mailman (input) for mailman id 89834;
 Thu, 25 Feb 2021 15:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFIjH-0008CY-6O
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:39:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 914c8315-89fc-43ad-b121-3e50c5700f24;
 Thu, 25 Feb 2021 15:39:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20A1BB10B;
 Thu, 25 Feb 2021 15:39:01 +0000 (UTC)
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
X-Inumbo-ID: 914c8315-89fc-43ad-b121-3e50c5700f24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614267541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NFd034RDEJYXcq9r3tELC5CypWrYDcd0d0knOZGlyxM=;
	b=XgbQ5MYSf2y5OQAreaPj8wbV/1arB81ci6OiZNQSw0iecmcn9PeJAz3pxsL+lARSo7YFil
	FFLJYih+iUjnSrwCloncsniCXHAee0dIo8SgjzscYwdffwufiCiPBmbI5y8vuQWuYLhWUl
	+WdMBDaNIfKT8sciziRQSdpj+YQekDk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen-netback: use local var in xenvif_tx_check_gop() instead
 of re-calculating
To: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Message-ID: <6604dec2-4460-3339-f797-e5f8a7df848f@suse.com>
Date: Thu, 25 Feb 2021 16:39:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

shinfo already holds the result of skb_shinfo(skb) at this point - no
need to re-invoke the construct even twice.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -557,8 +557,8 @@ check_frags:
 	}
 
 	if (skb_has_frag_list(skb) && !first_shinfo) {
-		first_shinfo = skb_shinfo(skb);
-		shinfo = skb_shinfo(skb_shinfo(skb)->frag_list);
+		first_shinfo = shinfo;
+		shinfo = skb_shinfo(shinfo->frag_list);
 		nr_frags = shinfo->nr_frags;
 
 		goto check_frags;

