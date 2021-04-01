Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D05C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:54:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50C361007
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50C361007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104263.199218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu23-0006Vh-3B; Thu, 01 Apr 2021 09:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104263.199218; Thu, 01 Apr 2021 09:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu23-0006Va-05; Thu, 01 Apr 2021 09:54:31 +0000
Received: by outflank-mailman (input) for mailman id 104263;
 Thu, 01 Apr 2021 09:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRu21-0006VT-IZ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:54:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 162e1716-1d1c-432e-86aa-435eef0c2cd3;
 Thu, 01 Apr 2021 09:54:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 262E0B032;
 Thu,  1 Apr 2021 09:54:28 +0000 (UTC)
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
X-Inumbo-ID: 162e1716-1d1c-432e-86aa-435eef0c2cd3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdS547I0MHs8GHpeGea/kzNdcUxE2McJtcRJ1hPnylM=;
	b=Yw2aNBfYvGgfmOIZZAydVv7NE5hING06Tbr1dHmF+WBYBdMmxtdW4AzLiCWY3VRhuyLZzc
	AZcIoARXZo0GVFdu7M7vh+nGvIdi9FjUUtTruyszBKAdP8hw88mvwJ6fS9zcFqMXoJgSoe
	Uj3Isdgek2k9ntlCRjq6CB31hRlAAnI=
Subject: [PATCH v4 2/3] x86/time: yield to hyperthreads after updating TSC
 during rendezvous
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Message-ID: <81da85eb-2e8e-9b76-2fb3-2beddc33e9af@suse.com>
Date: Thu, 1 Apr 2021 11:54:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Since we'd like the updates to be done as synchronously as possible,
make an attempt at yielding immediately after the TSC write.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1708,7 +1708,14 @@ static void time_calibration_tsc_rendezv
             atomic_inc(&r->semaphore);
 
             if ( i == 0 )
+            {
                 write_tsc(master_tsc);
+                /*
+                 * Try to give our hyperthread(s), if any, a chance to do
+                 * the same as instantly as possible.
+                 */
+                cpu_relax();
+            }
 
             while ( atomic_read(&r->semaphore) != (2*total_cpus - 1) )
                 cpu_relax();
@@ -1730,7 +1737,14 @@ static void time_calibration_tsc_rendezv
             }
 
             if ( i == 0 )
+            {
                 write_tsc(master_tsc);
+                /*
+                 * Try to give our hyperthread(s), if any, a chance to do
+                 * the same as instantly as possible.
+                 */
+                cpu_relax();
+            }
 
             atomic_inc(&r->semaphore);
             while ( atomic_read(&r->semaphore) > total_cpus )


