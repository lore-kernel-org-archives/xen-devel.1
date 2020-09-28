Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97D5C2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 12:48:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549DA21974
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 12:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="HC8R9OeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549DA21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsZd-00011x-KY; Mon, 28 Sep 2020 12:48:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMsZc-00011s-Qy
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:48:08 +0000
X-Inumbo-ID: d65e8350-d4f4-4482-8678-07977a4ae00e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d65e8350-d4f4-4482-8678-07977a4ae00e;
 Mon, 28 Sep 2020 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601297286;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PBVzVyzYPZC6892HkoORxYNHabSQpp1y2T5oKjMBAu4=;
 b=HC8R9OeCQwYeCQfVBuQUC0859CXd2kyfR9lbjaECG3T3ElGbSxx2S0kK
 +lXvBMkhH/L0sIEBiyD57+LJkalofBjVFQhODvMcPREPts/0TjEHRsOdM
 A4MJCLOijx2JYECj+E9dumUz53eacYvK+dG+w+pE4kxSqH2rJ254vbinH A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 21xcia6cEeq6Skj60pG6Du/4WpwJNOoRApc/nL9jQjAKKiTOdfUiw4ofxABEUoywnvz8IdOizo
 VEOjvf63KYq2CpxK1G6bbbtNdBTVyy8n7jA/loMRPJbddSfLBOlWOq5zyAQd9MSKVjH7AKIhB0
 sgF4wNX5yO/Ge5ovnf8TMPI267aAXG4B9pCTzOI8gjEvIDVkFef753Haondiw7TVWMysVR0DuO
 pdRtvSncV5uMclkjb4DUT6IntNif7MQ9MJzRIknKZFP231VgiZqBLoBIthVNFkSiww9idFMI+T
 JhU=
X-SBRS: None
X-MesageID: 28754082
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="28754082"
Subject: Re: [PATCH 1/5] x86: introduce read_sregs() to allow storing to
 memory directly
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <6cd5dfca-a10c-0847-c084-a511ab2cbb1c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <46c1f7b6-6c96-9c81-849e-4e44ed341ccb@citrix.com>
Date: Mon, 28 Sep 2020 13:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6cd5dfca-a10c-0847-c084-a511ab2cbb1c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 28/09/2020 13:05, Jan Beulich wrote:
> --- a/xen/include/asm-x86/regs.h
> +++ b/xen/include/asm-x86/regs.h
> @@ -15,4 +15,18 @@
>      (diff == 0);                                                              \
>  })
>  
> +#define read_sreg(name) ({                                    \
> +    unsigned int __sel;                                       \
> +    asm volatile ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
> +    __sel;                                                    \
> +})
> +
> +static inline void read_sregs(struct cpu_user_regs *regs)
> +{
> +    asm volatile ( "mov %%ds, %0" : "=m" (regs->ds) );
> +    asm volatile ( "mov %%es, %0" : "=m" (regs->es) );
> +    asm volatile ( "mov %%fs, %0" : "=m" (regs->fs) );
> +    asm volatile ( "mov %%gs, %0" : "=m" (regs->gs) );

It occurs to me that reads don't need to be volatile.  There are no side
effects.

With that fixed, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

