Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4ADC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 23:37:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19FFD206B6
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 23:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19FFD206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFoge-0001o6-Lz; Sun, 14 Apr 2019 23:37:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sDI5=SQ=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hFogd-0001nu-Q3
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 23:37:23 +0000
X-Inumbo-ID: 402ead38-5f0e-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 402ead38-5f0e-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 23:37:22 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hFogb-0004Ih-Pc; Sun, 14 Apr 2019 23:37:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hFogb-0002qq-Hl; Sun, 14 Apr 2019 23:37:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hFogb-0002aT-H6; Sun, 14 Apr 2019 23:37:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134789-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=860d6e158dbb581c3aabc6a20ae8d83b325bffd8
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Apr 2019 23:37:21 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134789: regressions - FAIL
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
Message-ID: <20190414233721.ZCLJI1ZELtMO48Scne_sdLHRzMKF12m6kGyfWnSKfwk@z>

ZmxpZ2h0IDEzNDc4OSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDc4OS8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMzOTkx
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVz
dC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0taTM4NiAgMSBidWlsZC1jaGVjaygxKSAg
ICAgICAgIGJsb2NrZWQgbi9hCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0
ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAg
ICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2
ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1h
cm1oZi14bCAgICAgICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBu
ZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1
cHBvcnQtY2hlY2sgICAgZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRl
c3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICA4NjBkNmUxNThkYmI1ODFjM2FhYmM2YTIwYWU4
ZDgzYjMyNWJmZmQ4CmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICBjYjcw
YTI2Zjc4ODQ4ZmU0NWY1OTNmN2ViYzljZmFhYzc2MGE3OTFiCgpMYXN0IHRlc3Qgb2YgYmFzaXMg
ICAxMzM5OTEgIDIwMTktMDMtMjIgMTU6MDA6NDYgWiAgIDIzIGRheXMKRmFpbGluZyBzaW5jZSAg
ICAgICAgMTM0MDY4ICAyMDE5LTAzLTI1IDEyOjAwOjUxIFogICAyMCBkYXlzICAxMDAgYXR0ZW1w
dHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM0NzAyICAyMDE5LTA0LTEyIDE1OjAwOjQ0IFogICAg
MiBkYXlzICAgMTYgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVu
ZGVyIHRlc3Q6CiAgQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CiAg
QWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgogIEFtaXQg
U2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KICBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgogIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgogIEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgogIENocmlzdGlh
biBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KICBEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+CiAgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgogIElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgogIEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4KICBMdWthcyBKdWVuZ2VyIDxqdWVuZ2VyQGljZS5yd3RoLWFh
Y2hlbi5kZT4KICBNIEEgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+CiAgTm9yYmVydCBN
YW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CiAgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgogIFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+CiAgUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRl
PgogIFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CiAgUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgogIFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXNAdGtsZW5neWVsLmNvbT4KICBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgogIFhp
YW9jaGVuIFdhbmcgPHdhbmd4aWFvY2hlbjBAZ21haWwuY29tPgogIFhpbiBMaSA8eGluLmxpQGNp
dHJpeC5jb20+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFybWhm
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xZW11dS1kZWJpYW5odm0taTM4NiAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQg
CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
bGQgYmUgMjA2NSBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
