Return-Path: <SRS0=1JDs=B6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF707C433E4
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 10:59:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E642206FA
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 10:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="TO5HjZZ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E642206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8iHv-0006XC-OG; Thu, 20 Aug 2020 10:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8iHu-0006X3-Mi
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 10:59:18 +0000
X-Inumbo-ID: e992a573-fb90-4503-ac16-9be7b80e2b08
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e992a573-fb90-4503-ac16-9be7b80e2b08;
 Thu, 20 Aug 2020 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Cc:From:References:To:Subject;
 bh=wv/2WXEibGvFuZv/wsQ3NNtvCXExI0KosaJAtxVDh5Y=; b=TO5HjZZ10qBjsjG/fHH3O3lBTM
 rsyoqCZGz33nrcfQ8uE9Kl6OfwQwje1AYiOdqH9pemsso71BVH0sy4SDW/7bYgiqBk0p+FSImx+iR
 aCiKIxSfM4y8XCTOsnLuWkwS8oWG+3GimDw4SiAnjXV8uduQ3/C4TZ/sAD5EaKx1KXHc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8iHr-0000ts-Eu; Thu, 20 Aug 2020 10:59:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8iHq-0000YL-U9; Thu, 20 Aug 2020 10:59:15 +0000
Subject: Re: About VIRTIO support on Xen
To: Jedi Chen <jedix81@gmail.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAK-iXTF3F05+RH=ttOhwpOfcngfPY_bAp73fYprxg__QB+fD2w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Message-ID: <62cabf58-b889-4f60-8065-634db3eaea66@xen.org>
Date: Thu, 20 Aug 2020 11:59:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK-iXTF3F05+RH=ttOhwpOfcngfPY_bAp73fYprxg__QB+fD2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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



On 20/08/2020 05:45, Jedi Chen wrote:
> Hi xen-devel,

Hi,

> 
> I am very interesting about the VIRTIO on Xen. And from one meeting 
> report of AGL Virtualization Expert Group (EG-VIRT)
> https://wiki.automotivelinux.org/eg-virt-meetings#pm_cest_meeting4, I 
> got the information that ARM and Linaro are
> upstreaming XEN work incorporating VirtIO. But I can't find any 
> information in the mailing list. Is there any
> architecture overview or design doc about it?

There is some discussion on xen-devel [1] to add support for Virtio MMIO 
on Arm. This is still in early development, but you should be able to 
get a PoC setup with the work.

Best regards,

[1] <1596478888-23030-1-git-send-email-olekstysh@gmail.com>

> 
> Thanks,
> 
> 
> 



-- 
Julien Grall

