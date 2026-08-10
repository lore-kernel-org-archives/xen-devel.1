Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EAAC5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:05:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387827.1629049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWFD-00042C-CY; Mon, 10 Aug 2026 20:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387827.1629049; Mon, 10 Aug 2026 20:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWFD-000425-9y; Mon, 10 Aug 2026 20:05:11 +0000
Received: by outflank-mailman (input) for mailman id 1387827;
 Mon, 10 Aug 2026 20:05:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWFB-00041v-GP
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:05:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWFA-00FQ90-HW
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:05:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a2ef2-bab6-0a2a0a5309dd-0a2a4502e08a-6
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:05:08 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a2ef2-6ca4-0a2a45020019-aceafc1fa41c-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:05:08 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2716C4359C;
 Mon, 10 Aug 2026 20:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B371F000E9;
 Mon, 10 Aug 2026 20:05:04 +0000 (UTC)
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
	s=k20260515; t=1786392306;
	bh=gPnvIhkRdHJGclEh1u0eMnzRQFbglbdwmyBABLRGU7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Ey8QtfK6dSAyGrkb0bImOKnm+SsjeqDG/E7sd+lC0Nq0xabrz/G7oxO+4SH7ZKqJZ
	 b/aXjTNYHO2spAziyjTvCzqr6xKLnvO2XqAK7QxHwhQw8N0UfTxtJr9ud+/Hu4jDxy
	 JZqU22qobir96gZDtFajaHmVgKLJRPkxNXbV+As7t+q9sCHM9/SKf3cIY8pbDUDoDB
	 Z+H4/KC3AEN0HWebMl347Nmdw1vsJj2ufFqXvPcAscJTq+1mwGsEYedotXjqqaVlAN
	 IH4as/xrLy/pg1W9+a6BZH0g8UKUxNW47pFGRIbOsy6PSZSCDOniC/7+M3XEhxrpGY
	 iZNtJHONTj8HA==
Date: Mon, 10 Aug 2026 13:05:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 2/7] xen/console: use 'unsigned int' in
 contring_{flush,puts}()
In-Reply-To: <20260728065049.1318143-3-dmukhin@ford.com>
Message-ID: <ce54345e-33b6-5d7d-9b79-0229c1254a3d@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1786392308-660A82AC-B355065F/0/0
X-purgate-type: clean
X-purgate-size: 1348

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> contring_puts() and conring_flush() still use 'uint32_t' to access
> indices.
> 
> Switch to 'unsigned int' to as required by CODING_STYLE.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes since v7:
> - new patch
> ---
>  xen/drivers/char/console.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 37fdda93a4c1..40355c1d14d6 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -375,7 +375,7 @@ static void conring_puts(const char *str, size_t len)
>  long read_console_ring(struct xen_sysctl_readconsole *op)
>  {
>      XEN_GUEST_HANDLE_PARAM(char) str;
> -    uint32_t idx, len, max, sofar, c, p;
> +    unsigned int idx, len, max, sofar, c, p;
>  
>      str   = guest_handle_cast(op->buffer, char),
>      max   = op->count;
> @@ -421,7 +421,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
>   */
>  static int conring_flush(unsigned int flags)
>  {
> -    uint32_t idx, len, sofar, c;
> +    unsigned int idx, len, sofar, c;
>      unsigned int order;
>      char *buf;
>  
> -- 
> 2.54.0
> 

