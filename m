Return-Path: <SRS0=2tZV=6L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FB4C54FD0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 05:28:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E01206E2
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 05:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E01206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSwJR-0007aV-31; Mon, 27 Apr 2020 05:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jSwJQ-0007aQ-KI
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 05:28:12 +0000
X-Inumbo-ID: e203fda6-8847-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e203fda6-8847-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 05:28:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3573AE28;
 Mon, 27 Apr 2020 05:28:08 +0000 (UTC)
Subject: Re: Xen network domain performance for 10Gb NIC
To: tosher 1 <akm2tosher@yahoo.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a06fdec5-9e9e-2319-e7f7-d68fdb48ffba@suse.com>
Date: Mon, 27 Apr 2020 07:28:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1359850718.562651.1587928713792@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.04.20 21:18, tosher 1 wrote:
>   Hi everyone,
> 
> Lately, I have been experimenting with 10Gb NIC performance on Xen domains. I have found that network performance is very poor for PV networking when a driver domain is used as a network backend.
> 
> My experimental setup is I have two machines connected by the 10Gb network: a server running the Xen hypervisor and a desktop machine working as a client. I have Ubuntu 18.04.3 LTS running on the Dom0, Domus, Driver Domain, and client desktop, where the Xen version is 4.9. I measured the network bandwidth using iPerf3.
> 
> The network bandwidth between a DomU using Dom0 as backend and the client desktop is like 9.39Gbits/sec. However, when I use a network driver domain, which has the 10Gb NIC by PCI pass through, the bandwidth between the DomU and the client desktop is like 2.41Gbit/sec is one direction and 4.48Gbits/sec in another direction. Here, by direction, I mean the client-server direction for iPerf3.
> 
> These results indicate a huge performance degradation, which is unexpected. I am wondering if I am missing any key points here which I should have taken care of or if there is any tweak that I can apply.

Is the driver domain PV or HVM?

How many vcpus do dom0, the driver domain and the guest have?


Juergen

