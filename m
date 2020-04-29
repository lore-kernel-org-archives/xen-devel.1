Return-Path: <SRS0=DK6E=6N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F05EC83003
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2020 13:29:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A072085B
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2020 13:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A072085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmm6-0008R0-3l; Wed, 29 Apr 2020 13:29:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTmm4-0008Qv-Ak
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:29:16 +0000
X-Inumbo-ID: 6ba63afc-8a1d-11ea-9949-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ba63afc-8a1d-11ea-9949-12813bfff9fa;
 Wed, 29 Apr 2020 13:29:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 166B5ABD0;
 Wed, 29 Apr 2020 13:29:14 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/pv: Short-circuit is_pv_{32,64}bit_domain() in
 !CONFIG_PV32 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-3-andrew.cooper3@citrix.com>
 <9b721f94-92de-8d23-b9a4-fdaae13aec38@suse.com>
 <0300a420-2979-d788-c158-12d580e412ee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <128b382e-e601-d09f-95de-fa9f7b0b2318@suse.com>
Date: Wed, 29 Apr 2020 15:29:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0300a420-2979-d788-c158-12d580e412ee@citrix.com>
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

On 29.04.2020 15:13, Andrew Cooper wrote:
> On 20/04/2020 15:09, Jan Beulich wrote:
>> On 17.04.2020 17:50, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/pv/domain.c
>>> +++ b/xen/arch/x86/pv/domain.c
>>> @@ -215,7 +215,7 @@ int switch_compat(struct domain *d)
>>>          return 0;
>>>  
>>>      d->arch.has_32bit_shinfo = 1;
>>> -    d->arch.is_32bit_pv = 1;
>>> +    d->arch.pv.is_32bit = 1;
>>>  
>>>      for_each_vcpu( d, v )
>>>      {
>>> @@ -235,7 +235,7 @@ int switch_compat(struct domain *d)
>>>      return 0;
>>>  
>>>   undo_and_fail:
>>> -    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
>>> +    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
>>>      for_each_vcpu( d, v )
>>>      {
>>>          free_compat_arg_xlat(v);
>>> @@ -358,7 +358,7 @@ int pv_domain_initialise(struct domain *d)
>>>      d->arch.ctxt_switch = &pv_csw;
>>>  
>>>      /* 64-bit PV guest by default. */
>>> -    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
>>> +    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
>> Switch to true/false while you're touching these?
> 
> Yes, but I'm tempted to delete these lines in the final hunk.  Its
> writing zeros into a zeroed structures.

Oh, yes, agreed.

Jan

