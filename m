Return-Path: <SRS0=NZeg=6O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86383C83001
	for <xen-devel@archiver.kernel.org>; Thu, 30 Apr 2020 07:21:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C9D20838
	for <xen-devel@archiver.kernel.org>; Thu, 30 Apr 2020 07:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C9D20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU3VH-0006KW-Kn; Thu, 30 Apr 2020 07:21:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU3VG-0006Jz-1v
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 07:21:02 +0000
X-Inumbo-ID: 23b0e469-8ab3-11ea-9a09-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23b0e469-8ab3-11ea-9a09-12813bfff9fa;
 Thu, 30 Apr 2020 07:21:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5315EADF8;
 Thu, 30 Apr 2020 07:20:58 +0000 (UTC)
Subject: Re: [PATCH] x86/hap: be more selective with assisted TLB flush
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200429173601.77605-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4257a323-d37f-4af0-bdc6-a3f65c19438a@suse.com>
Date: Thu, 30 Apr 2020 09:20:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429173601.77605-1-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 19:36, Roger Pau Monne wrote:
> When doing an assisted flush on HAP the purpose of the
> on_selected_cpus is just to trigger a vmexit on remote CPUs that are
> in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
> also check that the vCPU is running.

Am I right to understand that the change is relevant only to
cover the period of time between ->is_running becoming false
and ->dirty_cpu becoming VCPU_CPU_CLEAN? I.e. ...

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -719,7 +719,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>          hvm_asid_flush_vcpu(v);
>  
>          cpu = read_atomic(&v->dirty_cpu);
> -        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) )
> +        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )

... the previous logic would have suitably covered the switch-to
path, but doesn't properly cover the switch-from one, due to our
lazy context switch approach? If so, I agree with the change:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
It might be worth mentioning this detail in the description then,
though.

Jan

