Return-Path: <SRS0=ng2r=AA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38FDC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2020 15:50:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF39120706
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2020 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF39120706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmJHM-0005qd-7B; Fri, 19 Jun 2020 15:50:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmJHK-0005my-IP
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 15:50:06 +0000
X-Inumbo-ID: 8a7fe60e-b244-11ea-bbaf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a7fe60e-b244-11ea-bbaf-12813bfff9fa;
 Fri, 19 Jun 2020 15:50:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EBF79AD31;
 Fri, 19 Jun 2020 15:50:01 +0000 (UTC)
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <20200619153003.GB735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd788041-f2cd-c5fc-cfb8-df89816cb27c@suse.com>
Date: Fri, 19 Jun 2020 17:50:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619153003.GB735@Air-de-Roger>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 17:30, Roger Pau Monné wrote:
> On Fri, Jun 19, 2020 at 01:41:03AM +0200, Michał Leszczyński wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -1612,6 +1612,24 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>      return rc;
>>  }
>>  
>> +void hvm_vmtrace_destroy(struct vcpu *v)
>> +{
>> +    unsigned int i;
>> +    struct page_info *pg;
>> +    struct ipt_state *ipt = v->arch.hvm.vmx.ipt_state;
>> +    mfn_t buf_mfn = ipt->output_base >> PAGE_SHIFT;
> 
> Does this build? I think you are missing a _mfn(...) here?

This as well as ...

>> +    size_t buf_size = ipt->output_mask.size + 1;
>> +
>> +    xfree(ipt);
>> +    v->arch.hvm.vmx.ipt_state = NULL;
>> +
>> +    for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ )
>> +    {
>> +        pg = mfn_to_page(_mfn(mfn_add(buf_mfn, i)));

... the extra _mfn() here suggest the code was only ever built in
release mode so far.

Jan

