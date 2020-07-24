Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66014C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 12:11:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D59A2065E
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 12:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="efIW1T5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D59A2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jywXu-0006f7-8j; Fri, 24 Jul 2020 12:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tno1=BD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jywXs-0006f2-CS
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 12:11:24 +0000
X-Inumbo-ID: ca03ec6c-cda6-11ea-a3bd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca03ec6c-cda6-11ea-a3bd-12813bfff9fa;
 Fri, 24 Jul 2020 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595592683;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1P0gyWlreOZfRM/fQGa8yYGacnnFBtjTvWhn8X6cGuo=;
 b=efIW1T5Isp5K3LJa06HaWVr4TKxVEg7V9htLuLHgBUIppkrifR1AsVce
 eBWBfs09kkvhcrbsiKmF0eibL3bUvVmQ/vBx2zoGPzg/j1vcXNkmlQCyY
 b1y05OBVu+abEkAvjFrCFPkfdNan3jvMY43I3ngbnNv8X1gVfvuDzcR8l U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sxJRq5KY/C4CEE2PXaJ8Mbtme54zkvMBY+7ZCHnQ5L/1e4W1eFXsIeAADadGEaoJbDIRdGiwIm
 XaazKwkCMwHRkzT0ZlpWIVCe49dcchAl6GmOB3eGMlnZYjc8J6TqAcJJ39QMJTWvTsxMt69ty7
 Lzzwp0tdjfv7rm8RGrSEryYBGwDGC014F5d7quuNVNMZQDiEPOSZY8rWVFjRCQ/ZN7gAkpF2e7
 wOs0GxVZ1+JUZerQc3z/YHkVLaR9bjPfg3b1bBSkwSXDqDhsT2STyY/L7915oU0EhjjY8/hSfS
 TZA=
X-SBRS: 2.7
X-MesageID: 23117059
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,390,1589256000"; d="scan'208";a="23117059"
Subject: Re: [PATCH] x86: guard against port I/O overlapping the RTC/CMOS range
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8b267b5e-8bd0-692e-d5d9-4a2bd21fb261@citrix.com>
Date: Fri, 24 Jul 2020 13:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/07/2020 14:10, Jan Beulich wrote:
> Since we intercept RTC/CMOS port accesses, let's do so consistently in
> all cases, i.e. also for e.g. a dword access to [006E,0071]. To avoid
> the risk of unintended impact on Dom0 code actually doing so (despite
> the belief that none ought to exist), also extend
> guest_io_{read,write}() to decompose accesses where some ports are
> allowed to be directly accessed and some aren't.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -210,7 +210,7 @@ static bool admin_io_okay(unsigned int p
>          return false;
>  
>      /* We also never permit direct access to the RTC/CMOS registers. */
> -    if ( ((port & ~1) == RTC_PORT(0)) )
> +    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
>          return false;

This first hunk is fine.

However, why decompose anything?  Any disallowed port in the range
terminates the entire access, and doesn't internally shrink the access.

~Andrew

