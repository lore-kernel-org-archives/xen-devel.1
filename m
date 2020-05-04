Return-Path: <SRS0=jOUd=6S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999ABC47257
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 08:54:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C5620721
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 08:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73C5620721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVWr3-0003Ws-Td; Mon, 04 May 2020 08:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVWr3-0003Wn-5g
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 08:53:37 +0000
X-Inumbo-ID: bd972bc6-8de4-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd972bc6-8de4-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 08:53:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 115D4AC61;
 Mon,  4 May 2020 08:53:37 +0000 (UTC)
Subject: Re: [PATCH] x86/amd: Initial support for Fam19h processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200430095947.31958-1-andrew.cooper3@citrix.com>
 <471aaf7e-497f-edd2-6eb0-06d337a23538@suse.com>
 <9dc3a9e6-4a86-f24a-b279-59fec5ef22d8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9106a1bf-fcc9-1ea3-97ae-e13432fa1236@suse.com>
Date: Mon, 4 May 2020 10:53:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9dc3a9e6-4a86-f24a-b279-59fec5ef22d8@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 17:50, Andrew Cooper wrote:
> On 30/04/2020 12:09, Jan Beulich wrote:
>> On 30.04.2020 11:59, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/microcode/amd.c
>>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>>> @@ -125,6 +125,7 @@ static bool_t verify_patch_size(uint32_t patch_size)
>>>          max_size = F16H_MPB_MAX_SIZE;
>>>          break;
>>>      case 0x17:
>>> +    case 0x19:
>>>          max_size = F17H_MPB_MAX_SIZE;
>>>          break;
>> Didn't you indicate to me the other day that the upper bound would
>> grow?
> 
> That was a very non-specific patch to Linux.  I've asked around, and the
> answer seems to be 4800.
> 
> Are you happy for your review to stand with adding a new
> F19H_MPB_MAX_SIZE define to this effect?

Yes.

Jan

