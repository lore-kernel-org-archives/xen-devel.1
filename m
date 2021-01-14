Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53936C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:03:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068BB23A5E
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068BB23A5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67068.119397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04A9-000526-II; Thu, 14 Jan 2021 15:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67068.119397; Thu, 14 Jan 2021 15:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04A9-00051z-F0; Thu, 14 Jan 2021 15:03:49 +0000
Received: by outflank-mailman (input) for mailman id 67068;
 Thu, 14 Jan 2021 15:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04A8-00051t-8R
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:03:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea676005-e34b-4f4d-a952-e541c54722bf;
 Thu, 14 Jan 2021 15:03:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5501AC95;
 Thu, 14 Jan 2021 15:03:46 +0000 (UTC)
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
X-Inumbo-ID: ea676005-e34b-4f4d-a952-e541c54722bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIRqMrh4BihbYMSyf4RvOGN3HvBiIewdOTvhbgvfyIk=;
	b=cfbUfTAsvyoF7pjUsD1b0VYZbSVEr3gfBsnBM0kyHwMv6JI+4kKLOk5o7CsvT1iR7Shm3V
	A7waM0FOWkvfkOQh/swVIQfLNiKOCrMdriqE3c6+MsCjNwGWEqpkqWDQ6J4zXyQIOqmqYP
	FrOoqZl8mlBC0/BvVDzVyIRV+JL/+xI=
Subject: [PATCH 01/17] x86/shadow: use __put_user() instead of
 __copy_to_user()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <8a0e0e7e-85c3-7ede-b2a5-410177e799a2@suse.com>
Date: Thu, 14 Jan 2021 16:03:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In a subsequent patch I would almost have broken the logic here, if I
hadn't happened to read through the comment at the top of
safe_write_entry(): __copy_from_user() does not provide a guarantee
shadow_write_entries() requires - it's only an optimization that it
makes use of __put_user_size() for certain sizes. Use __put_user()
directly, which does expand to a single (memory accessing) insn.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In a future patch I guess I'll make this write store the intended data
instead of doing this "no-op" write, making the subsequent loop start
from 1 in the success case. In fact I also think safe_write_entry()
would better go away, in favor of direct use of write_atomic().

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -776,9 +776,9 @@ shadow_write_entries(void *d, void *s, i
     /* Because we mirror access rights at all levels in the shadow, an
      * l2 (or higher) entry with the RW bit cleared will leave us with
      * no write access through the linear map.
-     * We detect that by writing to the shadow with copy_to_user() and
+     * We detect that by writing to the shadow with __put_user() and
      * using map_domain_page() to get a writeable mapping if we need to. */
-    if ( __copy_to_user(d, d, sizeof (unsigned long)) != 0 )
+    if ( __put_user(*dst, dst) )
     {
         perfc_incr(shadow_linear_map_failed);
         map = map_domain_page(mfn);


