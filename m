Return-Path: <SRS0=Dhlx=NZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_03_06,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC4AC433F5
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 15:08:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B2C610A1
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 15:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7B2C610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.178164.324082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnf-0001eX-N7; Fri, 03 Sep 2021 15:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178164.324082; Fri, 03 Sep 2021 15:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnf-0001eK-JL; Fri, 03 Sep 2021 15:08:15 +0000
Received: by outflank-mailman (input) for mailman id 178164;
 Fri, 03 Sep 2021 15:08:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAne-0000pX-09
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:08:14 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d872ea58-6b0c-4a80-96e7-c4bd4ba6c50b;
 Fri, 03 Sep 2021 15:08:08 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681606215260.8066699495482;
 Fri, 3 Sep 2021 08:06:46 -0700 (PDT)
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
X-Inumbo-ID: d872ea58-6b0c-4a80-96e7-c4bd4ba6c50b
ARC-Seal: i=1; a=rsa-sha256; t=1630681610; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lAaLajPmJgFfFXG9/fAvb2ro5HO85Q3nsofHT2js9kIjJLUIcmAEwVnVRByD18B9BbfWzRwjXmHiRQ1NkHqkCAR6baJbqVuXyFDQKewron6VMgyp1EwK0vRuauCP8k7v0/w3eJpo6xNKA1Yg6FnkV3iStlXyd6g2aenWpPZrl4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681610; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=OgL0twSQXxCO75U01QAyE+snmmbBrwyx4tBfZzhsUPE=; 
	b=jriZcMk0QAlQDwqd9hUmAFmBdN4GJoYRaEmd+YHpKX0SL+UPXmbNtZcqoMhQSCtEyt1kPYe0QYzzE9pdr7wGpidWVQ7jEM4kx+MPlTs4NJxhi84N7kK6LaUKJviuftYYlGwX8nBEU1JwBLrLCELr/mp/Ju0n3Ae8nXv46//zZ5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681610;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OgL0twSQXxCO75U01QAyE+snmmbBrwyx4tBfZzhsUPE=;
	b=lApT1YGLT1E23o2KEJ6XDdo9IKv1h1NXRUckpo4eBRBVW4gSMl9PBq8GGeC791od
	A3VugirBc8gh4HsVUaozTDgdsQtcEV7hVDMzE4XkxvlSmbQG/607flA0hM1f6Mc/Spq
	3vljexfm5F+I1+JGiPfg0RrmordO6hguPURTRL/Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 08/11] xsm: drop generic event channel labeling exclusion
Date: Fri,  3 Sep 2021 15:06:26 -0400
Message-Id: <20210903190629.11917-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The internal define flag is not used by any XSM module, removing the #ifdef
leaving the generic event channel labeling as always present.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/sched.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404..e56690cd2b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -122,13 +122,11 @@ struct evtchn
 
 #ifdef CONFIG_XSM
     union {
-#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
         /*
          * If an XSM module needs more space for its event channel context,
          * this pointer stores the necessary data for the security server.
          */
         void *generic;
-#endif
 #ifdef CONFIG_XSM_FLASK
         /*
          * Inlining the contents of the structure for FLASK avoids unneeded
-- 
2.20.1


