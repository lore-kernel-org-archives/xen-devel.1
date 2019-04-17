Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23842C282DD
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 13:34:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23AE2173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 13:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23AE2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGkhb-0006Hi-56; Wed, 17 Apr 2019 13:34:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r7UA=ST=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hGkhZ-0006HY-Bo
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 13:34:13 +0000
X-Inumbo-ID: 7c4d564c-6115-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c4d564c-6115-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 13:34:12 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hGkhS-0003IW-Vp; Wed, 17 Apr 2019 13:34:07 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hGkhS-00025D-Nr; Wed, 17 Apr 2019 13:34:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hGkhS-0002cq-NG; Wed, 17 Apr 2019 13:34:06 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134914-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:host-install(5):fail:regression
 freebsd-master:build-amd64-freebsd-again:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=b6581130649ae23318450157b0126a41058576af
X-Osstest-Versions-That: freebsd=66dd3f2bd67f9380116d2d0210fef816b154bf7a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Apr 2019 13:34:06 +0000
Subject: [Xen-devel] [freebsd-master test] 134914: regressions - FAIL
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
Message-ID: <20190417133406.fjpimJNILGfV8L3ijTotAS2RqkAdD9x71gGghk2GN-Q@z>

ZmxpZ2h0IDEzNDkxNCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0OTE0LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzQ4MTEKIGJ1
aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgIDUgaG9zdC1pbnN0YWxsKDUpICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEzNDgxMQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGZyZWVi
c2QgICAgICAgICAgICAgIGI2NTgxMTMwNjQ5YWUyMzMxODQ1MDE1N2IwMTI2YTQxMDU4NTc2YWYK
YmFzZWxpbmUgdmVyc2lvbjoKIGZyZWVic2QgICAgICAgICAgICAgIDY2ZGQzZjJiZDY3ZjkzODAx
MTZkMmQwMjEwZmVmODE2YjE1NGJmN2EKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNDgxMSAgMjAx
OS0wNC0xNSAwOToyMDoyNCBaICAgIDIgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzQ5MTQg
IDIwMTktMDQtMTcgMDk6MTk6MDQgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3Bs
ZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBiZGUgPGJkZUBGcmVlQlNELm9y
Zz4KICBiZHJld2VyeSA8YmRyZXdlcnlARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5v
cmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgog
IGZzdSA8ZnN1QEZyZWVCU0Qub3JnPgogIGdhbGxhdGluIDxnYWxsYXRpbkBGcmVlQlNELm9yZz4K
ICBnamIgPGdqYkBGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5vcmc+
CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAg
bWFudSA8bWFudUBGcmVlQlNELm9yZz4KICBtdyA8bXdARnJlZUJTRC5vcmc+CiAgb3Nob2dibyA8
b3Nob2dib0BGcmVlQlNELm9yZz4KICBwZXRlcmogPHBldGVyakBGcmVlQlNELm9yZz4KICBwa3Vi
YWogPHBrdWJhakBGcmVlQlNELm9yZz4KICB0aGogPHRoakBGcmVlQlNELm9yZz4KICB0cmFzeiA8
dHJhc3pARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NC1mcmVl
YnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmYWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVu
cHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFn
ZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9m
IHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUu
ZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0
ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4g
YmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5n
aXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBi
ZSA2NTggbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
