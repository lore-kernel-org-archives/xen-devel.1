Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC963C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 12:01:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358064.1612346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnQl-0003uj-KM; Thu, 09 Jul 2026 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358064.1612346; Thu, 09 Jul 2026 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnQl-0003uc-HD; Thu, 09 Jul 2026 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1358064;
 Thu, 09 Jul 2026 12:00:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@swg.vates.tech>)
 id 1whnQj-0003uW-Ht
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:00:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnQi-00DUQm-Uo
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 14:00:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@swg.vates.tech>)
 id 6a4f8d5b-2eae-0a2a0a5409dd-0a2a450bd4b0-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:00:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@swg.vates.tech>)
 id 6a4f8d64-b7da-0a2a450b0019-b9ff1c229b9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:00:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f46c03b15000edb5.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jul 2026 12:00:30 +0000
Received: from nixpc.gpn.vates.fr
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id 23FC981C0B;
 Thu,  9 Jul 2026 14:00:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=RTnYH73xURiICL/d2/DiyoZ1v9xWUiiOBevGWfBVi3k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=aKmd/qGjLpUWSyh5A6VcUZqDcJ0wk+qJEhaDKm9E0/fGdfCllWedjbaK1yUsfilp66ZfxSZ0f
 dxS3mR6RECmvHsU/D+6i6E8l/F3UZMwKtsNDrfRL0adxxnNOP0Mw+Rgt9bUA3mD+B3MKt6kPB2j
 Jj54jybm4cnNZgUGs6hyroKH1WgTV1jHXHaglHUN+3hSKMzcTjZ6oPIAFErcg9Eg6d/eOXij2S8
 JO6lws7LK3kJVvWRPUKivgiQG6uk94lwyxtGGbLyUAdyqr86cZ3LPnlNdWgs3h29M4S5t9Ncpjj
 E04yq4ey9HjiMuxoKDVtxczmp1hTFm8yt5byBg0Z/GPw==
X-Zone-Loop: fcd810df306e8e149ff87e0afee56a8619948377eced
x-campaign-type: default
x-transaction-id: 59c99f91-3d67-4723-8ce1-49870b1ad20b
x-swg-uid: 01-00cc029c-2697-4833-a954-7fb64f9b9546
X-Mailer: Sweego
Message-ID:
 <1783598431.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@vates.tech>
x-swg-bid: 1783598431.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Andrii Sultanov <andriy.sultanov@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	George Dunlap <dunlapg@umich.edu>
Subject: [PATCH v1] tools/ocaml: xenbus - Fix handling of requests with len = 0 for socket connections
Date: Thu,  9 Jul 2026 12:00:09 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783598428414
X-purgate-ID: tlsNG-42698a/1783598436-4A3749ED-5914E706/0/0
X-purgate-type: clean
X-purgate-size: 2370

Following the report at https://lore.kernel.org/xen-devel/CAFLBxZaeTMcF4tcV45MJdCVx4A6qbzQdjKei_Quh_iLrtARVFA@mail.gmail.com/

Without this fix, the backend would be stuck waiting on the zero-sized
body until the next request comes in.

Instead return the request immediately after reading the header, there's
no need to wait for another call to .has_more_input and .input

Reported-by: George Dunlap <dunlapg@umich.edu>
Signed-off-by: Andrii Sultanov <andriy.sultanov@vates.tech>
---
 tools/ocaml/libs/xb/xb.ml | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tools/ocaml/libs/xb/xb.ml b/tools/ocaml/libs/xb/xb.ml
index 3e3ef2b29d..12ddb05c6d 100644
--- a/tools/ocaml/libs/xb/xb.ml
+++ b/tools/ocaml/libs/xb/xb.ml
@@ -249,6 +249,11 @@ let can_input con = Queue.can_push con.pkt_out CommandReply
 
 (* NB: can throw Reconnect *)
 let input con =
+  let reset_and_return partial_pkt =
+    let pkt = Packet.of_partialpkt partial_pkt in
+    con.partial_in <- init_partial_in ();
+    Some pkt
+  in
   if not (can_input con) then None
   else
     let to_read = to_read con in
@@ -264,17 +269,25 @@ let input con =
         if sz > 0 then
           Partial.append partial_pkt (Bytes.to_string b) sz;
         if Partial.to_complete partial_pkt = 0 then (
-          let pkt = Packet.of_partialpkt partial_pkt in
-          con.partial_in <- init_partial_in ();
-          Some pkt
+          reset_and_return partial_pkt
         ) else None
       | NoHdr (i, buf)      ->
         (* we complete the partial header *)
         if sz > 0 then
           Bytes.blit b 0 buf (Partial.header_size () - i) sz;
-        con.partial_in <- if sz = i then
-            HaveHdr (Partial.of_string (Bytes.to_string buf)) else NoHdr (i - sz, buf);
-        None
+        if sz = i then
+          let partial_pkt = Partial.of_string (Bytes.to_string buf) in
+          (* If there is no body, we can return the full request immediately *)
+          if Partial.to_complete partial_pkt = 0 then
+            reset_and_return partial_pkt
+          else (
+            con.partial_in <- HaveHdr partial_pkt;
+            None
+          )
+        else (
+          con.partial_in <- NoHdr (i - sz, buf);
+          None
+        )
     )
 
 let classify t =
-- 
2.54.0


