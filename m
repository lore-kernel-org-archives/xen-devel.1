Return-Path: <SRS0=mA2z=H4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECDDC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 13:28:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 014BB64E4B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 13:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 014BB64E4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.90306.170895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFd9x-0003Fc-DR; Fri, 26 Feb 2021 13:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90306.170895; Fri, 26 Feb 2021 13:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFd9x-0003FV-Ad; Fri, 26 Feb 2021 13:27:57 +0000
Received: by outflank-mailman (input) for mailman id 90306;
 Fri, 26 Feb 2021 13:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFd9v-0003FQ-ST
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 13:27:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26d7d8ff-d4d4-4e2f-8e94-b68cfabbcbc7;
 Fri, 26 Feb 2021 13:27:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55400AD74;
 Fri, 26 Feb 2021 13:27:54 +0000 (UTC)
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
X-Inumbo-ID: 26d7d8ff-d4d4-4e2f-8e94-b68cfabbcbc7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614346074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdfAgz1jJHl2MSMAUG70pDDursofdtrzfUF1wKdG9tU=;
	b=kxRvvhGrI/YWuY/TbnEQq3m/i/6hLakOtRoqLAT0EH1+muLvA1oVsRgm2G0yDZpA7LKmkH
	UCrmdAhQwTAF5N7aScRgWH5B2fNKLRuGSUyKsR1JmoWd1Hq4+1HVj4tyJDodePkQwxtRgZ
	aU3BaUITnVahrPwg/UCqIbbWHlNEfNU=
Subject: Re: [PATCH for-4.15 v5 1/3] xen/iommu: x86: Don't try to free page
 tables is the IOMMU is not enabled
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210226105640.12037-1-julien@xen.org>
 <20210226105640.12037-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3cd9b5c-a03a-a305-4133-7c2fe0546d97@suse.com>
Date: Fri, 26 Feb 2021 14:27:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226105640.12037-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 11:56, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> When using CONFIG_BIGMEM=y, the page_list cannot be accessed whilst it
> is is unitialized. However, iommu_free_pgtables() will be called even if
> the domain is not using an IOMMU.
> 
> Consequently, Xen will try to go through the page list and deference a
> NULL pointer.
> 
> Bail out early if the domain is not using an IOMMU.
> 
> Fixes: 15bc9a1ef51c ("x86/iommu: add common page-table allocator")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


