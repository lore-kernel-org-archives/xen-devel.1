Return-Path: <SRS0=ng2r=AA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB2AC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2020 13:39:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FD320DD4
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2020 13:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9FD320DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmHF6-00023j-Ei; Fri, 19 Jun 2020 13:39:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmHF4-00023d-Tb
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:39:38 +0000
X-Inumbo-ID: 51b41410-b232-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51b41410-b232-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 13:39:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71AF6AAF1;
 Fri, 19 Jun 2020 13:39:36 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <32440578-e346-85cc-abad-1aa5694f0ab2@suse.com>
 <855c1668-3f91-c084-70d5-76f3e171f074@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2152e32-ab27-12d2-f82c-7108c0c9867b@suse.com>
Date: Fri, 19 Jun 2020 15:39:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <855c1668-3f91-c084-70d5-76f3e171f074@citrix.com>
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
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 15:28, Andrew Cooper wrote:
> On 19/06/2020 13:48, Jan Beulich wrote:
>> On 19.06.2020 13:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -168,6 +168,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>      case MSR_TSX_FORCE_ABORT:
>>>      case MSR_TSX_CTRL:
>>>      case MSR_MCU_OPT_CTRL:
>>> +    case MSR_RTIT_OUTPUT_BASE:
>>> +    case MSR_RTIT_OUTPUT_MASK:
>>> +    case MSR_RTIT_CTL:
>>> +    case MSR_RTIT_STATUS:
>>> +    case MSR_RTIT_CR3_MATCH:
>>> +    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):
>> The respective CPUID field is 3 bits wide, so wouldn't it be better
>> to cover the full possible range (0...6 afaict)?
> 
> Last time I tried, you objected to me covering MSR ranges which weren't
> defined.

Wasn't that for a range where some number had been re-used from
earlier models (with entirely different purpose)?

> If you want to extend the range like that, it ought to be
> MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7) to cover the entire area
> which seems to be exclusively for PT.

I'd be okay with that, just that I'm not sure about (7): While
SDM Vol 2 oddly enough doesn't seem to list anything for leaf 7
subleaf 1 (or I'm sufficiently blind today), Vol 4 clearly says
for n=0...3 "If CPUID.(EAX=07H,ECX=1):EAX[2:0] > <n>", and the
field obviously can't be > 7.

Jan

