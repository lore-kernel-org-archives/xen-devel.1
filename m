Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41602C282CE
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 20:14:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 153DA2146F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 20:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 153DA2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCVDi-0003Ta-EJ; Fri, 05 Apr 2019 20:13:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2AYO=SH=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hCVDh-0003TO-7u
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 20:13:49 +0000
X-Inumbo-ID: 4f4af152-57df-11e9-80b3-1f3a6d518212
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f4af152-57df-11e9-80b3-1f3a6d518212;
 Fri, 05 Apr 2019 20:13:43 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hCVDa-0007NH-KE; Fri, 05 Apr 2019 20:13:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hCVDa-0005tv-CJ; Fri, 05 Apr 2019 20:13:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hCVDa-0006nB-Bf; Fri, 05 Apr 2019 20:13:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134455-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=1c6504163595d45e47a01750318c2b7b50541cbe
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Apr 2019 20:13:42 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134455: regressions -
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
Message-ID: <20190405201342.ivIlGPllPCQEoR21w5uknebNfMJdeqZMgfix7jMf7Wg@z>

ZmxpZ2h0IDEzNDQ1NSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDQ1NS8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgIDEyIGd1ZXN0LXN0YXJ0
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzk5
MQoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAg
ICBibG9ja2VkICBuL2EKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAgICAg
ICAgICAgICAgICAxYzY1MDQxNjM1OTVkNDVlNDdhMDE3NTAzMThjMmI3YjUwNTQxY2JlCmJhc2Vs
aW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICBjYjcwYTI2Zjc4ODQ4ZmU0NWY1OTNm
N2ViYzljZmFhYzc2MGE3OTFiCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzM5OTEgIDIwMTktMDMt
MjIgMTU6MDA6NDYgWiAgIDE0IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM0MDY4ICAyMDE5
LTAzLTI1IDEyOjAwOjUxIFogICAxMSBkYXlzICAgNTAgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNp
bmNlICAgMTM0NDU1ICAyMDE5LTA0LTA1IDE4OjAwOjQ1IFogICAgMCBkYXlzICAgIDEgYXR0ZW1w
dHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNv
bT4KICBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CiAgRG91
ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgogIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CiAgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CiAgTSBBIFlvdW5n
IDxtLmEueW91bmdAZHVyaGFtLmFjLnVrPgogIE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1h
em9uLmRlPgogIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgUGF3ZWwg
V2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgogIFBldHJlIFBpcmNhbGFidSA8cHBp
cmNhbGFidUBiaXRkZWZlbmRlci5jb20+CiAgUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgogIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KICBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgogIFhpYW9jaGVuIFdhbmcgPHdhbmd4aWFvY2hl
bjBAZ21haWwuY29tPgogIFhpbiBMaSA8eGluLmxpQGNpdHJpeC5jb20+Cgpqb2JzOgogYnVpbGQt
YXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJy
b2tlbiAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFy
bWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFp
bCAgICAKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0t
aTM4NiAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZp
cnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ct
cmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9o
b21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmls
ZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQg
b2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKYnJva2Vu
LWpvYiBidWlsZC1hcm02NC14c20gYnJva2VuCmJyb2tlbi1zdGVwIGJ1aWxkLWFybTY0LXhzbSBo
b3N0LWluc3RhbGwoNCkKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQg
YmUgMTQ4NyBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
