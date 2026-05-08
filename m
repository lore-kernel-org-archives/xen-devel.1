Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B01CD3445
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 21:24:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304240.1577317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSfk-0003ve-SK; Fri, 08 May 2026 21:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304240.1577317; Fri, 08 May 2026 21:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSfk-0003vX-Ph; Fri, 08 May 2026 21:23:48 +0000
Received: by outflank-mailman (input) for mailman id 1304240;
 Fri, 08 May 2026 21:23:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wLSfj-0003vR-Lu
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:23:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSfh-00Fbsh-1m
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:23:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fe5415-bab6-0a2a0a5309dd-0a2a4508c0e2-46
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:23:46 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fe5461-63b5-0a2a45080019-ac6904fe9cf0-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:23:46 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A850A6024D;
 Fri,  8 May 2026 21:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E71EC2BCB4;
 Fri,  8 May 2026 21:23:44 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778275424;
	bh=NAKnjKkODxWcV+2m2D9TCncmSNBk1eGzdy/HehPI1mI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UoRMBodVC/DLgpW2vRuqRK2gDSMAI9m4sdZOHmwJMXDsD/heFcqUTqAxDOdQYl8qx
	 u2M/67qQPq961yiGsCC6Ue05Kl8kPMTpU0gMOOCDhkOJMgxJln1PoAZLLaU0LGYKaR
	 /b8XYdki5J738s4BhiXLKB0JOeDG66wCa1qaWRwewze8m8xQ1OzwumrpqtXMfsSEcL
	 Ag8CreR74efjmvht0yTvpnnEkFdFRAa4CZO2PFo2/wVsgckYbyv4D7wCL7NNgozjeQ
	 MOqs5iE77wFiQwuGYZTOizmO0ipHfsCT9gy5ygdweZSox1pF/KuYy3wK5/MMfvbsv4
	 Yue7bt5W+IHPA==
Date: Fri, 8 May 2026 14:23:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: add support for WCH CH382 serial adapters
In-Reply-To: <20260508092813.12894-1-Zhao.Jiaqing@amd.com>
Message-ID: <alpine.DEB.2.22.394.2605081413340.1779943@ubuntu-linux-20-04-desktop>
References: <20260508092813.12894-1-Zhao.Jiaqing@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1778275426-B6368DB1-4A47739F/0/0
X-purgate-type: clean
X-purgate-size: 2850

On Fri, 8 May 2026, Jiaqing Zhao wrote:
> Add support for the WCH (Nanjing Qinheng Microelectronics Co., Ltd.)
> CH382 PCIe dual port serial adapter. The CH382 is available in two
> variants:
>  - CH382 2S   [1c00:3253]: 2 serial ports
>  - CH382 2S1P [1c00:3250]: 2 serial ports + 1 parallel port
> 
> This chip uses IO BAR0, base baud rate 115200, ports starting at offset
> 0xc0 and spaced 8 bytes apart, and a 256-byte FIFO. [1]
> 
> [1] https://www.wch-ic.com/downloads/CH382DS1_PDF.html
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

WCH has a few PCI vendor IDs, including 0x1c00 and also 0x4348. Linux
distinguishes them as PCI_VENDOR_ID_WCHIC = 0x1c00 and
PCI_VENDOR_ID_WCHCN = 0x4348. It would probably be better to rename
PCI_VENDOR_ID_WCH to PCI_VENDOR_ID_WCHIC in this patch.

Everything else looks good.

> ---
>  xen/drivers/char/ns16550.c | 23 +++++++++++++++++++++++
>  xen/include/xen/pci_ids.h  |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 878da27f2e..106ef56316 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -95,6 +95,7 @@ struct ns16550_config {
>          param_exar_xr17v354,
>          param_exar_xr17v358,
>          param_intel_lpss,
> +        param_wch_ch382,
>      } param;
>  };
  
> @@ -862,6 +862,16 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .mmio = 1,
>          .max_ports = 1,
>      },
> +    [param_wch_ch382] = {
> +        .base_baud = 115200,
> +        .first_offset = 0xc0,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 256,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 2,
> +    },
>  };
>  
>  static const struct ns16550_config __initconst uart_config[] =
> @@ -1189,6 +1200,18 @@ static const struct ns16550_config __initconst uart_config[] =
>          .dev_id = 0x7adc,
>          .param = param_intel_lpss
>      },
> +    /* WCH CH382 2S */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_WCH,
> +        .dev_id = 0x3253,
> +        .param = param_wch_ch382
> +    },
> +    /* WCH CH382 2S1P */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_WCH,
> +        .dev_id = 0x3250,
> +        .param = param_wch_ch382
> +    },
>  };
>  
>  static int __init
> diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> index 5884a20b8f..b8316d464c 100644
> --- a/xen/include/xen/pci_ids.h
> +++ b/xen/include/xen/pci_ids.h
> @@ -13,6 +13,8 @@
>  
>  #define PCI_VENDOR_ID_BROADCOM           0x14e4
>  
> +#define PCI_VENDOR_ID_WCH                0x1c00
> +
>  #define PCI_VENDOR_ID_INTEL              0x8086
>  
>  #endif /* XEN_PCI_IDS_H */
> -- 
> 2.53.0
> 

