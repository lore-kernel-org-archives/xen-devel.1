Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7538C4167B
	for <xen-devel@archiver.kernel.org>; Thu,  7 Dec 2023 16:57:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.650038.1015265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHgE-0005rK-JY; Thu, 07 Dec 2023 16:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650038.1015265; Thu, 07 Dec 2023 16:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHgE-0005rD-GT; Thu, 07 Dec 2023 16:56:54 +0000
Received: by outflank-mailman (input) for mailman id 650038;
 Thu, 07 Dec 2023 16:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdoU=HS=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1rBHgC-0005pb-FR
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 16:56:53 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d57f967-9521-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 17:56:51 +0100 (CET)
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rBHg6-00DSbw-18; Thu, 07 Dec 2023 16:56:46 +0000
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
X-Inumbo-ID: 9d57f967-9521-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lPh8LMdFy5YnUc1DS1fRee/YgkA63td0Odm8EIiRxZo=; b=4ZQWyiBxBZmb+0TW0srqcJOAPc
	RY+5C5DCQfFRe6ZGbAeMGL6WXUi6oTrxrPy0OIRHkDX/wcII8ahej4KwA6K3V0T08B3nGOfnF4pMU
	zIQdXT7H3SdOuGX0Nj3pHqZlm2BfYzTRqhJ7kRLvRpF6EFl2XjJsbaNuyJxj3XAvKHD0dhOna06SQ
	96pFdCxpQQh2CVZ2Rsi+ZkaWVNCPsm/pqqRhvgbRzzyylgoUQDa/0WMpKKQTHPl0Hj+3oZJZvvffG
	l30wql0Hy61/t2YC5bFsvcKXCZOhplzM4qO75gNkvRsq1jm1EWg5Yzx+qFV9U8wm4HQd+N6d2LsS+
	XANPw0Ww==;
Message-ID: <11399bd2-f49d-4708-ad62-bbaba424c4f8@infradead.org>
Date: Thu, 7 Dec 2023 08:56:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: client: fix kernel-doc comments
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231206181724.27767-1-rdunlap@infradead.org>
 <c4fb61d7-d65e-4f6d-bb3f-cc961a70a757@suse.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c4fb61d7-d65e-4f6d-bb3f-cc961a70a757@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/7/23 01:27, Juergen Gross wrote:
> On 06.12.23 19:17, Randy Dunlap wrote:
>> Correct function kernel-doc notation to prevent warnings from
>> scripts/kernel-doc.
>>

>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Cc: xen-devel@lists.xenproject.org
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> with one nit below (can be fixed while committing) ...

Ah yes, thanks.

-- 
~Randy

