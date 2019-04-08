Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E168C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 19:51:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3829F20880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 19:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3829F20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDaHq-0006cE-7S; Mon, 08 Apr 2019 19:50:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YvdM=SK=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hDaHp-0006c4-1r
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 19:50:33 +0000
X-Inumbo-ID: 90e3a0ce-5a37-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 90e3a0ce-5a37-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 19:50:31 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hDaHm-0007gh-R8; Mon, 08 Apr 2019 19:50:30 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hDaHm-0003B9-Fm; Mon, 08 Apr 2019 19:50:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hDaHm-0000ta-Ev; Mon, 08 Apr 2019 19:50:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134522-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=19127340a504c030901fc16d8475fc7d8cfdf8a5
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Apr 2019 19:50:30 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134522: regressions -
 trouble: blocked/broken/fail/pass
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
Message-ID: <20190408195030.1HiLBUTEmkOFgMpK3q29J9af7qZy8W44FD3s9VzkQYU@z>

ZmxpZ2h0IDEzNDUyMiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDUyMi8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAg
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKClRlc3RzIHdoaWNoIGRpZCBub3Qg
c3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAg
ICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFy
bWhmLWFybWhmLXhsICAgICAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUtc3VwcG9y
dC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRl
c3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICAxOTEyNzM0MGE1MDRjMDMwOTAxZmMxNmQ4NDc1
ZmM3ZDhjZmRmOGE1CmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICBjYjcw
YTI2Zjc4ODQ4ZmU0NWY1OTNmN2ViYzljZmFhYzc2MGE3OTFiCgpMYXN0IHRlc3Qgb2YgYmFzaXMg
ICAxMzM5OTEgIDIwMTktMDMtMjIgMTU6MDA6NDYgWiAgIDE3IGRheXMKRmFpbGluZyBzaW5jZSAg
ICAgICAgMTM0MDY4ICAyMDE5LTAzLTI1IDEyOjAwOjUxIFogICAxNCBkYXlzICAgNjMgYXR0ZW1w
dHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM0NTIyICAyMDE5LTA0LTA4IDEyOjAzOjE4IFogICAg
MCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVu
ZGVyIHRlc3Q6CiAgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT4KICBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGln
QGNpdHJpeC5jb20+CiAgRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgogIEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KICBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CiAgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgogIEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+CiAgTHVrYXMgSnVlbmdlciA8anVlbmdlckBpY2Uucnd0aC1hYWNoZW4uZGU+CiAgTSBB
IFlvdW5nIDxtLmEueW91bmdAZHVyaGFtLmFjLnVrPgogIE5vcmJlcnQgTWFudGhleSA8bm1hbnRo
ZXlAYW1hem9uLmRlPgogIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAg
UGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgogIFBldHJlIFBpcmNhbGFi
dSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CiAgUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPgogIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4KICBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgogIFhpYW9jaGVuIFdhbmcgPHdhbmd4
aWFvY2hlbjBAZ21haWwuY29tPgogIFhpbiBMaSA8eGluLmxpQGNpdHJpeC5jb20+Cgpqb2JzOgog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtYW1kNjQtbGli
dmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0
ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmxvY2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJp
YW5odm0taTM4NiAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0
LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxv
Z3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25m
aWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRz
LCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3Rl
cgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoK
YnJva2VuLWpvYiBidWlsZC1hcm02NC14c20gYnJva2VuCmJyb2tlbi1zdGVwIGJ1aWxkLWFybTY0
LXhzbSBob3N0LWluc3RhbGwoNCkKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQg
d291bGQgYmUgMTYxNCBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
