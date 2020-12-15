Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B922CC2BB48
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:28:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58835207E8
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58835207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54471.94644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDBd-0003xc-Dh; Tue, 15 Dec 2020 16:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54471.94644; Tue, 15 Dec 2020 16:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDBd-0003xU-9W; Tue, 15 Dec 2020 16:28:29 +0000
Received: by outflank-mailman (input) for mailman id 54471;
 Tue, 15 Dec 2020 16:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpDBc-0003xO-K4
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:28:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29e18333-382a-4328-8c7f-5abed8e08e0d;
 Tue, 15 Dec 2020 16:28:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFDB1AF9E;
 Tue, 15 Dec 2020 16:28:26 +0000 (UTC)
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
X-Inumbo-ID: 29e18333-382a-4328-8c7f-5abed8e08e0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGh7mL6+YZBcigbYlw7lNc5SDhGzwaIzC2wWxunuha4=;
	b=VAs/I3NVev7ZzZ2PCs2afHBrzjHapEshm7HVklz+VUTRwfd+/MqhMsVD8tn+3cuMc2Thxs
	Su/wW43MMwU9Yc1NazikmJDJPMO0trDFNKe5cisVcxF+ngAwPHo635mLyBe0AVxcRMvRJ8
	0Bm3oL14kFvYHajtVB2oyxYiBaHB9os=
Subject: [PATCH 6/6] x86/p2m: set_shared_p2m_entry() is MEM_SHARING-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Message-ID: <a9c24d20-0feb-42c8-ae2c-5cfd564157ee@suse.com>
Date: Tue, 15 Dec 2020 17:28:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1476,6 +1476,8 @@ int clear_identity_p2m_entry(struct doma
     return ret;
 }
 
+#ifdef CONFIG_MEM_SHARING
+
 /* Returns: 0 for success, -errno for failure */
 int set_shared_p2m_entry(struct domain *d, unsigned long gfn_l, mfn_t mfn)
 {
@@ -1514,7 +1516,10 @@ int set_shared_p2m_entry(struct domain *
     return rc;
 }
 
+#endif /* CONFIG_MEM_SHARING */
+
 #ifdef CONFIG_HVM
+
 static struct p2m_domain *
 p2m_getlru_nestedp2m(struct domain *d, struct p2m_domain *p2m)
 {


