Return-Path: <SRS0=K75F=DR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C23C433DF
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2020 11:02:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12221206B2
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2020 11:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="BPCvCFQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12221206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5392.14076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRCdc-0003x1-Rt; Sat, 10 Oct 2020 11:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5392.14076; Sat, 10 Oct 2020 11:02:08 +0000
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
	id 1kRCdc-0003wu-Oc; Sat, 10 Oct 2020 11:02:08 +0000
Received: by outflank-mailman (input) for mailman id 5392;
 Sat, 10 Oct 2020 11:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kRCdb-0003wp-KN
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 11:02:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed552af9-784a-4565-b752-1d9778160bd1;
 Sat, 10 Oct 2020 11:02:06 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRCdX-00018v-Go; Sat, 10 Oct 2020 11:02:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRCdX-0006iz-5S; Sat, 10 Oct 2020 11:02:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kRCdb-0003wp-KN
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 11:02:07 +0000
X-Inumbo-ID: ed552af9-784a-4565-b752-1d9778160bd1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ed552af9-784a-4565-b752-1d9778160bd1;
	Sat, 10 Oct 2020 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=kZ3T8E90nhe6fT4YSRfw7kez/6rP9Uw708x2JxQe0cU=; b=BPCvCFQnd+71fOxusP21qBpbec
	4TgmvJWYC55VK5BSiNZ/YLxUi5fhH0oRu45C7rXjwqH1wniWBGXvuNJdt1XjHnmGxqHqJtWqmirHN
	b8zS3Tv/YywdkIIMH9F4OwgZXNveVC82L1G+wt5Qlm5+qyTld3NUjXT5dUwu/Ke2pvzw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRCdX-00018v-Go; Sat, 10 Oct 2020 11:02:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRCdX-0006iz-5S; Sat, 10 Oct 2020 11:02:03 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
Date: Sat, 10 Oct 2020 12:02:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 28/09/2020 07:47, Masami Hiramatsu wrote:
> Hello,

Hi Masami,

> This made progress with my Xen boot on DeveloperBox (
> https://www.96boards.org/product/developerbox/ ) with ACPI.
> 

I have reviewed the patch attached and I have a couple of remarks about it.

The STAO table was originally created to allow an hypervisor to hide 
devices from a controller domain (such as Dom0). If this table is not 
present, then it means the OS/hypervisor can use any device listed in 
the ACPI table.

Additionally, the STAO table should never be present in the host ACPI table.

Therefore, I think the code should not try to find the STAO. Instead, it 
should check whether the SPCR table is present.

Cheers,

-- 
Julien Grall

