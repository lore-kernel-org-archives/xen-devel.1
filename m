Return-Path: <SRS0=Ms5E=B4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E480C433E1
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2020 14:10:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26F2207DA
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2020 14:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="KJIcaYm1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F26F2207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82JN-0002Hw-Oj; Tue, 18 Aug 2020 14:10:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k82JM-0002GH-7e
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:10:00 +0000
X-Inumbo-ID: 532b64a0-447f-400e-b233-a23b02aab92f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 532b64a0-447f-400e-b233-a23b02aab92f;
 Tue, 18 Aug 2020 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597759799;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NZkaUE1y1OwumNJhVA2gDfK1fhYYaogK8ZhyvKY2K/8=;
 b=KJIcaYm1oYykk5opzKz5Et1Afmx9rUGt0aTTCPCvUrBPI4EToBUw/t3G
 Op6Uj+XLaHAUKdUJcfWaJocbw7b3DTaBZfpcck//t2JVaXwxlWt3964uj
 +c2MihfGT61d5BFWDaeBvHZbjuhG5lzFRsgcKFdXmXave6LtRbrTpxxkr s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +ZScw5BJCA7ImaDabjNeBHxNE6bOR52MVrXBBUDVUe3HsUHbSeqv3PMqxkLEzehz5jovF8UJ7z
 bA5h/05PTz3ZlAUF2dZ3zxDvyJXnculG+eDl2d73YAJCHC3wdNYB81AUcc8Qm/DBN9sQlt5aVt
 wWt0SaZ0TZGLuBf52Kxp3qOsLrAePpcVczQvOllIdVqFBMfFUAW7mKq7GAiPNxapscL06X3ok8
 YknwBJTafP6yCXBkirs+r91T6Q32tFVALI0yel6O8zQYU4p6V/Ays4xZ/QhhG/VR2Xx2NSLBwX
 rU8=
X-SBRS: 2.7
X-MesageID: 25698870
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25698870"
Subject: Re: [PATCH 6/8] x86/pv: allow reading FEATURE_CONTROL MSR
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-7-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <154d6899-c8e7-76e0-659a-bc284e52a834@citrix.com>
Date: Tue, 18 Aug 2020 15:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-7-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> Linux PV guests will attempt to read the FEATURE_CONTROL MSR, report
> no features enabled or available, and that the MSR is already locked.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/pv/emul-priv-op.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index 554a95ae8d..76c878b677 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -879,6 +879,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
>              *val |= APIC_BASE_BSP;
>          return X86EMUL_OKAY;
>  
> +    case MSR_IA32_FEATURE_CONTROL:
> +        *val = IA32_FEATURE_CONTROL_LOCK;
> +        return X86EMUL_OKAY;

This isn't quite right.  This is an Intel-like MSR only, and should #GP
for AMD/Hygon.

It would be better to move it to the common guest_rdmsr() function, as
the two helpers (vmce_lmce, and nested_virt) used to construct it in the
vmx code are already generic.

This also helps progress the work to drop all the legacy MSR handling.

~Andrew

