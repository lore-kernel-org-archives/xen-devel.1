Return-Path: <SRS0=cyMZ=6I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C179AC2BA1A
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 11:13:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B9320728
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 11:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B9320728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRwGU-0003lc-UD; Fri, 24 Apr 2020 11:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRwGT-0003lT-Jj
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 11:13:01 +0000
X-Inumbo-ID: 8f1cedfa-861c-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f1cedfa-861c-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 11:13:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E716ACC4;
 Fri, 24 Apr 2020 11:12:59 +0000 (UTC)
Subject: Re: [PATCH 1/6] x86_64/mm: map and unmap page tables in
 cleanup_frame_table
To: Julien Grall <julien@xen.org>, Hongyan Xia <hx242@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
 <a1caa70d-9c7a-b0c2-d7cf-1893db8f0ac4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aba8fe76-9a7a-7099-c04f-0ce36eaac1f8@suse.com>
Date: Fri, 24 Apr 2020 13:12:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1caa70d-9c7a-b0c2-d7cf-1893db8f0ac4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 11:02, Julien Grall wrote:
> On 17/04/2020 10:52, Hongyan Xia wrote:
>> @@ -763,10 +763,10 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
>>               continue;
>>           }
>>   -        ASSERT(l1e_get_flags(l2e_to_l1e(l2e)[l1_table_offset(sva)]) &
>> -                _PAGE_PRESENT);
>> -         sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) +
>> -                    (1UL << PAGE_SHIFT);
>> +        ASSERT(l1e_get_flags(l1e_from_l2e(l2e, l1_table_offset(sva))) &
>> +               _PAGE_PRESENT);
>> +
>> +        sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) + (1UL << PAGE_SHIFT);
> 
> NIT: While you are modifying the indentation. Couldn't we use PAGE_MASK and PAGE_SIZE here?

Oh, yes, this would be nice.

Jan

