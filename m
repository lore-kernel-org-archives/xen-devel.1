Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B420B606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=I3dYMxkY
Received: from list by lists.xenproject.org with outflank-mailman.1461421.1672428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLX1-0000Qq-KM; Mon, 26 Oct 2026 14:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461421.1672428; Mon, 26 Oct 2026 14:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLX1-0000Qj-Hj; Mon, 26 Oct 2026 14:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1461421;
 Mon, 26 Oct 2026 14:18:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f@swg.vates.tech>)
 id 1xLLX0-0000Qd-FG
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:18:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLLWz-00EI2D-BJ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:18:33 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f@swg.vates.tech>)
 id 6adf6132-e002-0a2a0a5209dd-0a2a450a8c42-12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:18:33 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f@swg.vates.tech>)
 id 6adf6138-f2d2-0a2a450a0019-b9ff1c12b335-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:18:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a17893baae000f79f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 14:18:29 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id F320282DF1;
 Mon, 26 Oct 2026 15:18:28 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=2G9amNGzEGj9H/n3Fwm1IC8Oq+GlWmiIYg8/y4uJpeU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=I3dYMxkYTfSKZ4t38QTtxpLm95qLdOFZAxr8grMa2wsqjyKWAIbPxQiaFwyvG5X3rIbVjVlZp
 CdixKWpLfUg3vVDWeDfOnFqwHPft6enNKqCNVVQRRYf3y6Bxp7i2yJQ60sWdovdtYd7axZX9qGp
 /lAOmYhSkI8HOxJGyaY1ZGR0XeBAcYe7xhNx7lOM61HWWRzrqDSjxDcXdzVf9lkYoKu3vhF2y+z
 OZu7uuRtcRrdIY3wdfwwyBMi1zj48NFMlgEtWEhbfJmuLDR+pZ1QjwuTqRryeZuaHFekGcBA7SL
 aTkItYXSlHhY7rFcWQ0Yv+jieYkiLSzyNl6eQdd2tK0g==
X-Zone-Loop: 3d0d07d9f5ed8f56d38dbc10239c8cc406ceea75d25b
x-campaign-type: default
x-transaction-id: 56ff71c1-8b76-4e76-994e-f9fcb2de2e95
x-swg-uid: 01-111e260b-8b58-4aeb-85bd-49678707e836
X-Mailer: Sweego
Message-ID:
 <1793024310.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f@vates.tech>
x-swg-bid: 1793024310.8631fc262581453bbf619ec5b2062170.1a17893baae000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 26 Oct 2026 14:18:28 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml/libs/xs: Create FDs with the correct CLOEXEC
 status
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Andrew Mbugua <andrewprecious388@gmail.com>
References: <20261012201857.714448-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <20261012201857.714448-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793024309177
X-purgate-ID: tlsNG-4011c0/1793024313-528DDCFC-43245F50/0/0
X-purgate-type: clean
X-purgate-size: 2285
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/12/26 21:19, Andrew Cooper wrote:

> ... rather than editing them after the fact.
>
> This capability exists from Ocaml 4.05 which is also our minimum supported
> version.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
>
> Found while reviewing the other FD handling patch.
> ---
>   tools/ocaml/libs/xs/xs.ml | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/tools/ocaml/libs/xs/xs.ml b/tools/ocaml/libs/xs/xs.ml
> index addccc80099b..a088d67a8cb6 100644
> --- a/tools/ocaml/libs/xs/xs.ml
> +++ b/tools/ocaml/libs/xs/xs.ml
> @@ -155,9 +155,8 @@ exception Failed_to_connect
>   let daemon_open () =
>     try
>       let sockaddr = Unix.ADDR_UNIX(daemon_socket) in
> -    let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
> +    let sock = Unix.socket ~cloexec:true Unix.PF_UNIX Unix.SOCK_STREAM 0 in
>       Unix.connect sock sockaddr;
> -    Unix.set_close_on_exec sock;
>       make sock
>     with _ -> raise Failed_to_connect
>   
> @@ -169,8 +168,7 @@ let domain_open () =
>       with Unix.Unix_error(_, _, _) ->
>         "/proc/xen/xenbus" in
>   
> -  let fd = Unix.openfile path [ Unix.O_RDWR ] 0o550 in
> -  Unix.set_close_on_exec fd;
> +  let fd = Unix.openfile path [ Unix.O_RDWR; Unix.O_CLOEXEC ] 0o550 in
>     make fd
>   
>   let close xsh = Xsraw.close xsh.con
>
> base-commit: 0d3bb3c98bc99ec1c84ebb3df71b6e18daebff4f
The change on its own is fine - there's no functional impact. But as far 
as I
can tell, these functions are not used anywhere (they haven't been used 
in xapi
in a long time), so there's limited utility in this cleanup.

Regarding your question from the original thread, if this patch was intended
as an answer to it:

 > Where do these sockets come from?  What flags where they opened with?

The sockets that are dumped come from xenstored.ml:process_special_fds:

       let (cfd, _addr) = Unix.accept fd in

The default is keep-on-exec, so there shouldn't be any need to call
Unix.clear_close_on_exec in the patches suggested by Andrew Mbugua.

Acked-by: Andrii Sultanov <andriy.sultanov@vates.tech>


