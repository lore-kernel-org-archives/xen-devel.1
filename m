Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A05C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 08:07:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A964C2074D
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 08:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A964C2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl6cf-0003Hb-Hy; Tue, 16 Jun 2020 08:07:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl6ce-0003Gs-La
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:07:08 +0000
X-Inumbo-ID: 5f10e692-afa8-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f10e692-afa8-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 08:07:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15CCCAD17;
 Tue, 16 Jun 2020 08:07:09 +0000 (UTC)
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
To: Grzegorz Uriasz <gorbak25@gmail.com>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
Date: Tue, 16 Jun 2020 10:07:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.06.2020 16:36, Grzegorz Uriasz wrote:
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>  		if (fadt->xpm_timer_block.space_id ==
>  		    ACPI_ADR_SPACE_SYSTEM_IO) {
>  			pmtmr_ioport = fadt->xpm_timer_block.address;
> -			pmtmr_width = fadt->xpm_timer_block.bit_width;
> +			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
> +				pmtmr_width = 32;
> +			else
> +				pmtmr_width = 24;

I think disagreement of the two wants logging, and you want to
default to using the smaller of the two (or even to ignoring the
timer altogether). Then there wants to be a way to override
(unless we already have one) our defaulting, in case it's wrong.

Also I'd prefer if you used a conditional operator for this
assignment.

Jan

