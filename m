Return-Path: <SRS0=Bsih=IA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8F1C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  2 Mar 2021 09:43:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54FF60C41
	for <xen-devel@archiver.kernel.org>; Tue,  2 Mar 2021 09:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54FF60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.92216.173957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1Z6-0005Qc-N5; Tue, 02 Mar 2021 09:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92216.173957; Tue, 02 Mar 2021 09:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1Z6-0005QV-Jc; Tue, 02 Mar 2021 09:43:40 +0000
Received: by outflank-mailman (input) for mailman id 92216;
 Tue, 02 Mar 2021 09:43:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lH1Z5-0005QQ-KV
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 09:43:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lH1Z4-0001eS-3G; Tue, 02 Mar 2021 09:43:38 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lH1Z3-0007jY-NL; Tue, 02 Mar 2021 09:43:37 +0000
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
	bh=LL80vY0iGQtsgZdQlSTohRJseGhslfirDALRsvBsW2U=; b=pFytgKEN4V4hni9ftiS8WoDoys
	y2fpOqCyjAilX8y/7jrARk1LKwwE2kvC0P6a5kOJhm1OwQUjRKtKaOGZgc9SBzjbbi5mh5aCxWfhz
	xa9caO158al80fGaJKPP3bpj1QU1Otq+HeSkQMnRkTiH5Uxm/fp7DT0Gjf7dZ/C3oZ9U=;
Subject: Re: [PATCH for-4.15] tools/xenstored: Avoid dereferencing a NULL
 pointer if LiveUpdate is failing
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>
References: <20210226182655.2499-1-julien@xen.org>
 <842a4189-c7a9-e3c1-6e21-740eb352aadf@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d2268ad3-9636-a884-92ce-7f230bf55a48@xen.org>
Date: Tue, 2 Mar 2021 09:43:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <842a4189-c7a9-e3c1-6e21-740eb352aadf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 01/03/2021 19:19, Jürgen Groß wrote:
> On 26.02.21 19:26, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In case of failure in do_lu_start(), XenStored will first free lu_start
>> and then try to dereference it.
>>
>> This will result to a NULL dereference as the destruction callback will
>> set lu_start to NULL.
>>
>> The crash can be avoided by freeing lu_start *after* the reply has been
>> set.
>>
>> Fixes: af216a99fb4a ("tools/xenstore: add the basic framework for 
>> doing the live update")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall

