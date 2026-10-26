Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B1606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XemL/NC1
Received: from list by lists.xenproject.org with outflank-mailman.1461600.1672649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNq3-0002U9-4L; Mon, 26 Oct 2026 16:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461600.1672649; Mon, 26 Oct 2026 16:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNq3-0002U1-07; Mon, 26 Oct 2026 16:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1461600;
 Mon, 26 Oct 2026 16:46:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLNq1-0002Tv-Fd
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLNq0-0058YT-7c
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:46:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf83d1-8faa-0a2a0a5109dd-0a2a4503dc86-16
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:46:20 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf83dc-fae8-0a2a45030019-d155dd2fc854-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:46:20 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so1917725f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 09:46:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece13aasm16238676f8f.58.2026.10.26.09.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 09:46:19 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033180; x=1793637980; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVqijri3Coex1U/Y+HLIuqBZhqmkYm1Dyejt+PNag44=;
        b=XemL/NC1vKv9u+PPFGSEUsNRGUkk9AGEa1YhOFhSgjzk0TBXLKRE1tM+jfmWb+PlVA
         yrZzkJHRU8SqPKMCLooDDqWhaODTpBsR6fILBL6hSY2aFt8eW+6BQjb2yO+QPo1LtZUl
         A8/wj6i0zFE6ItC4cyY129gRheUNamNOpuopjpZlU+WBUFAHVEJtpRfO17EzppbmcKlu
         /zkm8qeh1QkyPNwU4I0yfWEjHZcUKOfpDEgEJK3EzQlhU8Ifk1WsGlJ38qX0QTd2iYTd
         9jRF+XVkkYgBUfdkAl0CaWa5/qaddf1Oegysyxp2KHB1xJL3sTfmMAO4dOsVOdwBMmPK
         Dv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033180; x=1793637980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVqijri3Coex1U/Y+HLIuqBZhqmkYm1Dyejt+PNag44=;
        b=D82UEsgW6g/XdoQG74SFEwI7up3GdscqUzh3IxH3fJDIPd2l4/Hx4dPQIjX5EMd+aL
         I8dP2v/ArwckivtJ4QWALHbXs6aJpt4TSHshBshKLLOOzv78VCtJdP/o38G5HLZYtr49
         06L0kT81DIDUH+S5T3F2X0qo6/RN3eZZNwg8YxJrY8XiDOLVjpugFqPf2GZ0+DoNup6a
         5qEaTUtmCvBCs/a23/Se8+YiuaRZZ29xOnyjJtCA48qJoS0OqBCZo4BCJEzSzg22jWwq
         soCt5IO0uAjupw/neuRv5bWlxtd8TImcoWvDL0k/4YDvgvbHBCR2XAyqcAzBoaplTkv/
         FmlQ==
X-Forwarded-Encrypted: i=1; AKwUvByHCsEqQpL163ynjP7JriH0Op5YS627QQgkMpzdRFyXzNepmImq6FOXYFx4zN32syeArieKrN7sX+w=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK2C9BG6neb61G0pAqiUnq5m2yRzVA0D8rIb/7g5GGEEFkDmEH4
	hUDlznmOQDlh4U+9ac2kJot0sCIdMhZahm/y3VTziQP+Bd1SjdrJCZQo
X-Gm-Gg: AYBFou1gV31btqIrRwLKtDUoa/AN8d9tA5T5bnfid2ksXiYSrmUmhJzlIDjn+JaT10b
	r6fBJbXOSeRo8/H59AvFV4dAtaZmSzkXUx/Wwlcb84rkH5e61vAW3s+AiCXc1WeJ9RvhNOemLJc
	rlUFdSWRAjWE/cUsEARoOK8xze38KRIBbj3t2qZ6pXnUkMaCZ4E6cpbB53lh/u0znZgGTMqo6b/
	PsCfiQUJvVVElB64SYtAX/b3DJiBVZeLo+GOoBXd0Y/20uAfEzy//SEvtLn83TvCdCJPXSmmynO
	IQ/IvgUc3h3gPROSyBrQMbVTD7Xlvuu6ka/KvNNDP7b0XDroUCvkpDJ1XT9n7IR3KhOU1NiMnzK
	M++h6kWyTgA/jQdhSWUdxusrZdGcC+SCGW8WLQAtApS/DWATmgAXBXKJSyCXDkh7K6qfPzsOzyh
	Xur8gHIvt4z+t6mbsF+RKY+ltSXFjYrVkF9y0OUi9wlWGBmIvad8T0FLa+z9NbA++XSGQfVx4BS
	OLMIBDPQ3SH2wHYHi7A11vGUcKAXyjo6NSZWPmIR4ObWCbYkhNuhequgBhYBRRWGLtD9LkmB98B
	NPBCyH7yAS8WtAT+/Rqe4l5Iviqq
