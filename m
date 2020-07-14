Return-Path: <SRS0=aF8x=AZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB23C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 12:04:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EF322224
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 12:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EF322224
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvJf7-0007Oh-Nk; Tue, 14 Jul 2020 12:03:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvJf6-0007OX-PW
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 12:03:52 +0000
X-Inumbo-ID: 1522ab1e-c5ca-11ea-92ff-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1522ab1e-c5ca-11ea-92ff-12813bfff9fa;
 Tue, 14 Jul 2020 12:03:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDF0DB021;
 Tue, 14 Jul 2020 12:03:53 +0000 (UTC)
Subject: Re: [PATCH v7 07/15] x86_64/mm: switch to new APIs in paging_init
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <7eb8f68f2202d97062d714d35a8b1d6a972cc623.1590750232.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb6d00d1-ea87-b33e-b2de-eacba4e6f4da@suse.com>
Date: Tue, 14 Jul 2020 14:03:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7eb8f68f2202d97062d714d35a8b1d6a972cc623.1590750232.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 13:11, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Map and unmap pages instead of relying on the direct map.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -481,6 +481,7 @@ void __init paging_init(void)
>      l3_pgentry_t *l3_ro_mpt;
>      l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
>      struct page_info *l1_pg;
> +    mfn_t l3_ro_mpt_mfn, l2_ro_mpt_mfn;

... just a single variable named "mfn" here. Afaics the life ranges
allow for this (imo) readability improvement.

Jan

