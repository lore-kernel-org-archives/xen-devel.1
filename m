Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A505C04AB1
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 07:33:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C0B208C3
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C0B208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ5Sa-00058o-1O; Mon, 13 May 2019 07:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=armk=TN=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hQ5SY-00058e-W9
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 07:33:19 +0000
X-Inumbo-ID: 5dc6de3c-7551-11e9-a986-473213c8219e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dc6de3c-7551-11e9-a986-473213c8219e;
 Mon, 13 May 2019 07:33:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hQ5ST-0006xn-2Y; Mon, 13 May 2019 07:33:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hQ5SS-0001u9-Q7; Mon, 13 May 2019 07:33:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hQ5SS-0003xY-Os; Mon, 13 May 2019 07:33:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-136048-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: xtf=b94ab2923c2f1671b628c0210fa8ddc7abe8c617
X-Osstest-Versions-That: xtf=1c9db326a7108203d5cfd706aa2c0a8818e9cccf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 May 2019 07:33:12 +0000
Subject: [Xen-devel] [xtf test] 136048: all pass - PUSHED
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513073312.IOdBrdVKz8yxQDEBMl1eArabn-3NYPqDMzNSnOo3plg@z>

ZmxpZ2h0IDEzNjA0OCB4dGYgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjA0OC8KClBlcmZlY3QgOi0pCkFsbCB0ZXN0cyBpbiB0
aGlzIGZsaWdodCBwYXNzZWQgYXMgcmVxdWlyZWQKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGlu
ZzoKIHh0ZiAgICAgICAgICAgICAgICAgIGI5NGFiMjkyM2MyZjE2NzFiNjI4YzAyMTBmYThkZGM3
YWJlOGM2MTcKYmFzZWxpbmUgdmVyc2lvbjoKIHh0ZiAgICAgICAgICAgICAgICAgIDFjOWRiMzI2
YTcxMDgyMDNkNWNmZDcwNmFhMmMwYTg4MThlOWNjY2YKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEz
NTQ0MiAgMjAxOS0wNC0zMCAxODoxMTo0MyBaICAgMTIgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2Ug
ICAxMzYwNDggIDIwMTktMDUtMTEgMTk6MDk6NDcgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXh0ZiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QteHRmLWFtZDY0LWFtZDY0LTEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC14dGYtYW1kNjQtYW1k
NjQtMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LXh0Zi1hbWQ2NC1hbWQ2NC0zICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QteHRmLWFtZDY0LWFtZDY0LTQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC14dGYtYW1kNjQtYW1kNjQtNSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xv
Z3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFy
ZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3Qg
aW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9z
c3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0
ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9u
IDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L3h0Zi5naXQKICAgMWM5ZGIzMi4u
Yjk0YWIyOSAgYjk0YWIyOTIzYzJmMTY3MWI2MjhjMDIxMGZhOGRkYzdhYmU4YzYxNyAtPiB4ZW4t
dGVzdGVkLW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
