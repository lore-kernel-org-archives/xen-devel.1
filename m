Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF76C79FB7
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 07:38:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414024.1643880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZMt-0006vv-DO; Thu, 10 Sep 2026 07:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414024.1643880; Thu, 10 Sep 2026 07:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZMt-0006vo-Ai; Thu, 10 Sep 2026 07:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1414024;
 Thu, 10 Sep 2026 07:38:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4ZMs-0006vi-9R
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 07:38:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4ZMr-007zlr-0R;
 Thu, 10 Sep 2026 07:38:45 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4ZMr-005rLE-20;
 Thu, 10 Sep 2026 07:38:45 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=ZadJenT7WXiUfYrdH3hkxphw83tVWloPDVk8Swz1wLc=; b=zuh7zuydL8d8y2WUh7fJRu3IdD
	vw5bRRfQshxOJu5wBSGDuNqvfsewyIe38Oy6fcn4iLqg3bryPfO5I69MN0CyRcjEgvOYBWVjZ+DN1
	UDubSNStjjuAKX0GEGDHtEi2CoCWnGfvQhsbQNxCS2u+sMOtOfTAP2ghFsRuGeCO6agA=;
Date: Thu, 10 Sep 2026 09:38:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 01/12] x86/IO-APIC: address Misra 2.1 rule violations
Message-ID: <aqJeg_IcGrrGp1sb@macbook.local>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <85c111a5-105c-4b8f-8b81-d7ec1d0f9436@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85c111a5-105c-4b8f-8b81-d7ec1d0f9436@suse.com>

On Fri, Aug 28, 2026 at 08:59:41AM +0200, Jan Beulich wrote:
> In both functions cases 0..3 are handled, and a 2-bit mask is applied to
> the switch() expression. Therefore the default: cases are reported
> unreachable by Eclair. Subsume the "case 2" blocks each into the
> corresponding default ones.
> 
> While there also drop all the pointless figure braces inside the various
> case blocks, inserting blank lines instead between them.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> 
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -804,66 +804,48 @@ static int __init MPBIOS_polarity(int id
>      switch (mp_irqs[idx].mpc_irqflag & 3)
>      {
>      case 0: /* conforms, ie. bus-type dependent polarity */
> -    {
>          switch (mp_bus_id_to_type[bus])
>          {
>          case MP_BUS_ISA: /* ISA pin */
> -        {
>              polarity = default_ISA_polarity(idx);
>              break;
> -        }
> +
>          case MP_BUS_EISA: /* EISA pin */
> -        {
>              polarity = default_EISA_polarity(idx);
>              break;
> -        }
> +
>          case MP_BUS_PCI: /* PCI pin */
> -        {
>              polarity = default_PCI_polarity(idx);
>              break;
> -        }
> +
>          case MP_BUS_MCA: /* MCA pin */
> -        {
>              polarity = default_MCA_polarity(idx);
>              break;
> -        }
> +
>          case MP_BUS_NEC98: /* NEC 98 pin */
> -        {
>              polarity = default_NEC98_polarity(idx);
>              break;
> -        }
> +
>          default:
> -        {
>              printk(KERN_WARNING "broken BIOS!!\n");
>              polarity = 1;
>              break;
>          }
> -        }
>          break;
> -    }
> +
>      case 1: /* high active */
> -    {
>          polarity = 0;
>          break;
> -    }
> -    case 2: /* reserved */
> -    {
> -        printk(KERN_WARNING "broken BIOS!!\n");
> -        polarity = 1;
> -        break;
> -    }
> +
>      case 3: /* low active */
> -    {
>          polarity = 1;
>          break;
> -    }
> -    default: /* invalid */
> -    {
> +
> +    default: /* reserved */
>          printk(KERN_WARNING "broken BIOS!!\n");

We should also see about improving those messages, because this is not
helpful at all.

Thanks, Roger.

