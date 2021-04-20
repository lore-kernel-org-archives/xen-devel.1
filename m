Return-Path: <SRS0=xmOv=JR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5CEC433B4
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 13:01:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44FA0613CD
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 13:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44FA0613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113654.216591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpzu-0002I2-1L; Tue, 20 Apr 2021 13:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113654.216591; Tue, 20 Apr 2021 13:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpzt-0002Hv-Uo; Tue, 20 Apr 2021 13:00:57 +0000
Received: by outflank-mailman (input) for mailman id 113654;
 Tue, 20 Apr 2021 13:00:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYpzs-0002Hq-Jt
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:00:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpzn-0001B4-P5; Tue, 20 Apr 2021 13:00:51 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpzn-0008HU-HR; Tue, 20 Apr 2021 13:00:51 +0000
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
	bh=GE7kMMQDC7qGfHnr7SeRoZrQd4ZsjTtrQTSkfnOkghM=; b=wK0PSINeZ0WYGg8xcxwDkOjM3s
	ZcRd/riZHN7WBK5zcOdxRZXsVajZ7tcZVCSdn5/ih86IFCMaoh1uXbDm+SXpzeQz853nj1J2YCm54
	eYmd74SGoKLJRyW49KJzndANe3akk9nj6zj4wVE+n/Qn5blAV7T1L83IjcHTpWalDGno=;
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Chao Gao <chao.gao@intel.com>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
 <148ad77f-d447-0800-d48b-9ba8c758b905@xen.org>
 <b89c8443-4df6-485b-2b5b-d89360a6969a@suse.com>
 <98da1bbb-8860-0728-a438-a4f12719d4e2@xen.org>
 <525fa57c-b036-7c2b-3a6d-ede7f4ce6d36@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5f77d54a-6c92-84bb-a8a9-a0864b350f1f@xen.org>
Date: Tue, 20 Apr 2021 14:00:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <525fa57c-b036-7c2b-3a6d-ede7f4ce6d36@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/04/2021 13:50, Jan Beulich wrote:
>> Alternatively, you could be a bit more
>> verbose in your request so the other understand the reasoning behind it.
> 
> Well, yes, perhaps. But then there's the desire to not repeat oneself
> all the time.

Most likely, the time you try to save not expanding your thought are 
going to be lost when the contributor will come back asking why you are 
requesting it. ;)

Cheers,

-- 
Julien Grall

