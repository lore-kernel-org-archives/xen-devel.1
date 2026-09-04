Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65184C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:53:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408682.1641100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2VIL-0003ex-RT; Fri, 04 Sep 2026 14:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408682.1641100; Fri, 04 Sep 2026 14:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2VIL-0003eq-Ou; Fri, 04 Sep 2026 14:53:33 +0000
Received: by outflank-mailman (input) for mailman id 1408682;
 Fri, 04 Sep 2026 14:53:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2VIK-0003ek-GQ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:53:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2VIJ-005HUh-2i;
 Fri, 04 Sep 2026 14:53:31 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2VIJ-00DU3E-0o;
 Fri, 04 Sep 2026 14:53:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=VjPIlWJ5xUTg8SyViWsT4d84P1/WzUYuP9dRMf7/n3c=; b=D5c3PZpSSdyEV1AwDvgBTcijjk
	EhvsXu3JJOgF3KZRDVH2RwGVX0Su8315UT0BstwAjrH3/lIa/NTtlughdS2VWNGuGdLHY755SX1EL
	x/IDg/tX/ch4IGEzoH2x7iIZkqrVAgmKoVKmi5QNrGI/nG7M6zgITigqos4ZmYkc1CAI=;
Date: Fri, 4 Sep 2026 16:53:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
Message-ID: <aprbab18qnndUhnM@macbook.local>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-2-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904141516.367862-2-ross.lagerwall@citrix.com>

On Fri, Sep 04, 2026 at 03:15:14PM +0100, Ross Lagerwall wrote:
> The Viridian spec requires the vector to be >= 0x10 when writing to the
> SINTx MSR, otherwise it should #GP fault.
> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
> the spec-defined initial value and since the vector is 0, it GP faults.
> To workaround this, treat the write as a no-op if the value is
> unchanged.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> In v2: Added a comment to clarify
> 
>  xen/arch/x86/hvm/viridian/synic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> index e6cba7548f1b..75b004440e58 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -157,6 +157,14 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          if ( !(viridian_feature_mask(d) & HVMPV_synic) )
>              return X86EMUL_EXCEPTION;
>  
> +        /*
> +         * Windows 11 Hyper-V (26H1) has been seen to write this MSR to
> +         * its default value, despite not being a spec compliant value.
> +         * Tolerate writes which have no change in value.
> +         */
> +        if ( val == vs->as_uint64 )
> +            break;

To make this a bit less workaround like, could we ignore the vector if
the SINT is masked (bit 16 set)?

Thanks, Roger.

