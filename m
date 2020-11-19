Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3508DC388F9
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 09:21:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B629221EB
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 09:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="HRb/x51o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B629221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30508.60565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfg7z-0001Wb-Fu; Thu, 19 Nov 2020 09:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30508.60565; Thu, 19 Nov 2020 09:21:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfg7z-0001WU-CB; Thu, 19 Nov 2020 09:21:19 +0000
Received: by outflank-mailman (input) for mailman id 30508;
 Thu, 19 Nov 2020 09:21:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfg7y-0001WP-4s
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:21:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfg7x-0007Lw-8k; Thu, 19 Nov 2020 09:21:17 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfg7w-00050i-W0; Thu, 19 Nov 2020 09:21:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfg7y-0001WP-4s
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=34dCLaEzvPfuLtsh2yUyi7VJJvxm+wbXreAmOflWzGM=; b=HRb/x51oFm/TMC8R7maBZaxwfC
	HNw4bWW/mBtg205vecqynOpNdaOstcbHJ38MOFZUX9eaTYdPORDu62Zt3tFuaem468l6CFWWvO1DI
	CWsaiQDcF03w6o1F1gHRLA82FQaQbn4SLwK5vOkCuCMmos3+9LdtUAI54j0Vs8oV5k/I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfg7x-0007Lw-8k; Thu, 19 Nov 2020 09:21:17 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfg7w-00050i-W0; Thu, 19 Nov 2020 09:21:17 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
Date: Thu, 19 Nov 2020 09:21:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/11/2020 09:05, Jan Beulich wrote:
> On 18.11.2020 16:50, Julien Grall wrote:
>> On 16/11/2020 12:25, Rahul Singh wrote:
>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>> is enabled for ARM, compilation error is observed for ARM architecture
>>> because ARM platforms do not have full PCI support available.
>>   >
>>> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
>>> ns16550 PCI for X86.
>>>
>>> For X86 platforms it is enabled by default. For ARM platforms it is
>>> disabled by default, once we have proper support for NS16550 PCI for
>>> ARM we can enable it.
>>>
>>> No functional change.
>>
>> NIT: I would say "No functional change intended" to make clear this is
>> an expectation and hopefully will be correct :).
>>
>> Regarding the commit message itself, I would suggest the following to
>> address Jan's concern:
> 
> While indeed this is a much better description, I continue to think
> that the proposed Kconfig option is undesirable to have.

I am yet to see an argument into why we should keep the PCI code 
compiled on Arm when there will be no-use....

> Either,
> following the patch I've just sent, truly x86-specific things (at
> least as far as current state goes - if any of this was to be
> re-used by a future port, suitable further abstraction may be
> needed) should be guarded by CONFIG_X86 (or abstracted into arch
> hooks), or the HAS_PCI_MSI proposal would at least want further
> investigating as to its feasibility to address the issues at hand.

I would be happy with CONFIG_X86, despite the fact that this is only 
deferring the problem.

Regarding HAS_PCI_MSI, I don't really see the point of introducing given 
that we are not going to use NS16550 PCI on Arm in the forseeable 
future. So why do we need a finer graine Kconfig?

Cheers,

-- 
Julien Grall

