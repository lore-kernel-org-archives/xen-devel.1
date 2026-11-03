Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59534606A33E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=qqd6yftQ
Received: from list by lists.xenproject.org with outflank-mailman.1470115.1678862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSA-00068o-Nk; Tue, 03 Nov 2026 15:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470115.1678862; Tue, 03 Nov 2026 15:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGSA-00068g-KA; Tue, 03 Nov 2026 15:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1470115;
 Tue, 03 Nov 2026 15:29:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOGS9-0005w9-3H
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGS8-00Ba9X-Fx
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:36 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdcd-8faa-0a2a0a5109dd-0a2a450c8b10-38
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:36 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fde0-f479-0a2a450c0019-d155dd29d431-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:36 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e00eee27dso2305976f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:36 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:34 -0800 (PST)
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
        d=citrix.com; s=google; t=1793719776; x=1794324576; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlONDbpAh5pNQ0fTDZFEV0XEM4VMcy0VXMNJpoTJmPI=;
        b=qqd6yftQ2wDRqX1v2HfvFWlfQuaKMqQKg1siG50XeOFNViHO73Y1pVkiyJnFceHBER
         qjOIbWxTvLxfaju/gWjn3x6PNPPubTwzbpeaU8NSuzBRLYGCsLU/IY5y1cHJ1GEbpyEa
         +Q76Kfr46yrnz13XKeO3Ibhl9FOgCj8o5g9Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719776; x=1794324576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlONDbpAh5pNQ0fTDZFEV0XEM4VMcy0VXMNJpoTJmPI=;
        b=01jFpMLTblbw8sbKbkJxZFR/JGi5VHE9hms4r0B8ONIR6EzDIFKkdD+7W/7Tmnb3yr
         B3vMSeX5Jq7bgdG3L7ebRfWOauQSP2CxdPyZY5PbO/zUE5l3ervcHqibzuC+TA+G9y9Y
         rxtDHiCg4hnLbDih3HkWSYTWbJdTBpjyP3/Mx5fSuFEA6CfYSYfy3lKc9RDqYE90NeiF
         HHjXHWXYyweTj7Rjxr9buHo7CqNsy6y0OnSMqH9TJxlJI3NMLC5gqRasDYGSXWySqYdI
         OkL0flE03Z4XHTEs8eVNjKBf8sc8jQM2rmqtuKgrde77st2vM/3oZqUEUidYxCbLF/Xu
         Riug==
X-Gm-Message-State: APuU4Z9Uby/5glVaRerTzYhwOzRIMfL5X5DhLyuY4vfb5s0k0Dm5u8Ab
	2NN8EgamvEnsNX5YNeEIGSrxiS373kwoM3fUZywNYOOAW6yDMoUL0nbik/3jw+z69sn/nELGo6t
	+GfPtiAk=
X-Gm-Gg: AYBFou12QEADHgEzLCyICzmugRImxXjcMVSfT4kThMcFHel1Zyl3xaKcLylxOn95mBR
	j8kHJmO1Z4H7Zi1znatQjKn0zyy/0zGelTCRa3k+fUkgnsMC+V3nfvi3SdRQ8VGryGNcv0P4o/u
	b5HdyiCZbwnT8MWIBPFMy51H/CzAJMn9OdviA63JPL0nmulZLTDO1V49i7/ZeKPnLuCEiNxnD6I
	ZnRD3v6YDG6DU3wv+bQ8vn5aHhBtAkd2rPWf87zgRH9nUvavW9OHol+L5ekpeFSULUbaKG+Drgg
	8u28vKuyNzWlA7dao3wStm1qfdl33YUdofsR6KimNWafHXtO90iEMnQonkqv1e3BIgfEZP1FqyZ
	3aHy2FwZL7noxWqtiAVmefiKHwKs26PwE7RSn43GWBfRnYI7iQYS1D6utzS9Ywo8KQ12yUH0hEG
	lx0AUSprA48ZJknEtBLF9XrWho+KaV36O/Po81o3gzjDq88/AHV3PlVdlOEtHc8WsApTLvTBtwt
	6OJEyJEwk0GMSJVQIRnK0NbRhERp9miVt5qf+MxPB4CKdU5cr9/loGg+Ec7x4/OtGOTnvMGUZf5
	YqlqC0AJ7HekHa7vKZzC510ajYAFDJegm6iMAPp4gsJ9lTKCZ0Yoe1rIVAvkS/U8VkBMAJRnNw5
	QVi8A
X-Received: by 2002:a5d:5d0d:0:b0:48e:932:aef5 with SMTP id ffacd0b85a97d-48e6e302ad5mr28401206f8f.21.1793719775453;
        Tue, 03 Nov 2026 07:29:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 1/6] xen/gnttab: Drop owner->grant_table check in _cache_flush()
Date: Tue,  3 Nov 2026 15:29:23 +0000
Message-Id: <20261103152928.2142176-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793719776-01CC3A5B-EBF076D4/10/78276251493
X-purgate-type: spam
X-purgate-size: 1724
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "owner && !owner->grant_table" case needs a put_page() in it's error
handling.

In Xen 4.20 and earlier, this was addressed by XSA-520.  Since the addition of
CONFIG_HAS_GRANT_CACHE_FLUSH in Xen 4.21, this path is only reachable on ARM,
and system domains on ARM do not own any memory.

Therefore delete the check, rather than inserting unreachable error handling.

No functional change.

This issue was also independently reported by Yehyeong Lee as the security
team was already working on XSA-519/520.

Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
 xen/common/grant_table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 5e79c012b695..2285c4aee8d6 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3633,7 +3633,7 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 
     page = mfn_to_page(mfn);
     owner = page_get_owner_and_reference(page);
-    if ( !owner || !owner->grant_table )
+    if ( !owner )
     {
         rcu_unlock_domain(d);
         return -EPERM;
-- 
2.39.5


