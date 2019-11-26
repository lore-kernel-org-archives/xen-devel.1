Return-Path: <SRS0=lwom=ZS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8C4C432C0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 12:25:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FEF2068E
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 12:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="gK679cuC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FEF2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuZ-0004Wv-TN; Tue, 26 Nov 2019 12:25:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuZ-0004Wg-2v
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:43 +0000
X-Inumbo-ID: d7a3849e-1047-11ea-b155-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7a3849e-1047-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771133; x=1606307133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ea7azaT3YO7wOzipAnz9vVarYKbJ0yLWP4KNNBu9TQs=;
 b=gK679cuCJ4aqPA+azHKgpiWocCoTJd8WIP5JfiOZVq/bS0D/14hzap3Z
 qhXbnssdvqGYXeagMg91shchXObk5IiFqOpWFsa0Cv1LpPP8O+CFNcVJ4
 EYF/bNgMoze9NoZLGGD1GYmVLE2poohJo504hppoSTg2ymcyu41oc49Bc Q=;
IronPort-SDR: GeVVOOXk34nt5EtqBYXVtLAJvtJxwzSaY4McGfclNvBEyl9D5QLXxaY0CTEcTSAv7EggYnzOow
 +dIxvDVknkTA==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="6386604"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Nov 2019 12:25:32 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0D4CFA0006; Tue, 26 Nov 2019 12:25:32 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:31 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:30 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:28 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:08 +0000
Message-ID: <20191126122511.7409-5-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 4/7] create-diff-object: Add support for
 applied/reverted marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCB2ZXJzaW9uIDIgb2YgYSBwYXlsb2FkIHN0cnVjdHVyZSBhZGRpdGlvbmFsIGZpZWxkIGlz
IHN1cHBvcnRlZAp0byB0cmFjayB3aGV0aGVyIGdpdmVuIGZ1bmN0aW9uIGhhcyBiZWVuIGFwcGxp
ZWQgb3IgcmV2ZXJ0ZWQuClRoZXJlIGFsc28gY29tZXMgYWRkaXRpb25hbCA4LWJ5dGUgYWxpZ25t
ZW50IHBhZGRpbmcgdG8gcmVzZXJ2ZQpwbGFjZSBmb3IgZnV0dXJlIGZsYWdzIGFuZCBvcHRpb25z
LgoKVGhlIG5ldyBmaWVsZHMgYXJlIHplcm8tb3V0IHVwb24gLmxpdmVwYXRjaC5mdW5jcyBzZWN0
aW9uIGNyZWF0aW9uLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3
ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+Ci0tLQogY29tbW9uLmggICAgICAgICAgICAgfCAyICsrCiBjcmVhdGUtZGlm
Zi1vYmplY3QuYyB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jb21tb24uaCBiL2NvbW1vbi5oCmluZGV4IDMwMGU1
MDguLjlmOWNiN2IgMTAwNjQ0Ci0tLSBhL2NvbW1vbi5oCisrKyBiL2NvbW1vbi5oCkBAIC0xMjQs
NiArMTI0LDggQEAgc3RydWN0IGxpdmVwYXRjaF9wYXRjaF9mdW5jIHsKIAl1aW50MzJfdCBvbGRf
c2l6ZTsKIAl1aW50OF90IHZlcnNpb247CiAJdW5zaWduZWQgY2hhciBwYWRbMzFdOworCXVpbnQ4
X3QgYXBwbGllZDsKKwl1aW50OF90IF9wYWRbN107CiB9OwogCiBzdHJ1Y3Qgc3BlY2lhbF9zZWN0
aW9uIHsKZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMKaW5kZXggZmVkNDdjZC4uZTg4NmQ0YyAxMDA2NDQKLS0tIGEvY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKQEAgLTIwMTMsOCArMjAxMywxMCBAQCBz
dGF0aWMgdm9pZCBsaXZlcGF0Y2hfY3JlYXRlX3BhdGNoZXNfc2VjdGlvbnMoc3RydWN0IGtwYXRj
aF9lbGYgKmtlbGYsCiAJCQlmdW5jc1tpbmRleF0ub2xkX3NpemUgPSByZXN1bHQuc2l6ZTsKIAkJ
CWZ1bmNzW2luZGV4XS5uZXdfYWRkciA9IDA7CiAJCQlmdW5jc1tpbmRleF0ubmV3X3NpemUgPSBz
eW0tPnN5bS5zdF9zaXplOwotCQkJZnVuY3NbaW5kZXhdLnZlcnNpb24gPSAxOworCQkJZnVuY3Nb
aW5kZXhdLnZlcnNpb24gPSAyOwogCQkJbWVtc2V0KGZ1bmNzW2luZGV4XS5wYWQsIDAsIHNpemVv
ZiBmdW5jc1tpbmRleF0ucGFkKTsKKwkJCWZ1bmNzW2luZGV4XS5hcHBsaWVkID0gMDsKKwkJCW1l
bXNldChmdW5jc1tpbmRleF0uX3BhZCwgMCwgc2l6ZW9mIGZ1bmNzW2luZGV4XS5fcGFkKTsKIAog
CQkJLyoKIAkJCSAqIEFkZCBhIHJlbG9jYXRpb24gdGhhdCB3aWxsIHBvcHVsYXRlCi0tIAoyLjE2
LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIu
IDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIs
IFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
dW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
