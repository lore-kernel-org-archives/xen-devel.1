Return-Path: <SRS0=jAzW=5K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D63C1975A
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2020 13:34:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE9320658
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2020 13:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE9320658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6Ah-00033v-98; Wed, 25 Mar 2020 13:34:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH6Af-00033q-QP
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 13:34:13 +0000
X-Inumbo-ID: 5070f9b6-6e9d-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5070f9b6-6e9d-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 13:34:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 164D1AC37;
 Wed, 25 Mar 2020 13:34:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3aa9bde-1cf7-f400-ba0b-dc9defb687d3@suse.com>
Date: Wed, 25 Mar 2020 14:34:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323101724.15655-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 3/7] x86/ucode/intel: Remove gratuitous
 memory allocations from cpu_request_microcode()
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

On 23.03.2020 11:17, Andrew Cooper wrote:
>  static struct microcode_patch *cpu_request_microcode(const void *buf,
>                                                       size_t size)
>  {
> -    long offset = 0;
>      int error = 0;
> -    struct microcode_intel *mc, *saved = NULL;
> +    const struct microcode_intel *saved = NULL;
>      struct microcode_patch *patch = NULL;
>  
> -    while ( (offset = get_next_ucode_from_buffer(&mc, buf, size, offset)) > 0 )
> +    while ( size )
>      {
> -        error = microcode_sanity_check(mc);
> -        if ( error )
> +        const struct microcode_intel *mc;
> +        unsigned int blob_size;
> +
> +        if ( size < MC_HEADER_SIZE ||       /* Insufficient space for header? */
> +             (mc = buf)->hdr.hdrver != 1 || /* Unrecognised header version?   */
> +             mc->hdr.ldrver != 1 ||         /* Unrecognised loader version?   */

These two duplicate what microcode_sanity_check() does,
plus the function issues a log message when either check
fails. Since I think ...

> +             size < (blob_size =            /* Insufficient space for patch?  */
> +                     get_totalsize(&mc->hdr)) )

... this wants to come after the two version checks, how
about lifting the printk() here? The other user of
microcode_sanity_check() is an ASSERT(), where it's rather
less relevant to have such a printk().

Jan

