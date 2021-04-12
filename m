Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60282C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 11:34:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1964B61244
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1964B61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.109007.208047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVupE-00059z-OJ; Mon, 12 Apr 2021 11:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109007.208047; Mon, 12 Apr 2021 11:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVupE-00059s-KS; Mon, 12 Apr 2021 11:33:52 +0000
Received: by outflank-mailman (input) for mailman id 109007;
 Mon, 12 Apr 2021 11:33:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVupD-00059n-Jv
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:33:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 932780d3-1912-464c-b74e-690e0ada95cb;
 Mon, 12 Apr 2021 11:33:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F23A0B2EE;
 Mon, 12 Apr 2021 11:33:49 +0000 (UTC)
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
X-Inumbo-ID: 932780d3-1912-464c-b74e-690e0ada95cb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618227230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sQ4lVi2o4tchc7YFjCdNdXGvwL77JuReQE511bjCYZY=;
	b=obepuhsUzBTeARZ39AYZAT6nTmNuA4wXsvGB6Wn3pWlBEjHdggUHbnlMcgbeOLNtFjBYZA
	waxTI219U1b/W/vg6WPwAdBJ2SxiWAOU8vHTrzCG510D2WKqqwjs7cyF5xG5BGzaZb/F49
	5rFuB+v22Pjrbhi2tIAUXm5hpfN5gUE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EPT: minor local variable adjustment in ept_set_entry()
Message-ID: <c682ec9a-c339-a929-1c91-c20bf53d9722@suse.com>
Date: Mon, 12 Apr 2021 13:33:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Not having direct_mmio (used only once anyway) as a local variable gets
the epte_get_entry_emt() invocation here in better sync with the other
ones. While at it also reduce ipat's scope.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -677,8 +677,6 @@ ept_set_entry(struct p2m_domain *p2m, gf
     unsigned long fn_mask = !mfn_eq(mfn, INVALID_MFN) ? (gfn | mfn_x(mfn)) : gfn;
     int ret, rc = 0;
     bool_t entry_written = 0;
-    bool_t direct_mmio = (p2mt == p2m_mmio_direct);
-    uint8_t ipat = 0;
     bool_t need_modify_vtd_table = 1;
     bool_t vtd_pte_present = 0;
     unsigned int iommu_flags = p2m_get_iommu_flags(p2mt, mfn);
@@ -790,8 +788,10 @@ ept_set_entry(struct p2m_domain *p2m, gf
 
     if ( mfn_valid(mfn) || p2m_allows_invalid_mfn(p2mt) )
     {
+        uint8_t ipat = 0;
         int emt = epte_get_entry_emt(p2m->domain, gfn, mfn,
-                                     i * EPT_TABLE_ORDER, &ipat, direct_mmio);
+                                     i * EPT_TABLE_ORDER, &ipat,
+                                     p2mt == p2m_mmio_direct);
 
         if ( emt >= 0 )
             new_entry.emt = emt;

