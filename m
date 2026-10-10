Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F9ECA9EC5
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 22:13:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445419.1661634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFfJX-000183-CX; Sat, 10 Oct 2026 22:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445419.1661634; Sat, 10 Oct 2026 22:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFfJX-00017w-8n; Sat, 10 Oct 2026 22:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1445419;
 Sat, 10 Oct 2026 22:13:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xFfJV-00017q-Fh
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 22:13:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFfJU-005B5U-T8
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 00:13:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a127e070a900080d7@swg.vates.tech>)
 id 6acab820-2eae-0a2a0a5409dd-0a2a45088230-42
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 00:13:08 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a127e070a900080d7@swg.vates.tech>)
 id 6acab874-f659-0a2a45080019-b9ff1c239517-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 00:13:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a127e070a900080d7.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 22:13:02 +0000
Received: from [192.168.31.249] (213.40.31.93.rev.sfr.net [93.31.40.213])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A35C381FCC;
 Sun, 11 Oct 2026 00:13:01 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=ZAu6Hk56oBtUF6yeK+C0zOkn9lPD/TWacsgO27G78p0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=sVC2PUiLSr070no8g3mXxY76witXW32SiTAif6MU/TIv9yDn28ScWzckbhCPEhGVoX40bJVVK
 zou2+atzqJJ0RQ+DTvsMjI4gryUD3lq/qfe9mzLx9R8M+aZ0n+OanC7VQV6OAolnS0Aw5pzDH5J
 w5O4ki13Gm9ffstc+/tU2UZcYSn/eh9aKZulxeiqEnh8v19IN2Qpm8XxoGlFE9NF0qQYsup8I9c
 I076wLz02RudPylMtaSN6EAVETQndPMlj2ENgX3ek1wlZsSoFRTs2f/LvAjW2WDxhHexBtp46hE
 eDwxX5uq/NyKbk1Z0uPdSkHwORzcPsYtFsm4pbyo5smw==
X-Zone-Loop: e5b2f2b3987b1f8a339583ea68001ad70479a1e42374
x-campaign-type: default
x-transaction-id: 6b245b9a-32b6-4213-b3a8-27f903c9e01e
x-swg-uid: 01-af59a75c-e324-4c47-ace0-23ae5b215440
X-Mailer: Sweego
Message-ID:
 <1791670382.8631fc262581453bbf619ec5b2062170.1a127e070a900080d7@vates.tech>
x-swg-bid: 1791670382.8631fc262581453bbf619ec5b2062170.1a127e070a900080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Sun, 11 Oct 2026 00:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
To: Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791670381792
X-purgate-ID: tlsNG-c1860d/1791670388-CF15E87B-9F5C6C2D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1367

For any reasons, it seems this patch has not been received by ML server, 
I couldn't find him here: 
https://lore.kernel.org/xen-devel/20261010031406.2057735-1-zhangzheng@iscas.ac.cn/T/#t


On 10/10/26 5:21 AM, Zhang Zheng wrote:
> An SBI console call may return before the UART finishes transmitting.
> Wait for UART_LSR_TEMT before ns16550 reprograms the UART and clears its
> FIFO, preserving pending early-console output and legacy SBI v0.1 support.
> 
> Suggested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Link: https://lore.kernel.org/xen-devel/8836d1e3-77c8-4447-b1ef-132620a71441@gmail.com/
> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> ---
>   xen/drivers/char/ns16550.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index c174465059..278d38822d 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -427,6 +427,10 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
>   #endif
>       }
>   
> +    /* Preserve output queued by firmware before taking over the UART. */
> +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
> +        cpu_relax();
> +
>       ns16550_setup_preirq(uart);
>   
>       /* Check this really is a 16550+. Otherwise we have no FIFOs. */


