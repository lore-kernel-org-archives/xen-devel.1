Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF801606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=SZSPx8zT
Received: from list by lists.xenproject.org with outflank-mailman.1482083.1685952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp1B-0002XA-G4; Tue, 10 Nov 2026 16:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482083.1685952; Tue, 10 Nov 2026 16:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp1B-0002X3-B7; Tue, 10 Nov 2026 16:48:21 +0000
Received: by outflank-mailman (input) for mailman id 1482083;
 Tue, 10 Nov 2026 16:48:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQp1A-0002Wr-LG
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:48:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQp19-00EotQ-Op
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:48:19 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af34ac3-e002-0a2a0a5209dd-0a2a4503ed88-26
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:48:19 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af34ad3-fae8-0a2a45030019-d155dd2cbc59-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:48:19 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4922dbcee23so1282322f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:48:19 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836a9951csm5729448f8f.56.2026.11.10.08.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:48:18 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794329299; x=1794934099; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T72J1p5Im/yiqPaq+J3mMeABDSjPwDOl4wDrRkC+ho=;
        b=SZSPx8zTvzTp0jkioe13FmBo9ChMma99gjdSOooWP92+zyYcw144KIM5tmECqVt+Ti
         CCKpHaHEWWsiTAHEyuxj21E69z5kjuut7BjyS/PlWdCc9o1l3bGnd7BK2AnX0hqmnyFp
         JRrZ9ACRWsLDT3Hj657XC2mbkzs0hwDWJHaro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329299; x=1794934099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T72J1p5Im/yiqPaq+J3mMeABDSjPwDOl4wDrRkC+ho=;
        b=f2ryj/H+XsmYFGY7X4xwC+9A1pvPNMEPevXKeIitsewyjNvOV0gY/PYJe8ZKAwwila
         ueC6ooXFTcARpuuFpwFRmvpH9zo9HqfrTD/N8QEBXDBREORUk4AGP9UOzsyhaJi8wEoB
         nMQfR4zQeP4cIVMOiSKD+edAC/awCbBBF9uBeS80JYqexUSrYwYDORtmNCUfdb9LxTTi
         sJ404nKliCTFPj/BoshSIufgyrK8Igzy9VMrnlXmaUoIa+9ZszGKkr98uJ+se5WpLM8Q
         d/w0NldvvJNaNbPluuKhcy0Bt+E8cr8aU5f/HQrmw9xNJywhRMrc+L3htA6sd9gzh+bk
         //hg==
X-Gm-Message-State: APuU4Z/bo9s2/tYODtLlQL0kUR/b0/dZFUrneuszlijWnR7NRd+tAqYZ
	ONMRxnoO5wwBz1CkEQ7qkB/l4wpSKarxukjaLzVKPkVdj4J5HhlNTJuQB/JHWJqsYWJy+QxaGJs
	Jd9S+16c=
X-Gm-Gg: AYBFou1J+MyCut05zf0K3yMEPe5s0f0yJSJ6YqQQVRa426GiIVD8DwcUPT/gyKJ3ANw
	2eUm2XH6+smbdSRw1MI7qFtFkOmZPpahw9lf/Xl/XYk/EqeSSsKzzFBnNtAtkfsFY4XcyIuDQ5t
	wepbXrd4nzNPOKhoDVQvlL3VnVB1Dct4XFQPxHQKpgBMmXcdFfjDI5tM2Hpzrf3POMDU0WumR2J
	h02NgO88kqtTzGJFNyxfugsFgPyTJATiPB2qQ9l5Al3JrCMxGEJ6Oa5H3Ux6AzY3x7wof32OHBY
	zKKkLCbElIXK+hBmN0Tcj1fe/KKnDp6NRfxPbgWv46oC4Og63BtXSpmUVH+PstHnW0PVwEK5S0u
	z8PWOKejTge087u7huo8si+MVKl/bVrMuvPwmRz/KPAvzVFI8WIYJyHYEnKhedETZo6TrpPJbSh
	uuUQTEZ362rw5QPz2k5wff3Xkg564rwlO5bGgrrRAQv7lmLXzmCNFuWAMtH7w38CkWu08d+LxCb
	K9MvdMsT4dBU2CR+OULoZJongANaL1VmvVGPvKBpOeW4bIjfcKIhvzxOCHjJk/ZmR3/pk/6W8PX
	Bn7Qh/MKvZi6kclSYQXQtcyiQQnfTBqOX1keNa9rELLX+BKdWfQcYkrWl8Ml8q95sGLOiAd5pnt
	3iDs=
X-Received: by 2002:a05:6000:4a10:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-4982f77eb69mr5635418f8f.16.1794329298976;
        Tue, 10 Nov 2026 08:48:18 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/gnttab: Properly drop page ref on a GNTTAB_cache_flush error path
Date: Tue, 10 Nov 2026 16:48:16 +0000
Message-Id: <20261110164816.3163420-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794329299-76CF84E9-A5F2EEDE/10/78276251493
X-purgate-type: spam
X-purgate-size: 1317
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jan Beulich <jbeulich@suse.com>

This patch was XSA-520 in Xen 4.20 and earlier, as it affected security
supported x86 cases.

In Xen 4.21 and later, the hypercall is only available to ARM.  Nevertheless,
there are two identified cases (STATIC_MEM and the xentrace buffers) on ARM
where system domains own memory, and need this error path.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/common/grant_table.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 5e79c012b695..a76ae35368a5 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3635,6 +3635,8 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
     owner = page_get_owner_and_reference(page);
     if ( !owner || !owner->grant_table )
     {
+        if ( owner )
+            put_page(page);
         rcu_unlock_domain(d);
         return -EPERM;
     }

base-commit: 204e45847d5a743b611de989835f651fcfd6ddc0
-- 
2.39.5


