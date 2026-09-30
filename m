Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67738CA5FAD
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 01:27:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436791.1655461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBj60-0000wO-07; Wed, 30 Sep 2026 01:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436791.1655461; Wed, 30 Sep 2026 01:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBj5z-0000wG-Re; Wed, 30 Sep 2026 01:26:55 +0000
Received: by outflank-mailman (input) for mailman id 1436791;
 Wed, 30 Sep 2026 01:26:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xBj5z-0000wA-0D
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 01:26:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBj5x-00FLbq-Tf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 03:26:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6abc6546-e002-0a2a0a5209dd-0a2a450aa41a-4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:26:53 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6abc655c-f2d2-0a2a450a0019-a06583088232-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:26:53 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 0F37B460CF49;
 Tue, 29 Sep 2026 21:24:45 -0400 (EDT)
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
From: Lin Liu <lin.liu01@citrix.com>
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	lin.liu01@citrix.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/nSVM: Save L2's CR0, CR4 and EFER on #VMEXIT, not Xen's
Date: Wed, 30 Sep 2026 01:26:51 +0000
Message-ID: <20260930012651.1663413-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <252b42e8-d710-46f6-b837-21a9e6198d46@suse.com>
References: <252b42e8-d710-46f6-b837-21a9e6198d46@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790731613-5A7DACFC-07EF3EAB/0/0
X-purgate-type: clean
X-purgate-size: 1164

>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -1079,11 +1079,11 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>      ns_vmcb->_cpl = n2vmcb->_cpl;
>>  
>>      /* EFER */
>> -    ns_vmcb->_efer = n2vmcb->_efer;
>> +    ns_vmcb->_efer = v->arch.hvm.guest_efer;
>>  
>>      /* CRn */
>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>> -    ns_vmcb->_cr0 = n2vmcb->_cr0;
>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>> +    ns_vmcb->_cr0 = v->arch.hvm.guest_cr[0];
>>  
>>      /* DRn */
>>      ns_vmcb->_dr7 = n2vmcb->_dr7;
>
>... I still think it is a mistake to leave alone the similar CR2 handling
>code further down in the function. Yes, #PF handling in
>nsvm_vcpu_vmexit_inject() updates the value, but as indicated before that
>(aiui) still leaves (at least) the case where L2 writes CR2 explicitly.
> ...
> Jan

Sorry I was about to reply in the thread of v1 ...

Yes, L2 guest can write CR2 explicitly, and the value goes to the shadow, e.g:
n2vmcb, which is the good reason the value need to be copied back from n2vmcb,
rather than the guest_cr backup.

Lin

