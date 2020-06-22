Return-Path: <SRS0=lk3V=AD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CDAC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2020 12:39:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C54F20732
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2020 12:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C54F20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnLjX-0002ow-Ck; Mon, 22 Jun 2020 12:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MNSJ=AD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jnLjV-0002or-RD
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 12:39:29 +0000
X-Inumbo-ID: 690cdffd-b485-11ea-be86-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 690cdffd-b485-11ea-be86-12813bfff9fa;
 Mon, 22 Jun 2020 12:39:28 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OVk8geFmR6xtVi3u5EUW/YEMvHM4My/nqALXbeX7+H+Ue9g98FP3POgm3gds5sjABmMjp4iDoB
 hMIaWM3whag9L+/MKtfiHjF+5xIxf3+7NbnZwLSO5rxDUCNBmKVNQLp6ouexCpJsQ3ezcv3CAG
 8Zeurgx1Fr7nCzSDpf8gUzMCCG7OrlrDfdf1Ht/F73Hi/PAnnoLxqLRM/dBpUODVls4aAhDw4X
 FxeVgb4UO+rPjwxAFn/FoWiYLYQRSCQZ+F6KckE5uLuongOFVzpFoZKp0/ORenImiBSx3qdW7H
 jaU=
X-SBRS: 2.7
X-MesageID: 20622817
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,266,1589256000"; d="scan'208";a="20622817"
Subject: Re: [PATCH] x86/CPUID: fill all fields in
 x86_cpuid_policy_fill_native()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
Date: Mon, 22 Jun 2020 13:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/06/2020 13:09, Jan Beulich wrote:
> Coverity validly complains that the new call from
> tools/tests/cpu-policy/test-cpu-policy.c:test_cpuid_current() leaves
> two fields uninitialized, yet they get then consumed by
> x86_cpuid_copy_to_buffer(). (All other present callers of the function
> pass a pointer to a static - and hence initialized - buffer.)
>
> Coverity-ID: 1464809
> Fixes: c22ced93e167 ("tests/cpu-policy: Confirm that CPUID serialisation is sorted")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -176,6 +176,10 @@ void x86_cpuid_policy_fill_native(struct
>                            ARRAY_SIZE(p->extd.raw) - 1); ++i )
>          cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
>  
> +    /* Don't report leaves from possible lower level hypervisor. */

", for now."

This will change in the future.

With this, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +    p->hv_limit = 0;
> +    p->hv2_limit = 0;
> +
>      x86_cpuid_policy_recalc_synth(p);
>  }
>  


