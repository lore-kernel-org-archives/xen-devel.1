Return-Path: <SRS0=yXRq=WP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C70EC3A5A0
	for <xen-devel@archiver.kernel.org>; Mon, 19 Aug 2019 19:44:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44E13214DA
	for <xen-devel@archiver.kernel.org>; Mon, 19 Aug 2019 19:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44E13214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hznZr-0002oO-SW; Mon, 19 Aug 2019 19:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hiS5=WP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hznZq-0002oE-Mg
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 19:44:26 +0000
X-Inumbo-ID: c00ed198-c2b9-11e9-813a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c00ed198-c2b9-11e9-813a-bc764e2007e4;
 Mon, 19 Aug 2019 19:44:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hznZm-0001la-DI; Mon, 19 Aug 2019 19:44:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hznZl-0000EK-Qk; Mon, 19 Aug 2019 19:44:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hznZl-0000ql-Q3; Mon, 19 Aug 2019 19:44:21 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-140355-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=41a4c010326cd697d92141076bab53c424edb56f
X-Osstest-Versions-That: freebsd=f39a1bd1426e0e5a462522b7a1de56e8233591e7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Aug 2019 19:44:21 +0000
Subject: [Xen-devel] [freebsd-master test] 140355: all pass - PUSHED
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

ZmxpZ2h0IDE0MDM1NSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwMzU1LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNDFhNGMwMTAzMjZjZDY5N2Q5MjE0
MTA3NmJhYjUzYzQyNGVkYjU2ZgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgZjM5YTFiZDE0MjZlMGU1YTQ2MjUyMmI3YTFkZTU2ZTgyMzM1OTFlNwoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTQwMTk1ICAyMDE5LTA4LTE2IDA5OjIxOjM4IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0MDM1NSAgMjAxOS0wOC0xOSAwOToyMDoxNiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAg
YXZnIDxhdmdARnJlZUJTRC5vcmc+CiAgYmRyZXdlcnkgPGJkcmV3ZXJ5QEZyZWVCU0Qub3JnPgog
IGJyb29rcyA8YnJvb2tzQEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGRl
bHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+
CiAgRXJpYyBKb3luZXIgPGVyakBmcmVlYnNkLm9yZz4KICBlcmogPGVyakBGcmVlQlNELm9yZz4K
ICBldWdlbiA8ZXVnZW5ARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxhc2t5QEZyZWVCU0Qu
b3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIEphY29iIEtlbGxlciA8amFjb2IuZS5rZWxs
ZXJAaW50ZWwuY29tPgogIGplZmYgPGplZmZARnJlZUJTRC5vcmc+CiAga2V2YW5zIDxrZXZhbnNA
RnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNE
Lm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtamcgPG1qZ0BGcmVlQlNELm9yZz4KICBt
bWVsIDxtbWVsQEZyZWVCU0Qub3JnPgogIHJheSA8cmF5QEZyZWVCU0Qub3JnPgogIHJtYWNrbGVt
IDxybWFja2xlbUBGcmVlQlNELm9yZz4KICB0aGogPHRoakBGcmVlQlNELm9yZz4KICB2YW5neXpl
biA8dmFuZ3l6ZW5ARnJlZUJTRC5vcmc+CiAgd3VsZiA8d3VsZkBGcmVlQlNELm9yZz4KCmpvYnM6
CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9y
dC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9s
b2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBl
dGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9z
c3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTto
Yj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJl
dmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2ZyZWVic2QuZ2l0CiAg
IGYzOWExYmQxNDI2Li40MWE0YzAxMDMyNiAgNDFhNGMwMTAzMjZjZDY5N2Q5MjE0MTA3NmJhYjUz
YzQyNGVkYjU2ZiAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
