Return-Path: <SRS0=54zI=A4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBC8C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2020 13:29:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C8A82067D
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2020 13:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="FXH6a3xD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C8A82067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQQF-0000xj-1p; Fri, 17 Jul 2020 13:29:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwQQE-0000xe-6i
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:29:06 +0000
X-Inumbo-ID: 7c8b3bf4-c831-11ea-95fe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c8b3bf4-c831-11ea-95fe-12813bfff9fa;
 Fri, 17 Jul 2020 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vy17Fh/U6PP9hOLGm7LaXQkSnIjQFuHzX8pSnUlYdtU=; b=FXH6a3xDsTU98+8TCX2jGEtLtF
 dZgC+OzWQSWRWf0P7CiMlyc1MrUEn1zwu9Lmc+fadDJ3BxaHm6o6fphwjlBBH2M2FwXGEbeKgm0hk
 Zl+WUO4gSWm2omg+qcUjMs49yjm2T4stiR3HX7IamSSjyy4VKHT1V7nh/Vg7CdhdYPMo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwQQC-0006a4-NG; Fri, 17 Jul 2020 13:29:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwQQC-0006aA-B9; Fri, 17 Jul 2020 13:29:04 +0000
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <339df023-7844-b998-81bd-8c00baad3b04@xen.org>
Date: Fri, 17 Jul 2020 14:29:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/07/2020 14:22, Bertrand Marquis wrote:
>>> # Emulated PCI device tree node in libxl:
>>>
>>> Libxl is creating a virtual PCI device tree node in the device tree
>>> to enable the guest OS to discover the virtual PCI during guest
>>> boot. We introduced the new config option [vpci="pci_ecam"] for
>>> guests. When this config option is enabled in a guest configuration,
>>> a PCI device tree node will be created in the guest device tree.
>>>
>>> A new area has been reserved in the arm guest physical map at which
>>> the VPCI bus is declared in the device tree (reg and ranges
>>> parameters of the node). A trap handler for the PCI ECAM access from
>>> guest has been registered at the defined address and redirects
>>> requests to the VPCI driver in Xen.
>>
>> Can't you deduce the requirement of such DT node based on the presence
>> of a 'pci=' option in the same config file?
>>
>> Also I wouldn't discard that in the future you might want to use
>> different emulators for different devices, so it might be helpful to
>> introduce something like:
>>
>> pci = [ '08:00.0,backend=vpci', '09:00.0,backend=xenpt', '0a:00.0,backend=qemu', ... ]

I like this idea :).

>>
>> For the time being Arm will require backend=vpci for all the passed
>> through devices, but I wouldn't rule out this changing in the future.
> 
> We need it for the case where no device is declared in the config file and the user
> wants to add devices using xl later. In this case we must have the DT node for it
> to work.

Are you suggesting that you plan to implement PCI hotplug?

Cheers,

-- 
Julien Grall

