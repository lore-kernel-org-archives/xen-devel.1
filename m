Return-Path: <SRS0=cyMZ=6I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F243C2BA1A
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 09:02:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71DAE20724
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 09:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="PH9AvQgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71DAE20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRuE9-00080j-UA; Fri, 24 Apr 2020 09:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRuE8-00080e-TH
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:02:28 +0000
X-Inumbo-ID: 528f9751-860a-11ea-9475-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528f9751-860a-11ea-9475-12813bfff9fa;
 Fri, 24 Apr 2020 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2UT31ZSgx27RMlDVsTNhqwa3saXLusAAL8Qxf/y3Gk=; b=PH9AvQgQqHRaYzPwGVU+amm8PC
 QUwRfZUmVHQD0vC0C4bQhW9lmjnt2Ea6eTHIFg6wUcGToCWofCZpoND5z+OaTL+7r5r66KzAUdaJA
 djnDH2aubAa5HSavrr1k7fotMqKIzRIaDmvfHGZXAlXz6ZCBr6jlaMdiZ6BOW7elLgwA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRuE7-0003Uz-HH; Fri, 24 Apr 2020 09:02:27 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRuE7-0003wW-Ba; Fri, 24 Apr 2020 09:02:27 +0000
Subject: Re: [PATCH 1/6] x86_64/mm: map and unmap page tables in
 cleanup_frame_table
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1587116799.git.hongyxia@amazon.com>
 <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a1caa70d-9c7a-b0c2-d7cf-1893db8f0ac4@xen.org>
Date: Fri, 24 Apr 2020 10:02:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/04/2020 10:52, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Also fix a weird indentation.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> ---
>   xen/arch/x86/x86_64/mm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index e85ef449f3..18210405f4 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -737,8 +737,8 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
>   
>       while (sva < eva)
>       {
> -        l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(sva)])[
> -          l3_table_offset(sva)];
> +        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(sva)],
> +                           l3_table_offset(sva));
>           if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) ||
>                (l3e_get_flags(l3e) & _PAGE_PSE) )
>           {
> @@ -747,7 +747,7 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
>               continue;
>           }
>   
> -        l2e = l3e_to_l2e(l3e)[l2_table_offset(sva)];
> +        l2e = l2e_from_l3e(l3e, l2_table_offset(sva));
>           ASSERT(l2e_get_flags(l2e) & _PAGE_PRESENT);
>   
>           if ( (l2e_get_flags(l2e) & (_PAGE_PRESENT | _PAGE_PSE)) ==
> @@ -763,10 +763,10 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
>               continue;
>           }
>   
> -        ASSERT(l1e_get_flags(l2e_to_l1e(l2e)[l1_table_offset(sva)]) &
> -                _PAGE_PRESENT);
> -         sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) +
> -                    (1UL << PAGE_SHIFT);
> +        ASSERT(l1e_get_flags(l1e_from_l2e(l2e, l1_table_offset(sva))) &
> +               _PAGE_PRESENT);
> +
> +        sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) + (1UL << PAGE_SHIFT);

NIT: While you are modifying the indentation. Couldn't we use PAGE_MASK 
and PAGE_SIZE here?

Cheers,

-- 
Julien Grall

