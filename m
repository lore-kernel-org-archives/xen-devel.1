Return-Path: <SRS0=rMjY=T2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA76C282E1
	for <xen-devel@archiver.kernel.org>; Sun, 26 May 2019 03:52:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588D520815
	for <xen-devel@archiver.kernel.org>; Sun, 26 May 2019 03:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588D520815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUkCx-0007Q0-81; Sun, 26 May 2019 03:52:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0A05=T2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hUkCw-0007Pp-1I
 for xen-devel@lists.xenproject.org; Sun, 26 May 2019 03:52:26 +0000
X-Inumbo-ID: abf6aba0-7f69-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id abf6aba0-7f69-11e9-8980-bc764e045a96;
 Sun, 26 May 2019 03:52:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hUkCs-0002yg-1E; Sun, 26 May 2019 03:52:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hUkCr-0008QT-Q9; Sun, 26 May 2019 03:52:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hUkCr-0003zF-OV; Sun, 26 May 2019 03:52:21 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-136901-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=aab5f5a3bd55421fa6a8dbc05332a9b9fb49992c
X-Osstest-Versions-That: freebsd=cb9788efd6dd2c8377e001d8a85c722ba926f6cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 May 2019 03:52:21 +0000
Subject: [Xen-devel] [freebsd-master test] 136901: all pass - PUSHED
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
Message-ID: <20190526035221.px1-wMLhNZ0HgiEe3ELlfrq7JOGmfGxBPKCJMfxqXzo@z>

ZmxpZ2h0IDEzNjkwMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2OTAxLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgYWFiNWY1YTNiZDU1NDIxZmE2YThk
YmMwNTMzMmE5YjlmYjQ5OTkyYwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgY2I5Nzg4ZWZkNmRkMmM4Mzc3ZTAwMWQ4YTg1YzcyMmJhOTI2ZjZjZgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM2NjA2ICAyMDE5LTA1LTIwIDA5OjI1OjIyIFogICAgNSBkYXlzCkZhaWxpbmcg
c2luY2UgICAgICAgIDEzNjgyNyAgMjAxOS0wNS0yMiAxOTo1MjozMCBaICAgIDMgZGF5cyAgICAy
IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNjkwMSAgMjAxOS0wNS0yNCAxMzozMjow
NSBaICAgIDEgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlz
aW9ucyB1bmRlciB0ZXN0OgogIGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3JnPgogIGFlIDxhZUBG
cmVlQlNELm9yZz4KICBhbGxhbmp1ZGUgPGFsbGFuanVkZUBGcmVlQlNELm9yZz4KICBhc29tZXJz
IDxhc29tZXJzQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJhcHQgPGJh
cHRARnJlZUJTRC5vcmc+CiAgYnogPGJ6QEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qu
b3JnPgogIGNwZXJjaXZhIDxjcGVyY2l2YUBGcmVlQlNELm9yZz4KICBkY2hhZ2luIDxkY2hhZ2lu
QEZyZWVCU0Qub3JnPgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+CiAgZG91Z20gPGRv
dWdtQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGdhbGxhdGlu
IDxnYWxsYXRpbkBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGlt
cEBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJp
dHNARnJlZUJTRC5vcmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFu
c0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9ybEBG
cmVlQlNELm9yZz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVl
QlNELm9yZz4KICBtYXJraiA8bWFya2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5v
cmc+CiAgbWNrdXNpY2sgPG1ja3VzaWNrQEZyZWVCU0Qub3JnPgogIG1lbGlmYXJvIDxtZWxpZmFy
b0BGcmVlQlNELm9yZz4KICBtbSA8bW1ARnJlZUJTRC5vcmc+CiAgbmdpZSA8bmdpZUBGcmVlQlNE
Lm9yZz4KICBzb2JvbWF4IDxzb2JvbWF4QEZyZWVCU0Qub3JnPgogIHN0ZXZlayA8c3RldmVrQEZy
ZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB6ZWlzaW5nIDx6ZWlzaW5n
QEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpM
b2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVz
ZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWls
O2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZv
dW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9
c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hl
bi9naXQvZnJlZWJzZC5naXQKICAgY2I5Nzg4ZWZkNmQuLmFhYjVmNWEzYmQ1ICBhYWI1ZjVhM2Jk
NTU0MjFmYTZhOGRiYzA1MzMyYTliOWZiNDk5OTJjIC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
