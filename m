Return-Path: <SRS0=VfOS=5W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E82C2BA19
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 11:04:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCC3206F5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 11:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCC3206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPXh-0001Ym-Jc; Mon, 06 Apr 2020 11:03:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLPXf-0001YZ-OH
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:03:47 +0000
X-Inumbo-ID: 49827a14-77f6-11ea-bfe0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49827a14-77f6-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 11:03:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 030BBAD41;
 Mon,  6 Apr 2020 11:03:46 +0000 (UTC)
Subject: Re: [PATCH 0/5] use new API for Xen page tables
To: Hongyan Xia <hx242@xen.org>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <636251f68db5e094f0c4dd5871eb4146dadb1589.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f072eca-bd34-ebb7-706f-9dc688c991ad@suse.com>
Date: Mon, 6 Apr 2020 13:03:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <636251f68db5e094f0c4dd5871eb4146dadb1589.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.2020 10:27, Hongyan Xia wrote:
> Ping.

Does this somehow imply you didn't get my replies sent on the 1st?

Jan

> On Mon, 2020-03-23 at 09:41 +0000, Hongyan Xia wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> This small series is basically just rewriting functions using the new
>> API to map and unmap PTEs. Each patch is independent.
>>
>> Apart from mapping and unmapping page tables, no other functional
>> change
>> intended.
>>
>> Wei Liu (5):
>>   x86/shim: map and unmap page tables in replace_va_mapping
>>   x86_64/mm: map and unmap page tables in m2p_mapped
>>   x86_64/mm: map and unmap page tables in share_hotadd_m2p_table
>>   x86_64/mm: map and unmap page tables in destroy_compat_m2p_mapping
>>   x86_64/mm: map and unmap page tables in destroy_m2p_mapping
>>
>>  xen/arch/x86/pv/shim.c     | 10 ++++---
>>  xen/arch/x86/x86_64/mm.c   | 55 +++++++++++++++++++++++++-----------
>> --
>>  xen/include/asm-x86/page.h | 18 +++++++++++++
>>  3 files changed, 62 insertions(+), 21 deletions(-)
>>
> 


