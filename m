Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F6DCCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:14:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451447.1666527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0p-0000nR-HG; Fri, 16 Oct 2026 09:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451447.1666527; Fri, 16 Oct 2026 09:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0p-0000nI-ES; Fri, 16 Oct 2026 09:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1451447;
 Fri, 16 Oct 2026 09:14:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd43ef0008425@swg.vates.tech>)
 id 1xHe0n-0000al-Ft
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:14:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHe0m-007orE-SX
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:14:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd43ef0008425@swg.vates.tech>)
 id 6ad1ead5-8faa-0a2a0a5109dd-0a2a4502a888-6
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:14:00 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd43ef0008425@swg.vates.tech>)
 id 6ad1ead7-6ca4-0a2a45020019-b9ff1c22ace5-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:13:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a143fd43ef0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 09:13:53 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E867381F66;
 Fri, 16 Oct 2026 11:13:52 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=jhZDJ/uRT58PcuL5wb2FP//FQDMpMS0RNO/OKYNYozc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=FILaNU+3H4nZoxUQhRtkniwx5UT5WsU6U6QNDz7VcAXF6PTb31BI1AGoz++PEuBj6ESpalNPf
 UVeXMFnjIGRmLzGA3W5QpsMwxS46Voq/Cv6jIgkKXHDB7qwEMnqsnHXtJAMlTd2A+8qjyEfanbq
 8Tmmf8/JCiyBespiiAilsOzaaWYsD15pgbHRkbxll07g73Pbw9kbo9BfXQE79UYX2fb8ggblJq7
 5VtC2/AWrFRMmpsVjWfeTMxSmqdtARkjlHaxRLOOaTz8Wj81jb2lU8j5gO5/9bgtkrubJKWnNKL
 7oOAu+ykd6K5Ps3JR6Apx6ormioN3ZQw9tWautNC6Fyg==
X-Zone-Loop: caecabbb661e24a69649d9d6dfcd665282f38e1d8702
x-campaign-type: default
x-transaction-id: 60130833-c02c-46b2-b9ec-58b1b7bc260f
x-swg-uid: 01-0dbc8a69-13ae-4a75-a2a9-efbfa3a74e93
X-Mailer: Sweego
Message-ID:
 <1792142033.8631fc262581453bbf619ec5b2062170.1a143fd43ef0008425@vates.tech>
x-swg-bid: 1792142033.8631fc262581453bbf619ec5b2062170.1a143fd43ef0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 0/3] tools/libxenstat: small fixes in the Linux network collector
Date: Fri, 16 Oct 2026 09:12:56 +0000
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2a2.ec0f426ae79c724a.1a143fd408c.3006d1f093e7f4ee=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792142033040
X-purgate-ID: tlsNG-720697/1792142039-F26B72AC-178D5F58/0/0
X-purgate-type: clean
X-purgate-size: 2051

---=Part.2a2.ec0f426ae79c724a.1a143fd408c.3006d1f093e7f4ee=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

While looking at xenstat_collect_networks() for commit 0c53660c1cf3
("tools/libxenstat: don't lose all VIFs when dom0 has no Linux bridge"),
I noticed a few more issues in xenstat_linux=2Ec:

- getBridge() dereferences NULL when /sys/class/net can't be opened,
- after a failed /proc/net/dev header check, the next call skips the
  check and parses the file anyway,
- parseNetDevLine() doesn't initialise all of its outputs (cleanup, no
  functional change intended)=2E

Patches 1 and 2 may be worth backporting=2E If so, patch 1 should go along
with 0c53660c1cf3: without it, the empty bridge name would make every
VIF disappear instead=2E

Testing: libxenstat builds with the usual tools CFLAGS (including
-Werror)=2E I also tested the series on an XCP-ng 8=2E3 host (Xen 4=2E17=
=2E7,
Open vSwitch), applied with 0c53660c1cf3 on top of its libxenstat and
loaded via LD_LIBRARY_PATH:
- xentop reports the same networks and counters with and without the
  series,
- with /sys/class/net made unavailable in a private mount namespace,
  xentop no longer segfaults in readdir() called from
  xenstat_collect_networks(),
- with an invalid /proc/net/dev bind-mounted over the real one, a second
  xenstat_get_node() call fails again instead of parsing the file=2E

Olivier Lambert (3):
  tools/libxenstat: don't crash when /sys/class/net can't be opened
  tools/libxenstat: don't skip the /proc/net/dev check after a failure
  tools/libxenstat: fix output initialisation in parseNetDevLine()

 tools/libs/stat/xenstat_linux=2Ec | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

--=20
2=2E53=2E0



-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.2a2.ec0f426ae79c724a.1a143fd408c.3006d1f093e7f4ee=---

