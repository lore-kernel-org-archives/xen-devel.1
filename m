Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBDAC83004
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 07:59:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96100206A1
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 07:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96100206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTL9G-00084a-Nb; Tue, 28 Apr 2020 07:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTL9F-00084T-R7
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 07:59:21 +0000
X-Inumbo-ID: 2a752f5e-8926-11ea-983b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a752f5e-8926-11ea-983b-12813bfff9fa;
 Tue, 28 Apr 2020 07:59:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA857ABCF;
 Tue, 28 Apr 2020 07:59:18 +0000 (UTC)
Subject: Ping: [PATCH v3 0/5] (remaining) XSA-292 follow-up
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Message-ID: <b3cb2f58-0e7d-e6c6-80d3-04590bf8bd21@suse.com>
Date: Tue, 28 Apr 2020 09:59:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew,

On 25.09.2019 17:19, Jan Beulich wrote:
> 1: x86: suppress XPTI-related TLB flushes when possible
> 2: x86/mm: honor opt_pcid also for 32-bit PV domains

I realize these two weren't entirely uncontroversial. May I
please ask that you get back to them, more than half a year
after their posting? For patch 1 I don't think I got
anything back yet on v2 / v3. For patch 2 see
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg01721.html

> 3: x86/HVM: move NOFLUSH handling out of hvm_set_cr3()

See
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg01689.html
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg01737.html

> 4: x86/HVM: refuse CR3 loads with reserved (upper) bits set
> 5: x86/HVM: cosmetics to hvm_set_cr3()

These two have your ack, but depend on at least patch 3 afaict.

Jan

