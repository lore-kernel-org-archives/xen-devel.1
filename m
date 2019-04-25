Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD12C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 22:42:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA002067C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 22:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA002067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJn4P-00044K-6x; Thu, 25 Apr 2019 22:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jpZV=S3=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hJn4N-000448-Lg
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 22:42:19 +0000
X-Inumbo-ID: 6007fe28-67ab-11e9-9eda-7f4064c8ff8f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6007fe28-67ab-11e9-9eda-7f4064c8ff8f;
 Thu, 25 Apr 2019 22:42:16 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hJn4J-0004Wz-JV; Thu, 25 Apr 2019 22:42:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hJn4J-0006w2-BM; Thu, 25 Apr 2019 22:42:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hJn4J-0004vJ-Ak; Thu, 25 Apr 2019 22:42:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135295-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This: ovmf=20029ca22baaeb9418c1fd9df88d12d32d585cb6
X-Osstest-Versions-That: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2019 22:42:15 +0000
Subject: [Xen-devel] [ovmf test] 135295: regressions - FAIL
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
Message-ID: <20190425224215.kp6Qvz-ZDraB2CkTN-Jr_f1yFiH-EVWYnw8836PA8B4@z>

ZmxpZ2h0IDEzNTI5NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzUyOTUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDYgbGli
dmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDk3NwoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIDIwMDI5Y2EyMmJhYWViOTQx
OGMxZmQ5ZGY4OGQxMmQzMmQ1ODVjYjYKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIGMyZjY0MzQ3OWViM2YwMGQ5MzBjNDYxY2RlYzNiYTQyMGEzNjA3MmMKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzNDk3NyAgMjAxOS0wNC0xOSAwNDowMjo1NCBaICAgIDYgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzUwODEgIDIwMTktMDQtMjIgMDE6NDI6NTQgWiAgICAzIGRheXMg
ICAxNiBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzUyOTUgIDIwMTktMDQtMjUgMTM6
NDE6MjUgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBYXJvbiBBbnRvbmUgPGFhbnRvbkBtaWNyb3NvZnQuY29t
PgogIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIENoYXNlbCBD
aGl1IDxjaGFzZWwuY2hpdUBpbnRlbC5jb20+CiAgQ2hyaXN0aWFuIFJvZHJpZ3VleiA8Y2hyaXN0
aWFuLnJvZHJpZ3VlekBpbnRlbC5jb20+CiAgRGFuZGFuIEJpIDxkYW5kYW4uYmlAaW50ZWwuY29t
PgogIEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVsLmNvbT4KICBIYW8gV3UgPGhhby5hLnd1
QGludGVsLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIE1hcmNpbiBX
b2p0YXMgPG13QHNlbWloYWxmLmNvbT4KICBSZWJlY2NhIENyYW4gPHJlYmVjY2FAYmx1ZXN0b3Au
b3JnPgogIHJlYmVjY2EgdmlhIEdyb3Vwcy5JbyA8cmViZWNjYT1ibHVlc3RvcC5vcmdAZ3JvdXBz
LmlvPgogIFJvZHJpZ3VleiwgQ2hyaXN0aWFuIDxjaHJpc3RpYW4ucm9kcmlndWV6QGludGVsLmNv
bT4KICBTaGVuZ2xlaSBaaGFuZyA8c2hlbmdsZWkuemhhbmdAaW50ZWwuY29tPgogIFRpbmcgWWUg
PHRpbmcueWVAaW50ZWwuY29tPgogIFh1ZSBTaGVuZ2ZlbmdYIDxzaGVuZ2Zlbmd4Lnh1ZUBpbnRl
bC5jb20+CiAgWHVlLCBTaGVuZ2ZlbmdYIDxzaGVuZ2Zlbmd4Lnh1ZUBpbnRlbC5jb20+CiAgWWUs
IFRpbmcgPHRpbmcueWVAaW50ZWwuY29tPgogIFl1bmh1YSBGZW5nIDx5dW5odWF4LmZlbmdAaW50
ZWwuY29tPgogIFpoaWNoYW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+CiAgWmhpanUuRmFu
IDx6aGlqdXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYt
eHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1s
aWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAg
CiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1v
dm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkz
ODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
CmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBj
b25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1s
YWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBv
cnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1h
c3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFy
eQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgNjA0IGxpbmVz
IGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
