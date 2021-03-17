Return-Path: <SRS0=alo8=IP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8514C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 11:55:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5AB64F2A
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 11:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5AB64F2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98669.187268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUlE-0005b3-Uy; Wed, 17 Mar 2021 11:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98669.187268; Wed, 17 Mar 2021 11:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUlE-0005aw-S2; Wed, 17 Mar 2021 11:54:48 +0000
Received: by outflank-mailman (input) for mailman id 98669;
 Wed, 17 Mar 2021 11:54:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUlD-0005ar-H5
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:54:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUlA-0005Fd-Gb; Wed, 17 Mar 2021 11:54:44 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUlA-0001FR-7W; Wed, 17 Mar 2021 11:54:44 +0000
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
	bh=c//ys24c5UYVm+BYnE/A+cLez1A+IVc+8GG/DkQMbts=; b=NawzYYqF4vgOM1IH2srIO3xg0u
	ec+rFkImZO8CxIBike4XoE8+rpseyVhD+OOrwzCR9o/1zuZPW7yEcJ68dy8gS4i4+nprPTvQcw6WL
	LGWVbVA3h6fTEqN4C3bHfLf1ZJxYJzPkzaupiEyoQqrZS9tQ2GcAVyZsbDJCPC51h0Xo=;
Subject: Re: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored
 daemon as Tech Preview
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210317112745.15207-1-julien@xen.org>
 <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <87fff120-5ed8-4775-2340-3852ee7475e8@xen.org>
Date: Wed, 17 Mar 2021 11:54:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/03/2021 11:49, Andrew Cooper wrote:
> On 17/03/2021 11:27, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Support to liveupdate C XenStored daemon was added during the 4.15
>> development cycle. Add a section in SUPPORT.MD to explain what is the
>> support state.
>>
>> For now, it is a tech preview.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> What about oxenstored ?

Oh, I read your answer as there is no support. I can resend a patch with 
the following title:

"LiveUpdate of C/Ocaml XenStored daemon"

Cheers,

-- 
Julien Grall

