Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8961C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:50:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85246223DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85246223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71688.128573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Hc5-0005nl-1n; Wed, 20 Jan 2021 17:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71688.128573; Wed, 20 Jan 2021 17:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Hc4-0005ne-Ux; Wed, 20 Jan 2021 17:49:48 +0000
Received: by outflank-mailman (input) for mailman id 71688;
 Wed, 20 Jan 2021 17:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkA9=GX=arm.com=vladimir.murzin@srs-us1.protection.inumbo.net>)
 id 1l2Hc4-0005nZ-8l
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:49:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 06011854-411a-43cf-a3be-3e21f15d0994;
 Wed, 20 Jan 2021 17:49:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAF4414FF;
 Wed, 20 Jan 2021 09:49:27 -0800 (PST)
Received: from [10.57.9.138] (unknown [10.57.9.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEFE43F68F;
 Wed, 20 Jan 2021 09:49:14 -0800 (PST)
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
X-Inumbo-ID: 06011854-411a-43cf-a3be-3e21f15d0994
Subject: Re: [XEN PATCH] xen/arm: Hide Pointer Authentication (PAC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
References: <20210120112712.9534-1-vladimir.murzin@arm.com>
 <2b70b207-4893-e08a-6fdc-52c0b5c8cc6b@xen.org>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <1b1049e2-d12e-b0ba-e101-e63e5d887712@arm.com>
Date: Wed, 20 Jan 2021 17:49:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2b70b207-4893-e08a-6fdc-52c0b5c8cc6b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/20/21 5:44 PM, Julien Grall wrote:
> Hi Vladimir,
> 
> On 20/01/2021 11:27, Vladimir Murzin wrote:
>> The ARMv8.3 Pointer Authentication extension is not supported by Xen
>> at the moment, so do not expose that via ID register.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   xen/arch/arm/cpufeature.c        |  6 +++++
>>   xen/include/asm-arm/cpufeature.h | 38 +++++++++++++++++++++++++++++++-
>>   2 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 99fe4db28..1d8878380 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -187,6 +187,12 @@ static int __init create_guest_cpuinfo(void)
>>         /* Hide MTE support as Xen does not support it */
>>       guest_cpuinfo.pfr64.mte = 0;
>> +
>> +    /* Hide PAC support as Xen does not support it */
>> +    guest_cpuinfo.isa64.apa = 0;
>> +    guest_cpuinfo.isa64.api = 0;
>> +    guest_cpuinfo.isa64.gpa = 0;
>> +    guest_cpuinfo.isa64.gpi = 0;
>>   #endif
>>         /* Hide AMU support */
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
>> index c6e5711b2..43135abef 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -212,8 +212,44 @@ struct cpuinfo_arm {
>>           };
>>       } mm64;
>>   -    struct {
>> +    union {
>>           uint64_t bits[2];
>> +        struct {
>> +            /* ISAR0 */
>> +            unsigned long __res0:4;
>> +            unsigned long aes:4;
>> +            unsigned long sha1:4;
>> +            unsigned long sha2:4;
>> +            unsigned long crc32:4;
>> +            unsigned long atomic:4;
>> +            unsigned long __res1:4;
>> +            unsigned long rdm:4;
>> +            unsigned long sha3:4;
>> +            unsigned long sm3:4;
>> +            unsigned long sm4:4;
>> +            unsigned long dp:4;
>> +            unsigned long fhm:4;
>> +            unsigned long ts:4;
>> +            unsigned long tlb:4;
>> +            unsigned long rndr:4;
>> +
>> +            /* ISAR1 */
>> +            unsigned long dpb:4;
>> +            unsigned long apa:4;
>> +            unsigned long api:4;
>> +            unsigned long jscvt:4;
>> +            unsigned long fcma:4;
>> +            unsigned long lrcpc:4;
>> +            unsigned long gpa:4;
>> +            unsigned long gpi:4;
>> +            unsigned long frintts:4;
>> +            unsigned long sb:4;
>> +            unsigned long specres:4;
>> +            unsigned long bf16:4;
>> +            unsigned long dgh:4;
>> +            unsigned long i8mm:4;
>> +            unsigned long __res0:8;
> 
> This unfortunately break the build on arm64 becase __res0 is defined twiced in the structure:
> 
> oss/xen/xen/include/asm/cpufeature.h:251:27: error: duplicate member ‘__res0’
>              unsigned long __res0:8;
>                            ^~~~~~
> 

Sorry about that, I should have double checked that patch still compiles.

> The change is trivial, so I have resolved it (see change below) and committed it:
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 2baf7919615d..70cb67301f74 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -248,7 +248,7 @@ struct cpuinfo_arm {
>              unsigned long bf16:4;
>              unsigned long dgh:4;
>              unsigned long i8mm:4;
> -            unsigned long __res0:8;
> +            unsigned long __res2:8;
>          };
>      } isa64;
> 

LGTM, Great Thanks!

Vladimir

> Cheers,
> 


