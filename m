Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BC8C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 19:40:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295C72175B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 19:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295C72175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJNki-0005HB-DF; Wed, 24 Apr 2019 19:40:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mgLR=S2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hJNkh-0005H2-4c
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 19:40:19 +0000
X-Inumbo-ID: c6993dca-66c8-11e9-a3b8-2393ade883f8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6993dca-66c8-11e9-a3b8-2393ade883f8;
 Wed, 24 Apr 2019 19:40:12 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hJNkZ-00036L-Qf; Wed, 24 Apr 2019 19:40:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hJNkZ-0006mo-JG; Wed, 24 Apr 2019 19:40:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hJNkZ-0008Cr-Ie; Wed, 24 Apr 2019 19:40:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135265-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This: ovmf=b9d4847ec25816483d78ec94ac22836e1e8aa749
X-Osstest-Versions-That: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Apr 2019 19:40:11 +0000
Subject: [Xen-devel] [ovmf test] 135265: regressions - FAIL
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
Message-ID: <20190424194011.QSoL23keurPq97QhmUquIbJWyccgmKhi0SuZkvWdhiM@z>

ZmxpZ2h0IDEzNTI2NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzUyNjUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDYgbGli
dmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDk3NwoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIGI5ZDQ4NDdlYzI1ODE2NDgz
ZDc4ZWM5NGFjMjI4MzZlMWU4YWE3NDkKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIGMyZjY0MzQ3OWViM2YwMGQ5MzBjNDYxY2RlYzNiYTQyMGEzNjA3MmMKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzNDk3NyAgMjAxOS0wNC0xOSAwNDowMjo1NCBaICAgIDUgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzUwODEgIDIwMTktMDQtMjIgMDE6NDI6NTQgWiAgICAyIGRheXMg
ICAxMSBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzUyNjUgIDIwMTktMDQtMjQgMTc6
MTE6NDEgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBYXJvbiBBbnRvbmUgPGFhbnRvbkBtaWNyb3NvZnQuY29t
PgogIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIENoYXNlbCBD
aGl1IDxjaGFzZWwuY2hpdUBpbnRlbC5jb20+CiAgQ2hyaXN0aWFuIFJvZHJpZ3VleiA8Y2hyaXN0
aWFuLnJvZHJpZ3VlekBpbnRlbC5jb20+CiAgRGFuZGFuIEJpIDxkYW5kYW4uYmlAaW50ZWwuY29t
PgogIEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVsLmNvbT4KICBIYW8gV3UgPGhhby5hLnd1
QGludGVsLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIFJlYmVjY2Eg
Q3JhbiA8cmViZWNjYUBibHVlc3RvcC5vcmc+CiAgcmViZWNjYSB2aWEgR3JvdXBzLklvIDxyZWJl
Y2NhPWJsdWVzdG9wLm9yZ0Bncm91cHMuaW8+CiAgUm9kcmlndWV6LCBDaHJpc3RpYW4gPGNocmlz
dGlhbi5yb2RyaWd1ZXpAaW50ZWwuY29tPgogIFNoZW5nbGVpIFpoYW5nIDxzaGVuZ2xlaS56aGFu
Z0BpbnRlbC5jb20+CiAgVGluZyBZZSA8dGluZy55ZUBpbnRlbC5jb20+CiAgWHVlIFNoZW5nZmVu
Z1ggPHNoZW5nZmVuZ3gueHVlQGludGVsLmNvbT4KICBYdWUsIFNoZW5nZmVuZ1ggPHNoZW5nZmVu
Z3gueHVlQGludGVsLmNvbT4KICBZZSwgVGluZyA8dGluZy55ZUBpbnRlbC5jb20+CiAgWXVuaHVh
IEZlbmcgPHl1bmh1YXguZmVuZ0BpbnRlbC5jb20+CiAgWmhpY2hhbyBHYW8gPHpoaWNoYW8uZ2Fv
QGludGVsLmNvbT4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1
aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3Qu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hv
bWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0
CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4
cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlz
IGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5l
c3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
P3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9n
OyBpdCB3b3VsZCBiZSA1ODUgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
