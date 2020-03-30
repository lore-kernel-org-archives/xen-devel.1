Return-Path: <SRS0=Uyyz=5P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F7CC43331
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2020 14:07:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54E320776
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2020 14:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="l9v4Znjz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54E320776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIv4P-0003wA-8P; Mon, 30 Mar 2020 14:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIv4O-0003w3-Iy
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 14:07:16 +0000
X-Inumbo-ID: c2a00220-728f-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a00220-728f-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VilGFPmX/nNg6jtP0A1wpmdjbQd+AuajL3YJ8SlM6qg=; b=l9v4ZnjzGZ7xDJ/18UbqsJ0O7/
 lP8E1IkzH0frNKtUr4PC1fZ+BV2nKXBulLrjheO/XM+uZqtNjwoG9pSlLMNCiMcKtZ1It8UN5BOgW
 VGjyTYwzFmKNjJK9Iv3neLSru71UG+KAgNKQ1NO6m7t/HF6KVPYcT+BZtyy6LITgCQHQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIv4K-0005bg-Uj; Mon, 30 Mar 2020 14:07:12 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIv4K-0001GQ-OJ; Mon, 30 Mar 2020 14:07:12 +0000
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
 <20200330135735.31512-4-ian.jackson@eu.citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a2f51bd6-7492-b9f3-0637-71d1a7681a04@xen.org>
Date: Mon, 30 Mar 2020 15:07:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330135735.31512-4-ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 3/3] docs/README: Fix a broken url
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 30/03/2020 14:57, Ian Jackson wrote:
> There was a / missing here.
> 
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   README | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README b/README
> index 555f3415fa..d0c87a78f0 100644
> --- a/README
> +++ b/README
> @@ -20,7 +20,7 @@ GPL. Since its initial public release, Xen has grown a large
>   development community, spearheaded by xen.org (https://www.xen.org).
>   
>   This file contains some quick-start instructions to install Xen on
> -your system. For more information see https:/www.xen.org/ and
> +your system. For more information see https://www.xen.org/ and
>   https://wiki.xen.org/
>   
>   Quick-Start Guide
> 

-- 
Julien Grall

