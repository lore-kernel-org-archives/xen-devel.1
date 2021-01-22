Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B810C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 20:43:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C9523B06
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 20:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C9523B06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73100.131787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l33Gr-0002yB-Hq; Fri, 22 Jan 2021 20:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73100.131787; Fri, 22 Jan 2021 20:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l33Gr-0002y4-Ev; Fri, 22 Jan 2021 20:43:05 +0000
Received: by outflank-mailman (input) for mailman id 73100;
 Fri, 22 Jan 2021 20:43:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l33Gq-0002xz-26
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 20:43:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l33Gj-0007pC-Fb; Fri, 22 Jan 2021 20:42:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l33Gj-0007RK-8y; Fri, 22 Jan 2021 20:42:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=WzdBfJUTzt/uP+uGk2PfCEHSISs2fpLozBEh7TrxPWQ=; b=ecm11d9KrdZdfb1I3E4RfgXVji
	fTLDjQ1uc37DEqoLYB66r8wWeIfzthX2uWrSGs8zZCn/ovtQ/dQHm2xodCVkrz4COqlTLH9XktU/f
	mNu7uNX02a4FvqNr+vLc3JCwCnic82BiUgHwkMDM2YPdAa/8WS94oUbL/8pdPWDPsMJA=;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <edc67950-7d8f-5551-23c6-7b4a398ec9cf@xen.org>
 <189bbbab-e3c6-c7d4-84af-63e568f23dd3@oracle.com>
 <c7db8ca5-cb14-353e-0745-617482b77bc7@xen.org>
 <77df7ce8-fc8c-ca9b-9d79-2335f459be13@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b4a9b411-78a7-6635-bd5f-6559060ab31c@xen.org>
Date: Fri, 22 Jan 2021 20:42:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <77df7ce8-fc8c-ca9b-9d79-2335f459be13@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 22/01/2021 18:39, Boris Ostrovsky wrote:
> 
> 
> On 1/22/21 1:33 PM, Julien Grall wrote:
> 
>>
>> Thanks. In which case, I would suggest to move the definition of ignore_msrs in the idle to an x86 specific structure. Maybe "arch_x86"?
> 
> 
> I did consider this but left it in common area since there are already a bunch of fields there that are x86-specific.

Most of them were introduced before Arm existed :).

> 
> If there is desire to create an x86 sub-struct then we should move all of them there.

The libxl interface is meant to be stable at the source level but not 
ABI stable. So we wouldn't be able to move the existing field in a new 
x86 without adding a compat layer (see for instance hvm.altp2m vs 
altp2m). I don't think this is worth it for them.

That said, we should try to treat each architecture equally. So I think 
it is not a good idea to continue to pursue adding an field in common 
area if the field is only meant to be used for a single arch.

If Ian or Wei thinks it is fine to define in common code, then so it be.

Cheers,

-- 
Julien Grall

