Return-Path: <SRS0=WVJZ=CQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FA0C433E2
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 07:59:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AF6208C7
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 07:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66AF6208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFC3a-0005B7-Aq; Mon, 07 Sep 2020 07:59:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFC3Y-0005B2-I5
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:59:16 +0000
X-Inumbo-ID: 6027a60b-e443-434b-84e9-27f784afbeeb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6027a60b-e443-434b-84e9-27f784afbeeb;
 Mon, 07 Sep 2020 07:59:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9484B613;
 Mon,  7 Sep 2020 07:59:15 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] x86/pv: Fix consistency of 64bit segment bases
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
References: <20200904135209.29226-1-andrew.cooper3@citrix.com>
 <20200904135209.29226-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2054f2e1-b580-34a8-96f9-3517e7a8c3c7@suse.com>
Date: Mon, 7 Sep 2020 09:59:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904135209.29226-2-andrew.cooper3@citrix.com>
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

On 04.09.2020 15:52, Andrew Cooper wrote:
> The comments in save_segments(), _toggle_guest_pt() and write_cr() are false.
> The %fs and %gs bases can be updated at any time by the guest.
> 
> As a consequence, Xen's fs_base/etc tracking state is always stale when the
> vcpu is in context, and must not be used to complete MSR_{FS,GS}_BASE reads, etc.
> 
> In particular, a sequence such as:
> 
>   wrmsr(MSR_FS_BASE, 0x1ull << 32);
>   write_fs(__USER_DS);
>   base = rdmsr(MSR_FS_BASE);
> 
> will return the stale base, not the new base.  This may cause guest a guest
> kernel's context switching of userspace to malfunction.
> 
> Therefore:
>  * Update save_segments(), _toggle_guest_pt() and read_msr() to always read
>    the segment bases from hardware.
>  * Update write_cr(), write_msr() and do_set_segment_base() to not not waste
>    time caching data which is instantly going to become stale again.
>  * Provide comments to explaining when the tracking state is and isn't stale.
> 
> This bug has been present for 14 years, but several bugfixes since have built
> on and extended the original flawed logic.
> 
> Fixes: ba9adb737ba ("Apply stricter checking to RDMSR/WRMSR emulations.")
> Fixes: c42494acb2f ("x86: fix FS/GS base handling when using the fsgsbase feature")
> Fixed: eccc170053e ("x86/pv: Don't have %cr4.fsgsbase active behind a guest kernels back")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