X-Received: by 2002:a05:6000:2410:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-48e44c7bfeemr12077412f8f.25.1793033179324;
        Mon, 26 Oct 2026 09:46:19 -0700 (PDT)
Message-ID: <9bd50f03-721f-4750-915f-e7ea7553cc92@gmail.com>
Date: Mon, 26 Oct 2026 17:46:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/ns16550: drain TX before reinitializing the
 UART
To: Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
 <938aadfc32c531f934291fdff3763cdefd5849e6.1792467713.git.zhangzheng@iscas.ac.cn>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <938aadfc32c531f934291fdff3763cdefd5849e6.1792467713.git.zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793033180-778F24E9-9E076842/10/73395122804
X-purgate-type: spam
X-purgate-size: 3119
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/26 5:45 AM, Zhang Zheng wrote:
> Drain pending output before resetting FIFOs. Bound the wait to avoid
> hanging boot if the UART never reports empty.
> 
> Wait for TEMT (which already implies THRE on a 16550) to ensure
> transmission has finished before reconfiguration. uart->lsr_mask normally
> checks only THRE, which indicates room for more output.
> 
> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> ---
>   xen/drivers/char/ns16550.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 1f54155d67..29f784280e 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -410,6 +410,12 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>   static void __init cf_check ns16550_init_preirq(struct serial_port *port)
>   {
>       struct ns16550 *uart = port->uart;
> +    cycles_t start;
> +    /*
> +     * Too early for proper time calibration, assume a 5GHz CPU and let it wait
> +     * about 1s, with still reasonable timeout on a slower CPU.
> +     */
> +    cycles_t timeout_ticks = 5UL * 1000 * 1000 * 1000;

Shouldn't we use here ULL? 5UL * 1000 * 1000 * 1000 > MAX_unsingned_long 
on 32-bit platforms, at least, for arm33 and riscv32 unsigned long is 
4-byte type?

Also, I think that the comment should be updated as get_cycles() doesn't 
count CPU cycles:
  - on RISC-V it reads the time CSR, which ticks at the timebase
    frequency. E.g. on SpacemiT K1 that's 24MHz, so the "about 1s"
    becomes ~208s; with QEMU virt's 10MHz it's ~500s.
  - on Arm it reads CNTPCT, again typically in the tens of MHz range,
    with similar results.

So it won't be 1s for that arch-s.

Also for Arm and RISC-V preinit_xen_time() runs before 
console_init_preirq(), so time is already usable at this point if I am 
not mistaken something so "Too early for proper time calibration" sounds 
incorrect.

>   
>   #ifdef CONFIG_HAS_IOPORTS
>       /* I/O ports are distinguished by their size (16 bits). */
> @@ -427,6 +433,15 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
>   #endif
>       }
>   
> +    /*
> +     * Drain firmware/early-console output before changing line settings or
> +     * resetting FIFOs. Wait for TEMT so the shift register is empty too.
> +     */
> +    start = get_cycles();
> +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) &&

This is done before pci_serial_early_init() (called from
ns16550_setup_preirq()), so for a PCI UART (specified via
<port-bdf> / <bridge-bdf> or found via "pci") whose decoding hasn't
been enabled by firmware, the LSR read may still return all ones.
With TEMT set in that value, the wait is then simply skipped. That's
harmless, but perhaps worth a word in the description or a code
comment.


> +            get_cycles() - start < timeout_ticks )
> +        cpu_relax();
> +
>       ns16550_setup_preirq(uart);
>   
>       /* Check this really is a 16550+. Otherwise we have no FIFOs. */

~ Oleksii


