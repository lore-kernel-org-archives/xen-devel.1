Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250EBC10F14
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 01:05:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC57A214DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 01:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC57A214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHHxx-0003VX-GE; Fri, 19 Apr 2019 01:05:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qrum=SV=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hHHxw-0003VL-UC
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 01:05:20 +0000
X-Inumbo-ID: 3336ad20-623f-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3336ad20-623f-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 01:05:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hHHxu-0008MD-Ol; Fri, 19 Apr 2019 01:05:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hHHxu-0006g9-F8; Fri, 19 Apr 2019 01:05:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hHHxu-0002iq-EA; Fri, 19 Apr 2019 01:05:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134970-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
X-Osstest-Versions-That: ovmf=0eccea3fbe2f6d4999d972d9310d4f2717f5100c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Apr 2019 01:05:18 +0000
Subject: [Xen-devel] [ovmf test] 134970: regressions - FAIL
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
Message-ID: <20190419010518.-pFdJZX7ftP4blinWWGZvdb483Otk2EGmujckbSbH1A@z>

ZmxpZ2h0IDEzNDk3MCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzQ5NzAvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDYgbGli
dmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDg4OQoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIGMyZjY0MzQ3OWViM2YwMGQ5
MzBjNDYxY2RlYzNiYTQyMGEzNjA3MmMKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIDBlY2NlYTNmYmUyZjZkNDk5OWQ5NzJkOTMxMGQ0ZjI3MTdmNTEwMGMKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzNDg4OSAgMjAxOS0wNC0xNiAyMzoxMToyNCBaICAgIDIgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzQ5MzUgIDIwMTktMDQtMTggMDE6MTE6MjMgWiAgICAwIGRheXMg
ICAgNSBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzQ5NjUgIDIwMTktMDQtMTggMTg6
NDE6MzUgWiAgICAwIGRheXMgICAgMiBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGlu
YXJvLm9yZz4KICBCcmV0IEJhcmtlbGV3IDxCcmV0LkJhcmtlbGV3QG1pY3Jvc29mdC5jb20+CiAg
RmFuLCBaaGlqdVggPHpoaWp1eC5mYW5AaW50ZWwuY29tPgogIEdhcnkgTGluIDxnbGluQHN1c2Uu
Y29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CiAgWmFpbGlhbmcgU3VuIDx6
YWlsaWFuZy5zdW5AaW50ZWwuY29tPgogIFpoaWNoYW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5j
b20+CiAgWmhpanUuRmFuIDx6aGlqdXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2
NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0
LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3Mv
aW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlv
biBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUg
Y2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rl
c3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291
bGQgYmUgNTA0IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
