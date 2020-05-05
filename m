Return-Path: <SRS0=STq+=6T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3EEC47254
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2020 14:52:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54EEA206B9
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2020 14:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54EEA206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyvZ-0006JW-1u; Tue, 05 May 2020 14:52:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVyvX-0006JM-Hb
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:52:07 +0000
X-Inumbo-ID: fbcdf52e-8edf-11ea-9dc5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbcdf52e-8edf-11ea-9dc5-12813bfff9fa;
 Tue, 05 May 2020 14:52:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7855DAB3D;
 Tue,  5 May 2020 14:52:07 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Fix Clang build with !CONFIG_PV32
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200505142810.14827-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3434eaa5-d8ce-fa8f-17a8-19e9739121d8@suse.com>
Date: Tue, 5 May 2020 16:52:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505142810.14827-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 16:28, Andrew Cooper wrote:
> @@ -753,8 +751,9 @@ void load_system_tables(void)
>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>  	if ( IS_ENABLED(CONFIG_PV32) )
> -		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
> -				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
> +		_set_tssldt_desc(
> +			this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
> +			(unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);

Isn't indentation here off by 4 compared to what we
normally do with extremely large argument expressions?
Other than this lgtm.

Jan

