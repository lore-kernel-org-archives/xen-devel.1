Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE135C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 14:02:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774346117A
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 14:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774346117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129245.242638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0J1-0000YG-OM; Tue, 18 May 2021 14:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129245.242638; Tue, 18 May 2021 14:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0J1-0000Y9-L2; Tue, 18 May 2021 14:02:43 +0000
Received: by outflank-mailman (input) for mailman id 129245;
 Tue, 18 May 2021 14:02:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj0J0-0000Xt-LO
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:02:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0Ir-00049G-W2; Tue, 18 May 2021 14:02:33 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0Ir-0001uS-Qb; Tue, 18 May 2021 14:02:33 +0000
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
	bh=Djo0Z8UCuwusoCbx3XP4eRV8Bal3+Nb6wmPQyTK86qQ=; b=qGUEWcKhGEZGeKSCM2sfbrqm81
	8n/e9CzaDKyRMDKAQuPRLZwnPUJC0WnrtMssAo5yOtNkUpdK/W08xU+gLo7kCzq90RNb/dmLN8W0F
	3QR370j7yOlhoFStBJ4x69GeAba55Lhy78LWz+qH5u4m0z/yK2ZMZ6p+HVAVGjz2uzSI=;
Subject: Re: PING Re: [PATCH 00/14] Use const whether we point to literal
 strings (take 1)
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
 <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210405155713.29754-1-julien@xen.org>
 <05eaa910-7630-d1e4-4b70-3008d672fe5c@xen.org>
 <20210517184153.wwj4ek4bkmelpuia@liuwe-devbox-debian-v2>
From: Julien Grall <julien@xen.org>
Message-ID: <d7db6d71-f285-44b1-f76b-72f18f0e5f24@xen.org>
Date: Tue, 18 May 2021 15:02:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517184153.wwj4ek4bkmelpuia@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 17/05/2021 19:41, Wei Liu wrote:
> On Mon, May 10, 2021 at 06:49:01PM +0100, Julien Grall wrote:
>> Hi,
>>
>> Ian, Wei, Anthony, can I get some feedbacks on the tools side?
> 
> I think this is moving to the right direction so
> 
> Acked-by: Wei Liu <wl@xen.org>

Thanks! I had committed most of the tools code but one patch. I have 
kept your acked-by on the patch and will wait Anthony to do a full review.

Cheers,

-- 
Julien Grall

