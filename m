Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E79B606A33D
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwZ6Xu2j
Received: from list by lists.xenproject.org with outflank-mailman.1493046.1693220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTNz0-0002a0-Mt; Tue, 17 Nov 2026 18:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493046.1693220; Tue, 17 Nov 2026 18:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTNz0-0002Zt-KC; Tue, 17 Nov 2026 18:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1493046;
 Tue, 17 Nov 2026 18:32:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTNyz-0002Yi-8C
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 18:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTNyx-005gk6-TW
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 19:32:39 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afc9d8d-2eae-0a2a0a5409dd-0a2a4509c754-38
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 19:32:39 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afc9dc7-be1a-0a2a45090019-d1558031d855-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 19:32:39 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so1476025e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 10:32:39 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 ([2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78430752sm89640855e9.12.2026.11.17.10.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 10:32:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794940359; x=1795545159; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9ZUbLBIBaaccoNwPxbYgvSuq78blSb3iqZN3Y/GsEE=;
        b=VwZ6Xu2jtaE/D5t8omuVVPvD2XT98jKeuzcJi0g+i441yzSiB4WNmOe9r40eYJ9e9e
         nqGQz+oB7raNJExwRT1+zGlnybhi8w6Ytbv1aNOFeeDN+bzSDVs4RwJLUIeNWyHND7fQ
         4KWjBcxdYfruFSpsI/TvULdE790IBERpRVWYdcpbNC2bjaBBuEU/EfC1QsswbRhey8Zf
         RE7yHsoBJ4ltdz7iYSkErtBdvPqn9odXmJcETm88//9EhAQpwSX6QCc2Lwt2BRm2m2uZ
         Fcuob+PCnmqhNgU4mXbXsyFHy+tpwEwFR9W3lLrIdigcsMD6IE76mak6ZIbc66hCZg7r
         WEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940359; x=1795545159;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9ZUbLBIBaaccoNwPxbYgvSuq78blSb3iqZN3Y/GsEE=;
        b=fARIqeKpWMF6u88vdw83yzn8Mlxe7xAkkuKVN7njvH4ej7fwIfqJFe9rrJSld6m0Py
         LrRoSppjOl8YwGbnTcKPr09sj2EeKYie/yGMBXoZwQR7V1ZctQhhli0jNsVRNeMNV5TI
         oYV7mML6EMxixSmsVDpFFvpxPfpSkShUUBh3dZ2t6Z26nqC4BVh64OyzddNrH/N8zsBs
         JpYsnd/YFfIgQ8bj/ARTYTJUf46oKhtBBLUaXgOkqqddT1ifhVDA7wfVy4kftdTfs8St
         mSLczEHBeRg1d555q+jTHWciFbFZS8XgiSZBxTx/5puQfRWzJziO32EjxHPUH/7DJfYd
         voLQ==
X-Forwarded-Encrypted: i=1; AL+hErFRkMHVyR/mAUFDCKVd53jj4m31jp0JtauXtsDDPfqN4ZrinpgiC0BjtXQZfqyVHmz80xxSWkF1iuM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+tnA5syOCWma9xS79RaOkwTF4S6Wxe0mNf5vnuPM3cdk17iUQb
	Wasq6uuWQ1d9ayVImKI0/DRFNAK31qdmzfu1hNegFrRvH4Vn8TznfiVW
X-Gm-Gg: AYBFou3j5DBweyaym4sZsOG+UxYA+Bgk/bCi2iLN3mNngd43OxF7O6eLqAETNORHdnK
	6cJY/1cCdDFUUn0ncDItusmODDh4m8BNYZBhqVPCWPW8LVkNBJm/EMaRWTRwfltURhcnWDVh512
	TXlcKwRPYVt5Hcn4Ez4wG8/CQp5qGns9JPDf2iGl+n/AMPSSnTWnvBffak73pKaQAYMufxD7lvT
	o8q8rfXHGtTcnT45uKdKiS3UvZMF1Y5b0RdHYCawWpe6evO7oyVeoQUUTg4EaUR9zDxCpALixBo
	v8gv6lvmG19psimVXbL6+8Bi44A0lvxOkA8zKROfDZ+NQthcVJdQtuPib0cguAkmWYPEBh7vONW
	L76Qj3HLGkrRBV8ONITfoOvUXk+b0Tb/0Q+YV8851BaqR/3LjjJW9LWSt3ODJh9Rx5Jc2NtWUyi
	H3mDJdpb7+dMx2QHV/6jAy9ufO4Z9P78Ap/W4H/WrYILTwEsgl6CnZfSG+KihEUjVVVMTYWNhH5
	AMDj6w3rWChvdQQBPkmcnE2QjPt2kknbt3NIuyYucfNuCZH3EhzDdRH6bn+vQaEWRl+AEy1W4Hk
	+4RCXmaMwz87JrW4GuDhChipwwxAH5ggYIY4Q3YAqPhXt9dZhYEtXP5NymGRCJK/uLpvRpaIe7K
	wo+rob/HXZI4=
X-Received: by 2002:a05:600c:83cf:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb7d6cd41amr1074845e9.4.1794940359172;
        Tue, 17 Nov 2026 10:32:39 -0800 (PST)
Message-ID: <4f8ecef8-0c2f-43df-bd03-036e1e3f2be9@gmail.com>
Date: Tue, 17 Nov 2026 19:32:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v8 09/26] emul/ns16x50: implement MCR/MSR registers
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-10-dmukhin@ford.com>
Content-Language: en-US
In-Reply-To: <20261111194800.1070016-10-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794940359-BD0CD034-AE9E5221/10/73395122804
X-purgate-type: spam
X-purgate-size: 4936
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
> Add MCR/MSR registers emulation to the I/O port handler.
> 
> Add implementation of ns16x50_iir_check_msi().
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 76 ++++++++++++++++++++++++++++++++-
>   1 file changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index e80815ccf6e2..9f530e589495 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -69,6 +69,10 @@ do { \
>    */
>   #define UART_LSR_MASK           (UART_LSR_OE | UART_LSR_BI)
>   
> +#define UART_MCR_MASK           (UART_MCR_DTR | UART_MCR_RTS | \
> +                                 UART_MCR_OUT1 | UART_MCR_OUT2 | \
> +                                 UART_MCR_LOOP)
> +
>   /*
>    * Number of supported registers in the UART.
>    */
> @@ -136,7 +140,7 @@ static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
>   
>   static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
>   {
> -    return false;
> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
>   }
>   
>   /*
> @@ -193,6 +197,13 @@ static void ns16x50_irq_check(struct vuart_ns16x50 *vdev)
>       uint8_t iir = ns16x50_iir_get(vdev);
>       bool asserted = !(iir & UART_IIR_NOINT);
>   
> +    /*
> +     * On a PC-compatible UART OUT2 gates the ISA interrupt.
> +     * Linux'es autoconfig_irq() expects when it toggles MCR.OUT2 during IRQ
> +     * probing.
> +     */
> +    asserted &= !!(vdev->regs[UART_MCR] & UART_MCR_OUT2);
> +
>       if ( asserted == vdev->irq_asserted )
>           return;
>   
> @@ -254,12 +265,63 @@ static int ns16x50_io_write8(
>           regs[UART_LCR] = val;
>           break;
>   
> +    case UART_MCR: {

Nit: I think '{' should be on the next line.

> +        uint8_t msr_curr, msr_next, msr_delta;
> +
> +        msr_curr = regs[UART_MSR];
> +        msr_next = 0;
> +        msr_delta = 0;
> +
> +        if ( val & UART_MCR_RSRVD0 )
> +            ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %#x\n",
> +                         UART_MCR_RSRVD0);
> +
> +        if ( val & UART_MCR_TCRTLR )
> +            ns16x50_warn(vdev, "MCR: not supported: %#x\n",
> +                         UART_MCR_TCRTLR);
> +
> +        if ( val & UART_MCR_RSRVD1 )
> +            ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %#x\n",
> +                         UART_MCR_RSRVD1);
> +

See my reply to 02/26: bit 5 is AFE on the TL16C550C itself. With a
local mask, these three checks become one
"if ( val & ~UART_MCR_MASK )".


> +        /* Set modem status */
> +        if ( val & UART_MCR_LOOP )
> +        {

I am curious if loopback mode used somewhere except PC? I did a trace 
for RISC-V for example and I see only the following writes to MCR:
0x00, 0x01, 0x09, 0x0b.

> +            if ( val & UART_MCR_DTR )
> +                msr_next |= UART_MSR_DSR;
> +            if ( val & UART_MCR_RTS )
> +                msr_next |= UART_MSR_CTS;
> +            if ( val & UART_MCR_OUT1 )
> +                msr_next |= UART_MSR_RI;
> +            if ( val & UART_MCR_OUT2 )
> +                msr_next |= UART_MSR_DCD;
> +        }
> +        else
> +            msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
> +
> +        /* Calculate changes in modem status */
> +        if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> +            msr_delta |= UART_MSR_DCTS;
> +        if ( (msr_curr & UART_MSR_DSR) ^ (msr_next & UART_MSR_DSR) )
> +            msr_delta |= UART_MSR_DDSR;
> +        if ( !(msr_curr & UART_MSR_RI) && (msr_next & UART_MSR_RI) )
> +            msr_delta |= UART_MSR_TERI;

This is the leading edge. MSR.RI is the complement of the RI input, and
TERI is set when the input goes from low to high (SLLS177I, 7.7.10, bits
2 and 6), i.e. when MSR.RI goes from 1 to 0. QEMU does the same
(hw/char/serial.c: "UART_MSR_TERI only if change was from 1 -> 0"). So:

         if ( (msr_curr & UART_MSR_RI) && !(msr_next & UART_MSR_RI) )

> +        if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
> +            msr_delta |= UART_MSR_DDCD;
> +
> +        regs[UART_MCR] = val & UART_MCR_MASK;
> +        regs[UART_MSR] = msr_next | msr_delta;

This drops delta bits that are still pending. The change bits are only
cleared "when the CPU reads the MSR" (7.7.10), so e.g. with DTR and RTS
toggled by two separate MCR writes in loopback mode before the guest
reads MSR, ΔCTS from the first write is lost. Keeping them:

         regs[UART_MSR] = msr_next | msr_delta |
                          (msr_curr & UART_MSR_CHANGE);ч

> +
> +        break;
> +    }
> +

~ Oleksii


