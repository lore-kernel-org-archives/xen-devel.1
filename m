Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AFBCCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:14:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451446.1666518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0o-0000az-Bq; Fri, 16 Oct 2026 09:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451446.1666518; Fri, 16 Oct 2026 09:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0o-0000as-8E; Fri, 16 Oct 2026 09:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1451446;
 Fri, 16 Oct 2026 09:14:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@swg.vates.tech>)
 id 1xHe0m-0000ad-Jj
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:14:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHe0l-007orE-Ss
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:13:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@swg.vates.tech>)
 id 6ad1ead2-8faa-0a2a0a5109dd-0a2a45078384-22
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:13:59 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@swg.vates.tech>)
 id 6ad1ead7-b4ea-0a2a45070019-b9ff1c2290e3-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:13:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a143fd4e9d0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 09:13:56 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2477481F66;
 Fri, 16 Oct 2026 11:13:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=sdNcgIdN4H4UbHm09K61vzUgHpaWd/G/2LuMED6huBk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OoZPZyl43zg/W+nrzjZXNtWEquJ817wHR52isU1d6QjpSQADU7lofQ+6/2xjNI1fgI8SWyTLP
 xFvqfqwBQokGMRUsfZ9Xv6xYP0UVx6zlVS15GXnms4MknSlPkRDhWuS3UIb40+PBcgFpYB37Tah
 kcXCx5l/thWlWei8lvT8DltCJWiyutAVMa5HN4N+LvH5sHoaP4jcYV06c/7TzTJQ2d27k+2Nd6L
 0W5nvxTn3uuajvxHAH6TW8+d03AOoyJ3Wsrvzal+QBN30nZu56avBqdZjmKRkC1Q2xfWeS8z+0u
 kq2yThq3pUOB/hMpxHx2Qis9QZ2uLX3JG9jNeafTB1kQ==
X-Zone-Loop: 547bb98680937fecdedb2f8742730cac0f7c4e2e647d
x-campaign-type: default
x-transaction-id: e53da2f4-b329-4410-bdf0-d0d4be742665
x-swg-uid: 01-92795d43-29ad-4cd0-a59b-e0171df22f1a
X-Mailer: Sweego
Message-ID:
 <1792142036.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@vates.tech>
x-swg-bid: 1792142036.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 1/3] tools/libxenstat: don't crash when /sys/class/net can't be opened
Date: Fri, 16 Oct 2026 09:12:57 +0000
In-Reply-To: <20261016091259.1254879-1-olivier.lambert@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2a3.4299984cb8e203e1.1a143fd4d00.d047e9d82b55c6a9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792142036224
X-purgate-ID: tlsNG-ef75cf/1792142039-A72DCAE4-B763E3EF/0/0
X-purgate-type: clean
X-purgate-size: 1870

---=Part.2a3.4299984cb8e203e1.1a143fd4d00.d047e9d82b55c6a9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

getBridge() doesn't check the return value of opendir(), so readdir()
and closedir() are passed a NULL pointer when /sys/class/net can't be
opened, e=2Eg=2E when sysfs isn't mounted=2E As getBridge() is called on e=
very
network collection, the libxenstat user (xentop for instance) crashes
instead of simply not finding a bridge=2E

Return early in that case=2E The caller's buffer is zero-initialised, so
no bridge is reported, which xenstat_collect_networks() handles since
commit 0c53660c1cf3 ("tools/libxenstat: don't lose all VIFs when dom0
has no Linux bridge")=2E

Fixes: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use netwo=
rk bonding")
Assisted-by: Claude-Code:claude-opus-5-5
Signed-off-by: Olivier Lambert <olivier=2Elambert@vates=2Etech>
---
 tools/libs/stat/xenstat_linux=2Ec | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libs/stat/xenstat_linux=2Ec b/tools/libs/stat/xenstat_l=
inux=2Ec
index 2a7d2f1a96=2E=2Eec627f3ef5 100644
--- a/tools/libs/stat/xenstat_linux=2Ec
+++ b/tools/libs/stat/xenstat_linux=2Ec
@@ -75,6 +75,9 @@ static void getBridge(const char *excludeName, char *res=
ult, size_t resultLen)
 	char tmp[512] =3D { 0 };
=20
 	d =3D opendir("/sys/class/net");
+	if (d =3D=3D NULL)
+		return;
+
 	while ((de =3D readdir(d)) !=3D NULL) {
 		if ((strlen(de->d_name) > 0) && (de->d_name[0] !=3D '=2E')
 			&& (strstr(de->d_name, excludeName) =3D=3D NULL)) {
--=20
2=2E53=2E0



-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.2a3.4299984cb8e203e1.1a143fd4d00.d047e9d82b55c6a9=---

