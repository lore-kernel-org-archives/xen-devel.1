Return-Path: <SRS0=vMqj=6Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B94DC47255
	for <xen-devel@archiver.kernel.org>; Mon, 11 May 2020 13:10:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D734820735
	for <xen-devel@archiver.kernel.org>; Mon, 11 May 2020 13:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D734820735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY8CC-0002rs-GL; Mon, 11 May 2020 13:10:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY8CB-0002rf-KC
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 13:10:11 +0000
X-Inumbo-ID: bdb9b43a-9388-11ea-a20f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdb9b43a-9388-11ea-a20f-12813bfff9fa;
 Mon, 11 May 2020 13:10:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C8B29AFD4;
 Mon, 11 May 2020 13:10:11 +0000 (UTC)
Subject: Re: [PATCH] changelog: add relevant changes during 4.14 development
 window
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200511103145.37098-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f783539-6a36-08eb-c141-bd0f76e5acfd@suse.com>
Date: Mon, 11 May 2020 15:10:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511103145.37098-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 12:31, Roger Pau Monne wrote:
> Add entries for the relevant changes I've been working on during the
> 4.14 development time frame. Mostly performance improvements related
> to pvshim scalability issues when running with high number of vCPUs.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  CHANGELOG.md | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index b11e9bc4e3..554eeb6a12 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -8,6 +8,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ### Added
>   - This file and MAINTAINERS entry.
> + - Use x2APIC mode whenever available, regardless of interrupt remapping
> +   support.
> + - Performance improvements to guest assisted TLB flushes, either when using
> +   the Xen hypercall interface or the viridian one.
> + - Assorted pvshim performance and scalability improvements plus some bug
> +   fixes.

Wouldn't most/all of these better go under a "### Changed" heading?

Jan

