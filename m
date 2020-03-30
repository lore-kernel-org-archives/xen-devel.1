Return-Path: <SRS0=Uyyz=5P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CFAC43331
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2020 11:09:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC92220733
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2020 11:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC92220733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIsIH-0004Ij-Gh; Mon, 30 Mar 2020 11:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIsIF-0004Ic-Oz
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 11:09:23 +0000
X-Inumbo-ID: e9066a58-7276-11ea-b9c0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9066a58-7276-11ea-b9c0-12813bfff9fa;
 Mon, 30 Mar 2020 11:09:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69DBFAF90;
 Mon, 30 Mar 2020 11:09:22 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Simran Singhal <singhalsimran0@gmail.com>
References: <20200329045512.GA28203@simran-Inspiron-5558>
 <20200330101113.GP28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74649c0b-90b3-a6fb-4781-026202b92527@suse.com>
Date: Mon, 30 Mar 2020 13:09:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330101113.GP28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.03.2020 12:11, Roger Pau Monné wrote:
> On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
>> index f049920196..2edb103205 100644
>> --- a/xen/arch/x86/hvm/vmx/vvmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
>> @@ -253,12 +253,12 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
>>      return offset;
>>  }
>>  
>> -u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
>> +uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
>>  {
>>      union vmcs_encoding enc;
>> -    u64 *content = (u64 *) vvmcs;
>> +    uint64_t *content = vvmcs;
>>      int offset;
>> -    u64 res;
>> +    uint64_t res;
>>  
>>      enc.word = vmcs_encoding;
>>      offset = vvmcs_offset(enc.width, enc.type, enc.index);
>> @@ -307,12 +307,12 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
>>      return virtual_vmcs_vmread_safe(v, encoding, val);
>>  }
>>  
>> -void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
>> +void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
>>  {
>>      union vmcs_encoding enc;
>> -    u64 *content = (u64 *) vvmcs;
>> +    uint64_t *content = vvmcs;
>>      int offset;
>> -    u64 res;
>> +    uint64_t res;
> 
> Thanks for doing the switch of content to type uint64_t. You should
> however not change the type of res to uint64_t also IMO, as you are
> not touching that line anyway.

I actually wouldn't mind the patch being left as is?

> With that fixed:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Roger - please clarify if your R-b is also fine without the requested
adjustment.

Jan

