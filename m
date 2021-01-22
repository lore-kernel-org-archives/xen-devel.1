Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FB4C433E6
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 14:26:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF7A2053B
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 14:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FF7A2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72805.131155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xOP-0002cO-9S; Fri, 22 Jan 2021 14:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72805.131155; Fri, 22 Jan 2021 14:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xOP-0002cH-6M; Fri, 22 Jan 2021 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 72805;
 Fri, 22 Jan 2021 14:26:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2xOO-0002cC-Ir
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:26:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2xON-0000sI-SF; Fri, 22 Jan 2021 14:26:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2xON-0002lF-My; Fri, 22 Jan 2021 14:26:27 +0000
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
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=VXXEjxUWc27YXPt6Dcbx+wV2yohvxAT/qwCO9fqBp4c=; b=uNPrPGwru47X2OtwqEi25kCu5b
	/T+wIyevLmGHENH8n5j25kMaJX0rVhvmAhdTjp+GuS85hiYXnWaMGazr5pR45r4Cuq5pjLKMTGI8a
	XfpyevRyohULX53x43I7nSlQFSQf56CjFkVfS/WADhqFmoZxGeATIvuEcjJS6lGT38mY=;
Subject: Re: Null scheduler and vwfi native problem
To: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
From: Julien Grall <julien@xen.org>
Message-ID: <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
Date: Fri, 22 Jan 2021 14:26:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Anders,

On 22/01/2021 08:06, Anders Törnqvist wrote:
> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
> - booting with "sched=null vwfi=native" but not doing the IRQ 
> passthrough that you mentioned above
> "xl destroy" gives
> (XEN) End of domain_destroy function
> 
> Then a "xl create" says nothing but the domain has not started correct. 
> "xl list" look like this for the domain:
> mydomu                                   2   512     1 ------       0.0

This is odd. I would have expected ``xl create`` to fail if something 
went wrong with the domain creation.

The list of dash, suggests that the domain is:
    - Not running
    - Not blocked (i.e cannot run)
    - Not paused
    - Not shutdown

So this suggest the NULL scheduler didn't schedule the vCPU. Would it be 
possible to describe your setup:
   - How many pCPUs?
   - How many vCPUs did you give to dom0?
   - What was the number of the vCPUs given to the previous guest?

One possibility is the NULL scheduler doesn't release the pCPUs until 
the domain is fully destroyed. So if there is no pCPU free, it wouldn't 
be able to schedule the new domain.

However, I would have expected the NULL scheduler to refuse the domain 
to create if there is no pCPU available.

@Dario, @Stefano, do you know when the NULL scheduler decides to 
allocate the pCPU?

Cheers,

-- 
Julien Grall

