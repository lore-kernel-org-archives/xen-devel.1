Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5470C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 11:23:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F87520679
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 11:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F87520679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg50s-0000hj-9n; Tue, 02 Jun 2020 11:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg50r-0000hW-Bb
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 11:23:21 +0000
X-Inumbo-ID: 7676f2da-a4c3-11ea-abd8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7676f2da-a4c3-11ea-abd8-12813bfff9fa;
 Tue, 02 Jun 2020 11:23:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B259AD48;
 Tue,  2 Jun 2020 11:23:21 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/ucode: Fix errors with start/end_update()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200601145755.3661-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e852d7b8-34e7-abc5-23a5-30106d271876@suse.com>
Date: Tue, 2 Jun 2020 13:23:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200601145755.3661-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.06.2020 16:57, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -395,26 +395,9 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
>      return patch;
>  }
>  
> -#ifdef CONFIG_HVM
> -static int start_update(void)
> -{
> -    /*
> -     * svm_host_osvw_init() will be called on each cpu by calling '.end_update'
> -     * in common code.
> -     */
> -    svm_host_osvw_reset();
> -
> -    return 0;
> -}
> -#endif
> -
>  const struct microcode_ops amd_ucode_ops = {
>      .cpu_request_microcode            = cpu_request_microcode,
>      .collect_cpu_info                 = collect_cpu_info,
>      .apply_microcode                  = apply_microcode,
> -#ifdef CONFIG_HVM
> -    .start_update                     = start_update,
> -    .end_update_percpu                = svm_host_osvw_init,

As a result the function can (and imo should) become static. Preferably
with that
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

