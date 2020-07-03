Return-Path: <SRS0=DZRD=AO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8602AC433DF
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2020 05:15:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DBB120772
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2020 05:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DBB120772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrE2u-0002z2-Dl; Fri, 03 Jul 2020 05:15:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbuU=AO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jrE2s-0002yx-PU
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 05:15:30 +0000
X-Inumbo-ID: 3617d24a-bcec-11ea-891d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3617d24a-bcec-11ea-891d-12813bfff9fa;
 Fri, 03 Jul 2020 05:15:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33B3FB03E;
 Fri,  3 Jul 2020 05:15:29 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] x86/xen: remove 32-bit Xen PV guest support
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20200701110650.16172-1-jgross@suse.com>
 <20200701110650.16172-2-jgross@suse.com>
 <6d0b517a-6c53-61d3-117b-40e33e013037@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <96159aed-9fdb-9fcb-a1b1-7c6c2c47e6a1@suse.com>
Date: Fri, 3 Jul 2020 07:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6d0b517a-6c53-61d3-117b-40e33e013037@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.07.20 00:59, Boris Ostrovsky wrote:
> On 7/1/20 7:06 AM, Juergen Gross wrote:
>> Xen is requiring 64-bit machines today and since Xen 4.14 it can be
>> built without 32-bit PV guest support. There is no need to carry the
>> burden of 32-bit PV guest support in the kernel any longer, as new
>> guests can be either HVM or PVH, or they can use a 64 bit kernel.
>>
>> Remove the 32-bit Xen PV support from the kernel.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/entry/entry_32.S      | 109 +----------
>>   arch/x86/include/asm/proto.h   |   2 +-
>>   arch/x86/include/asm/segment.h |   2 +-
>>   arch/x86/kernel/head_32.S      |  31 ---
>>   arch/x86/xen/Kconfig           |   3 +-
>>   arch/x86/xen/Makefile          |   3 +-
>>   arch/x86/xen/apic.c            |  17 --
>>   arch/x86/xen/enlighten_pv.c    |  48 +----
> 
> 
> Should we drop PageHighMem() test in set_aliased_prot()?
> 
> 
> (And there are few other places where is is used, in mmu_pv.c)

Yes, will drop those.

> 
> 
> 
>> @@ -555,13 +547,8 @@ static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
>>   	 * exception between the new %fs descriptor being loaded and
>>   	 * %fs being effectively cleared at __switch_to().
>>   	 */
>> -	if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_CPU) {
>> -#ifdef CONFIG_X86_32
>> -		lazy_load_gs(0);
>> -#else
> 
> 
> I think this also needs an adjustment to the preceding comment.

Yes.

> 
> 
>>   
>> -#ifdef CONFIG_X86_PAE
>> -static void xen_set_pte_atomic(pte_t *ptep, pte_t pte)
>> -{
>> -	trace_xen_mmu_set_pte_atomic(ptep, pte);
>> -	__xen_set_pte(ptep, pte);
> 
> 
> Probably not for this series but I wonder whether __xen_set_pte() should
> continue to use hypercall now that we are 64-bit only.

As Andrew wrote already the hypercall will be cheaper.

I'll adjust the comment, though.

> 
> 
>> @@ -654,14 +621,12 @@ static int __xen_pgd_walk(struct mm_struct *mm, pgd_t *pgd,
> 
> 
> Comment above should be updated.

Yes.


Juergen

