Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A33C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:52:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389883.1630488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTyl-0006wM-W6; Thu, 13 Aug 2026 11:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389883.1630488; Thu, 13 Aug 2026 11:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTyl-0006wE-SP; Thu, 13 Aug 2026 11:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1389883;
 Thu, 13 Aug 2026 11:52:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wuTyk-0006w7-LL
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:52:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTyk-006ElJ-1K
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:52:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dafd1-e002-0a2a0a5209dd-0a2a4501d4f2-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:52:09 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dafe7-5984-0a2a45010019-888fbc3352ca-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:52:09 +0200
Received: by mx.zohomail.com with SMTPS id 1786621916845447.51828945348825;
 Thu, 13 Aug 2026 04:51:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1786621919; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KwItdb5ZuNsg+q/yt7Bycy/sDqtQlm7BAtPrQOcQ4QIK5ewK+pvSCPS0m4486360pZ8ncr56cLA+wRmDh22hATR5Ysb8w8B0I+qNyZf9OIaNQg3pTHcFd4FlDHF6Qv2aJPcVrulpR6GemFWNjiqTRYOAZ7bDWauK9CG9Ig0QqbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786621919; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Brmj6kD7q7zLBYdskHDr3VnIZX9DfS8N1MF6VyKYuAk=; 
	b=VlPMCvl7aj0xevvWHczV+uBs/WMpFlSybTEqAxMseo3+ekKppp86n3w1+jneICZ4pO77NVvAmwdZ1aW9pL3L5R2UI8bI/HoVUZgRt0qn3JUliFmAp6+zZ/zebOPnRqxmA9yATfVZzpGvhmS7PhlodypVTHhQrbzTZnGJ07nZKJE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786621919;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Brmj6kD7q7zLBYdskHDr3VnIZX9DfS8N1MF6VyKYuAk=;
	b=iDr/Ro6B4PbOgTsRjR7XcWdO7o1I5hP6WDg0uHk3a309Rk6MB4NL4N/Qzcjyg592
	P1DHSS+sA/34hBS0KscUGLJTbmHakxa/P6/ntUfamCsCh2Wk3Rvkl1yG0aJ1tBPi7Jr
	7D158AGNbvFLUe+jbGgy9YRnaPK4jqG00mekKYPE=
Message-ID: <e5799ee9-6a97-4ad8-b1c4-6b54e43b7a4d@apertussolutions.com>
Date: Thu, 13 Aug 2026 07:51:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] x86/mm: get_page_from_l1e() is PV-or-shadow-only
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
 <4531d02a-3a37-4c57-ba17-32034ba08cf9@apertussolutions.com>
 <b742fec6-730a-4138-b5f5-7197f24df247@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b742fec6-730a-4138-b5f5-7197f24df247@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d62444/1786621929-BF063757-1557C914/0/0
X-purgate-type: clean
X-purgate-size: 3139

On 8/3/26 6:11 AM, Jan Beulich wrote:
> On 02.08.2026 17:55, Daniel P. Smith wrote:
>> On 7/28/26 9:18 AM, Jan Beulich wrote:
>>> Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
>>> With the function compiled out, its dedicated XSM hook also becomes
>>> unreachable, so it is similarly guarded.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> It feels suspicious that the .priv_mapping() check is used for HVM guests
>>> in shadow mode, but not for ones in HAP mode.
>>
>> I believe a hint to it is laying in the comment,
>>
>>    /*
>>     * Let privileged domains transfer the right to map their target
>>     * domain's pages. This is used to allow stub-domain pvfb export to
>>     * dom0, until pvfb supports granted mappings. At that time this
>>     * minor hack can go away.
>>     */
>>
>> Correct me if I am wrong, but get_page_from_l1e() is only used by PV and
>> HVM + Shadow. When in HVM + HAP is mapping a guest page, it is done
>> through p2m_get_foreign() which will then be covered by
>> xsm_map_gmfn_foreign(). So only HVM + Shadow can hit TARGET_HACK check.
> 
> Yes, sure; that wasn't the point of my comment. The point was that I'd
> expect _the same_ hook to be used by the other path. Aiui if you make a
> policy, you want same situations dealt with the same. Hence there shouldn't
> be a need to express the same thing two ways.
> 

But it's not the same, the enforcement mechanism is different. FLASK is 
an evaluation of Subject/Object/Predicate. In this case the mechanism 
(software enforced access) that provides the Predicate has enough risk 
that it warranted itself a separate check to allow fine grained 
assignment of the operation to a specific domain which was driven by a 
specific use case.

>> I think the question is how to address the TARGET_HACK situation.
> 
> I fear I don't really know what exactly you mean here.
> 

Is this path still needed for the pvfb or is it now in use by other use 
cases. If the former, then close the ability otherwise TARGET_HACK 
should be renamed to something sensible for general case. Some code 
documentation might be necessary to help understand why/

>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -837,6 +837,8 @@ static int cf_check print_mmio_emul_rang
>>>    }
>>>    #endif
>>>    
>>> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>>> +
>>>    /*
>>>     * get_page_from_l1e returns:
>>>     *   0  => success (page not present also counts as such)
>>> @@ -1038,6 +1040,8 @@ get_page_from_l1e(
>>>        return -EBUSY;
>>>    }
>>>    
>>> +#endif /* CONFIG_PV || CONFIG_SHADOW_PAGING */
>>> +
>>
>> Would it also not be prudent to #ifdef out the declaration in asm/mm.h?
> 
> Ah, yes, this looks possible for this function - the decl isn't needed for any
> DCE-ing by the compiler.
> 
>> I think it would be a good defensive approach to condition out the
>> header declaration. Otherwise,
>>
>> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Thanks, also for all the others.
> 
> Jan


