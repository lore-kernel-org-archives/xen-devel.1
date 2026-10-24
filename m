Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63609606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=N04XhRFg
Received: from list by lists.xenproject.org with outflank-mailman.1459932.1671512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKXTo-0000vP-TX; Sat, 24 Oct 2026 08:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459932.1671512; Sat, 24 Oct 2026 08:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKXTo-0000vI-Qy; Sat, 24 Oct 2026 08:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1459932;
 Sat, 24 Oct 2026 08:51:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f@swg.vates.tech>)
 id 1xKXTn-0000vC-5b
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 08:51:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKXTm-001OFO-70
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 10:51:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f@swg.vates.tech>)
 id 6adc7183-2eae-0a2a0a5409dd-0a2a4508ca16-20
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 10:51:53 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f@swg.vates.tech>)
 id 6adc71a9-f659-0a2a45080019-b9ff1c22841d-3
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 10:51:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a16d1bed9a000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 24 Oct 2026 08:51:49 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C7C0E82379;
 Sat, 24 Oct 2026 10:51:47 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=JOLuLyZU26Pwp+uet98NHgtxrykDYq7LWYrKUWWwKbw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=N04XhRFg6Yt1vRs9dgaKgR9Bt3ZS5TsZV40VwIOpXG30dzxhJyr1e20g4zCY9VW8/FuYmn7hl
 sImlWcdr50TmhaAZxix0CenR7XBrqNR70Oo4/Ng77oXMq9s88pBvRNWTDEXVfOSYc/3+Ybneag7
 xCc5HMWIEYDdSeOqK4JtyvZ+1ZeH9HmpxzgGMyMCklv+T303HpBq3him40LBi6ELCfQwBdm7COt
 nbfrpr+4i3Mqy50hDZhzSPj5R8zq3RFzHH5y902FE4ALqAfQ6TzjIcw/UkhO0rmsP4FH6SyilsM
 zZhrcFdkgjghEKvXzstHRDf9iQZKftOWJshVnYn5utpw==
X-Zone-Loop: 94b0fa4a39b945b86288426c500b1aeb8218e1be9f95
x-campaign-type: default
x-transaction-id: 098abf31-f35b-4344-a132-afeda1595b65
x-swg-uid: 01-9bfe38b6-f4fd-466b-8e1e-633a91088b31
X-Mailer: Sweego
Message-ID:
 <1792831909.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f@vates.tech>
x-swg-bid: 1792831909.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH v2 0/3] tools/libxenstat: small fixes in the Linux network collector
Date: Sat, 24 Oct 2026 08:51:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1b1.d251b75fffadc3b4.1a16d1be84c.16662fe5e2b4fa78=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792831907921
X-purgate-ID: tlsNG-c1860d/1792831913-CEF5F87B-6A5414C3/0/0
X-purgate-type: clean
X-purgate-size: 2374
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.1b1.d251b75fffadc3b4.1a16d1be84c.16662fe5e2b4fa78=-
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

Changes in v2:
- Patch 3: drop "fix" from the subject and add an Amends: tag, as it
  changes no behaviour (Baptiste Le Duc)=2E
- Collect Baptiste's Reviewed-by on patches 1 and 2=2E

v1: https://lore=2Ekernel=2Eorg/xen-devel/1792142033=2E8631fc262581453bbf6=
19ec5b2062170=2E1a143fd43ef0008425@vates=2Etech/

Olivier Lambert (3):
  tools/libxenstat: don't crash when /sys/class/net can't be opened
  tools/libxenstat: don't skip the /proc/net/dev check after a failure
  tools/libxenstat: clean up output initialisation in parseNetDevLine()

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
---=Part.1b1.d251b75fffadc3b4.1a16d1be84c.16662fe5e2b4fa78=---

