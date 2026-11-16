Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B6606A330
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qID4Okub
Received: from list by lists.xenproject.org with outflank-mailman.1490339.1691277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSu4W-0006Z1-2s; Mon, 16 Nov 2026 10:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490339.1691277; Mon, 16 Nov 2026 10:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSu4V-0006Yu-Vp; Mon, 16 Nov 2026 10:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1490339;
 Mon, 16 Nov 2026 10:36:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSu4V-0006YY-1y
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:36:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSu4U-00Co4s-DU
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:36:22 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afadca6-8faa-0a2a0a5109dd-0a2a45098a86-2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:36:22 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afadca6-be1a-0a2a45090019-d155dd2cecca-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:36:22 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so3533087f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 02:36:22 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f77fc47sm21588689f8f.22.2026.11.16.02.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 02:36:20 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825382; x=1795430182; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbsGUnPwL5goKvJqFEDyTqI1R4ouyejrWTvNZeWFuh4=;
        b=qID4OkubtX8eloSCdRYcKww5Y93R6HBx4BqMSBS5zgxl+K3LBthDljqGmai3ITfXhR
         6ySa24mFvW6SqliBrhqTDp8BuLhYlbMJeBxmvUf+4oPfH9g4prosZHR5xKZydp48J+YU
         oZs4Tyi4Ewu47mYsymqIBSJWN4Y31zW65N+sY4QNKIUCoUbEEwOg+aOx9fQ9zsMh4Ryw
         155kCsM5VU7NrG0z7g9X7WsNhqcajkLq2E0C2GVNGr2is+SohYvbBxt0S3Ql1Bic6YQx
         NRrkhv6Toa/xVVOWLEDfZLaS1arCIasLOhrKaOVusEowfumqulFpiU11QJKeS6K2HiT2
         nrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825382; x=1795430182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbsGUnPwL5goKvJqFEDyTqI1R4ouyejrWTvNZeWFuh4=;
        b=MmuUIW178NZf2Tj9iMuF6aoIaYwR+y/Hojuh88uh81JyDc+7SWu7JCa5dPFFuqBc/s
         Q8hnK6qzdwM2SFnyOxDJmT2p3DVuxhqUi/FqFonHUTj1WsW7APUVn+yPWEPzV/Fchp92
         NxYD2gmm/0F6vYeVbsr/LA1Ar8ZQdj3gXovHelLTCEhTs86g3YToiAXywzPgCgFElOjR
         QvDlLtdBn95MHzScWTR17F7QaloDkj1WoFScclpdZMe2m4Calv8O7q2YJDMJPWNiUXZI
         kkmKWdRcYLG7cUrobpPxgT/i03vpLAT3rxJ8xAvyd6BsC+Thl8TljRdqPLLYtMcMwxtI
         1f5w==
X-Forwarded-Encrypted: i=1; AL+hErHjIGzmWuYIqhef9QeQ10eOWsd/4OGzgpSm++N3bsgl1KdcrJ7Brn3Ck17gziy/GvZ6Nd2ayFCAXAM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/sKMlOPWK6qkWpSLHbf0SNWQae4Ac0xv4Yo/yth5eqOssTEeTG
	8dAWG6EcIW9ubJhtrbVq5acpDku6v3vTcOBqSuxZ64ZIfJlHMx6owfFG
X-Gm-Gg: AZFdTZfE/gFkZFXZzgGvTarijIEnlf8+HSnAZlyV9PdlwJCWeCQbB2EMm1BYUOxa4e6
	qXC7FobtV5yQ+YfusWw0bReOC7LDMaJQ4AzxiOf3JOksxyBlHb1W/8yGVxc4GmPMAjn7qQLzr9Z
	MikovnV5wfukuJ7+fK44WHFspQK6lQfF25pyXjN0KMY3Npzh863OLOzC7uZ2clEDraxdXjkSyQE
	HHJWjjFzPmIlh7B2wK1DJr2sqmkh45QYYTGTvw5N+GEWgqfQ8tA0OY1r1Mn7n1J72aP7V04ludW
	XFTmDITJLlKfJgQ04oUST81Ge7BUGqFTIwHLLirrWHnyNYwYzo/e1SnNbSnMTMXzEbJUet7kvbQ
	OM1HlBhl2sU4e2YONWpeHsiqwYzx0yWVzEyuJQV4YMfeNbgR0V5ZFjZ6soIKKGugpBFS5YeTXIp
	oIZEHPJVO/KYdjqiVlS53p97+ma8t1HjrhW6ar9D7WTkZ9uQJw1pxuyUxKqOUxYs0UIZUV8Dggt
	35WM4mDlxpqsS4e4FaTNxp/8M8D4jtf8ZlLNhbeUbtGkO79NK4xeMW1IW/ZN48pydS92E7JGJ8w
	jABrY3beLsVSXF8manyICaNXzMn7qozFAD775kp8aOL7uPOBwOE5w1pFvfx4VdJfV9EGeLaUYdZ
	Jyw==
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-49c714a2a99mr14521707f8f.24.1794825381581;
        Mon, 16 Nov 2026 02:36:21 -0800 (PST)
Message-ID: <baf72de4-2fe9-4c11-91ad-46cbce2c9b82@gmail.com>
Date: Mon, 16 Nov 2026 11:36:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/26] emul/ns16x50: implement DLL/DLM registers
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-6-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794825382-3B2DC034-A58B078F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6228
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add DLL/DLM registers emulation.
> 
> DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.

They are initialised to the divisor for 115200, but guest writes are
stored and read back, so the guest sees whatever it programmed. Maybe
"DLL/DLM are reset to the divisor for 115200 baud; the divisor doesn't
affect emulation otherwise".

