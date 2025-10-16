Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D067CCD194
	for <xen-devel@archiver.kernel.org>; Thu, 16 Oct 2025 07:36:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1144229.1477682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IWq-0002EP-UI; Thu, 16 Oct 2025 07:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144229.1477682; Thu, 16 Oct 2025 07:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IWq-0002EI-RY; Thu, 16 Oct 2025 07:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1144229;
 Thu, 16 Oct 2025 07:36:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8szn=4Z=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1v9ITS-0006T6-MF
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:32:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 45169db3-aa62-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:32:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B64F21688;
 Thu, 16 Oct 2025 00:32:20 -0700 (PDT)
Received: from [10.57.65.134] (unknown [10.57.65.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F1683F6A8;
 Thu, 16 Oct 2025 00:32:20 -0700 (PDT)
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
X-Inumbo-ID: 45169db3-aa62-11f0-980a-7dc792cee155
Message-ID: <54f183bb-33ce-4b9c-91a9-827a6ed198d6@arm.com>
Date: Thu, 16 Oct 2025 09:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] x86/xen: simplify flush_lazy_mmu()
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-3-kevin.brodsky@arm.com>
 <35d9cf4f-135e-4786-a4e3-fd3a4a18b800@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <35d9cf4f-135e-4786-a4e3-fd3a4a18b800@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2025 18:52, Dave Hansen wrote:
> On 10/15/25 01:27, Kevin Brodsky wrote:
>> While at it, we can also avoid preempt_disable() if we are not
>> in lazy MMU mode - xen_get_lazy_mode() should tolerate preemption.
> ...
>>  static void xen_flush_lazy_mmu(void)
>>  {
>> -	preempt_disable();
>> -
>>  	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
>> -		arch_leave_lazy_mmu_mode();
>> -		arch_enter_lazy_mmu_mode();
>> +		preempt_disable();
>> +		xen_mc_flush();
>> +		preempt_enable();
>>  	}
> But xen_get_lazy_mode() does:
>
> 	this_cpu_read(xen_lazy_mode);
>
> Couldn't preemption end up doing the 'xen_lazy_mode' read and the
> xen_mc_flush() on different CPUs?
>
> That seems like a problem. Is there a reason it's safe?

You're right, I was thinking in terms of task, but xen_mc_flush() does
operate on the current CPU (and it's called when context-switching).
Will restore the original order in v4.

- Kevin


