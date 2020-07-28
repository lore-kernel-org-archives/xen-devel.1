Return-Path: <SRS0=jQwh=BH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E798C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 16:57:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF0852053B
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 16:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="4mxGsr4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF0852053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0SuJ-0001GS-Ra; Tue, 28 Jul 2020 16:56:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSwU=BH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0SuI-0001GN-UP
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 16:56:50 +0000
X-Inumbo-ID: 53fa5c9a-d0f3-11ea-a91b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53fa5c9a-d0f3-11ea-a91b-12813bfff9fa;
 Tue, 28 Jul 2020 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ne/5f8Dz1USlmrgYJGbkJHI1b0murad2BfKI+443u80=; b=4mxGsr4g8PgshJvwRUqY4v41Rn
 vtqGxEUykkes1fa/mEJ+5CksVi/mwLFb9sgcA38ZVZqlFmLUPeo9rdByOAImeMwliEw1ar/ZV48Cz
 1TfekSsNNetD/kHvz4WjWI8EjivFN2iaJAEXhxo//xXgNQQk5mf/r0XBLezc3eygaHDY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0SuG-0005KQ-MG; Tue, 28 Jul 2020 16:56:48 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0SuG-0003el-EZ; Tue, 28 Jul 2020 16:56:48 +0000
Subject: Re: Porting Xen to Jetson Nano
To: Srinivas Bangalore <srini@yujala.com>, xen-devel@lists.xenproject.org,
 'Christopher Clark' <christopher.w.clark@gmail.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
 <000001d661cb$45cdaa10$d168fe30$@yujala.com>
 <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
 <002901d66462$a1dff530$e59fdf90$@yujala.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f8de3b17-d8bd-884d-a37f-6e6d58bcab8c@xen.org>
Date: Tue, 28 Jul 2020 17:56:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002901d66462$a1dff530$e59fdf90$@yujala.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 27/07/2020 23:09, Srinivas Bangalore wrote:
> Hi,
> 
> 
> On 24/07/2020 16:01, Srinivas Bangalore wrote:
>> Hi Julien,
> 
> Hello,
> 
>>
>> Thanks for the tips. Comments inline...
> 
> I struggled to find your comment inline as your e-mail client doesn't quote
> my answer. Please configure your e-mail client to use some form of quoting
> (the usual is '>').
> 
> [<SB>] Done! Sorry about that.

Thanks this is a good start. Unfortunately, it doesn't fully help it 
when you have a reply split accross multiple line. This is become more 
proeminent after a few back and forth. Which e-mail client are you using?

> [<SB>] OK, I started porting the patch series to 4.14, but it is definitely
> not straightforward ;) Will take some time to do this. BTW, I was looking at
> xen/arch/arm/Rules.mk in 4.14 and it is blank. The previous releases had
> some board-specific stuff in this file - esp the EARLY_PRINTK definitions.
> Has this changed in 4.14?

earlyprintk can now be configured using Kconfig. This should be easier 
to configure as you can do it the same way as you would for other options.

Cheers,

-- 
Julien Grall

