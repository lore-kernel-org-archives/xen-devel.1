Return-Path: <SRS0=4S+V=AV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6281C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2020 12:15:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6C520720
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2020 12:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6C520720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtrwI-0002mP-Mw; Fri, 10 Jul 2020 12:15:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY6w=AV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jtrwH-0002mK-0P
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 12:15:37 +0000
X-Inumbo-ID: 0e4fa903-c2a7-11ea-8f9c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e4fa903-c2a7-11ea-8f9c-12813bfff9fa;
 Fri, 10 Jul 2020 12:15:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AD0DADE2;
 Fri, 10 Jul 2020 12:15:34 +0000 (UTC)
Subject: Re: [PATCH] xen/xenbus: Fix a double free in xenbus_map_ring_pv()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20200710113610.GA92345@mwanda>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3434e219-216f-ba50-c001-35a066d20db4@suse.com>
Date: Fri, 10 Jul 2020 14:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710113610.GA92345@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Yan Yankovskyi <yyankovskyi@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.07.20 13:36, Dan Carpenter wrote:
> When there is an error the caller frees "info->node" so the free here
> will result in a double free.  We should just delete first kfree().
> 
> Fixes: 3848e4e0a32a ("xen/xenbus: avoid large structs and arrays on the stack")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for spotting this!

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

