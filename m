Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585E5C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:38:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A67C206C1
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A67C206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeaB-0007q5-VV; Thu, 25 Apr 2019 13:38:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jpZV=S3=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hJeaB-0007pn-Bn
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:38:35 +0000
X-Inumbo-ID: 6bad50b5-675f-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6bad50b5-675f-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 13:38:33 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hJea9-0001aj-8M; Thu, 25 Apr 2019 13:38:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hJea8-0005PW-Uz; Thu, 25 Apr 2019 13:38:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hJea8-00074h-UM; Thu, 25 Apr 2019 13:38:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135288-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-libvirt:libvirt-build:fail:regression
 ovmf:build-i386-pvops:kernel-build:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=b9d4847ec25816483d78ec94ac22836e1e8aa749
X-Osstest-Versions-That: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2019 13:38:32 +0000
Subject: [Xen-devel] [ovmf test] 135288: regressions - FAIL
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
Message-ID: <20190425133832._YXQIjLafacE84f0EDDwXJEvyUHIgDVjRg0m3uenU7A@z>

ZmxpZ2h0IDEzNTI4OCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzUyODgvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDYgbGli
dmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDk3NwogYnVpbGQtaTM4Ni1w
dm9wcyAgICAgICAgICAgICAgNiBrZXJuZWwtYnVpbGQgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTM0OTc3CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2Nr
aW5nOgogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgIGJsb2NrZWQgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
Ogogb3ZtZiAgICAgICAgICAgICAgICAgYjlkNDg0N2VjMjU4MTY0ODNkNzhlYzk0YWMyMjgzNmUx
ZThhYTc0OQpiYXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgYzJmNjQzNDc5
ZWIzZjAwZDkzMGM0NjFjZGVjM2JhNDIwYTM2MDcyYwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM0
OTc3ICAyMDE5LTA0LTE5IDA0OjAyOjU0IFogICAgNiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDEzNTA4MSAgMjAxOS0wNC0yMiAwMTo0Mjo1NCBaICAgIDMgZGF5cyAgIDE1IGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDEzNTI2NSAgMjAxOS0wNC0yNCAxNzoxMTo0MSBaICAgIDAgZGF5
cyAgICA1IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIEFhcm9uIEFudG9uZSA8YWFudG9uQG1pY3Jvc29mdC5jb20+CiAgQXJkIEJpZXNoZXV2
ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgQ2hhc2VsIENoaXUgPGNoYXNlbC5jaGl1
QGludGVsLmNvbT4KICBDaHJpc3RpYW4gUm9kcmlndWV6IDxjaHJpc3RpYW4ucm9kcmlndWV6QGlu
dGVsLmNvbT4KICBEYW5kYW4gQmkgPGRhbmRhbi5iaUBpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVgg
PHpoaWp1eC5mYW5AaW50ZWwuY29tPgogIEhhbyBXdSA8aGFvLmEud3VAaW50ZWwuY29tPgogIExh
c3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CiAgUmViZWNjYSBDcmFuIDxyZWJlY2NhQGJs
dWVzdG9wLm9yZz4KICByZWJlY2NhIHZpYSBHcm91cHMuSW8gPHJlYmVjY2E9Ymx1ZXN0b3Aub3Jn
QGdyb3Vwcy5pbz4KICBSb2RyaWd1ZXosIENocmlzdGlhbiA8Y2hyaXN0aWFuLnJvZHJpZ3VlekBp
bnRlbC5jb20+CiAgU2hlbmdsZWkgWmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBU
aW5nIFllIDx0aW5nLnllQGludGVsLmNvbT4KICBYdWUgU2hlbmdmZW5nWCA8c2hlbmdmZW5neC54
dWVAaW50ZWwuY29tPgogIFh1ZSwgU2hlbmdmZW5nWCA8c2hlbmdmZW5neC54dWVAaW50ZWwuY29t
PgogIFllLCBUaW5nIDx0aW5nLnllQGludGVsLmNvbT4KICBZdW5odWEgRmVuZyA8eXVuaHVheC5m
ZW5nQGludGVsLmNvbT4KICBaaGljaGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwuY29tPgogIFpo
aWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwt
cWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1h
bWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoK
TG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhl
c2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFp
bDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3Qu
Z2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBm
b3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDth
PXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDU4
NSBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
