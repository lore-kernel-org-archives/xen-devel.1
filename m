Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BA4C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:48:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E3D20883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28E3D20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpEF-00049o-Dx; Tue, 09 Apr 2019 11:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PIXm=SL=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hDpEE-00049Z-N5
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:47:50 +0000
X-Inumbo-ID: 4b16c792-5abd-11e9-9ea0-a394f5d2367e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b16c792-5abd-11e9-9ea0-a394f5d2367e;
 Tue, 09 Apr 2019 11:47:46 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hDpEA-0006Qi-3p; Tue, 09 Apr 2019 11:47:46 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hDpE9-0004WM-Eg; Tue, 09 Apr 2019 11:47:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hDpE9-0006mD-E5; Tue, 09 Apr 2019 11:47:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134566-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=072a96c4901b4cb084375d0a4ae881876c220b16
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2019 11:47:45 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134566: regressions -
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
Message-ID: <20190409114745.SqnIcihAkXqXRVe2FooeQqcV_WVBfpG--UoI_Oy8z_k@z>

ZmxpZ2h0IDEzNDU2NiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDU2Ni8KClJlZ3Jlc3Npb25z
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
c3Rpbmc6CiB4ZW4gICAgICAgICAgICAgICAgICAwNzJhOTZjNDkwMWI0Y2IwODQzNzVkMGE0YWU4
ODE4NzZjMjIwYjE2CmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICBjYjcw
YTI2Zjc4ODQ4ZmU0NWY1OTNmN2ViYzljZmFhYzc2MGE3OTFiCgpMYXN0IHRlc3Qgb2YgYmFzaXMg
ICAxMzM5OTEgIDIwMTktMDMtMjIgMTU6MDA6NDYgWiAgIDE3IGRheXMKRmFpbGluZyBzaW5jZSAg
ICAgICAgMTM0MDY4ICAyMDE5LTAzLTI1IDEyOjAwOjUxIFogICAxNCBkYXlzICAgNjYgYXR0ZW1w
dHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM0NTUwICAyMDE5LTA0LTA4IDIwOjAwOjM3IFogICAg
MCBkYXlzICAgIDMgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
ZXlAYW1hem9uLmRlPgogIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KICBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PgogIFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KICBQZXRyZSBQaXJj
YWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgogIFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KICBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+CiAgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KICBYaWFvY2hlbiBXYW5nIDx3
YW5neGlhb2NoZW4wQGdtYWlsLmNvbT4KICBYaW4gTGkgPHhpbi5saUBjaXRyaXguY29tPgoKam9i
czoKIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicm9rZW4gIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0
LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUt
ZGViaWFuaHZtLWkzODYgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1h
bWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywg
Y29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVw
b3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1t
YXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9
YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1h
cnkKCmJyb2tlbi1qb2IgYnVpbGQtYXJtNjQteHNtIGJyb2tlbgpicm9rZW4tc3RlcCBidWlsZC1h
cm02NC14c20gaG9zdC1pbnN0YWxsKDQpCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7
IGl0IHdvdWxkIGJlIDE2NTQgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
