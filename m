Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776CAC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 16:34:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ECD32087C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 16:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ECD32087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG4Yp-0008S8-2C; Mon, 15 Apr 2019 16:34:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7hXc=SR=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hG4Yn-0008Ry-KR
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 16:34:21 +0000
X-Inumbo-ID: 51a5494a-5f9c-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51a5494a-5f9c-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 16:34:20 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hG4Yg-0002rZ-5S; Mon, 15 Apr 2019 16:34:14 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hG4Yf-0006Hu-41; Mon, 15 Apr 2019 16:34:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hG4Yf-0004TN-3G; Mon, 15 Apr 2019 16:34:13 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134811-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=66dd3f2bd67f9380116d2d0210fef816b154bf7a
X-Osstest-Versions-That: freebsd=831bf1a1aa1df21ca34482e024c4b88d38026a03
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Apr 2019 16:34:13 +0000
Subject: [Xen-devel] [freebsd-master test] 134811: all pass - PUSHED
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
Message-ID: <20190415163413.gMCEvEmS-bLZ1eYMYvzK5_b53mE5JEkqv6DYvbFNUj4@z>

ZmxpZ2h0IDEzNDgxMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0ODExLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNjZkZDNmMmJkNjdmOTM4MDExNmQy
ZDAyMTBmZWY4MTZiMTU0YmY3YQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgODMxYmYxYTFhYTFkZjIxY2EzNDQ4MmUwMjRjNGI4OGQzODAyNmEwMwoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM0NjkwICAyMDE5LTA0LTEyIDA5OjE5OjEyIFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNDgxMSAgMjAxOS0wNC0xNSAwOToyMDoyNCBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYmFwdCA8YmFwdEBGcmVlQlNELm9yZz4K
ICBiZGUgPGJkZUBGcmVlQlNELm9yZz4KICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBjaHVjayA8
Y2h1Y2tARnJlZUJTRC5vcmc+CiAgZGVscGhpaiA8ZGVscGhpakBGcmVlQlNELm9yZz4KICBpbXAg
PGltcEBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAga2li
IDxraWJARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2
QEZyZWVCU0Qub3JnPgogIG1ja3VzaWNrIDxtY2t1c2lja0BGcmVlQlNELm9yZz4KICBuZ2llIDxu
Z2llQEZyZWVCU0Qub3JnPgogIG9zaG9nYm8gPG9zaG9nYm9ARnJlZUJTRC5vcmc+CiAgcm1hY2ts
ZW0gPHJtYWNrbGVtQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB0
dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KICB0eWNob24gPHR5Y2hvbkBGcmVlQlNELm9yZz4K
ICB2bWFmZmlvbmUgPHZtYWZmaW9uZUBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1m
cmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3Nz
dGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2Vz
OiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFi
bGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJh
bCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0
O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3Qg
aGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhl
bmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2ZyZWVic2QuZ2l0CiAgIDgzMWJmMWExYWExLi42
NmRkM2YyYmQ2NyAgNjZkZDNmMmJkNjdmOTM4MDExNmQyZDAyMTBmZWY4MTZiMTU0YmY3YSAtPiB0
ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
