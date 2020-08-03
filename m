Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1708BC433DF
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 05:09:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C69206F6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 05:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C69206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Sia-0002Er-AQ; Mon, 03 Aug 2020 05:09:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2SiY-0002Em-TB
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 05:08:58 +0000
X-Inumbo-ID: 6f2d98f8-d547-11ea-aef0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f2d98f8-d547-11ea-aef0-12813bfff9fa;
 Mon, 03 Aug 2020 05:08:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D054BAB8B;
 Mon,  3 Aug 2020 05:09:11 +0000 (UTC)
Subject: Re: [PATCH 3/4] public/io/netif: specify MTU override node
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200730194858.28523-1-paul@xen.org>
 <20200730194858.28523-4-paul@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9ef89ad4-c48e-ee42-cdcf-8118b2621c16@suse.com>
Date: Mon, 3 Aug 2020 07:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730194858.28523-4-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.20 21:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> There is currently no documentation to state what MTU a frontend should
> adertise to its network stack. It has however long been assumed that the
> default value of 1500 is correct.
> 
> This patch specifies a mechanism to allow the tools to set the MTU via a
> xenstore node in the frontend area and states that the absence of that node
> means the frontend should assume an MTU of 1500 octets.
> 
> NOTE: The Windows PV frontend has used an MTU sampled from the xenstore
>        node specified in this patch.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Can you please update docs/misc/xenstore-paths.pandoc accordingly?
With that you can have my:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

