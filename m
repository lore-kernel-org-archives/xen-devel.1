Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0226C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:45:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375797.1622870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3fF-00049p-Il; Wed, 29 Jul 2026 12:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375797.1622870; Wed, 29 Jul 2026 12:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3fF-00049i-GB; Wed, 29 Jul 2026 12:45:37 +0000
Received: by outflank-mailman (input) for mailman id 1375797;
 Wed, 29 Jul 2026 12:45:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wp3fE-00049b-5h
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:45:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp3fD-00EM4e-BL
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:45:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a69f5ed-5cb7-0a2a0a5109dd-0a2a450cc740-18
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:45:35 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a69f5ed-f479-0a2a450c0019-a0658308a23a-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:45:34 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 0F534445786E;
 Wed, 29 Jul 2026 08:43:58 -0400 (EDT)
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
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v1] x86/nSVM: Check the L1 IOPM_BASE and MSRPM_BASE
Date: Wed, 29 Jul 2026 13:42:46 +0100
Message-ID: <20260729124246.2183527-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6cacbf75-7dc2-4eee-9791-8d434446165a@suse.com>
References: <6cacbf75-7dc2-4eee-9791-8d434446165a@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785329134-00ACCA5B-1CD6B30C/0/0
X-purgate-type: clean
X-purgate-size: 2185

On 28.07.2026 16:00, Jan Beulich wrote: 
>On 28.07.2026 13:41, Abdelkareem Abdelsaamad wrote:
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -18,6 +18,8 @@
>>  
>>  #define NSVM_ERROR_VVMCB        1
>>  #define NSVM_ERROR_VMENTRY      2
>> +#define IOPM_MAX_PAGES_DIFF     2
>> +#define MSRPM_MAX_PAGES_DIFF    1

>I see little value in these constants, the more that from their names alone
>one cannot infer what they're meant to represent. Furthermore the difference
>between the two checks you add makes clear that in the latter one you open-
>code MSRPM_MAX_PAGES_DIFF being 1.
I will change to IOPM_PAGES and MSRPM_PAGES in v2. I think it is preferrable to
use named constants rather than magic numbers?

>> @@ -295,6 +297,23 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>>      unsigned long *ns_viomap;
>>      bool ioport_80 = true, ioport_ed = true;
>> 
>> +    if ( (domain_get_maximum_gpfn(v->domain) < IOPM_MAX_PAGES_DIFF) ||
>>
>Leaving aside that it's questionable whether a domain with just two pages
>can actually run sensibly, I think there's an off-by-one here, but I
>further think the check isn't needed. After all ...
>
>> +         (gfn_x(_gfn(ns_vmcb->_iopm_base_pa >> PAGE_SHIFT)) >
>
>... the shift here guarantees that adding IOPM_MAX_PAGES_DIFF to the
>result would not overflow (unless that constant was really huge).
For the calculation, my thinking is that domain_get_maximum_gpfn returns the
maximum frame number index and the IOPM spans 3 pages, which is why I do not
think there is an off-by-one in the calculation. I completely agree with the
larger point: because of the PAGE_SHIFT and the 2-page domain, I also do not
believe, is a realistic guest. I will change the check in v2.
>
>Also please use gaddr_to_gfn() (or PFN_DOWN()) instead of open-coding.
I Will change in v2.

>> +        gdprintk(XENLOG_ERR, "nsvm_vmrun_permissionmap invalid _iopm_base_pa"
>> +                 " address (%#"PRIx64")\n", ns_vmcb->_iopm_base_pa);

>When you want the function name in a log message, please use __func__.
Yes, I will change in v2.
>Jan


