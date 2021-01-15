Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8492FC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 10:01:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15634224F9
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15634224F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67873.121335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Luc-00045s-Dm; Fri, 15 Jan 2021 10:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67873.121335; Fri, 15 Jan 2021 10:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Luc-00045l-91; Fri, 15 Jan 2021 10:00:58 +0000
Received: by outflank-mailman (input) for mailman id 67873;
 Fri, 15 Jan 2021 10:00:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Lub-00045e-1a
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:00:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0LuV-0000hS-37; Fri, 15 Jan 2021 10:00:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0LuU-0002pa-Ti; Fri, 15 Jan 2021 10:00:51 +0000
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
	bh=8sGMvAxQtagJ6nOoDrYVIuvjKBNLBfRHV0dmZu8S7A8=; b=LEIaBgbPawd6cNcjCIDIHRzLQc
	LOQcE5Q5ahM/bO6y7rJ9caLPafqtW3psvD2qfh3nHhNOsGbpVsHIz/DMUgb2ZUQ0a4WJbrFWrJSMN
	yQ9dWmfggBtxgXzIK1ekBNN8pd+r2gz1rWD2V255vd39JHv3PrP6SEtAqVHbS+8nYkTE=;
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
 <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3a0e542b-6db6-7a5e-4998-ac87089ac5c1@xen.org>
Date: Fri, 15 Jan 2021 10:00:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 15/01/2021 09:57, Jan Beulich wrote:
> On 14.01.2021 20:02, Andrew Cooper wrote:
>> Bugs:
>>
>> 1) HPET/PIT issue on newer Intel systems.  This has had literally tens
>> of reports across the devel and users mailing lists, and prevents Xen
>> from booting at all on the past two generations of Intel laptop.  I've
>> finally got a repro and posted a fix to the list, but still in progress.
>>
>> 2) "scheduler broken" bugs.  We've had 4 or 5 reports of Xen not
>> working, and very little investigation on whats going on.  Suspicion is
>> that there might be two bugs, one with smt=0 on recent AMD hardware, and
>> one more general "some workloads cause negative credit" and might or
>> might not be specific to credit2 (debugging feedback differs - also
>> might be 3 underlying issue).
>>
>> All of these have had repeated bug reports.  I'd classify them as
>> blockers, given the impact they're having on people.
> 
> 3) Fallout from MSR handling behavioral change.

4) Use-after-free in the IOMMU code (this should be a blocker).

See  "xen/iommu: Collection of bug fixes for IOMMU teadorwn"

<20201222154338.9459-1-julien@xen.org>

Cheers,

> 
> Jan
> 

-- 
Julien Grall

