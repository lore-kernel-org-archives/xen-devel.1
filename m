Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C143FC9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 09:27:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435808.1654605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7dM-0006Tu-Rn; Mon, 28 Sep 2026 09:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435808.1654605; Mon, 28 Sep 2026 09:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7dM-0006Tn-Of; Mon, 28 Sep 2026 09:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1435808;
 Mon, 28 Sep 2026 09:26:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xB7dL-0006Th-MY
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:26:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB7dK-002GC3-Ek
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:26:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aba32d7-8faa-0a2a0a5109dd-0a2a4509a0ae-8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:26:50 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aba32d9-be1a-0a2a45090019-a0658308ba00-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:26:50 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 869D644E2AD5;
 Mon, 28 Sep 2026 05:24:43 -0400 (EDT)
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
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
Date: Mon, 28 Sep 2026 09:26:47 +0000
Message-ID: <20260928092647.1558693-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8bc996ec-09c0-4241-bc3a-64dbf44c5e5f@suse.com>
References: <8bc996ec-09c0-4241-bc3a-64dbf44c5e5f@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790587610-BD4C3034-BBB1E25B/0/0
X-purgate-type: clean
X-purgate-size: 881

>> On 23.09.2026 11:51, Lin Liu wrote:
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>      ns_vmcb->_efer = n2vmcb->_efer;
>>  
>>      /* CRn */
>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>>      ns_vmcb->_cr0 = n2vmcb->_cr0;
>
>In addition to mirroring the change to CR0 and EFER, doesn't CR2 also
>need handling the same way? Effectively the inverse direction of anything
>respective that nsvm_vmcb_prepare4vmrun() does?
>
>Jan

CR2 is different, it store the page fault address on #PF.
If #PF happens, xen as hardware emulator, should write back the CR2 as part of
guest state area. so copy from n2vmcb is the right behavior.

I will raise v2 to update all other CRs and EFER.

