Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00498C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 10:35:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C02E60235
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 10:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C02E60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76870.138895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54eH-0004NV-N7; Thu, 28 Jan 2021 10:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76870.138895; Thu, 28 Jan 2021 10:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54eH-0004NO-Js; Thu, 28 Jan 2021 10:35:37 +0000
Received: by outflank-mailman (input) for mailman id 76870;
 Thu, 28 Jan 2021 10:35:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l54eF-0004ND-Pz
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:35:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92de7f99-ed55-453d-83f6-803ab00a0496;
 Thu, 28 Jan 2021 10:35:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2BA1ABC4;
 Thu, 28 Jan 2021 10:35:33 +0000 (UTC)
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
X-Inumbo-ID: 92de7f99-ed55-453d-83f6-803ab00a0496
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611830134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5AE+p0tuwffWob6HmHooeYjcx5+onHwSwoE0/M0ojIY=;
	b=ugJlz96/S9SSOnoWHLv5VS81itOZ/omPZMnCys1rn1NrrLswHiYALdeMGQiC5meDswkcp7
	4WyjUGWekIk7BXUxoDOl7O8R+tMvQxO7PnGdaxYUoozupum0Yi1+ja9ynexJcd5p2j9GtX
	aK134DGsacTxfd0Po/iCeCSP3UTHwVU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] memory: bail from page scrubbing when CPU is no longer online
Message-ID: <251a14b5-01a5-0a9d-d269-f463a0759f1d@suse.com>
Date: Thu, 28 Jan 2021 11:35:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Scrubbing can significantly delay the offlining (parking) of a CPU (e.g.
because of booting into in smt=0 mode), to a degree that the "CPU <n>
still not dead..." messages logged on x86 in 1s intervals can be seen
multiple times. There are no softirqs involved in this process, so
extend the existing preemption check in the scrubbing logic to also exit
when the CPU is no longer observed online.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1324,9 +1324,11 @@ bool scrub_free_pages(void)
                      * Scrub a few (8) pages before becoming eligible for
                      * preemption. But also count non-scrubbing loop iterations
                      * so that we don't get stuck here with an almost clean
-                     * heap.
+                     * heap. Consider the CPU no longer being seen as online as
+                     * a request to preempt immediately, to not unduly delay
+                     * its offlining.
                      */
-                    if ( cnt > 800 && softirq_pending(cpu) )
+                    if ( !cpu_online(cpu) || (cnt > 800 && softirq_pending(cpu)) )
                     {
                         preempt = true;
                         break;

