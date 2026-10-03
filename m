Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D6CA5FE6
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2026 19:54:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440094.1657932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xD5nT-0003RZ-2Q; Sat, 03 Oct 2026 19:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440094.1657932; Sat, 03 Oct 2026 19:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xD5nS-0003RR-Tf; Sat, 03 Oct 2026 19:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1440094;
 Sat, 03 Oct 2026 19:53:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10353f83e0003f66@swg.vates.tech>)
 id 1xD5nQ-0003RL-Bi
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2026 19:53:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xD5nP-00FZ18-MI
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2026 21:53:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10353f83e0003f66@swg.vates.tech>)
 id 6ac15d08-8faa-0a2a0a5109dd-0a2a4509deb4-26
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2026 21:53:23 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10353f83e0003f66@swg.vates.tech>)
 id 6ac15d32-be1a-0a2a45090019-b9ff1c129015-3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2026 21:53:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10353f83e0003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 03 Oct 2026 19:53:17 +0000
Received: from ryzen.vates.team (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id F096981BA6;
 Sat,  3 Oct 2026 21:53:15 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=j+KXb/x5R1/0Pmx6JE5T/X5srzKoVU/jEE1dTUsXjVg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=r4KqyV57t/V5biU4fwUDhZxM/AcSGiJDUnXfjEoWnmb3gk8Pfuwi0EbWCg7evdIXMS8P96IG3
 ngnd7emf0VPcvBjhxKh70rjNI+e4Z6gvovU8Ze9AANEwVWpq1s6MWquBBOxZpi6T0aPNGvseStL
 uO61DYDHjjrDvL1NLVI/jd5N4ZM00EMo26bDFyrDjMBovRt+QQcq+iDaqj9yh2c2Uu8/wqLzAyJ
 w4iZ1JeGrgjaG5Drcou+2yBPF3YTgMidWw6j/3CH1+QlKEyZObLA+4pGtthHlq8rSDuphRn4oa9
 n2WP7KkCyEfGxOFSXxYlHi7m0GBaDEr1zhyNmR9jHfiA==
X-Zone-Loop: 17c664dcae6a30fd6070a267adbd5e1c2be8deeab11c
x-campaign-type: default
x-transaction-id: 95aa0caa-db28-424c-9eaf-1b370694e48b
x-swg-uid: 01-4ef930ad-ced0-4674-a76c-5868f902795e
X-Mailer: Sweego
Message-ID:
 <1791057197.8631fc262581453bbf619ec5b2062170.1a10353f83e0003f66@vates.tech>
x-swg-bid: 1791057197.8631fc262581453bbf619ec5b2062170.1a10353f83e0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	jason.andryuk@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2] x86/ACPI: optimise C3 entry on AMD CPUs
Date: Sat,  3 Oct 2026 21:53:10 +0200
In-Reply-To: <332fec64-31f0-48b5-8c86-163e81899310@suse.com>
References: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech> <332fec64-31f0-48b5-8c86-163e81899310@suse.com>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.602.166c55b5ce43ba07.1a10353f46b.1238d118b573c425=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791057196143
X-purgate-ID: tlsNG-bad1c0/1791057203-3A4DB034-368E43BE/0/0
X-purgate-type: clean
X-purgate-size: 1228

---=Part.602.166c55b5ce43ba07.1a10353f46b.1238d118b573c425=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01=2E10=2E2026 09:14, Jan Beulich wrote:
> Why the RFC, btw?

It's my first Xen patch, and on staging it was only build-tested: I
booted and measured it on the 4=2E17 backport only=2E I should have droppe=
d
the tag for v2=2E

> Linux also deals with modern Centaur (VIA) and Zhaoxin (Shanghai) CPUs=
=2E
> We will want to mirror that too, provided we want to continue this
> mirroring=2E Alternatively we could have Linux'es xen-acpi-processor
> driver invoke acpi_processor_power_init_bm_check() before passing up
> C-state info=2E That would imo be better overall, with one downside: Non=
-
> Linux Dom0-s would then need to follow suit=2E

Noted=2E I'll leave the choice between the two to you and the other x86
maintainers=2E

Thanks for committing it, and for fixing the attribution=2E

Olivier


-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.602.166c55b5ce43ba07.1a10353f46b.1238d118b573c425=---

