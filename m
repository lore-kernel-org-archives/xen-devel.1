Return-Path: <SRS0=q/iZ=AL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DBCC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2020 16:23:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCE820768
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2020 16:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCE820768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqJ2l-0003hD-Ag; Tue, 30 Jun 2020 16:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqJ2j-0003h8-UF
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 16:23:33 +0000
X-Inumbo-ID: 0a1e3b98-baee-11ea-865a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a1e3b98-baee-11ea-865a-12813bfff9fa;
 Tue, 30 Jun 2020 16:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC75AADE4;
 Tue, 30 Jun 2020 16:23:31 +0000 (UTC)
Subject: Re: [PATCH v4 01/10] x86/vmx: add Intel PT MSR definitions
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e18c7aa4-2340-85a8-9e17-64325fa99e5b@suse.com>
Date: Tue, 30 Jun 2020 18:23:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.06.2020 14:33, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Define constants related to Intel Processor Trace features.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>

This needs re-basing onto current staging, now that Andrew's patch
to add the MSR numbers has gone in. Apart from this a couple of
cosmetic requests:

> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -69,6 +69,43 @@
>  #define MSR_MCU_OPT_CTRL                    0x00000123
>  #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
>  
> +/* Intel PT MSRs */
> +#define MSR_RTIT_OUTPUT_BASE                0x00000560
> +
> +#define MSR_RTIT_OUTPUT_MASK                0x00000561
> +
> +#define MSR_RTIT_CTL                        0x00000570
> +#define  RTIT_CTL_TRACEEN                    (_AC(1, ULL) <<  0)

The right side is indented one space too many - see the similar
#define in context above.

> +#define  RTIT_CTL_CYCEN                      (_AC(1, ULL) <<  1)
> +#define  RTIT_CTL_OS                         (_AC(1, ULL) <<  2)
> +#define  RTIT_CTL_USR                        (_AC(1, ULL) <<  3)
> +#define  RTIT_CTL_PWR_EVT_EN                 (_AC(1, ULL) <<  4)
> +#define  RTIT_CTL_FUP_ON_PTW                 (_AC(1, ULL) <<  5)
> +#define  RTIT_CTL_FABRIC_EN                  (_AC(1, ULL) <<  6)
> +#define  RTIT_CTL_CR3_FILTER                 (_AC(1, ULL) <<  7)
> +#define  RTIT_CTL_TOPA                       (_AC(1, ULL) <<  8)
> +#define  RTIT_CTL_MTC_EN                     (_AC(1, ULL) <<  9)
> +#define  RTIT_CTL_TSC_EN                     (_AC(1, ULL) <<  10)

The double blanks on the earlier lines exist such that here you
can reduce to a single one. You'll also find examples of this
further up in the file.

> +#define  RTIT_CTL_DIS_RETC                   (_AC(1, ULL) <<  11)
> +#define  RTIT_CTL_PTW_EN                     (_AC(1, ULL) <<  12)
> +#define  RTIT_CTL_BRANCH_EN                  (_AC(1, ULL) <<  13)
> +#define  RTIT_CTL_MTC_FREQ                   (_AC(0x0F, ULL) <<  14)

0xf please (i.e. lower case and no random number of leading
zeros).

> +#define  RTIT_CTL_CYC_THRESH                 (_AC(0x0F, ULL) <<  19)
> +#define  RTIT_CTL_PSB_FREQ                   (_AC(0x0F, ULL) <<  24)
> +#define  RTIT_CTL_ADDR(n)                    (_AC(0x0F, ULL) <<  (32 + (4 * (n))))

Strictly speaking we don't need the parentheses around the operands
of binary * here - in mathematics precedence between + and * is
well defined. (We do parenthesize certain other expressions, when
the precedence may not be as well known.)

Thanks, Jan

