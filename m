Return-Path: <SRS0=NS8K=57=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB9AC2BA2B
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 06:57:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C3A206D9
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 06:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C3A206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jObzE-0006iM-By; Wed, 15 Apr 2020 06:57:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jObzD-0006iH-3S
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 06:57:27 +0000
X-Inumbo-ID: 5d081eee-7ee6-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d081eee-7ee6-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 06:57:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0402CAC6D;
 Wed, 15 Apr 2020 06:57:23 +0000 (UTC)
Subject: Re: [XEN PATCH v3] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <758e3427f147ed82774edcbbe80b0b29c812e6e4.1586862721.git.havanur@amazon.com>
 <3926fb02-2058-6e3a-6dcd-3ac5c4b97de5@suse.com>
 <5e86b2bc-2d79-3062-856b-c9babfcc5a16@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df3f7228-adc7-38ae-7eb0-366575d3c687@suse.com>
Date: Wed, 15 Apr 2020 08:57:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5e86b2bc-2d79-3062-856b-c9babfcc5a16@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Harsha Shamsundara Havanur <havanur@amazon.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 18:26, Andrew Cooper wrote:
> On 14/04/2020 15:12, Jan Beulich wrote:
>> On 14.04.2020 13:12, Harsha Shamsundara Havanur wrote:
>>> --- a/tools/firmware/hvmloader/pci.c
>>> +++ b/tools/firmware/hvmloader/pci.c
>>> @@ -84,6 +84,7 @@ void pci_setup(void)
>>>      uint32_t vga_devfn = 256;
>>>      uint16_t class, vendor_id, device_id;
>>>      unsigned int bar, pin, link, isa_irq;
>>> +    uint8_t pci_devfn_decode_type[256] = {};
>> I'm still waiting for a reply on my v1 comment on the stack
>> consumption of this, suggesting two 256-bit bitmaps instead.
> 
> 256 bytes of stack space isn't something to worry about.  Definitely not
> for the complexity of using bitmaps instead.

Complexity? hvmloader already has an odd partial set of bitmap
manipulation functions. Completing this doesn't seem overly
difficult. And while I agree that 256 bytes of stack space
_alone_ aren't much reason to worry, it is - as almost
always - the accumulation of local variables (over an entire
call tree, which isn't overly deep here) which counts. (Note
how the use of bitmaps would have avoided the truncation bug
that had been introduced into v2(?).)

Jan

