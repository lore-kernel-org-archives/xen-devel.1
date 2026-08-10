Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74B2C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:42:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387867.1629094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWoz-0003SX-R5; Mon, 10 Aug 2026 20:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387867.1629094; Mon, 10 Aug 2026 20:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWoz-0003SQ-OR; Mon, 10 Aug 2026 20:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1387867;
 Mon, 10 Aug 2026 20:42:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWoy-0003SK-FX
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:42:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWox-00FO3G-LH
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:42:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a3771-8faa-0a2a0a5109dd-0a2a4506ba70-24
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:42:07 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a379e-195a-0a2a45060019-aceafc1fd302-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:42:07 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F35143E3D;
 Mon, 10 Aug 2026 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7147A1F000E9;
 Mon, 10 Aug 2026 20:42:02 +0000 (UTC)
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
	s=k20260515; t=1786394524;
	bh=2pkvEhvOT48AM77G2DSwJ9QzA4kZ/PPRhW9xCuWWTpg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RUB+QzMp61DRoMlXy1x6ncyrpmfj9Ir1e5EwcbvCatjliNN1gTLerunPeV5aeKasj
	 E5QwUzEHwfZPLBB1G9FqA2BTS6OogEcghhkTZDZ9sGbS281t1HGVfPVKmhtXDT4Gzt
	 PUtZTxBliRY6mUn/GuPUO7YSnpjWR407eoYK0en5DVnGzbpa2tnXuf/iQUJPtdKu/J
	 G+sRDg1tZquXPB+Z5RnRB3fch/5uZj2b8f0mWAT6HGMTrDkQH1RKiZMB+e2yKrNqZL
	 E2pD2zGjf5OteNiMjlrmW1PI9EJBKTjQJ8f1TZVSl4Xv+g9VNDYaTmtyh76W/7ZIcB
	 vyC2fwkhZ1YnQ==
Date: Mon, 10 Aug 2026 13:42:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 7/7] xen/console: make console buffer size
 configurable
In-Reply-To: <20260728065049.1318143-8-dmukhin@ford.com>
Message-ID: <3db29635-6c45-8071-53d8-01737e1a7349@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-8-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1786394527-1EAC277B-66E0B5A8/0/0
X-purgate-type: clean
X-purgate-size: 3767

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add new CONRING_SHIFT Kconfig parameter to specify the boot console
> buffer size as a power of 2.
> 
> The supported range is [14..27] -> [16KiB..128MiB].
> 
> Set default to 15 (32 KiB).
> 
> Update the documentation for 'conring_size=' command line option.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/185
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v7:
> - n/a
> ---
>  docs/misc/xen-command-line.pandoc |  8 ++++++--
>  xen/drivers/char/Kconfig          | 21 +++++++++++++++++++++
>  xen/drivers/char/console.c        |  6 +++---
>  3 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 2be8772b329a..448c9bdb8254 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -425,10 +425,14 @@ The following are examples of correct specifications:
>  ### conring_size
>  > `= <size>`
>  
> -> Default: `conring_size=16k`
> -
>  Specify the size of the console ring buffer.
>  
> +The default console ring buffer size is selected at build-time via
> +`CONFIG_CONRING_SHIFT` setting.
> +
> +The run-time console ring buffer size is the maximum of the build-time value
> +and the value specified by the `conring_size=` command-line option.
> +
>  ### console
>  > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
>  
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 8e49a52c735b..a40a9929132b 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -95,6 +95,27 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SHIFT
> +	int "Console ring buffer size (power of 2)"
> +	range 14 27

anything above 20 would fail to build on arm


> +	default 15

this is OK but is double than the previous default and would be nice to
keep a note about it in xen-command-line.pandoc


> +	help
> +	  Select the boot console ring buffer size as a power of 2.
> +
> +	  The run-time console ring buffer is the maximum of the build-time
> +	  value and the value specified by the `conring_size=` command-line
> +	  option.
> +
> +	  If `conring_size=` is not specified on the command line, the run-time
> +	  console ring buffer size is the maximum of this value and
> +	  `num_present_cpus() << (9 + xenlog_lower_thresh)`.
> +
> +	    27 => 128 MiB
> +	    26 =>  64 MiB
> +	    ...
> +	    15 =>  32 KiB (default)
> +	    14 =>  16 KiB
> +
>  config XHCI
>  	bool "XHCI DbC UART driver"
>  	depends on X86
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index a1b8e5f5b507..76367c1dd705 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -340,12 +340,12 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>   * ********************************************************
>   */
>  
> -/* conring_size: allows a larger console ring than default (16kB). */
> +/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
>  static unsigned int __initdata opt_conring_size;
>  size_param("conring_size", opt_conring_size);
>  
> -#define _CONRING_SIZE 16384
> -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> +#define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
> +#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
>  static char __initdata _conring[_CONRING_SIZE];
>  static char *__ro_after_init conring = _conring;
>  static unsigned int __ro_after_init conring_size = _CONRING_SIZE;
> -- 
> 2.54.0
> 

