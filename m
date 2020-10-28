Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853EAC388F7
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 15:43:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2354247CF
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 15:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="lTJoXbgM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2354247CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13714.34449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnb7-0007QT-Ti; Wed, 28 Oct 2020 15:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13714.34449; Wed, 28 Oct 2020 15:42:49 +0000
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
	id 1kXnb7-0007QM-Pk; Wed, 28 Oct 2020 15:42:49 +0000
Received: by outflank-mailman (input) for mailman id 13714;
 Wed, 28 Oct 2020 15:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXnb5-0007QH-VL
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddcbab9d-85b1-4c18-8a39-29bf2a172c4c;
 Wed, 28 Oct 2020 15:42:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4136FADCC;
 Wed, 28 Oct 2020 15:42:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXnb5-0007QH-VL
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:42:47 +0000
X-Inumbo-ID: ddcbab9d-85b1-4c18-8a39-29bf2a172c4c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ddcbab9d-85b1-4c18-8a39-29bf2a172c4c;
	Wed, 28 Oct 2020 15:42:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603899766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m+osU/Ke31c9xIOQYci1sX4iSdMIFcxvQe6MCm+EGgI=;
	b=lTJoXbgMtrDo87BTgiuq8CwRqC9wH+HjpjWWGtoLD9mRVbfbOYF/vWX2eTGm13ZcQI1xqr
	9kdggn7thjRK+E06fu4wUpIQStRyieIpxMG25Aczr0JHXS8kifSPGuZ0DmNfiKmYowVb2b
	7NeDg6zmPELCC9/4y1V0iWnnDiMM5zk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4136FADCC;
	Wed, 28 Oct 2020 15:42:46 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: correct GFN use by sh_unshadow_for_p2m_change()
Message-ID: <888b8f2b-4368-6179-25c5-dc3eb6acbf3d@suse.com>
Date: Wed, 28 Oct 2020 16:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Luckily sh_remove_all_mappings()'s use of the parameter is limited to
generation of log messages. Nevertheless we'd better pass correct GFNs
around:
- the incoming GFN, when replacing a large page, may not be large page
  aligned,
- incrementing by page-size-scaled values can't be right.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3115,6 +3115,8 @@ static void sh_unshadow_for_p2m_change(s
                  && mfn_valid(nmfn) )
                 npte = map_domain_page(nmfn);
 
+            gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
+
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
                 if ( !npte
@@ -3123,8 +3125,7 @@ static void sh_unshadow_for_p2m_change(s
                 {
                     /* This GFN->MFN mapping has gone away */
                     sh_remove_all_shadows_and_parents(d, omfn);
-                    if ( sh_remove_all_mappings(d, omfn,
-                                                _gfn(gfn + (i << PAGE_SHIFT))) )
+                    if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
                         cpumask_or(&flushmask, &flushmask, d->dirty_cpumask);
                 }
                 omfn = mfn_add(omfn, 1);

