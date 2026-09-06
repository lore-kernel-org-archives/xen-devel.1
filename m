Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A46C79F85
	for <xen-devel@archiver.kernel.org>; Sun,  6 Sep 2026 13:37:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410267.1641343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3D3M-0004gZ-H3; Sun, 06 Sep 2026 13:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410267.1641343; Sun, 06 Sep 2026 13:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3D3M-0004gR-Dj; Sun, 06 Sep 2026 13:37:00 +0000
Received: by outflank-mailman (input) for mailman id 1410267;
 Sun, 06 Sep 2026 13:37:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1x3D3M-0004gL-0v
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 13:37:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3D3L-006VLh-DC
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 15:36:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a9d6c1e-2eae-0a2a0a5409dd-0a2a4501dae8-32
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 15:36:59 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a9d6a5d-5984-0a2a45010019-a0658309caa2-3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 15:27:58 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 858D183FBC99;
 Sun,  6 Sep 2026 09:25:52 -0400 (EDT)
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
Subject: Re: Re: Re: [PATCH v4] x86/nSVM: Check injected event consistency
Date: Sun,  6 Sep 2026 14:22:48 +0100
Message-ID: <20260906132248.3121411-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906131117.3121334-1-abdelkareem.abdelsaamad@citrix.com>
References: <20260906131117.3121334-1-abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788701278-1D272757-18EA1D61/13/0
X-purgate-type: clean
X-purgate-size: 1560

>>> @@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>>      svm_dump_sel("  TR", &vmcb->tr);
>>>  }
>>>  
>>> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>>> +    uint8_t vmcb_injected_vector)
>>> +{
>>> +    switch ( vmcb_injected_vector )
>>> +    {
>>> +    case X86_EXC_DE:
>>> +    case X86_EXC_DB:
>>> +    case X86_EXC_BP:
>>> +    case X86_EXC_UD:
>>> +    case X86_EXC_NM:
>>> +    case X86_EXC_DF:
>>> +    case X86_EXC_TS:
>>> +    case X86_EXC_NP:
>>> +    case X86_EXC_SS:
>>> +    case X86_EXC_GP:
>>> +    case X86_EXC_PF:
>>> +    case X86_EXC_MF:
>>> +    case X86_EXC_AC:
>>> +    case X86_EXC_MC:
>>
>>Is #MC valid to inject without CR4.MCE set?
>The testing I performed (see previous comment) does not show that set CR4.MCE
>is required for the valid injection.
>>> +    case X86_EXC_XM:
>>
>>As before: Doesn't #XM (AMD: #XF) require CR4.OSXMMEXCPT to be set?
>The testing I performed (see previous comment) does not show that set CR4.MCE
>is required for the valid injection.
I meant ..does not show that set CR4.OSXMMEXCPT is required.
>>
>>Again as before: Is #SX really permitted without any constraints? You did
>>reply to both comments on v3, but that outcome isn't reflected here. The
>>more that what you said there could equally apply ...
>The testing I performed (see the first comment) does not show that set CR4.MCE
>is required for the valid injection.
I meant ..does not show that any CR4 bit is required.

