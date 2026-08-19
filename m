Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D352C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 09:29:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394960.1633551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwcc6-00063i-6S; Wed, 19 Aug 2026 09:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394960.1633551; Wed, 19 Aug 2026 09:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwcc6-00063b-1v; Wed, 19 Aug 2026 09:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1394960;
 Wed, 19 Aug 2026 09:29:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wwcc5-00063V-Ls
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:29:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwcc4-0023kS-VP
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:29:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a857776-8faa-0a2a0a5109dd-0a2a450abf16-26
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:29:36 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a85777d-f2d2-0a2a450a0019-a0658309992a-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 11:29:34 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id DDFEA833DCF6;
 Wed, 19 Aug 2026 05:27:37 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v4] x86/nSVM: Validate the L1 IOPM physical address range
Date: Wed, 19 Aug 2026 10:25:38 +0100
Message-ID: <20260819092538.2765153-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e6f35ea6-77e2-481a-b695-421087e60edf@suse.com>
References: <e6f35ea6-77e2-481a-b695-421087e60edf@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787131774-4BAD4CFC-156D7123/0/0
X-purgate-type: clean
X-purgate-size: 2169

On 18.08.2026 11:23, Jan Beulich wrote:
>On 17.08.2026 18:59, Abdelkareem Abdelsaamad wrote:
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -282,7 +282,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
>>      return 0;
>>  }
>>  
>> -static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>> +static int nsvm_vmrun_permissionmap(struct vcpu *v)
>>  {
>>      struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
>>      struct nestedsvm *svm = &vcpu_nestedsvm(v);
>> @@ -294,6 +294,17 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>>      enum hvm_translation_result ret;
>>      unsigned long *ns_viomap;
>>      bool ioport_80 = true, ioport_ed = true;
>> +    /* IOPM is structured as a linear array of 64K+3 bits. */
>> +    const unsigned long nr_iopm_additional_pages = PFN_DOWN((0x10000 + 8) / 8 - 1);
>
>Hm, the expression I did suggest was indeed off by one, yet yours doesn't fit
>the comment very well. What's wrong with PFN_DOWN((0x10000 + 3) / 8) or
>PFN_DOWN((0xffff + 4) / 8)?
In the expression I wrote, I was trying to maintain maximum fidelity to the
exact byte count and fetch the last byte index, even though PFN_DOWN ultimately
maps both 8192 and 8193 to 2 pages to have more fidelity to the original
calculation. It probaly looks a bit over-engineered but I wanted to keep as
much fidelity to the actual expression.
> +    gfn_t ns_iopm_end =
> +        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), nr_iopm_additional_pages);
>
>I'm also inclined to suggest to drop the local variable, as it's used just
>here. The overall result would be
>
>    /* IOPM is structured as a linear array of 64K+3 bits. */
>    gfn_t ns_iopm_end = gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa),
>                                PFN_DOWN((0x10000 + 3) / 8));
>
>which imo is a little easier to follow. Preferably with those adjustments
>(happy to carry out while committing, but please confirm):
Sounds good to me! Please go ahead and drop it while committing. Thank you.
>Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>Jan

