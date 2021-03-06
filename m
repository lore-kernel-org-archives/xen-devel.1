Return-Path: <SRS0=x7Wx=IE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BB3C433DB
	for <xen-devel@archiver.kernel.org>; Sat,  6 Mar 2021 19:52:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6717D64F07
	for <xen-devel@archiver.kernel.org>; Sat,  6 Mar 2021 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6717D64F07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94374.177921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIcyE-00063O-Oo; Sat, 06 Mar 2021 19:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94374.177921; Sat, 06 Mar 2021 19:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIcyE-00063H-Lk; Sat, 06 Mar 2021 19:52:14 +0000
Received: by outflank-mailman (input) for mailman id 94374;
 Sat, 06 Mar 2021 19:52:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIcyD-00063C-72
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 19:52:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIcyA-0007wv-IY; Sat, 06 Mar 2021 19:52:10 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIcyA-00073S-7Q; Sat, 06 Mar 2021 19:52:10 +0000
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
	bh=ek6GxqEhnufZUAI0eViLtNegYXP4e2JeQmjzhDOrxVI=; b=dX3X+qI7Y9aE6Zuu6SdMelb7mu
	OUiAcAYuI28ASWPc3iG0FTHVvWzTSO3pCVif5bqdX/doLsb0jpf2W24HAViyA0MnrDQqVPEX4Zdqp
	JSiekSr2F99IjNIgN17BSmOWxlGLCCEFVtyeWnEcxCHMd1d1tVA13/VB5sjsXfQ/P7Dc=;
Subject: Re: [PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk
 configuration
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-25-git-send-email-olekstysh@gmail.com>
 <e1da0892-5496-b438-f52f-1e5dd8d48979@xen.org>
 <87f92e40-6462-21ba-0c56-b77c6518fef8@gmail.com>
 <dce22061-aa73-dba7-601d-fe20f989688d@xen.org>
 <57272148-ff37-1e5e-1b83-b56304431bc9@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86564c3a-2320-138a-574d-067e9b6ab417@xen.org>
Date: Sat, 6 Mar 2021 19:52:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <57272148-ff37-1e5e-1b83-b56304431bc9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 10/02/2021 09:02, Oleksandr wrote:
> 
> On 20.01.21 19:05, Julien Grall wrote:
> Thinking a bit more what approach to choose...
> I would tend to automatically allocate the virtio IRQ (4th option) 
> rather than use static approach with reserved IRQs
> in order to eliminate the chance of a clash with a physical IRQs 
> completely from the very beginning. From other side
> we can indeed use static approach (as simpler one) for now and then 
> refine it when we have more understanding about the virtio usage.
> What do you think?

The static approach should be fine for now.

Cheers,

-- 
Julien Grall

