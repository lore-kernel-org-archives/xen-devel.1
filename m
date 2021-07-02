Return-Path: <SRS0=Zy1u=L2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BAEC11F68
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 14:04:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8EB6142B
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 14:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8EB6142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149154.275725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJmb-0004fI-Ku; Fri, 02 Jul 2021 14:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149154.275725; Fri, 02 Jul 2021 14:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJmb-0004fB-I0; Fri, 02 Jul 2021 14:04:41 +0000
Received: by outflank-mailman (input) for mailman id 149154;
 Fri, 02 Jul 2021 14:04:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzJmb-0004f5-4I
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 14:04:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzJmZ-000282-1D; Fri, 02 Jul 2021 14:04:39 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzJmY-0008EW-RB; Fri, 02 Jul 2021 14:04:38 +0000
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
	bh=6EtD5SqbRZJNvHvLZGtuLrFhx1G/nd/OrXMKhDJ1chI=; b=qkbpf3/7L3zxazPEqvUwNJEF3h
	me/qnG0UXHl2hv8SZx97S0v+791Kl2O0JMxlK6MzKLqwDUF6UqrIkmUW2bF0JjsBaSYIVPB0QCh+S
	6WV71OiNu+yA/svhIKwqy4lgVs3lrvLlMnkJTDtNdTHR5bESOZuPCzwjGeAfzHoAgYFc=;
Subject: Re: [XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen
To: Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210628134217.47622-1-anthony.perard@citrix.com>
 <24793.54037.159770.159505@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ed929363-2b15-bf5f-5a7d-d9e330d79025@xen.org>
Date: Fri, 2 Jul 2021 15:04:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <24793.54037.159770.159505@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/06/2021 14:48, Ian Jackson wrote:
> Anthony PERARD writes ("[XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen"):
>> qemu-xen tree have a osstest gate and doesn't need to be pinned.
>>
>> On the other hand, OVMF's xen repository doesn't have a gate and needs
>> to be pinned. The "master" branch correspond now to the tag
>> "edk2-stable202105", so pin to that commit.
>>
>> Fixes: a04509d34d72 ("Branching: Update version files etc. for newly unstable")
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Looks like I adjusted the wrong line in a04509d34d72.  Sorry.

I have committed it.

Cheers,

-- 
Julien Grall

