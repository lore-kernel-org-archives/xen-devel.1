Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EDDC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 08:32:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401766.1637296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzs0L-0003oU-PN; Fri, 28 Aug 2026 08:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401766.1637296; Fri, 28 Aug 2026 08:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzs0L-0003oN-Km; Fri, 28 Aug 2026 08:32:05 +0000
Received: by outflank-mailman (input) for mailman id 1401766;
 Fri, 28 Aug 2026 08:32:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wzs0K-0003oF-08
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:32:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzs0I-0002J3-Tk
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:32:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a91476e-bab6-0a2a0a5309dd-0a2a450ba012-44
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:32:02 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a914782-b7e8-0a2a450b0019-a237832f8dee-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:32:02 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 321FB4EE004E;
 Fri, 28 Aug 2026 10:31:56 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1787905922;
	b=Dk+q15xrGrlwRMYp5SNXXhihQnNczemPIxp5TL2ZTn7t/idml8t2kJXK6fYgdNuLhJ53
	 aDli3KjDKywWNbXT7uq1hoRoBuoGSH2gmCK9pKs0BZAtCf6yvjR6XKfAn9krqj6liAaYQ
	 boj8RIidyKbCce9UkJ+nG7lRnceDWZcmNMaF8v7UEpe5hiDLNvyeNbxu6/QhfGWrxQFaR
	 wltG0lYLsg2GMxFGrTwpApFpgD43ZYjWWoFbmzIcN05vijfdFJZXpxnPIfDFiJMInSEbx
	 QZz3jDxlCAlU/CHK8oC8uVLjSevglGIYycJXYAgndAeKVm+L9FZiEP5IuxidPCZugJ234
	 Ra0xU2x0PG9hS8ZfrsTA0dHigpTlJRq9K8XM6rF7TS+YbOKJzAiMldNmtY0kU/pWm4kl+
	 2PxwLWmar8N02MnRXfIwWkGzlGhpXg10PWGPz33j2+NNIvVcNF83RlSh7/Tuh+IY6IqtK
	 EYn1Aefhg3pif3k05AmXTodcEb7BaSHK3pjQk+uD5NwuUwBPYrs3ZC0mM5CJR/FIa2Ahv
	 KKQZwFnpyfhSclnJhyUQXgzznlYO+4ATotG/35lcPVNYxRhUy2R/Goi5Y5eGTuFpustU+
	 YLfsskyYRohkbWMEbywVpy/gXzL40eywRGulB9uMzZhsFxZLlVnJm5w/oBdO/Cs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1787905922;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=57DpeOM4ZZyK6S8+j5v/LJFABgPU7k0ijq2diC/4+3A=;
	b=y7D7ISArE0UrhGwH9X9qwWFoIMXQumh/pWhngjhhWtm28yJjR1i4IxxYSIo7pcdRVl0E
	 dWLyl7zrpS07237dHp9A9w5h7p4BFEQIH8U+MIBEV8FwLpGZtggBZ5JNd2DZ52OO14a+4
	 x7uwiaVlKxJxtCb6MtYpnYTOYUgpk3ogivLRvdgZZINH3lw7bkYqj0wY58/Vx/u/6NvNo
	 OHhIYzMv6aQakEtPiQpR8iko4tWpKZ9xf/yFlJ6uPH27q3pQBF9xxRNSRJQkSNFM0A6Jj
	 9xz2aWuC1I9+66UNS/9O/8zcQ7N49O3duaIYyDle5zI3oLTzNjE4pKtjxndRk8Q6BWNrR
	 0D1WryDysWZmI5PjUctG8Xq7MvYoYDPfQXnYq70tLOHwRRuLPjqbmfsm84vCz6t8camQG
	 t5RaAsoNxfHsqsXYdjeLP8Kr5IzSZAq8h49fOG2o/HOLUIogDNiIsCz5/BtaMxLJkYtbP
	 ANPJlPYd26TVnTSSYPLcoLb8pVDjcBrjl5+LqldlepBwrYi2+v2kmsPea06eQZB6FT70C
	 0YENudEYm/6uvihY2tvy/wFYVCV+YI+GgOXcWOF+/u5aJe6FDXTTqBDQCOUYFjva2dWUd
	 dd/1sn5px2AqLnQNjh1Xwf7hq0V2QH4Vq7XP+3Cgqpde+ZTmeyrDC07zwV7mdVs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 10:31:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 01/12] x86/IO-APIC: address Misra 2.1 rule violations
In-Reply-To: <85c111a5-105c-4b8f-8b81-d7ec1d0f9436@suse.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <85c111a5-105c-4b8f-8b81-d7ec1d0f9436@suse.com>
Message-ID: <32044eb1dfef2d0281e11534a6d1d938@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787905922-A88C99EA-DF8F90DF/0/0
X-purgate-type: clean
X-purgate-size: 4379

On 2026-08-28 08:59, Jan Beulich wrote:
> In both functions cases 0..3 are handled, and a 2-bit mask is applied 
> to
> the switch() expression. Therefore the default: cases are reported
> unreachable by Eclair. Subsume the "case 2" blocks each into the
> corresponding default ones.
> 
> While there also drop all the pointless figure braces inside the 
> various
> case blocks, inserting blank lines instead between them.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

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
>          polarity = 1;
>          break;
>      }
> -    }
>      return polarity;
>  }
> 
> @@ -878,66 +860,48 @@ static int MPBIOS_trigger(int idx)
>      switch ((mp_irqs[idx].mpc_irqflag>>2) & 3)
>      {
>      case 0: /* conforms, ie. bus-type dependent */
> -    {
>          switch (mp_bus_id_to_type[bus])
>          {
>          case MP_BUS_ISA: /* ISA pin */
> -        {
>              trigger = default_ISA_trigger(idx);
>              break;
> -        }
> +
>          case MP_BUS_EISA: /* EISA pin */
> -        {
>              trigger = default_EISA_trigger(idx);
>              break;
> -        }
> +
>          case MP_BUS_PCI: /* PCI pin */
> -        {
>              trigger = default_PCI_trigger(idx);
>              break;
> -        }
> +
>          case MP_BUS_MCA: /* MCA pin */
> -        {
>              trigger = default_MCA_trigger(idx);
>              break;
> -        }
> +
>          case MP_BUS_NEC98: /* NEC 98 pin */
> -        {
>              trigger = default_NEC98_trigger(idx);
>              break;
> -        }
> +
>          default:
> -        {
>              printk(KERN_WARNING "broken BIOS!!\n");
>              trigger = 1;
>              break;
>          }
> -        }
>          break;
> -    }
> +
>      case 1: /* edge */
> -    {
>          trigger = 0;
>          break;
> -    }
> -    case 2: /* reserved */
> -    {
> -        printk(KERN_WARNING "broken BIOS!!\n");
> -        trigger = 1;
> -        break;
> -    }
> +
>      case 3: /* level */
> -    {
>          trigger = 1;
>          break;
> -    }
> -    default: /* invalid */
> -    {
> +
> +    default: /* reserved */
>          printk(KERN_WARNING "broken BIOS!!\n");
>          trigger = 0;
>          break;
>      }
> -    }
>      return trigger;
>  }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

