Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC23C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 17:06:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1BC2173E
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 17:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="HxRb6YYI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E1BC2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6916.18079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkES-0000mU-4Q; Wed, 14 Oct 2020 17:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6916.18079; Wed, 14 Oct 2020 17:06:32 +0000
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
	id 1kSkES-0000mN-1M; Wed, 14 Oct 2020 17:06:32 +0000
Received: by outflank-mailman (input) for mailman id 6916;
 Wed, 14 Oct 2020 17:06:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSkEQ-0000mE-98
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:06:30 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70251fd8-73ba-4907-8c36-27d714b03d5b;
 Wed, 14 Oct 2020 17:06:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkEN-00024b-QI; Wed, 14 Oct 2020 17:06:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkEN-00082n-JW; Wed, 14 Oct 2020 17:06:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSkEQ-0000mE-98
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:06:30 +0000
X-Inumbo-ID: 70251fd8-73ba-4907-8c36-27d714b03d5b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 70251fd8-73ba-4907-8c36-27d714b03d5b;
	Wed, 14 Oct 2020 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Q4fyAUhdnkBCkpuu4znc9gASkYekK/Z+3FZj3aUhbHo=; b=HxRb6YYIWFHQxObunVomfYbmsc
	Tf8p/97Fb25Dx3HHwTfvl+cwpygh4RjT+x1cavsfW8VdzIWp0vLDEyneCdCsuPMmRtnv320C/u0VD
	JTEXDqZJk3+m1h9Kh00cC2wFSF4yqV25mi/EuZM+1lLB+EiV3uYzt8j/v/J7hhOKW4Fs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkEN-00024b-QI; Wed, 14 Oct 2020 17:06:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkEN-00082n-JW; Wed, 14 Oct 2020 17:06:27 +0000
Subject: Re: [PATCH] xen/arm: Document the erratum #853709 related to Cortex
 A72
To: Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20201014100541.11687-1-michal.orzel@arm.com>
 <ef5fc4c3-5de3-0ec1-fed9-afdb8dd1bfc1@xen.org>
 <AM6PR08MB4641ACDB3B63F0A065FBD48389050@AM6PR08MB4641.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c4341231-f41d-961f-c9cd-116369a7bc75@xen.org>
Date: Wed, 14 Oct 2020 18:06:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB4641ACDB3B63F0A065FBD48389050@AM6PR08MB4641.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/10/2020 12:06, Michal Orzel wrote:
> Hi Julien,
> 
> I agree. You can update the commit message.

Thanks. I have updated the commit message and committed it.

On a different topic, it looks like you are sending the e-mail with 
HTML. Would you mind to configure it to send plain text?

Cheers,

-- 
Julien Grall

