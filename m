Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5182ECA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:43:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442490.1660038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETnu-0003Cx-1H; Wed, 07 Oct 2026 15:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442490.1660038; Wed, 07 Oct 2026 15:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETnt-0003Cq-Uf; Wed, 07 Oct 2026 15:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1442490;
 Wed, 07 Oct 2026 15:43:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@swg.vates.tech>)
 id 1xETns-0003Bc-9h
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:43:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xETnr-002ol7-DO
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:43:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@swg.vates.tech>)
 id 6ac6687e-8faa-0a2a0a5109dd-0a2a450bbee8-44
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:43:35 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@swg.vates.tech>)
 id 6ac668a6-b7e8-0a2a450b0019-b9ff1c22808f-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:43:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a11708bf380003f66.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:43:31 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 93BFE8108D;
 Wed,  7 Oct 2026 17:43:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=rDl2j1bOq4XKzcwO60J1RdsI72stV9z1o/0sInWqrhA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=LNn3eFKVs9eu6OGhcIVePwuVwFKJ1ZxRu8zOMqL96dCXGXKUKxSIhmKqypM+DkiH9yFIh9Enm
 l86wrOfM7NIsjCH0WhZz/eaeOLhPQiTQicF8qKh16xHWSasANBXIilco1Oy/wmNL6ZN5cCPm12F
 gJJwXYTsmaPsR6p361iSiiVckX6BjPyfPM0cW2wb07BpX8WEHKsbfY9SUtpk/zF9Tkx+Ttkbt9A
 OwtO6RmHWgJFV1RRCxv4ORH1EfNhKBtIvNV1StkrcPTuCwnRovRBY/MkwrDo5FO1wl8vpZZabRL
 BCe1adD7UhGKMAue7jPHgavWcay4U8rs49MptZiO8Cfg==
X-Zone-Loop: fc869ddd6d0c96c54dcb4148bad17f26ba80e19f89d5
x-campaign-type: default
x-transaction-id: 68b78bb6-795f-4864-a945-75e184c16ea7
x-swg-uid: 01-2e0ceb0e-db64-441d-9ad0-b6290752018c
X-Mailer: Sweego
Message-ID:
 <1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@vates.tech>
x-swg-bid: 1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH 0/4] Introduce a interface to query cpu status map
Date: Wed,  7 Oct 2026 17:40:43 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.6ff.b65add74318a0ded.1a11708bc14.a426533906f15c3a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791387810837
X-purgate-ID: tlsNG-42698a/1791387815-A96C29EA-F460B28B/0/0
X-purgate-type: clean
X-purgate-size: 2563

---=Part.6ff.b65add74318a0ded.1a11708bc14.a426533906f15c3a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello, this is originally meant to make xenpm get-core-temp more
robust, but happens to also be useful in other cases=2E

CPUs can offline for various reasons including hot-pluggable CPUs
(possible CPUs) or through explicit offlining with xen-hptool
(present but offline)=2E However, there is no way to probe which CPU
is in which state outside of Xen itself (cpu_online_map and other
maps)=2E

That leads to problems in some cases as xenpm get-core-temp may try
to query CPU temperature of offline CPUs (leading to ENODEV) or
observe a incorrect cores_per_socket (if offline CPUs are a part of
the first socket), leading to inconsistent package temperatures
reporting=2E

The first commit expose a new sysctl to query the cpu_online_map,
cpu_present_map and cpu_possible_map bitmaps=2E

The 2 following commits add a matching interface in xl and new
`xl info -m` to get the CPU status map (Online/Offline status
of each pCPU)=2E

And the latest commit reworks xenpm get-core-temp core/socket
selection logic to properly handle cases when CPUs are brought
offline and be more robust against some complicated CPU topologies=2E

This can be trivially tested using `xen-hptool cpu-{on,off}line N` to
bring a CPU offline along with `xl info -m` and `xenpm get-core-temp`
to observe it=2E

Teddy Astie (4):
  sysctl: Introduce XEN_SYSCTL_get_cpu_status_map
  libxl: Introduce CPU status map interface
  xl: Expose CPU status map with 'xl info -m'
  xenpm: Rework get-core-temp around CPU status map and topology

 tools/include/libxl=2Eh            | 11 ++++++
 tools/include/xenctrl=2Eh          |  4 ++
 tools/libs/ctrl/xc_misc=2Ec        | 45 +++++++++++++++++++++
 tools/libs/light/libxl=2Ec         | 39 +++++++++++++++++++
 tools/libs/light/libxl_types=2Eidl |  6 +++
 tools/misc/xenpm=2Ec               | 67 ++++++++++++++++++++++++++++----
 tools/xl/xl_cmdtable=2Ec           |  4 +-
 tools/xl/xl_info=2Ec               | 46 ++++++++++++++++++++--
 xen/common/sysctl=2Ec              | 34 ++++++++++++++++
 xen/include/public/sysctl=2Eh      | 13 +++++++
 xen/xsm/flask/hooks=2Ec            |  1 +
 11 files changed, 258 insertions(+), 12 deletions(-)

--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.6ff.b65add74318a0ded.1a11708bc14.a426533906f15c3a=---

