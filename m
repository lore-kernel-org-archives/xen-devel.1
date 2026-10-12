Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4AECA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 16:23:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446487.1662598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGInt-0007Jh-3v; Mon, 12 Oct 2026 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446487.1662598; Mon, 12 Oct 2026 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGInt-0007Ja-0h; Mon, 12 Oct 2026 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 1446487;
 Mon, 12 Oct 2026 16:23:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGInr-0007IN-Lj
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 16:23:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGInq-00G11Q-JP
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 18:23:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6acd0954-e002-0a2a0a5209dd-0a2a4509803e-38
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 18:23:06 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6acd096a-be1a-0a2a45090019-d1558034d873-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 18:23:06 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so13019275e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:23:06 -0700 (PDT)
Received: from andrew-B650M-DS3H.. ([102.213.49.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18dd15659sm197285685e9.4.2026.10.12.09.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 09:23:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822186; x=1792426986; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQE/x4hoVQgY+EdpQ1pgD1gNzudfoGE1aTGqMHPFuu8=;
        b=QR7wZFXFIIWIukfyDMYK4CRpfUwX8fBRPKBtDvBDr/GKEKK8pQIIpz84epbPP4jTHi
         LGO19brzgH1AXVhuZXU9FGhLxJBZwCLY0x4NjaTHgu+A2N6aH23QV/h6wM2Wi6GmaNuk
         adJbpgsaqwRYjvJB5QDV6HLvVdwkVWq4slDox+o6EUdSaZDvfz7YW9mToTumpOMc9QCX
         sr95hF43UCOQBwvRgt1Lb1Gt4b7tSappNwjM0c03sVBzX0xuySFVC60JFpQ/vvRanJqR
         2FzEjjedFkA9MFlx7I2tKvKfE7/orXpiW/x7ZgsM3ivJOAD0WEnTmcW8zCzRcFBn4Qda
         Fhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822186; x=1792426986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQE/x4hoVQgY+EdpQ1pgD1gNzudfoGE1aTGqMHPFuu8=;
        b=si5DcwxjJMmcjYficKTwjuMiMYykW3MhBPgQ+ULEm0AOLphZzk8VBGt8M5eJNjQTPH
         FJPSs3/iyw7ByicOQmtl+uSJ6Hb1QW0ig1xYbex5QujfTDx+RCFKJ3ZQw05ajVpj1tx7
         f6qUu2tH9Hg0zxI6RHT02d7y+Qv4nJDt5atSMbPZfHa1x850JWYEVDLrY8bhY16OLy6z
         TIbX3WGJQsP416tGSjzfqEehGQtI5RYWgFicoDX+MtbdLi+uTUCafizPZTX9pzXt+VEJ
         mOCk/fpvawhfpsMKm5IyNy9ljoBS24DFFc6noFhUZC6z097ZZXR54tbXfVV4/v6Vyd4A
         JW3Q==
X-Gm-Message-State: AFq9FYKTgGyOkCoR55HP2oKqa2oV3giEIB9lF1D9AsW9s+K81qnSB7Dm
	HXfQ30CyZC/zxiwFmLsHe7FK1x+98vjFUUzoxFTEx5Sa8Q5RSHwF5aYJqrG3bN1R
X-Gm-Gg: AYBFou1/sLzuRBM647WTM8KgZhUozu4YZxjbb7WzA58MvYVSUec/DaNXenZ0vu4U8Xq
	pbkH5WoXR9KTtxaod4jxuTepERBcsw6fNWYVgBCpYlAHPh9khRMxPjFtwLN7COQWor7os10sghQ
	KW8mquyflSczPGrML7bteEgDIHQScLPJstFVr6frLNaixIHZp16RhoFkHyOz6Fr+L2LhgQBF2K2
	rMznI0u9AqrkJgX8cZF+qOtHb9uA0v4BST5JU5//+JeLP0IxAduXlOTv+28WJoH2tcQpN2Yd5sr
	GP4ilc/zNbAV5ZwLe8g8O6flq7LkfOHb/ps1lOKlPvibjq3Vn49KP5lDEmpFTzw25SwMk37jPI6
	QcjtT17nfdrLIIfHLt2C+zM++s14KfHo4c/fGjHeSdJSf4HWDve5s7nkhhXKWf/m7UHbgGGDTDX
	BQ9J0U8WjO7cXdQmx/KwiE/FrujGQlPXVpDu9MSunNr3kKgPXC20JPxHUx70cj6anC0wTG9RVI8
	G7oj+F7QV6IbBwv
X-Received: by 2002:a05:600c:1d20:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a18e4f50ecmr201060925e9.34.1791822185721;
        Mon, 12 Oct 2026 09:23:05 -0700 (PDT)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	andriy.sultanov@vates.tech,
	guillaume.thouvenin@vates.tech,
	anthony.perard@vates.tech,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [PATCH] tools/oxenstored: preserve socket fds across exec live-update, document SIGTERM limit
Date: Mon, 12 Oct 2026 19:22:58 +0300
Message-ID: <20261012162258.811103-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791822186-3AEDE034-27FEE0B9/10/77776452383
X-purgate-type: spam
X-purgate-size: 3581

Resending this patch a new after fixing mailing list spam rejection

The TODO comment at connection.ml: has_extra_connection_data dates back to
commit 42f0581a91 ("tools/oxenstored: Implement live update for socket
connections"), which started dumping anonymous (dom0 toolstack) socket
connections as "socket,fd" plus watches, but left the SIGTERM /
file-based restart case unsolved:

  (* TODO: what about SIGTERM, should use systemd to store FDS
      || has_socket (* dom0 sockets not * dumped yet *) *)

An fd number is only meaningful for an exec-based live-update where the
fd is inherited. It cannot survive a SIGTERM/file-based restart
where fd numbers from the old process are meaningless. That would
require stashing the fds in systemd.

Additionally, Connection.dump never cleared CLOEXEC on the socket fd
(unlike DB.to_channel which does so for the listening socket), so even
an exec live-update including a forced one with `live-update -F`
which bypasses prevents_quit, loses the connection and restore hits
"Ignoring invalid socket FD".

Resolving the TODO without regressing commit 42f0581a91:
- keep allowing idle sockets for exec live-update; pending partial
  I/O still blocks via has_in/has_out and SIGTERM clients
  simply reconnect.
- clear CLOEXEC in Connection.dump so the dumped fd actually survives
  exec.
- replace the TODO with a comment explaining the remaining systemd fd
  store future work for SIGTERM.

Ive verified that make builds oxenstored cleanly

Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
 tools/ocaml/xenstored/connection.ml | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 37eb2444b9..e535e7cea6 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -435,9 +435,15 @@ let has_extra_connection_data con =
   let has_in = has_partial_input con in
   let has_out = has_output con in
   let has_nondefault_perms = make_perm con.dom <> con.perm in
+  (* Socket (dom0 toolstack) connections are dumped as "socket,fd" plus
+     watches by Connection.dump below. The fd number only survives an
+     exec-based live-update when the fd is preserved across exec (see
+     dump); it cannot survive a SIGTERM / file-based restart, where fd
+     numbers are meaningless. That case would require stashing the fds
+     in systemd (fd store / socket activation). Pending input/output
+     already blocks above, so idle sockets are safe for exec live-update
+     and SIGTERM clients simply reconnect. *)
   has_in || has_out
-  (* TODO: what about SIGTERM, should use systemd to store FDS
-     	|| has_socket (* dom0 sockets not * dumped yet *) *)
   || has_nondefault_perms (* set_target not dumped yet *)
 
 let has_transaction_data con =
@@ -464,9 +470,13 @@ let dump con chan =
       Domain.dump dom chan;
       domid
     | None ->
-      let fd = con |> get_fd |> Utils.FD.to_int in
-      Printf.fprintf chan "socket,%d\n" fd;
-      -fd
+      let fd = con |> get_fd in
+      (* Keep the fd across exec so an (exec-based, possibly forced)
+         live-update can restore it via "socket,%d". File-based
+         SIGTERM/restart cannot restore fds; that needs systemd fd store. *)
+      Unix.clear_close_on_exec fd;
+      Printf.fprintf chan "socket,%d\n" (Utils.FD.to_int fd);
+      -(Utils.FD.to_int fd)
   in
   (* dump watches *)
   List.iter (fun (path, token) ->
-- 
2.43.0

