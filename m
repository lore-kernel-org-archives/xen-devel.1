Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74588606A32C
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Z4jsgKUC
Received: from list by lists.xenproject.org with outflank-mailman.1470119.1678898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSE-0006zq-Qi; Tue, 03 Nov 2026 15:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470119.1678898; Tue, 03 Nov 2026 15:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSE-0006zb-Mm; Tue, 03 Nov 2026 15:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1470119;
 Tue, 03 Nov 2026 15:29:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOGSD-0006jS-EP
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGSC-0040rM-KI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:40 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdcd-bab6-0a2a0a5309dd-0a2a4509d89c-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:40 +0100
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fde4-be1a-0a2a45090019-d155da2cb5f2-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:40 +0100
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c414e5d282eso516700766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:40 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793719780; x=1794324580; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXonRJiUpIIQUGfPHULNa0+riN0YTsjAc2+s6FHrnD0=;
        b=Z4jsgKUCt1nv4RpXDOqlxCB6LJCLwIfUv7rZF95n7suf2jP85wjXv2679FoYhszdYg
         T8/RYMiR0TEpDdIQAPQBTWk/ONdhCZaS7nXKnNHwEDEAUU9XGbxd3phu3TG4K3fRElG2
         i0h9eePot8KFdlni9E6l5UOFBW2+98b/94ZlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719780; x=1794324580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXonRJiUpIIQUGfPHULNa0+riN0YTsjAc2+s6FHrnD0=;
        b=CeLRrQJ1NN7WIX+qYVSWJmuseua4LikYkNssPrmtN51i+VaTzs01RT3T3uZt9mKves
         bIdKnu6uEeFTJyQRKs0pLMDlwBCkqjQN1ZtTWtjzpjgpAd/8hYRQiyd6HaZKs+XpBeUO
         K8cFOOAT6etfzPCpydqlrwR1FkNzKEv+u+VpJR3RPKBNhM3s2q0a6/HXirs3xoBY6U6V
         eEmnoXTf9d6PXh8XHD3EiI1ILzqFUKk5dQ17oShUftr0xlrJ1ZQobRCnB8aGAkd1CfcG
         ++D0iXgE5Xke1aCsvwbCqeAJ6Nr+5VhVEddEcroGXVKKHXFE/mPFpCnT3tiG08odmJSb
         fewg==
X-Gm-Message-State: APuU4Z9BIsfHTEUKyDgmBNnddeOef6jOrc/Cg9AtqtoUMD0CitB+4Asn
	8ZkhVMnb5A0IwO17OfpuNjCa+w4ub6TKjgu9lwWsiGaZ3mF7SCfYFrKTABoNAhgItORq1nAIrAq
	QQBD9M9U=
X-Gm-Gg: AYBFou0UkbOtNAWMQ9CcUzAmJl+MscDXIqaIWvSr07VV9ocv+nqT+4NxiR8Rq74L1lo
	dxrEPCSmWoyEx4V7ElIfQGw/IWwwimxeqVXKhsD3GPw9mSPneqGboR9OBsggPLSGz0nY9PRoUHK
	6p9rNsEAdiOhnaEZ0DY69ICkJDxhj+A1kdn6w6bJEIlBAMNXtjb5zp6PBfu+14EAOwd/goHbd+x
	HO7GzeCMPAxkvVNw1bjwKQ+Es/J3zdb6WQjZI2DovMzigrlfTvf66QBF7cTvbQmEi/m7Rk1HNfr
	UqZTxq8az1QVy79TtdtY4lxgpXjSyQRsMIaEz3IfJScGlnT4VzPZskg1WDp9HU8JXGdou9YJwAH
	Hxy5exOPt02oip4MtoMOzRdV8pkXDHhjrQbATsLrAaI5P9U8uFn6Ip8jnD4ZUqIvB2cNcyPKCw0
	EwiXJOePxv7rGluiyqNSjJVi+gdKV1rd2uYJscLc7eILyTGul2hCn4cD0qNP/K7G1BCsueprsn6
	T4g1Z84VAlpRLVDH5bHmz/sDCKJdzO9ewGpFfBDz/VBLgHMEvzlgoF5YoW5Ils6njzrbRJIbK5p
	Be1+qj7hddXqU3LtekLZoqNn6RQj479Nvgiq9kWJZ2oHGG1vgXwLk9t6z/4keybYIkFF5r5CVKH
	4X0e7Tv1z3mE5eRk1/YV4Sh4U
X-Received: by 2002:a17:906:99c9:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c4ca7b405c5mr1089032866b.27.1793719779322;
        Tue, 03 Nov 2026 07:29:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 5/6] xen/gnttab: Fold error handling in _cache_flush()
Date: Tue,  3 Nov 2026 15:29:27 +0000
Message-Id: <20261103152928.2142176-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793719780-FC610034-42FF5581/10/78276251493
X-purgate-type: spam
X-purgate-size: 1656
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/common/grant_table.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 4cc23f9231e6..d453c38556fc 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3647,9 +3647,8 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
         act = grant_map_exists(d, owner->grant_table, mfn, cur_ref);
         if ( IS_ERR_OR_NULL(act) )
         {
-            grant_read_unlock(owner->grant_table);
-            put_page(page);
-            return act ? PTR_ERR(act) : 1;
+            ret = act ? PTR_ERR(act) : 1;
+            goto gnt_unlock;
         }
 
         /*
@@ -3683,13 +3682,15 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
     else
         ret = 0;
 
+    unmap_domain_page(v);
+
     if ( d != owner )
     {
         active_entry_release(act);
+    gnt_unlock:
         grant_read_unlock(owner->grant_table);
     }
 
-    unmap_domain_page(v);
     put_page(page);
 
     return ret;
-- 
2.39.5


