Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEB5C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 10:45:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB85F20720
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 10:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="RQbImd2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB85F20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15639.38676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRtg-0003KF-3R; Fri, 30 Oct 2020 10:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15639.38676; Fri, 30 Oct 2020 10:44:40 +0000
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
	id 1kYRtf-0003K8-Va; Fri, 30 Oct 2020 10:44:39 +0000
Received: by outflank-mailman (input) for mailman id 15639;
 Fri, 30 Oct 2020 10:44:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYRtf-0003K3-3o
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:44:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95b8aa91-3dec-46fe-9751-695b402f1854;
 Fri, 30 Oct 2020 10:44:33 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRtY-0005uJ-3u; Fri, 30 Oct 2020 10:44:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRtX-0007II-R0; Fri, 30 Oct 2020 10:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYRtf-0003K3-3o
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:44:39 +0000
X-Inumbo-ID: 95b8aa91-3dec-46fe-9751-695b402f1854
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 95b8aa91-3dec-46fe-9751-695b402f1854;
	Fri, 30 Oct 2020 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=VFQ8n6PEjMlDDaF1eOqtlImYkqVhedajZ7D7tUCU5H0=; b=RQbImd2cnmVCk7iMlLNGWKcAHY
	YYt3j5swk6/XYMEWDPgu31bARhaWTvMYBCFhxMsFEyO0QgQNjqaTivpaLI3awYmldvQwcG7ej6hPb
	wtp1zV185mj/IR4cG+oh8Zc5SvOSq+E1dWIs6bUac1mRXT7pu7+/gQFJG2hrDM/fZ6ig=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRtY-0005uJ-3u; Fri, 30 Oct 2020 10:44:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRtX-0007II-R0; Fri, 30 Oct 2020 10:44:31 +0000
Subject: Re: [PATCH v2 2/8] evtchn: replace FIFO-specific header by generic
 private one
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
 <c330d6e3-04da-9bf2-5634-b6b2961c18db@xen.org>
 <34db0b62-8442-5d3e-3e55-799f8683c8a5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <30e7270b-713f-33bc-4030-cc084a06185b@xen.org>
Date: Fri, 30 Oct 2020 10:44:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <34db0b62-8442-5d3e-3e55-799f8683c8a5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/10/2020 10:42, Jan Beulich wrote:
> On 30.10.2020 11:21, Julien Grall wrote:
>> On 20/10/2020 15:08, Jan Beulich wrote:
>>> Having a FIFO specific header is not (or at least no longer) warranted
>>> with just three function declarations left there. Introduce a private
>>> header instead, moving there some further items from xen/event.h.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks; perhaps you didn't notice this went in already?

I only noticed it afterwards. I find useful when committers send a quick 
message mentioning that part of the series has been committed.

Cheers,

-- 
Julien Grall

