Return-Path: <SRS0=jQwh=BH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772D0C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 18:00:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5415020672
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 18:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5415020672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0TtW-0007XF-Jl; Tue, 28 Jul 2020 18:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0TtV-0007MT-HU
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 18:00:05 +0000
X-Inumbo-ID: 29b6c26d-d0fc-11ea-8baf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29b6c26d-d0fc-11ea-8baf-bc764e2007e4;
 Tue, 28 Jul 2020 18:00:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB72CABE2;
 Tue, 28 Jul 2020 18:00:14 +0000 (UTC)
Subject: Re: [PATCH] public/domctl: Fix the struct xen_domctl ABI in 32bit
 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728101529.13753-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69eed808-a15e-b6a8-14e6-dd4d5bfaae2a@suse.com>
Date: Tue, 28 Jul 2020 20:00:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728101529.13753-1-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 12:15, Andrew Cooper wrote:
> The Xen domctl ABI currently relies on the union containing a field with
> alignment of 8.
> 
> 32bit projects which only copy the used subset of functionality end up with an
> ABI breakage if they don't have at least one uint64_aligned_t field copied.

I'm entirely find with the change, but I'm struggling with this justification:
How can _any_ change to the header in our tree help people using custom
derivations (i.e. including those defining only some of the union members)?

> Further proof that C isn't an appropriate way to desribe an ABI...

Further proof that it requires more careful writing in C to serve as an ABI
description, I would say.

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -959,6 +959,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>       return ret;
>   }
>   
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    struct xen_domctl d;

Doesn't this also need __maybe_unused? Afaik ...

> +    BUILD_BUG_ON(sizeof(d) != 16 /* header */ + 128 /* union */);
> +    BUILD_BUG_ON(offsetof(typeof(d), u) != 16);
> +}

... neither sizeof() nor typeof() count as actual uses.

Jan

