Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0F9C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:32:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387860.1629085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWfR-0001Zn-Vl; Mon, 10 Aug 2026 20:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387860.1629085; Mon, 10 Aug 2026 20:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWfR-0001Zg-TB; Mon, 10 Aug 2026 20:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1387860;
 Mon, 10 Aug 2026 20:32:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWfR-0001Za-18
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:32:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWfQ-001ci2-3G
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:32:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a3528-bab6-0a2a0a5309dd-0a2a450bed62-26
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:32:16 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a354e-b7e8-0a2a450b0019-ac6904fe94a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:32:15 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 44139600AD;
 Mon, 10 Aug 2026 20:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482631F000E9;
 Mon, 10 Aug 2026 20:32:12 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786393934;
	bh=t0DaZoyzF9WrcIzxXm/INYFRzCeVt+f83Z3q3BoGFYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WvyypVdQcDCtsCE08K71Ej8WxeS9X1uWhtyYCJigzO9zfP3vupT8oKt8IyDk9c4NR
	 P9N7xMSRZSYISzyxaPIkOz4a6EdXXALcYWg5qGzNK8uQhliDFLQMngV25Z2jE/DXRZ
	 X0cfQW6Qp5U+U5erjcSkhWEePOqI1FLpzvRVjJ7vRS4AmAaIq+wpdkIb5XNLS4amgo
	 Dx8aMxrkJvbFtmuC5Vh5cu/0720Z5vQjKXW3oSzVppTbd7M/+wE7sLQj6uKYHMrNuP
	 WmiK91Yd4J/6U3MhKA7au8wp9KUgQwdIYwr+olg5DlXYyzF828Nrzuj1WERF2gJX5a
	 Bmr8r3qFaGXjA==
Date: Mon, 10 Aug 2026 13:32:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 6/7] xen/serial: harden serial_tx_buffer checks
In-Reply-To: <20260728065049.1318143-7-dmukhin@ford.com>
Message-ID: <4b040e58-9020-a519-00cb-816ce2fddaa0@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-7-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1786393936-A92CC9EA-47C70C91/0/0
X-purgate-type: clean
X-purgate-size: 1964

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Ensure the user-defined value never crosses 2GB boundary and always
> rounded to the next power of 2 to align logic with console driver
> conring buffer management code.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v7:
> - addressed Jan's feedback:
>   https://lore.kernel.org/xen-devel/89029dbd-df1f-45d4-8a02-720cd6a42cab@suse.com/
> - kept only check for large buffer in serial_async_transmit()
>   and a doc update.
> ---
>  docs/misc/xen-command-line.pandoc | 2 ++
>  xen/drivers/char/serial.c         | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 1c711fa98086..2be8772b329a 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2396,6 +2396,8 @@ accidentally leaking secrets by releasing pages without proper sanitization.
>  
>  Set the serial transmit buffer size.
>  
> +The value provided will be rounded down to the nearest power of 2.
> +
>  ### serrors (ARM)
>  > `= diverse | panic`
>  
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index cf0abf1893e5..ba1647309ab8 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -523,6 +523,8 @@ void __init serial_async_transmit(struct serial_port *port)
>          return;
>      if ( serial_txbufsz < PAGE_SIZE )
>          serial_txbufsz = PAGE_SIZE;
> +    if ( serial_txbufsz > GB(2) )
> +        serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
>      while ( serial_txbufsz & (serial_txbufsz - 1) )
>          serial_txbufsz &= serial_txbufsz - 1;

My understanding of this loop is that, given that serial_txbufsz is
unsigned int, it is already clamping it to 2GB max


>      port->txbuf = xvmalloc_array(char, serial_txbufsz);
> -- 
> 2.54.0
> 

