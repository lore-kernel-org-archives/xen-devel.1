Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0626EC3815B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 14:10:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09DB20B1F
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 14:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09DB20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQX7T-00043S-MT; Mon, 20 Apr 2020 14:09:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQX7S-00043N-IQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:09:54 +0000
X-Inumbo-ID: 9b39e0c0-8310-11ea-9068-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b39e0c0-8310-11ea-9068-12813bfff9fa;
 Mon, 20 Apr 2020 14:09:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BB53ABD7;
 Mon, 20 Apr 2020 14:09:52 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/pv: Short-circuit is_pv_{32,64}bit_domain() in
 !CONFIG_PV32 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b721f94-92de-8d23-b9a4-fdaae13aec38@suse.com>
Date: Mon, 20 Apr 2020 16:09:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417155004.16806-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 17:50, Andrew Cooper wrote:
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -215,7 +215,7 @@ int switch_compat(struct domain *d)
>          return 0;
>  
>      d->arch.has_32bit_shinfo = 1;
> -    d->arch.is_32bit_pv = 1;
> +    d->arch.pv.is_32bit = 1;
>  
>      for_each_vcpu( d, v )
>      {
> @@ -235,7 +235,7 @@ int switch_compat(struct domain *d)
>      return 0;
>  
>   undo_and_fail:
> -    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
> +    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
>      for_each_vcpu( d, v )
>      {
>          free_compat_arg_xlat(v);
> @@ -358,7 +358,7 @@ int pv_domain_initialise(struct domain *d)
>      d->arch.ctxt_switch = &pv_csw;
>  
>      /* 64-bit PV guest by default. */
> -    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
> +    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;

Switch to true/false while you're touching these?

Jan

