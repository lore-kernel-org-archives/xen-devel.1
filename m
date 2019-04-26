Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A0C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:55:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE443206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE443206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK47r-00022Z-HE; Fri, 26 Apr 2019 16:55:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uV9E=S4=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hK47r-00022N-09
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:55:03 +0000
X-Inumbo-ID: 07727e76-6844-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07727e76-6844-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 16:55:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hK47i-0003n2-OD; Fri, 26 Apr 2019 16:54:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hK47i-0004Ih-FO; Fri, 26 Apr 2019 16:54:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hK47i-0006oU-Eo; Fri, 26 Apr 2019 16:54:54 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135317-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:host-install(5):fail:regression
 freebsd-master:build-amd64-freebsd-again:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=4284b348ee30b1fa32b59632063e08537834f86b
X-Osstest-Versions-That: freebsd=b58321507702a1125aed58ddc320b560b1bffc71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Apr 2019 16:54:54 +0000
Subject: [Xen-devel] [freebsd-master test] 135317: regressions - FAIL
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
Message-ID: <20190426165454.Gt30lf1D8Ni8gHMNLKfWE_X0uGn94qaHivRzIoV9JE4@z>

ZmxpZ2h0IDEzNTMxNyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1MzE3LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKIGJ1
aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgIDUgaG9zdC1pbnN0YWxsKDUpICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEzNTIzMwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGZyZWVi
c2QgICAgICAgICAgICAgIDQyODRiMzQ4ZWUzMGIxZmEzMmI1OTYzMjA2M2UwODUzNzgzNGY4NmIK
YmFzZWxpbmUgdmVyc2lvbjoKIGZyZWVic2QgICAgICAgICAgICAgIGI1ODMyMTUwNzcwMmExMTI1
YWVkNThkZGMzMjBiNTYwYjFiZmZjNzEKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNTIzMyAgMjAx
OS0wNC0yNCAwOToxOTowMyBaICAgIDIgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzUzMTcg
IDIwMTktMDQtMjYgMDk6MTk6MDYgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3Bs
ZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBhZSA8YWVARnJlZUJTRC5vcmc+
CiAgYmNyYW4gPGJjcmFuQEZyZWVCU0Qub3JnPgogIGJkZSA8YmRlQEZyZWVCU0Qub3JnPgogIGJy
IDxickBGcmVlQlNELm9yZz4KICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBnYWxsYXRpbiA8Z2Fs
bGF0aW5ARnJlZUJTRC5vcmc+CiAgZ29uem8gPGdvbnpvQEZyZWVCU0Qub3JnPgogIGhzZWxhc2t5
IDxoc2VsYXNreUBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGlt
cEBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJp
dHNARnJlZUJTRC5vcmc+CiAgam9oYWx1biA8am9oYWx1bkBGcmVlQlNELm9yZz4KICBrZXZhbnMg
PGtldmFuc0BGcmVlQlNELm9yZz4KICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2
QEZyZWVCU0Qub3JnPgogIHJncmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0g
PHJtYWNrbGVtQEZyZWVCU0Qub3JnPgogIHNodXJkIDxzaHVyZEBGcmVlQlNELm9yZz4KICB0eWNo
b24gPHR5Y2hvbkBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWlu
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0
LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dz
L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRp
b24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2Rl
IGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0
ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdv
dWxkIGJlIDgwNyBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
