Return-Path: <SRS0=FTuz=6G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EBBC5518A
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 09:04:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731DB20735
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 09:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731DB20735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBIh-0003Tw-Pp; Wed, 22 Apr 2020 09:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRBIf-0003Tr-Nr
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:04:09 +0000
X-Inumbo-ID: 3974c1c0-8478-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3974c1c0-8478-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 09:04:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BCCDBAB8F;
 Wed, 22 Apr 2020 09:04:06 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86/HVM: expose VM assist hypercall
To: Julien Grall <julien@xen.org>
References: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
 <5ed6b8a1-1f05-c24b-b3a8-d170a315d92a@suse.com>
 <2c5a677e-0327-8924-7ac3-2ae7d673be94@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5a28434-d6c9-f920-d8a8-070cb23c62a4@suse.com>
Date: Wed, 22 Apr 2020 11:04:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2c5a677e-0327-8924-7ac3-2ae7d673be94@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 10:57, Julien Grall wrote:
> On 21/04/2020 15:39, Jan Beulich wrote:
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -269,6 +269,8 @@ static inline void free_vcpu_guest_conte
>>     static inline void arch_vcpu_block(struct vcpu *v) {}
>>   +#define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
> 
> NIT: Do we want to evaluate d?

I didn't think we need to, given the very limited use of the
macro.

> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

