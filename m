Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328E0CA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 20:19:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446583.1662699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGMUB-0007zK-Bo; Mon, 12 Oct 2026 20:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446583.1662699; Mon, 12 Oct 2026 20:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGMUB-0007zD-6x; Mon, 12 Oct 2026 20:19:03 +0000
Received: by outflank-mailman (input) for mailman id 1446583;
 Mon, 12 Oct 2026 20:19:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xGMU9-0007z7-UF
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 20:19:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGMU8-006WX7-PP
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 22:19:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6acd409d-8faa-0a2a0a5109dd-0a2a4508ecae-12
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:19:00 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6acd40b4-f659-0a2a45080019-d155802ac166-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:19:00 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a02753c04fso12199045e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:19:00 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c1e33d2sm429813235e9.0.2026.10.12.13.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 13:18:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1791836340; x=1792441140; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHSe4BFFNpt47LbsXpx+CBTmAcYEiYVMx1Z4+dzV7Zs=;
        b=p8R8VrKii856k4jU+BHZjnLJVZVrhlsBygEiTHkEbFdU/NuO8ZB9dG5UqOf1bT93Jd
         Z8A3vGndCGsTqFmWzlnCpWrXEk9TDmYneMc5yXkNPvD4s0RcpRrdnW5VOuqlUj04x8Me
         tJGR+5HAwnvTWlDIHQ7Ne/huFGOeyb5hrGYzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836340; x=1792441140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHSe4BFFNpt47LbsXpx+CBTmAcYEiYVMx1Z4+dzV7Zs=;
        b=pk4VoMk+ZXaeXNgCPS+Y5vXQnaenhr++9kWWeRzeBuw5NhrVhlLA+VAwB5Fm6v4T/N
         ng7F+zbl+4lNhVA5qbbJsFi7+GP9GLHAo66+z1nDpePgc1wNa94uQ+54jwhw/n5Q4d2/
         d3XpjjHbn1TYPYlE93wDb6XgiCp1ES4Z6VR5t0O4K5xNVoKqveVx3wNIuIEe/K7BgHKG
         eaeziQvXQayeFkji8S/RAJ9hlMsm5gEXO+zP2KiNG+RKsjPM97AX9FYy7YTiz+P1Cjz7
         TBAI5MCeCrJB8tpv4RtUTWYWbjbU8vTKVp3qyUUQkN40uG3E1jEv54+o/LrloX0UY9Yt
         Gd1A==
X-Gm-Message-State: AFq9FYJqJD53tm/wBYeBCFL8rQx31dGGE3TNydkPzagwFJJWWB9F0n6w
	CL/NyB7F/EHlmODDGgODQxr/KoYJI0pjK33qVU6GEE/5hyBHeoE+e3vkr8lJ7D/LuU4bkwVZdnk
	uIJKr
X-Gm-Gg: AYBFou1/FNzXSJIpuZeOt6+RZxGePs/Px75/qQnlrZIg6BGkfVQMoQBvlVFx8T9QMFu
	nPWa5GGmCL5ZHS7/UVPZkEURL+j50O+58l+cDr/UCfryh0d9fe/hmknAGrDhUJG+GTo2eaBUV7u
	YUeTJprKkR4wRLJkh8yzU5PpbK+V9gNaao0Jed/eMTgjnNVfjiW1W8GM7BUz/4J+fq0Vljj0kIZ
	5cBYSfw2En5qP2agHnn3qowhaVAoHxQPmMg47LyKp931qbRXP0djHYFEHD/Mb8sJQdWKRTEpGH9
	j8slas1NVQwwMODn/lxYcxv83KNKqGyrGV9qmmDzWUA+MYHf+bDPkNXi2hZ4sFhItsqf4bXtGzw
	6OJpI8UtJF5suRQNY0kQhectAoXrq5TvUchhHWrbAxkodsI3VlclGxGfXVQEBMgVAP4azy/RmY4
	791seBUnrUG9aBiV05tHor2HjH18vmjsDIu1xlod6fdf+LlkMLbIRE9wZZ5CYV9kVgz6R89olwS
	gO7coeWNvlE2Embc7Qsh9thYKWWc7xamNOsQd5yLkUZShoO
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr235134845e9.31.1791836339376;
        Mon, 12 Oct 2026 13:18:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
Subject: [PATCH] tools/ocaml/libs/xs: Create FDs with the correct CLOEXEC status
Date: Mon, 12 Oct 2026 21:18:57 +0100
Message-Id: <20261012201857.714448-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1791836340-D755C87B-C306BFB0/0/0
X-purgate-type: clean
X-purgate-size: 1434

... rather than editing them after the fact.

This capability exists from Ocaml 4.05 which is also our minimum supported
version.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>

Found while reviewing the other FD handling patch.
---
 tools/ocaml/libs/xs/xs.ml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xs/xs.ml b/tools/ocaml/libs/xs/xs.ml
index addccc80099b..a088d67a8cb6 100644
--- a/tools/ocaml/libs/xs/xs.ml
+++ b/tools/ocaml/libs/xs/xs.ml
@@ -155,9 +155,8 @@ exception Failed_to_connect
 let daemon_open () =
   try
     let sockaddr = Unix.ADDR_UNIX(daemon_socket) in
-    let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
+    let sock = Unix.socket ~cloexec:true Unix.PF_UNIX Unix.SOCK_STREAM 0 in
     Unix.connect sock sockaddr;
-    Unix.set_close_on_exec sock;
     make sock
   with _ -> raise Failed_to_connect
 
@@ -169,8 +168,7 @@ let domain_open () =
     with Unix.Unix_error(_, _, _) ->
       "/proc/xen/xenbus" in
 
-  let fd = Unix.openfile path [ Unix.O_RDWR ] 0o550 in
-  Unix.set_close_on_exec fd;
+  let fd = Unix.openfile path [ Unix.O_RDWR; Unix.O_CLOEXEC ] 0o550 in
   make fd
 
 let close xsh = Xsraw.close xsh.con

base-commit: 0d3bb3c98bc99ec1c84ebb3df71b6e18daebff4f
-- 
2.39.5


