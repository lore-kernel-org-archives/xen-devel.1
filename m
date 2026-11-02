Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E8606BA59
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=v5TGmdL/
Received: from list by lists.xenproject.org with outflank-mailman.1468527.1677601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNw3Q-0002DV-Gm; Mon, 02 Nov 2026 17:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468527.1677601; Mon, 02 Nov 2026 17:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNw3Q-0002DO-Dr; Mon, 02 Nov 2026 17:42:44 +0000
Received: by outflank-mailman (input) for mailman id 1468527;
 Mon, 02 Nov 2026 17:42:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNw3P-0002D2-9r
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 17:42:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNw3O-0046WE-JE
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 18:42:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae8cb59-bab6-0a2a0a5309dd-0a2a4502a2f2-36
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:42:42 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae8cb8d-6ca4-0a2a45020019-d155802ca517-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:42:37 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so43275145e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:42:37 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a9fafe08sm3413885e9.3.2026.11.02.09.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 09:42:36 -0800 (PST)
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
        d=citrix.com; s=google; t=1793641357; x=1794246157; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SW+gAQ5r0oly8A4PGuSW/L4bqVl3rIFZrSP29fbwc/I=;
        b=v5TGmdL//NMHKIUhBwxtrG2AAjhU/POb5ACyAadoAJY61DeQturqXcxey02V6+GHP/
         mxK0KRR9k9e2GR6UvYManlBo7TSxbXXipCsALrdWk0uOfr3u1bQLmZ7qNw6uY3LIz4md
         kQCj7DNF6Qf862GjnVtzIa7zIWucyglcIclxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641357; x=1794246157;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SW+gAQ5r0oly8A4PGuSW/L4bqVl3rIFZrSP29fbwc/I=;
        b=xtHHSco8M/+H60YAbd30nnVhDC2hMHp0xqfmFMTB5kk/Vqs5CCKz1T7P42andLcE7Q
         IZuHuxjJ1fe8NT8MEnD+4jTRNFDMcnNtnDWiGqdW8xn8ikIDLUpOcnu7Oz4j+8tBAXxv
         XsYZSbYj9K5enWpJbi33eSK2UxCRCbkyb/bZ1WvcteK6O/ZlfmrLvmpm02u8JZvZJ8Fm
         N51vN64UvHeBlHwilJRN3xfV2KK9H199bk1Rs+Mn6BCbehg9GFY3/eMbQqYvoPklpOW4
         6YI1B8bgX47x9k1oK64fhkTufIkJM/wHai20hnkmFhbxEZKco5PG+KmGeVM67qi2rAed
         CiEg==
X-Gm-Message-State: AFq9FYKIUEalftoM8i2SLtN+jkjw015PHCNKkgcxQlkjw9CsF1OZEqad
	RMF01aXWCQMGoPCBd63au0WEtj7YFRtEkdLBG9O89OjSiumoV/RRjnkRDwozyViuCro+L47PyOk
	7kdQVYJA=
X-Gm-Gg: AYBFou0TK/d+lrVsFJqZ0gjS8RqDQsnMnwDAI1dx4+pFKGxnRKHyLmiUZqM76uEwCFM
	4qulkAC4GYoU5GDINfrMfxPytlgRKVpXOOxrDevqiRKk9R/Giu+I0YU3KG7LEx3RCD6t+PLjTES
	u0uESMDCT8XSspVpkwkbnF4as5Mm+3dcGS0ZLTLayMhoMiVsmiO+JpqCGKUm6OfeUAkSWV4hbaw
	cQOU/mxsHHcnK5RlEjswKvDw5sUP3MIaXpFD0xZO25gWBM3nI5LLf4j+Azkd20DCr7KSfJKLyw0
	2jczqgLpZ89mRVQg77IDs2Rukifr1poRhMRDCxHFqNFldI1TuamJwYetynYMjLMRiQdW13J6Vne
	uqyHTVMKqOLa8EBICOPCaY2w6nhvO71IcwY8RyXP/SVV5weelbqKeXXdWiXcC1i9tE1o4pixpiD
	eFdSQBHO2obDn4Rle1nD1mOsiv1munrChBC/5634k2NVW0MYRFUsWuTB285oQlRg3v2lU1WaXic
	jv3qM+PfFjNiuxpnWHiJkfHJzvPjX8pTfZWMixxZSUAJQ7mlGNvb/BhJfFlbwCA5jRjpMQ7xv9v
	fvYYjANcxGBlLL4Lbrrd6kXj31ioJx6JSm4q04AWcL/mTToXqlPPlJ6lOiNDGpdIQRrlAeaUjns
	cnjY=
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr239508635e9.11.1793641356705;
        Mon, 02 Nov 2026 09:42:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/pv: Improve code generation in async_exception_cleanup()
Date: Mon,  2 Nov 2026 17:42:34 +0000
Message-Id: <20261102174234.1764070-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793641362-F16AF2AC-DF6A54CB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1268
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use new helper functions to simplfiy the logic.  This removes an alternative
behind the scenes.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

async_exception_cleanup() is complete nonsense.  It's not remotely close to
how interupt blocking works in x86.
---
 xen/arch/x86/pv/iret.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 39ce316b8d91..0efc0c7f12f3 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -31,8 +31,8 @@ static void async_exception_cleanup(struct vcpu *curr)
     if ( !curr->arch.async_exception_mask )
         return;
 
-    if ( !(curr->arch.async_exception_mask & (curr->arch.async_exception_mask - 1)) )
-        trap = __scanbit(curr->arch.async_exception_mask, VCPU_TRAP_NONE);
+    if ( !multiple_bits_set(curr->arch.async_exception_mask) )
+        trap = ffs(curr->arch.async_exception_mask) + 1;
     else
         for ( trap = VCPU_TRAP_NONE + 1; trap <= VCPU_TRAP_LAST; ++trap )
             if ( (curr->arch.async_exception_mask ^
-- 
2.39.5