Also, LCR only becomes writable in 08/26, so until then DLAB is always
0 and none of the code added here is reachable. Would it make sense to
order the LCR patch first?

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 82 +++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 6e1cfecbaa55..80805ee6ecc6 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -119,8 +119,37 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
>   static int ns16x50_io_write8(
>       struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
>   {
> +    uint8_t *regs = vdev->regs;
> +    uint8_t val = *data;
>       int rc = 0;
>   
> +    switch ( reg )
> +    {
> +    case UART_THR: /* DLAB=0 --> UART_RBR, DLAB=1 --> UART_DLL */

On the write side, offset 0 with DLAB=0 is THR, not RBR.

> +        /* DLAB=1 */
> +        if ( regs[UART_LCR] & UART_LCR_DLAB )
> +        {
> +            regs[NS16X50_REGS_NUM + UART_DLL] = val;
> +            break;
> +        }
> +
> +        /* DLAB=0 */
> +        break;
> +
> +    case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
> +        /* DLAB=1 */
> +        if ( regs[UART_LCR] & UART_LCR_DLAB )
> +        {
> +            regs[NS16X50_REGS_NUM + UART_DLM] = val;
> +        }

Nit: no braces around a single statement (and it's inconsistent with
the read side, which uses break inside the if).

> +        /* DLAB=0 */
> +        break;
> +
> +    default:
> +        rc = -EINVAL;
> +        break;
> +    }
> +
>       return rc;
>   }
>   
> @@ -131,8 +160,17 @@ static int ns16x50_io_write8(
>   static int ns16x50_io_write16(
>       struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
>   {
> +    uint8_t *regs = vdev->regs;
> +    uint16_t val = *data;
>       int rc = -EINVAL;
>   
> +    if ( (regs[UART_LCR] & UART_LCR_DLAB) && reg == UART_DLL )
> +    {
> +        vdev->regs[NS16X50_REGS_NUM + UART_DLL] = val & UINT8_MAX;
> +        vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (val >> 8) & UINT8_MAX;

Nit: regs is declared but vdev->regs is used right below (same in
ns16x50_io_read16()).

More importantly, special-casing a 16-bit access to DLL with DLAB=1
covers just one case. E.g. QEMU's 16550 model accepts 2- and 4-byte
accesses but implements byte accesses only, so an outw() to base+0 ends
up as byte accesses to base+0 and base+1, each decoded according to the
current DLAB (serial_io_ops in hw/char/serial.c, with the splitting done
by access_with_adjusted_size() in system/memory.c). As far as I know,
that's also what happens on real hardware for an 8-bit device behind
ISA/LPC. Am I missing somethings? if no doing the same here would cover 
all registers and drop the ns16x50_io_{read,write}16() helpers, 
something like:

     for ( i = 0; i < size; i++ )
     {
         uint8_t byte = *data >> (i * 8);

         rc = ns16x50_io_write8(vdev, reg + i, &byte);
         if ( rc )
             break;
     }

(and the reverse for reads, assembling *data from the bytes). As it
stands, e.g. an outw() to THR/IER with DLAB=0 is rejected and logged as
an error.

> +        rc = 0;
> +    }
> +
>       return rc;
>   }
>   
> @@ -168,9 +206,39 @@ static int ns16x50_io_write(
>   static int ns16x50_io_read8(
>       struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
>   {
> +    uint8_t *regs = vdev->regs;
>       uint8_t val = UINT8_MAX;
>       int rc = 0;
>   
> +    switch ( reg )
> +    {
> +    case UART_RBR: /* DLAB=0 --> UART_RBR, DLAB=1 --> UART_DLL */
> +        /* DLAB=1 */
> +        if ( regs[UART_LCR] & UART_LCR_DLAB )
> +        {
> +            val = regs[NS16X50_REGS_NUM + UART_DLL];
> +            break;
> +        }
> +
> +        /* DLAB=0 */
> +        break;
> +
> +    case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
> +        /* DLAB=1 */
> +        if ( regs[UART_LCR] & UART_LCR_DLAB )
> +        {
> +            val = regs[NS16X50_REGS_NUM + UART_DLM];
> +            break;
> +        }
> +
> +        /* DLAB=0 */
> +        break;
> +
> +    default:
> +        rc = -EINVAL;
> +        break;
> +    }
> +
>       *data = val;
>   
>       return rc;
> @@ -182,9 +250,17 @@ static int ns16x50_io_read8(
>   static int ns16x50_io_read16(
>       struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
>   {
> +    uint8_t *regs = vdev->regs;
>       uint16_t val = UINT16_MAX;
>       int rc = -EINVAL;
>   
> +    if ( (regs[UART_LCR] & UART_LCR_DLAB) && reg == UART_DLL )
> +    {
> +        val = vdev->regs[NS16X50_REGS_NUM + UART_DLM] << 8 |
> +              vdev->regs[NS16X50_REGS_NUM + UART_DLL];
> +        rc = 0;
> +    }
> +
>       *data = val;
>   
>       return rc;
> @@ -310,7 +386,13 @@ static int cf_check ns16x50_io_handle(
>   
>   static void ns16x50_reset(struct vuart_ns16x50 *vdev)
>   {
> +    const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;

Nit: UART_CLOCK_HZ / (16 * 115200) reads more directly as the divisor
formula. A comment on why the divisor is preset at all would also help:
a real 16550 doesn't reset DLL/DLM, so this is a choice made for guests
that never program the baud rate.

> +
>       memset(vdev->regs, 0, sizeof(vdev->regs));
> +
> +    /* NB: report 115200 baud rate. */
> +    vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
> +    vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;
>   }
>   
>   static int ns16x50_init(void *arg)

~ Oleksii

