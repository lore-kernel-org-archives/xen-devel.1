Return-Path: <SRS0=VkMt=LS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12EDC49EA6
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 14:56:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF59613C0
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 14:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF59613C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146868.270395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwQmV-0008OT-3m; Thu, 24 Jun 2021 14:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146868.270395; Thu, 24 Jun 2021 14:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwQmV-0008OM-0u; Thu, 24 Jun 2021 14:56:39 +0000
Received: by outflank-mailman (input) for mailman id 146868;
 Thu, 24 Jun 2021 14:56:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwQmT-0008OE-5K
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 14:56:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwQmR-0002OC-Rf; Thu, 24 Jun 2021 14:56:35 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwQmR-0004sa-KS; Thu, 24 Jun 2021 14:56:35 +0000
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
	bh=dEtNWCKVkzqbyFAHE44xMqQTqtJFmSXLWfRMatdkYRc=; b=GfKb858ybWSHPUCTCqrgPRJV75
	CwVvzCZZZeDucmSFRr0enYhyDWQxnsj+MCrjDcPU3l6N4cXSq646VCPiaEjwgbhgW7F96WfMRMLm3
	gNaGQqL5uhYQ+zypTi6C5fm9m7zRhzJWHnkP2dEsW8Gcy+sIrFFkhGbJX6qXbetj11Cc=;
Subject: Re: [PATCH] tools/xenstored: Remove redundant check in
 socket_can_process()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210624144655.12900-1-julien@xen.org>
 <ef5c28e0-989c-2443-f72d-44cf17dc589c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b97249d6-2c97-2bc9-2dbc-db491c814fa1@xen.org>
Date: Thu, 24 Jun 2021 16:56:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ef5c28e0-989c-2443-f72d-44cf17dc589c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/06/2021 16:53, Juergen Gross wrote:
> On 24.06.21 16:46, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 3adfb50315d9 ("tools/xenstored: Introduce a wrapper for
>> conn->funcs->can_{read, write}") consolidated the check
>> !conn->is_ignored in two new wrappers.
>>
>> This means the check in socket_can_process() is now redundant. In
>> fact it should have been removed in orignal commit (as it was done
>> for the domain helpers).
>>
>> Reported-by: Raphael Ning <raphning@amazon.com
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! Committed.

Cheers,

-- 
Julien Grall

