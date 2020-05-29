Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E337C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 13:38:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD98206F1
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 13:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="KuaznYQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD98206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefCY-0001Ov-UR; Fri, 29 May 2020 13:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jefCX-0001Oq-V8
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:37:34 +0000
X-Inumbo-ID: 8ca936d7-a1b1-11ea-a8b7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ca936d7-a1b1-11ea-a8b7-12813bfff9fa;
 Fri, 29 May 2020 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRMf3JL5qzUN0yHgRk3JM7qMoHl49Y05x8/7LcQXiuw=; b=KuaznYQ7X8KHbVDAllbBAhop1T
 ceasurU4g6hde745U42si5i9HGciEimH+biicEvPADFBkr0v/pUGy+4xN6nL6FWWab3Lb29tKgKJm
 PBTfC9Urkp4YLF7PkZo6LpgnWAvDnXchtXzFNkjBrEuJ7wQXP8wQrb6XfK7rm4JA7YXc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jefCS-0005Tl-Ef; Fri, 29 May 2020 13:37:28 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jefCR-0008DK-VP; Fri, 29 May 2020 13:37:28 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
 <B5889544-3EB5-41ED-8428-8BCA05269371@arm.com>
 <20200529132020.GN1195@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <e7a757b4-b285-7089-91ea-d4248443aaf1@xen.org>
Date: Fri, 29 May 2020 14:37:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529132020.GN1195@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 29/05/2020 14:26, Roger Pau Monné wrote:
> TBH I would just remove the error message on Arm from the current
> hypercall, I don't think it's useful.
The message is part of the helpers get_page_from_gva() which is also 
used by copy_{to, from}_guest. While it may not be useful in the context 
of the runstate, it was introduced because there was some other weird 
bug happening before KPTI even existed (see [1]). I haven't yet managed 
to find the bottom line of the issue.

So I would still very much like to keep the message in place. Although 
we could reduce the number of cases where this is hapenning based on the 
fault.

Note this is a dprintk(XENLOG_G_DEBUG,...) so the verbosity of the 
logging is only for debug build.

Cheers,

[1] https://lists.xen.org/archives/html/xen-devel/2017-11/msg00942.html

-- 
Julien Grall

