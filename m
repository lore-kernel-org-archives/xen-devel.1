Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FD606EE93
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=FF2IiAAj
Received: from list by lists.xenproject.org with outflank-mailman.1469762.1678523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOE8n-0001yC-4N; Tue, 03 Nov 2026 13:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469762.1678523; Tue, 03 Nov 2026 13:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOE8n-0001y5-05; Tue, 03 Nov 2026 13:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1469762;
 Tue, 03 Nov 2026 13:01:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOE8m-0001xz-5U
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:01:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOE8l-003Vk9-Aw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:01:27 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9db21-8faa-0a2a0a5109dd-0a2a4505a83c-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:01:27 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9db25-4cb1-0a2a45050019-d155dd35ec65-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:01:26 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so3633500f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 05:01:25 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8011csm28152626f8f.31.2026.11.03.05.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 05:01:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793710885; x=1794315685; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwIrtioqvH93/Pzz+h/sMiRyUomArmW4gpD6n4nKQXM=;
        b=FF2IiAAjJzRk1sfSbvsBf4gaH0f2hMYDLYKVQb+MEDEz2ZNoot+rKZO7F7Sq+mRHLL
         m6+PVVZpwblimoYXACbv8CjpbpF5KVLDb/vECE8F0IEPZe5JME6az/H3fgl0lXgnxRKW
         +6umTQt+h0ruCyYFBR7mytSy1c4/b5up5hqWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710885; x=1794315685;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwIrtioqvH93/Pzz+h/sMiRyUomArmW4gpD6n4nKQXM=;
        b=PDYhzaMIWng87hW9FKsZv4S4LoTBI8Mi161Tkc6XrW3A7Pejcix3zS7bUbnQmMnZ0q
         w3nnMocmnqN+dChlgSptdnIVRAUKhmQ4OgA3+pqZ0pYaYiMsJHglEDgudHmy6zqkQzHz
         EuRBNJATUe/W767gRxTDQrKDCVqPg4lm1WxOUxTNB/7tWtGCHdePik6EiOPE/AOfjUyv
         L27f24KL54CV0lG33O1Dzl1sY/fYNLi3uw8rb54WFZHnIwsOqcH3GfM2gUameputEu3s
         i+g3oJu9QqfqOutbb3EmCDN736133TP1UEXoch9iQVO/MBXuxr1kXNyou2vtnh69yPt6
         WuoA==
X-Gm-Message-State: APuU4Z+/q+42Y+2YnsSNgUgNB6rFxJ+QmMZ6NgFCiH2NIjSDSyp7KOJu
	KgRXxQAJai0v3hG9p8w74448yvje1722BCZo9hUwkJnNjRdb9AR8BnNuMUnz/GGjlYKGi9SdDr/
	e/QofhNM=
X-Gm-Gg: AYBFou2+F8LuGU6SwY77ZFfDcQPqEzpugJ2osxfqapXmrX/+fQpz6FXfKuNo5Atmd45
	6xSpDKb5vQVOl31c1Y1x3IAl+Ew5Bk7GvBGroUL/uWnMxU/LJ0xxsqoWt3UYKHWgic1KcwzQ//W
	+uDRWxXjZsbkEDek/24sMxHFVsYeF6uzU9ff4tzdPAhfhK4Ct1xjS2utvkQ7k9F2IoVM5UgpL4g
	b5UyacpaGE1oYDgcQHS0rPP0As1PaFlW4mlDE6oUv7wf0gfCQJSRVMv9F6zcjPNIeR59vLKZ5L5
	X+jGnIvTVhnipP53O9Y1tv6n8HC3odzMUEVphFqrs99MZu6eZyJgWuWiFfWsFTYGa3i/jo22Lbs
	mlDFbjFoHRnokvKUT16ooen5KvZLE7DmRn8b/qgDLvqupv8i8Ii8Hdlzw//OpHmyvMDcSPwSxIz
	r9mVN4RfFGAGUwGkARXKGwQ5GgIwE32ri9iQ88l+raAZGuE8OZT92SYV61OLBlU5UL6ESx3AGNH
	crbtH1UsHP7ExZBpqyHuGnpL/orGg/ICxPFiciOn6Rd46RL8n0dinAgcqsNFXyFwwfoyQq9QCyE
	FvNXFjuPvpUqQbiJ+vgUzldaIG11N+M6vJn5Btjrn/YLmgSD6CVDVseqAOxqTNFH/n2swCqCF4C
	3DOQ=
X-Received: by 2002:a05:6000:2387:b0:48e:861b:882a with SMTP id ffacd0b85a97d-48e861b88abmr9916927f8f.47.1793710885043;
        Tue, 03 Nov 2026 05:01:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/gnttab: Shrink struct gnttab_copy_buf
Date: Tue,  3 Nov 2026 13:01:20 +0000
Message-Id: <20261103130120.2020581-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793710886-F52A32A1-41314BAD/10/78276251493
X-purgate-type: spam
X-purgate-size: 3337
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the booleans into earlier padding.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

On 64bit, this shrinks from 64 bytes to 56 bytes.

On arm32, it's 40 bytes before and after.  Given that we can't reuse the
tail-padding from struct gnttab_copy_ptr, I'm not sure there's an obvious
improvement to be had:

  xen.git/xen$ pahole xen-syms-arm32-after -E -C gnttab_copy_buf
  struct gnttab_copy_buf {
        struct gnttab_copy_ptr {
                union {
                        /* typedef grant_ref_t -> uint32_t */ unsigned int ref;          /*     0     4 */
                        /* typedef xen_pfn_t -> uint64_t */ long long unsigned int gmfn; /*     0     8 */
                } u;                                                                     /*     0     8 */
                /* typedef domid_t -> uint16_t */ short unsigned int domid;              /*     8     2 */
                /* typedef uint16_t */ short unsigned int offset;                        /*    10     2 */
        }ptr; /*     0    16 */

        /* XXX last struct has 4 bytes of padding */

        /* typedef uint16_t */ short unsigned int         len;                           /*    16     2 */
        _Bool                      read_only;                                            /*    18     1 */
        _Bool                      have_grant;                                           /*    19     1 */
        _Bool                      have_type;                                            /*    20     1 */

        /* XXX 3 bytes hole, try to pack */

        struct domain *            domain;                                               /*    24     4 */
        /* typedef mfn_t */ struct {
                long unsigned int  mfn;                                                  /*    28     4 */
        } mfn; /*    28     4 */
        struct page_info *         page;                                                 /*    32     4 */
        void *                     virt;                                                 /*    36     4 */

        /* size: 40, cachelines: 1, members: 9 */
        /* sum members: 37, holes: 1, sum holes: 3 */
        /* paddings: 1, sum paddings: 4 */
        /* last cacheline: 40 bytes */
  };
---
 xen/common/grant_table.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 5e79c012b695..d2c3c73be900 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2927,13 +2927,14 @@ struct gnttab_copy_buf {
     uint16_t len;
 
     /* Mapped etc. */
+    bool read_only;
+    bool have_grant;
+    bool have_type;
+
     struct domain *domain;
     mfn_t mfn;
     struct page_info *page;
     void *virt;
-    bool read_only;
-    bool have_grant;
-    bool have_type;
 };
 
 static int gnttab_copy_lock_domain(domid_t domid, struct gnttab_copy_buf *buf)

base-commit: 2043d22b7e926f508cc23391b4c75325fa7211e9
-- 
2.39.5


