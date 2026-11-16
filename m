Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A00606A329
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzTQYZul
Received: from list by lists.xenproject.org with outflank-mailman.1490347.1691286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuAo-00006U-Mz; Mon, 16 Nov 2026 10:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490347.1691286; Mon, 16 Nov 2026 10:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuAo-00006N-KM; Mon, 16 Nov 2026 10:42:54 +0000
Received: by outflank-mailman (input) for mailman id 1490347;
 Mon, 16 Nov 2026 10:42:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSuAn-00006H-3Y
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:42:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuAl-000FSf-Uv
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:42:51 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afade27-bab6-0a2a0a5309dd-0a2a4508d560-14
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:42:51 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afade2b-f659-0a2a45080019-d155802ce4fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:42:51 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso21580545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 02:42:51 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb6dc30b3asm86896135e9.13.2026.11.16.02.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 02:42:51 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794825771; x=1795430571; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7s5Ci7+IN9QEpsR2FTr/gWpy2T5q0ZzALy2Uag/63wY=;
        b=dzTQYZult9GrbR8OJSQEh6ZMv14/PRhHGLtpT/Pa7RmX1wZT+oovLLBYZXZm5wbIkk
         pkxJO0w7NUXtHGSJPWNrbRi1/9hRk9wbjz9VF2nVtZFGLb8ze6RotoM4c4b8BfZBgMVA
         iCphXjUzZUDfio6aAgAZqfAMm5LqhGb9s44xB265UdNNO9/VxI0p8FYMTEcuJLCerJXB
         e5S9HLRXJ9fpyddRniNac3nILJL0MtbbDZD79zs3ShqlDctoG6t2UCBCuyjSPGERqo/o
         wRwDMOxqJixHWa8DnZWuQpaB+viSBo7hAdEscyE3Po9ZwpoZ3qjtAGCeOkQVD2uxSpRY
         ojuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825771; x=1795430571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7s5Ci7+IN9QEpsR2FTr/gWpy2T5q0ZzALy2Uag/63wY=;
        b=eRG3T/ViO1QbgOF3DAK+Tge+aXjH9zif/bwW9aibYPsvX+xdrdmsDrrHSUKYZo9RKb
         xtTN2KVN2e9nHuXR/8HjH43GElr1GLC9+rL6nuWmdQgfu359daU2QvtF1VklJBj159Yy
         3V2nV/UtznRe5oB/i8Cs2pJOY3/8aMwxd008kpAdMTAckncA496D1wOifF6ZXkkSK4K2
         kVX397jFmys5MA9eAxDyX+QKK+plpnN+oOplD9TgjTNui0ht4Hy7L54IaYWwoCIR70bj
         WCLbZyjjsanTb848xkzS0XS4mJasBt/Tci0KA62bpmrMCisV3Q7RDS63dE/5zJBvZqhZ
         K0eA==
X-Forwarded-Encrypted: i=1; AL+hErHRuC2MzhePw8/Uye6U+NEdrdDgUaboCoj9ymRBA5rP9SCZ9VjcF+bZoUCzAeIAgY8jLmXpbdF3XAE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+2sUrpb2J4UPQH1dYwCe7tC2SAo4/ltTR69Yieq8pWrQPt7ek+
	GItg6dZW8AycUJ+mrAuM0h6yGH2hDOCxe5lbSwokI3HBerP8zxWolDCp
X-Gm-Gg: AYBFou3tJO6G8v/+wwMplQw1hEttgGgtj809RRznau6d/6oAlClowQk4/6ABxNJHZit
	8KjO78JJ4VW/RkKSkRBegDRi4sLLTzkbfhFPR90HBOejAvQZevcUP8y4vUdS/px68FOuPlSzA/T
	wlfp/2zAuFkiE7BSvHOXhIeQ8exgmwUABs0U/mp+02xvB/h9+C/7GimLskB5YjqTL9QcyD+epsW
	0gYWUcyrAtm4MdWPFWr0TKkufW5Ku7hUqjEOstCB5s1mcGutk6caTKiBDcoPWS/6h3QKFirvMlt
	HAjfucUCovAEakzIuzlOrxSvlShb4aisTCgm0p+N3dZMIIBCKiv2C6EWitC/F6UpGeQa2mGf08h
	nKOFBRGOFada4txWpsGO2mksdT3YW3/sCb2A1n18yIQtAm9ik/0ohA2O0DKyjPxoPcqIn9Qzrku
	EIVFp6X5EyE6ueZByH6SVlIj+G6fKFvRVnIojYg3HtbWCn9A/7OTNoBOTEqKuWbGXKltRB7Jy4I
	PgFW272SL7S/0oVanSXbIHopAMr+49cyYdFIv3DOKDqqnTXTfpldVnJ/FmULDfVymoV7ySUBhp5
	cZNmen3MFI7m32IWHHWzGKZNwVyrnzKERt8CDOhjjjvsIrWThNpud5EQTQpCbDiIhlt5BRnFvhe
	bQw==
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr223954895e9.26.1794825771345;
        Mon, 16 Nov 2026 02:42:51 -0800 (PST)
Message-ID: <99d00228-22c3-4ead-b882-e3da540f6d7a@gmail.com>
Date: Mon, 16 Nov 2026 11:42:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/26] emul/ns16x50: implement SCR register
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-7-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794825771-D574B87B-DA5F691C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1494
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
> Add SCR register emulation to the I/O port handler.
> Firmware (e.g. OVMF) may use SCR during the guest OS boot.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/ns16x50.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 80805ee6ecc6..2371aa32d03f 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -145,6 +145,11 @@ static int ns16x50_io_write8(
>           /* DLAB=0 */
>           break;
>   
> +    /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */

Nit: the comment sits only on the write side, and above the case label
rather than inside it like the other DLAB comments; with the commit
message saying the same, I'd drop it or move it next to the definition
of NS16X50_REGS_NUM, which is what makes SCR emulated at all.

> +    case UART_SCR:
> +        regs[UART_SCR] = val;
> +        break;
> +
>       default:
>           rc = -EINVAL;
>           break;
> @@ -234,6 +239,10 @@ static int ns16x50_io_read8(
>           /* DLAB=0 */
>           break;
>   
> +    case UART_SCR:
> +        val = regs[UART_SCR];
> +        break;
> +
>       default:
>           rc = -EINVAL;
>           break;

Reviwed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

