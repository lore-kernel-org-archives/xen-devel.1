Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9034DC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 13:38:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60660222B1
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 13:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60660222B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHTi9-0005iz-Gz; Fri, 19 Apr 2019 13:37:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qrum=SV=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hHTi8-0005iq-LH
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 13:37:48 +0000
X-Inumbo-ID: 50a9b682-62a8-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 50a9b682-62a8-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 13:37:46 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hHTi5-0007QZ-7U; Fri, 19 Apr 2019 13:37:45 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hHTi4-00073d-Mb; Fri, 19 Apr 2019 13:37:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hHTi4-0000Rx-Lx; Fri, 19 Apr 2019 13:37:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134986-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:debian-hvm-install:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=be3d5b30331d87e177744dbe23138b9ebcdc86f1
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Apr 2019 13:37:44 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134986: regressions - FAIL
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
Message-ID: <20190419133744.CB6djSuOJWy7KgLug13_sQfnpQmTJCfn736uYpVPLlw@z>

ZmxpZ2h0IDEzNDk4NiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDk4Ni8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hbWQ2NC1hbWQ2NC14bC1x
ZW11dS1kZWJpYW5odm0taTM4NiAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4g
MTMzOTkxCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5n
OgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sg
ICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDEz
IG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJt
NjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWls
ICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAxMyBtaWdyYXRlLXN1
cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLXhs
ICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAgZmFpbCAgIG5ldmVyIHBh
c3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICBi
ZTNkNWIzMDMzMWQ4N2UxNzc3NDRkYmUyMzEzOGI5ZWJjZGM4NmYxCmJhc2VsaW5lIHZlcnNpb246
CiB4ZW4gICAgICAgICAgICAgICAgICBjYjcwYTI2Zjc4ODQ4ZmU0NWY1OTNmN2ViYzljZmFhYzc2
MGE3OTFiCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzM5OTEgIDIwMTktMDMtMjIgMTU6MDA6NDYg
WiAgIDI3IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM0MDY4ICAyMDE5LTAzLTI1IDEyOjAw
OjUxIFogICAyNSBkYXlzICAxMzIgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM0ODM0
ICAyMDE5LTA0LTE1IDE5OjAwOjQ4IFogICAgMyBkYXlzICAgMjYgYXR0ZW1wdHMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9w
bGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQWxleGFuZHJ1IElzYWlsYSA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CiAgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPgogIEFtaXQgU2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWls
LmNvbT4KICBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgogIEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgogIEJyaWFuIFdvb2RzIDxicmlh
bi53b29kc0BhbWQuY29tPgogIENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0
cml4LmNvbT4KICBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CiAgR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgogIElnb3IgRHJ1emhpbmluIDxpZ29yLmRy
dXpoaW5pbkBjaXRyaXguY29tPgogIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KICBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KICBMdWthcyBK
dWVuZ2VyIDxqdWVuZ2VyQGljZS5yd3RoLWFhY2hlbi5kZT4KICBNIEEgWW91bmcgPG0uYS55b3Vu
Z0BkdXJoYW0uYWMudWs+CiAgTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CiAg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
PgogIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgUGF3ZWwgV2llY3pv
cmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgogIFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFi
dUBiaXRkZWZlbmRlci5jb20+CiAgUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tPgogIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KICBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgogIFhpYW9jaGVuIFdhbmcgPHdhbmd4aWFvY2hlbjBAZ21h
aWwuY29tPgogIFhpbiBMaSA8eGluLmxpQGNpdHJpeC5jb20+Cgpqb2JzOgogYnVpbGQtYXJtNjQt
eHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybWhmLWFy
bWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0taTM4NiAg
ICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0
LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xv
Z3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0
Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5v
cmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3Nz
dGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIv
P3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hi
PW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5n
LgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgMjA5OSBsaW5lcyBsb25nLikKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
