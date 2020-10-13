Return-Path: <SRS0=QJhb=DU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF33C43457
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 11:05:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB3A20E65
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 11:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="dtwGcF+w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB3A20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6151.16217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSI77-0005x5-5j; Tue, 13 Oct 2020 11:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6151.16217; Tue, 13 Oct 2020 11:05:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSI77-0005wy-2h; Tue, 13 Oct 2020 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 6151;
 Tue, 13 Oct 2020 11:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSI75-0005ws-8p
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:05:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43c0be4f-390d-445f-b550-b418b462d19a;
 Tue, 13 Oct 2020 11:05:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSI75-0005ws-8p
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:05:03 +0000
X-Inumbo-ID: 43c0be4f-390d-445f-b550-b418b462d19a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 43c0be4f-390d-445f-b550-b418b462d19a;
	Tue, 13 Oct 2020 11:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602587101;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Fil6qXpx5Jx7k0JgEfBa/teOaiR03jyju74BBwrClFY=;
  b=dtwGcF+wIYrOGwMJPbC0axbS8XWCD8yiuTpk6Z0Qm3ny9oA3XDC5pOUT
   xC7K80w+LO4oGdB5RJCX+8LvNMQVEns3TRmTJP0QtgpGptsd7pJaG6MdF
   43TBRFMboxEaKWu/huhvCXToZqahdIZtRVCLgrCwwindCgMDDNPE86q1X
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PFdo3m9GolughlWOToljGSDgRxnX/QljE/n0lI4kABxWYsGPJgChcaLRSA57jgOLk2PE27o/U+
 6wdIv3jGP41WuHULklUGcRylZhUG96ADLCa1zGDFuAq/UqLpbVUbBTA2gDXqJR4ngGJrwXuo+z
 MX1B6mjZCLuDwUtM1TQx6QGVxtxFUU9Zlp/PPmSS+azHQyEU4SEEp1ZvkbpZeo5tQehkAEfiz2
 +3x6VtKTQV4A9LVOyzDG/4D0KcMECpjXRoVwwMoGSafoptNymihXndFIYAqfSteazY+1MNNWf3
 Sow=
X-SBRS: 2.5
X-MesageID: 29127368
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="29127368"
Subject: Re: [PATCH v2 1/6] x86: replace __ASM_{CL,ST}AC
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <931e6d88-803e-36d6-da40-080879ec45a2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <54f12dc6-fb5d-d6b4-3d5f-7267f0e0ef00@citrix.com>
Date: Tue, 13 Oct 2020 12:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <931e6d88-803e-36d6-da40-080879ec45a2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 28/09/2020 13:29, Jan Beulich wrote:
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
>  $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>  $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
> +$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)

Kconfig

> --- /dev/null
> +++ b/xen/include/asm-x86/asm-defns.h
> @@ -0,0 +1,9 @@
> +#ifndef HAVE_AS_CLAC_STAC
> +.macro clac
> +    .byte 0x0f, 0x01, 0xca
> +.endm
> +
> +.macro stac
> +    .byte 0x0f, 0x01, 0xcb
> +.endm
> +#endif
> --- a/xen/include/asm-x86/asm_defns.h
> +++ b/xen/include/asm-x86/asm_defns.h

We cannot have two files which differ by the vertical positioning of a dash.

How about asm-insn.h for the former, seeing as that is what it contains.

~Andrew

