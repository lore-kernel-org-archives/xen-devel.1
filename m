Return-Path: <SRS0=8FaW=WU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606AEC3A5A2
	for <xen-devel@archiver.kernel.org>; Sat, 24 Aug 2019 00:52:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352F821726
	for <xen-devel@archiver.kernel.org>; Sat, 24 Aug 2019 00:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 352F821726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1KI9-0006OX-UU; Sat, 24 Aug 2019 00:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=97To=WU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i1KI8-0006OP-UW
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2019 00:52:28 +0000
X-Inumbo-ID: 719838b2-c609-11e9-adf0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 719838b2-c609-11e9-adf0-12813bfff9fa;
 Sat, 24 Aug 2019 00:52:27 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i1KI5-0003mY-Nh; Sat, 24 Aug 2019 00:52:25 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i1KI5-0000Z9-Dw; Sat, 24 Aug 2019 00:52:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i1KI5-0003sm-DC; Sat, 24 Aug 2019 00:52:25 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-140570-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=1347212622414842dae7ecda75cbfdd1e5c4cfee
X-Osstest-Versions-That: freebsd=86c98d165a4b667fe15d1c139a5cb363cec17282
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Aug 2019 00:52:25 +0000
Subject: [Xen-devel] [freebsd-master test] 140570: all pass - PUSHED
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZmxpZ2h0IDE0MDU3MCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwNTcwLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMTM0NzIxMjYyMjQxNDg0MmRhZTdl
Y2RhNzVjYmZkZDFlNWM0Y2ZlZQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgODZjOThkMTY1YTRiNjY3ZmUxNWQxYzEzOWE1Y2IzNjNjZWMxNzI4MgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTQwNDY4ICAyMDE5LTA4LTIxIDA5OjI0OjU1IFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0MDU3MCAgMjAxOS0wOC0yMyAwOToxOTo1NSBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYnJvb2tzIDxicm9va3NARnJlZUJTRC5v
cmc+CiAgYnogPGJ6QEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGN5IDxj
eUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8
ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGV1Z2VuIDxldWdlbkBGcmVlQlNELm9yZz4KICBpbXAgPGlt
cEBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBrYXJlbHMgPGthcmVsc0BG
cmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFuc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVl
QlNELm9yZz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVC
U0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIG1qZyA8bWpnQEZyZWVCU0Qub3JnPgog
IHJtYWNrbGVtIDxybWFja2xlbUBGcmVlQlNELm9yZz4KICBycnMgPHJyc0BGcmVlQlNELm9yZz4K
CmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVi
c2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNn
LXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAv
aG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZp
bGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5k
IG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNo
aW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2ZyZWVic2Qu
Z2l0CiAgIDg2Yzk4ZDE2NWE0Li4xMzQ3MjEyNjIyNCAgMTM0NzIxMjYyMjQxNDg0MmRhZTdlY2Rh
NzVjYmZkZDFlNWM0Y2ZlZSAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
