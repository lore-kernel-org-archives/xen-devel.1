Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D6AF557F8
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 09:38:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1285560.1566566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5Q-0001U4-2X; Mon, 20 Apr 2026 09:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285560.1566566; Mon, 20 Apr 2026 09:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5P-0001TK-Rt; Mon, 20 Apr 2026 09:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1285560;
 Mon, 20 Apr 2026 09:38:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e5f417.v1-2e3c03ff03de4943839f2f7b526ff987@bounce.vates.tech>)
 id 1wEl5O-0001OQ-Dy
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:38:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEl5N-00AEIs-Qt
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:38:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e5f417.v1-2e3c03ff03de4943839f2f7b526ff987@bounce.vates.tech>)
 id 69e5f412-5cb7-0a2a0a5109dd-0a2a450a9e6c-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:33 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e5f417.v1-2e3c03ff03de4943839f2f7b526ff987@bounce.vates.tech>)
 id 69e5f418-56b3-0a2a450a0019-c602890b16cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:33 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fzgQv5M7HzDRSrSC
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:38:31 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 2e3c03ff03de4943839f2f7b526ff987; Mon, 20 Apr 2026 09:38:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="julian.vetter@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776677911; x=1776947911;
	bh=p8k8y/LVlfkSFjIR489TVlpP2VQjBt8UHcDivsfmOkw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=isQPJtNjOMy94YA7LfNFY7LxB6CX445WWOjhrUskqM5oMumyGu+c0kkntG/xeqOIJ
	 hNUH7xPK2UJEjMDstv1LANozaumzRI7ML7OiqN8jzJ39M7tH9sK8146UszwxLVmlCS
	 o6GgyVPD10/hzl0F6QNP9LaZCCHZeIX4Rxazdtl73r83fnAqAPn0Z5DEyD/B6z5OlD
	 LQ5u+9OUmpQ6sXj+A9sVPvYqYqtghkztCrj+yZ9QLfgVMP3u8/tJAIJdaf1n0d0j03
	 zsFZdHcrLTO3s0l5K0SIdZQ2BSifbwFzRLRrsEr58B+VlbZPMy+In2tZJySlUuRKy0
	 WpwE40SUJckEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776677911; x=1776938411; i=julian.vetter@vates.tech;
	bh=p8k8y/LVlfkSFjIR489TVlpP2VQjBt8UHcDivsfmOkw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LSrYyx9lvLEY21z6LWF+iTyIQN0zpSkPpNPVmTxU1nNGiEms/5FndmcrIPjEInsZf
	 y64yshv2KBL3VP7Vx3WI1S+LY/DPxO6aDd82a0IOHMJmpvT1wqaK2vuf3fZ0DfWgLt
	 TgEnR0K2hKHNE5jVooEnj5pf0lpgff9nGiMeE2KeZgmULK0kC/sGLtWmPZ8eq74UPX
	 K2Lq4H2wGpIgTe6/GIf19lJrMZNIB0pMQtfhzJuI0RRwR6rim5C1yTTgGip39EiyEM
	 k2rJzBVzJb034p09dzd0TVYmIC5D5qXZ0ZxoYp8zTaiSB+KF43qOW5nbg6mlPSTZkA
	 85/8OCBHdKTIg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v6=202/3]=20ioreq:=20Indent=20ioreq=5Fserver=5Falloc=5Fmfn()=20body=20one=20level=20deeper?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776677910895
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260420093820.825969-3-julian.vetter@vates.tech>
In-Reply-To: <20260420093820.825969-1-julian.vetter@vates.tech>
References: <20260420093820.825969-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2e3c03ff03de4943839f2f7b526ff987?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 09:38:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776677913-471728B7-98452ACF/0/0
X-purgate-type: clean
X-purgate-size: 1965

No functional change. It adds a wrapping block to prepare for the loop
that the subsequent patch introduces to handle multiple ioreq pages.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v6:
- Dropped the indentation change for ioreq_server_free_mfn, because the
  modifications in the next patch don't really merit the change anymore
---
 xen/common/ioreq.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index d8d02167b4..bae9b99c99 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -277,22 +277,24 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
         return 0;
     }
 
-    page = alloc_domheap_page(s->target, MEMF_no_refcount);
+    {
+        page = alloc_domheap_page(s->target, MEMF_no_refcount);
 
-    if ( !page )
-        return -ENOMEM;
+        if ( !page )
+            return -ENOMEM;
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
+        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            domain_crash(s->emulator);
+            return -ENODATA;
+        }
 
-    mfn = page_to_mfn(page);
+        mfn = page_to_mfn(page);
+    }
     iorp->va = vmap(&mfn, 1);
     if ( !iorp->va )
         goto fail;
-- 
2.53.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


