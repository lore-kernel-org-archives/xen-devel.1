Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFAFCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 12:49:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440796.1658268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDi7k-0000X7-T7; Mon, 05 Oct 2026 12:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440796.1658268; Mon, 05 Oct 2026 12:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDi7k-0000X0-Q0; Mon, 05 Oct 2026 12:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1440796;
 Mon, 05 Oct 2026 12:48:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDi7j-0000Wt-Pp
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:48:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDi7i-0067O3-EW
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:48:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c1c21670003f66@swg.vates.tech>)
 id 6ac39c92-8faa-0a2a0a5109dd-0a2a450bcc58-48
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 14:48:54 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c1c21670003f66@swg.vates.tech>)
 id 6ac39cb6-b7e8-0a2a450b0019-b9ff1c23b103-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 14:48:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10c1c21670003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 12:48:52 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id BDC6382361;
 Mon,  5 Oct 2026 14:48:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=71dbmMeUgqc5uPvC5ClI7fThCtsLuV9OZ4alcvFzdzY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ltiX4L0au1KJSnaOICMCECBYYkgVgPOMbGQzodEBvR9hkudchGIzBvxKvI3nMxRICIIO5SJPk
 QjtfxL5VO+MbrDX3xV8A38xRzRqcysQixJnp68RKN84ZoQRZxM6uqZihIkF9IGxn5h8Q4esRgWH
 hqlbqIxuLRPWl1FPkmesQuux/IZ5t2kWZQ/SE+t22mufMxfyyc08/1/ez7dZVOYg14fjdXzkpJl
 RpBymsrbCeaqNmlovqXlvS+7GjkjkyArAKrmrYUDExSYn2a24sWzgR7O3DiRbu1myo64jB23zSC
 lpRasjc4e+GPVxDPb2Vh727GRYwl1LiG/6CSMJ05LlpA==
X-Zone-Loop: 49974e3cd8709e334bdab1f2887ad30f5e4e97864b28
x-campaign-type: default
x-transaction-id: 354cbd42-ea76-4b73-8d2e-b5b62eb716af
x-swg-uid: 01-0e8e8b8e-ada2-49c6-8bd7-6d305264d3ec
X-Mailer: Sweego
Message-ID:
 <1791204532.8631fc262581453bbf619ec5b2062170.1a10c1c21670003f66@vates.tech>
x-swg-bid: 1791204532.8631fc262581453bbf619ec5b2062170.1a10c1c21670003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 5 Oct 2026 13:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/oxenstored: preserve socket fds across exec
 live-update, document SIGTERM limit
To: Andrew Mbugua <andrewprecious388@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, guillaume.thouvenin@vates.tech,
 anthony.perard@vates.tech
References: <20261005124654.4070674-1-andrewprecious388@gmail.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <20261005124654.4070674-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791204531996
X-purgate-ID: tlsNG-42698a/1791204534-2C59A9EA-A5F544DA/10/77776452383
X-purgate-type: spam
X-purgate-size: 3776

Please stop re-sending this email - I've just received four copies of it.

On 10/5/26 13:47, Andrew Mbugua wrote:
> The TODO comment at connection.ml: has_extra_connection_data dates back to
> commit 42f0581a91 ("tools/oxenstored: Implement live update for socket
> connections"), which started dumping anonymous (dom0 toolstack) socket
> connections as "socket,fd" plus watches, but left the SIGTERM /
> file-based restart case unsolved:
>
>    (* TODO: what about SIGTERM, should use systemd to store FDS
>        || has_socket (* dom0 sockets not * dumped yet *) *)
>
> An fd number is only meaningful for an exec-based live-update where the
> fd is inherited. It cannot survive a SIGTERM/file-based restart
> where fd numbers from the old process are meaningless. That would
> require stashing the fds in systemd.
>
> Additionally, Connection.dump never cleared CLOEXEC on the socket fd
> (unlike DB.to_channel which does so for the listening socket), so even
> an exec live-update including a forced one with `live-update -F`
> which bypasses prevents_quit, loses the connection and restore hits
> "Ignoring invalid socket FD".
>
> Resolve the TODO without regressing commit 42f0581a91:
> - keep allowing idle sockets for exec live-update; pending partial
>    I/O still blocks via has_in/has_out and SIGTERM clients
>    simply reconnect.
> - clear CLOEXEC in Connection.dump so the dumped fd actually survives
>    exec.
> - replace the TODO with a comment explaining the remaining systemd fd
>    store future work for SIGTERM.
>
> Ive verified that make builds oxenstored cleanly
>
> Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
> ---
>   tools/ocaml/xenstored/connection.ml | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
> index 37eb2444b9..e535e7cea6 100644
> --- a/tools/ocaml/xenstored/connection.ml
> +++ b/tools/ocaml/xenstored/connection.ml
> @@ -435,9 +435,15 @@ let has_extra_connection_data con =
>     let has_in = has_partial_input con in
>     let has_out = has_output con in
>     let has_nondefault_perms = make_perm con.dom <> con.perm in
> +  (* Socket (dom0 toolstack) connections are dumped as "socket,fd" plus
> +     watches by Connection.dump below. The fd number only survives an
> +     exec-based live-update when the fd is preserved across exec (see
> +     dump); it cannot survive a SIGTERM / file-based restart, where fd
> +     numbers are meaningless. That case would require stashing the fds
> +     in systemd (fd store / socket activation). Pending input/output
> +     already blocks above, so idle sockets are safe for exec live-update
> +     and SIGTERM clients simply reconnect. *)
>     has_in || has_out
> -  (* TODO: what about SIGTERM, should use systemd to store FDS
> -     	|| has_socket (* dom0 sockets not * dumped yet *) *)
>     || has_nondefault_perms (* set_target not dumped yet *)
>   
>   let has_transaction_data con =
> @@ -464,9 +470,13 @@ let dump con chan =
>         Domain.dump dom chan;
>         domid
>       | None ->
> -      let fd = con |> get_fd |> Utils.FD.to_int in
> -      Printf.fprintf chan "socket,%d\n" fd;
> -      -fd
> +      let fd = con |> get_fd in
> +      (* Keep the fd across exec so an (exec-based, possibly forced)
> +         live-update can restore it via "socket,%d". File-based
> +         SIGTERM/restart cannot restore fds; that needs systemd fd store. *)
> +      Unix.clear_close_on_exec fd;
> +      Printf.fprintf chan "socket,%d\n" (Utils.FD.to_int fd);
> +      -(Utils.FD.to_int fd)
>     in
>     (* dump watches *)
>     List.iter (fun (path, token) ->

