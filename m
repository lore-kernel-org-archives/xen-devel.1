Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D579F419B6
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 13:32:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282456.1565053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0M4-0000yz-MS; Wed, 15 Apr 2026 13:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282456.1565053; Wed, 15 Apr 2026 13:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0M4-0000xS-Ix; Wed, 15 Apr 2026 13:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1282456;
 Wed, 15 Apr 2026 13:32:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df936d.v1-0c12d93e9f5c4829941f2040aaaea336@bounce.vates.tech>)
 id 1wD0M3-0000rk-IL
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:32:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0M2-006OmM-UK
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:32:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df936d.v1-0c12d93e9f5c4829941f2040aaaea336@bounce.vates.tech>)
 id 69df936d-e002-0a2a0a5209dd-0a2a4508b786-8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:30 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df936d.v1-0c12d93e9f5c4829941f2040aaaea336@bounce.vates.tech>)
 id 69df936d-fab6-0a2a45080019-c602bb0e6efc-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:30 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fwhs93YTkz8XSS6N
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0c12d93e9f5c4829941f2040aaaea336; Wed, 15 Apr 2026 13:32:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259949; x=1776529949;
	bh=PxrQtMDpZ4zK9NM/vPWDKrs+JHdyCRhp9oAg6MOgvbY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oVZdRPBp1MTtk98qliB0H0nRsGwTVPFph7/ZjEQ8768eeQDmTSSpYfKFvHrtQcaUa
	 4uOZj7xW/xq1MqSXcerjQg9gsiAyW5mbPTHDDDkqe0ZC5qpxdPhpmKOvXMNZH5VGgG
	 dES0Sf3STEa6vMnvcvmd5tEEfnyyYj0MuUlfyobpEtOjYTqL7HvjqFdlF6zLoqjg7w
	 EMkQKCfjBbh5zlfQ+GXRnfau5rMnHMuoqXQgvdf/siTEMysaQKYFBiGZ6heUKM9hFz
	 ig2rE/idtKk1q03yMD56Jr0cWowqNZ9kHIm/zBJztOp2/lkR8MBeW/a1hx8AN+sO9T
	 U1/24lnP1qJVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259949; x=1776520449; i=teddy.astie@vates.tech;
	bh=PxrQtMDpZ4zK9NM/vPWDKrs+JHdyCRhp9oAg6MOgvbY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mmEcEjbID8EA1NDPxstRncJDX6FMeMCENCqKnJYaTtJyyqoR/i32ckL1o+Xfor5pH
	 leYnLEKkPK5G4ORftlm/I0yqLKjBDA0F7zGbCS61tx3D+/MkbztTWv1LqBExPOjKSl
	 lSsOHKPmg5Le9lO+ZNuDc+G0Wj8a3AmexFd7zRjQ3dO9YyA4gMk0F4t99Ljqd2azIu
	 ZsUIqy4YN3hyUjL3+CvnNxceBhVtEzmKhJWAem6/oGC2eDv1U+2q35KogEVwEkT7dE
	 zF3lFgkPZx6p70oqGz92bRn7VEAJ/Ca7L6dKnypK97VBTidmFMxc5/6JpVwyzc9jHx
	 VMnp0wnAp0vww==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=207/7]=20hvm:=20Allow=20specifying=20a=20prefered=20asid=20minimum?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259947257
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <1603515ebdf6f7b26d5503c99ab5e5e2ac8fe278.1776259595.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0c12d93e9f5c4829941f2040aaaea336?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776259950-75358497-AD69C7F1/0/0
X-purgate-type: clean
X-purgate-size: 1837

To avoid clobbering all ASIDs that are below SEV-enabled guest maximum,
we want to allocate if possible all ASID over a "prefered minimum"
and fallback to below otherwise.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/asid.c             | 8 ++++++++
 xen/arch/x86/include/asm/hvm/asid.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 1a21125161..4ad3200c96 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -22,6 +22,9 @@ boolean_param("asid", opt_asid_enabled);
 bool __read_mostly asid_enabled = false;
 static unsigned long __ro_after_init *asid_bitmap;
 static unsigned long __ro_after_init asid_count;
+
+/* Default minimum ASID to use */
+unsigned long __read_mostly asid_default_min = 0;
 static DEFINE_SPINLOCK(asid_lock);
 
 /*
@@ -67,6 +70,11 @@ int hvm_asid_alloc(struct hvm_asid *asid)
         return 0;
     }
 
+    /* Try to allocate above default minimum */
+    if ( asid_default_min &&
+         !hvm_asid_alloc_range(asid, asid_default_min, asid_count) )
+        return 0;
+
     spin_lock(&asid_lock);
     new_asid = find_first_zero_bit(asid_bitmap, asid_count);
     if ( new_asid > asid_count )
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 13ea357f70..e989ebbe8c 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -16,6 +16,7 @@ struct hvm_asid {
 };
 
 extern bool asid_enabled;
+extern unsigned long asid_default_min;
 
 /* Initialise ASID management distributed across all CPUs. */
 int hvm_asid_init(unsigned long nasids);
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


