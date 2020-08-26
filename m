Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EBEC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 13:28:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01962214F1
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 13:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01962214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAvSy-0002U5-Dk; Wed, 26 Aug 2020 13:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAvSw-0002U0-I0
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 13:27:50 +0000
X-Inumbo-ID: 9d9468d3-2b96-4a4d-ac7e-c2ec5b1d526c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d9468d3-2b96-4a4d-ac7e-c2ec5b1d526c;
 Wed, 26 Aug 2020 13:27:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44925AEAB;
 Wed, 26 Aug 2020 13:28:20 +0000 (UTC)
Subject: Re: [PATCH] x86: Begin to introduce support for MSR_ARCH_CAPS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200824165804.17230-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7f3bc4f-7050-170f-5d1b-33ed24ad9470@suse.com>
Date: Wed, 26 Aug 2020 15:27:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824165804.17230-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.2020 18:58, Andrew Cooper wrote:
> ... including serialisation/deserialisation logic and unit tests.
> 
> There is no current way to configure this MSR correctly for guests.
> The toolstack side this logic needs building, which is far easier to
> do with it in place.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with perhaps one correction:

> @@ -23,6 +23,28 @@ struct msr_policy
>              bool cpuid_faulting:1;
>          };
>      } platform_info;
> +
> +    /*
> +     * 0x0000010a - MSR_ARCH_CAPABILITIES
> +     *
> +     * This is an Intel-only MSR, which provides miscellaneous enumeration,
> +     * including those which indicate that microarchitectrual sidechannels are
> +     * fixed in hardware.
> +     */
> +    union {
> +        uint32_t raw;
> +        struct {
> +            bool rdcl_no:1;
> +            bool ibrs_all:1;
> +            bool rsba:1;
> +            bool skip_l1dfl:1;
> +            bool ssb_no:1;
> +            bool mdd_no:1;

mds_no?

> +            bool if_pschange_mc_no:1;
> +            bool tsx_ctrl:1;
> +            bool taa_no:1;
> +        };
> +    } arch_caps;

I guess eventually we will want to eliminate the duplication between
this and the ARCH_CAPS_* #define-s we have in msr-index.h?

Jan

