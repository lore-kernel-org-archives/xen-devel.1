Return-Path: <SRS0=iyTO=JM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034BCC433ED
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 09:57:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FAF0611AC
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 09:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FAF0611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111002.212143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWykR-0003GE-Ni; Thu, 15 Apr 2021 09:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111002.212143; Thu, 15 Apr 2021 09:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWykR-0003G7-KF; Thu, 15 Apr 2021 09:57:19 +0000
Received: by outflank-mailman (input) for mailman id 111002;
 Thu, 15 Apr 2021 09:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWykP-0003G0-U0
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:57:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2342e67-f05a-4888-bc1b-5b9ee5cdf3bf;
 Thu, 15 Apr 2021 09:57:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59EE0AC6E;
 Thu, 15 Apr 2021 09:57:16 +0000 (UTC)
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
X-Inumbo-ID: b2342e67-f05a-4888-bc1b-5b9ee5cdf3bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618480636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1gi6LpB2ay90wHL0MaNprbc+A0YjlFknSp+NBnOGvwc=;
	b=Vw1Kvl7UytkqrctMlpfr3B+3kVy3w3Q8dMAObpByBujol6sMgMfDYOEfIwgEz+d5SYJhTG
	P5oYxEPGMS4fmkxLw6642LDYgXWR9Dxk5p3PC5rucFIBdvuJ/bEAo1xhaAQBrtnk6SEW0y
	7SY+DiOX+tLpzDcFLgLbzwlc+m+bLP0=
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>, paul@xen.org
References: <20210401102252.95196-1-roger.pau@citrix.com>
 <5b4ec824-8cfa-8795-3a96-fb18527d3c18@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <910fcf36-a0c6-9f1e-a402-9afa6a5c4a1f@suse.com>
Date: Thu, 15 Apr 2021 11:57:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <5b4ec824-8cfa-8795-3a96-fb18527d3c18@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 12:50, Paul Durrant wrote:
> On 01/04/2021 11:22, Roger Pau Monne wrote:
>> The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
>> as current, as there's no support for EOI'ing interrupts on a remote
>> vCPU.
>>
>> While there also turn the unconditional assert at the top of the
>> function into an error on non-debug builds.
>>
>> No functional change intended.
>>
>> Requested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Andrew,

can you please clarify whether your concern was addressed and this can
go in as-is, or (if not) reply to what Roger and I have said in response?

Thanks, Jan

