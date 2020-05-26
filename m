Return-Path: <SRS0=xV0j=7I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1299AC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 07:41:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA732070A
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 07:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA732070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdUD7-0001j3-C1; Tue, 26 May 2020 07:41:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdUD6-0001iy-M7
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 07:41:16 +0000
X-Inumbo-ID: 476dc06c-9f24-11ea-af7d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 476dc06c-9f24-11ea-af7d-12813bfff9fa;
 Tue, 26 May 2020 07:41:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA006B029;
 Tue, 26 May 2020 07:41:17 +0000 (UTC)
Subject: Re: Bug: toolstack allows too low values to be set for shadow_memory
To: Hans van Kranenburg <hans@knorrie.org>
References: <37137142-1e34-0f78-c950-91bcd6543eb8@knorrie.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <304a7a55-20a6-1dfe-1f3a-dabe90d28f40@suse.com>
Date: Tue, 26 May 2020 09:41:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <37137142-1e34-0f78-c950-91bcd6543eb8@knorrie.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.05.2020 17:51, Hans van Kranenburg wrote:
> This bug report is a follow-up to the thread "Domu windows 2012 crash"
> on the xen-users list. In there we found out that it is possible to set
> a value for shadow_memory that is lower than a safe minimum value.
> 
> This became apparent after XSA-304, which caused using more of this type
> of memory. Having a hardcoded line like shadow_memory = 8 results in
> random crashes of the guest,

I don't think it is the tool stack's responsibility to override
admin requested values, or at least not as far a affecting guest
stability goes; host stability of course needs to be guaranteed,
but that's then still the hypervisor's job, not the tool stack's.

Compare this to e.g. setting too small a memory= for a guest to
be able to boot at all, or setting maxmem > memory for a guest
without balloon driver.

Furthermore - what would the suggestion be as to a "safe minimum
value"? Assuming _all_ large pages may potentially get shattered
is surely a waste of memory, unless the admin really knows
guests are going to behave that way. (In your report you also
didn't mention what memory= values the issue was observed with.
Obviously larger memory= also require bumping shadow_memory= at
least from some point onwards.)

Jan

