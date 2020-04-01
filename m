Return-Path: <SRS0=OroT=5R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C34DC43331
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2020 09:42:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C79A32077D
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2020 09:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="UYOBdMj+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C79A32077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJZsz-0005Yq-VK; Wed, 01 Apr 2020 09:42:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJZsz-0005Yl-E8
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 09:42:13 +0000
X-Inumbo-ID: 107a7d0e-73fd-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 107a7d0e-73fd-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ieac/wN7McepiWeegw1+N3duJujkjNNABEbYp1vC6ss=; b=UYOBdMj+OKyWBiwCt0tmIg6S22
 4oULm9bNIKV/u8MECW1Z9xJUYoLfRyDDw5Ba5MRmlmVEPwmiC5sBsTsK5a0lJr5VVs7IWts7N+OrT
 88j2gGDpo1/q/qf4RA5x+bBxUo86C6v+vAeAzKkrjy7955sHJN0pSFr1ZOkHjrYjUVvk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJZsx-0007CW-Sc; Wed, 01 Apr 2020 09:42:11 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJZsx-0002BY-MP; Wed, 01 Apr 2020 09:42:11 +0000
Subject: Re: [XEN PATCH v4 03/18] build,arm: Fix deps check of head.o
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-4-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7300607b-2a51-7659-200b-f17e6c3a0287@xen.org>
Date: Wed, 1 Apr 2020 10:42:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Anthony,

On 31/03/2020 11:30, Anthony PERARD wrote:
> arm*/head.o isn't in obj-y or extra-y, so make don't load the
> associated .*.d file (or .*.cmd file when if_changed will be used).
> There is a workaround where .*.d file is added manually into DEPS.
> 
> Changing DEPS isn't needed, we can simply add head.o into extra-y and
> the dependency files will be loaded.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

