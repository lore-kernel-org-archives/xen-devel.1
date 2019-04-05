Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0EFC4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:15:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C370D217D4
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C370D217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCLsq-0002p9-Gf; Fri, 05 Apr 2019 10:15:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ODW8=SH=xenproject.org=prvs=991b75d7a=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hCLsp-0002ox-Es
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:15:39 +0000
X-Inumbo-ID: be6c8b80-578b-11e9-85aa-47514d9adf68
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be6c8b80-578b-11e9-85aa-47514d9adf68;
 Fri, 05 Apr 2019 10:15:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,312,1549929600"; d="scan'208";a="82833986"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-83876-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-amd64-xsm:<job status>:broken:regression
 ovmf:build-i386:<job status>:broken:regression
 ovmf:build-amd64-pvops:<job status>:broken:regression
 ovmf:build-i386-xsm:<job status>:broken:regression
 ovmf:build-amd64:<job status>:broken:regression
 ovmf:build-i386-pvops:<job status>:broken:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-i386-pvops:host-install(4):broken:nonblocking
 ovmf:build-i386:host-install(4):broken:nonblocking
 ovmf:build-amd64:host-install(4):broken:nonblocking
 ovmf:build-amd64-pvops:host-install(4):broken:nonblocking
 ovmf:build-i386-xsm:host-install(4):broken:nonblocking
 ovmf:build-amd64-xsm:host-install(4):broken:nonblocking
X-Osstest-Versions-This: ovmf=7ed72121b753a7493a8c5bf3711b5efbc5e80491
X-Osstest-Versions-That: ovmf=b02873340b2de5c2fe8325d22214cd3a5b21c5e5
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Fri, 5 Apr 2019 11:15:29 +0100
Subject: [Xen-devel] [ovmf baseline-only test] 83876: trouble: blocked/broken
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
Message-ID: <20190405101529.7SE1gETG6t_nC3M5-1b2eqNPs44ojQUlTbj3ElHMgOA@z>

VGhpcyBydW4gaXMgY29uZmlndXJlZCBmb3IgYmFzZWxpbmUgdGVzdHMgb25seS4KCmZsaWdodCA4
Mzg3NiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9vc3N0ZXN0LnhlbnNvdXJjZS5jb20vb3NzdGVz
dC9sb2dzLzgzODc2LwoKRmFpbHVyZXMgYW5kIHByb2JsZW1zIHdpdGggdGVzdHMgOi0oCgpUZXN0
cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5nIHRlc3Rz
IHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAg
IDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBidWlsZC1pMzg2ICAgICAgICAg
ICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBidWlsZC1h
bWQ2NC1wdm9wcyAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJv
a2VuCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAg
ICAgICAgICAgYnJva2VuCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgIDxqb2Igc3Rh
dHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAg
ICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCgpUZXN0cyB3aGljaCBkaWQg
bm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC14bC1x
ZW11dS1vdm1mLWFtZDY0ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgIGJsb2NrZWQgbi9h
CiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAg
ICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAg
MSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgYmxvY2tlZCBuL2EKIGJ1aWxkLWkzODYtbGli
dmlydCAgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBu
L2EKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAg
IGJyb2tlbiBiYXNlbGluZSB1bnRlc3RlZAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAg
NCBob3N0LWluc3RhbGwoNCkgICAgICAgYnJva2VuIGJhc2VsaW5lIHVudGVzdGVkCiBidWlsZC1h
bWQ2NCAgICAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICBicm9rZW4gYmFz
ZWxpbmUgdW50ZXN0ZWQKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgIDQgaG9zdC1pbnN0
YWxsKDQpICAgICAgIGJyb2tlbiBiYXNlbGluZSB1bnRlc3RlZAogYnVpbGQtaTM4Ni14c20gICAg
ICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgYnJva2VuIGJhc2VsaW5lIHVudGVz
dGVkCiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAg
ICBicm9rZW4gYmFzZWxpbmUgdW50ZXN0ZWQKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6
CiBvdm1mICAgICAgICAgICAgICAgICA3ZWQ3MjEyMWI3NTNhNzQ5M2E4YzViZjM3MTFiNWVmYmM1
ZTgwNDkxCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBiMDI4NzMzNDBi
MmRlNWMyZmU4MzI1ZDIyMjE0Y2QzYTViMjFjNWU1CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAgODM4
NjUgIDIwMTktMDQtMDMgMTU6Mjc6MDYgWiAgICAxIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAg
IDgzODc2ICAyMDE5LTA0LTA1IDA4OjUzOjU5IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQnJldCBCYXJrZWxl
dyA8QnJldC5CYXJrZWxld0BtaWNyb3NvZnQuY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJl
ZGhhdC5jb20+CiAgTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgU2hlbmdsZWkg
WmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBaaGFuZywgU2hlbmdsZWkgPHNoZW5n
bGVpLnpoYW5nQGludGVsLmNvbT4KICBaaGljaGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwuY29t
PgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxk
LWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cm9rZW4gIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJsb2NrZWQgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1aWxkLWFtZDY0LXB2b3BzICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQt
aTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJy
b2tlbiAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0
IG9uIG9zc3Rlc3QueHMuY2l0cml0ZS5uZXQKbG9nczogL2hvbWUvb3NzdGVzdC9sb2dzCmltYWdl
czogL2hvbWUvb3NzdGVzdC9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZh
aWxhYmxlIGF0CiAgICBodHRwOi8vb3NzdGVzdC54ZW5zb3VyY2UuY29tL29zc3Rlc3QvbG9ncwoK
VGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW5z
b3VyY2UuY29tL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKYnJva2VuLWpvYiBidWls
ZC1hbWQ2NC14c20gYnJva2VuCmJyb2tlbi1qb2IgYnVpbGQtaTM4NiBicm9rZW4KYnJva2VuLWpv
YiBidWlsZC1hbWQ2NC1wdm9wcyBicm9rZW4KYnJva2VuLWpvYiBidWlsZC1pMzg2LXhzbSBicm9r
ZW4KYnJva2VuLWpvYiBidWlsZC1hbWQ2NCBicm9rZW4KYnJva2VuLWpvYiBidWlsZC1pMzg2LXB2
b3BzIGJyb2tlbgpicm9rZW4tc3RlcCBidWlsZC1pMzg2LXB2b3BzIGhvc3QtaW5zdGFsbCg0KQpi
cm9rZW4tc3RlcCBidWlsZC1pMzg2IGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWlsZC1h
bWQ2NCBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYW1kNjQtcHZvcHMgaG9zdC1p
bnN0YWxsKDQpCmJyb2tlbi1zdGVwIGJ1aWxkLWkzODYteHNtIGhvc3QtaW5zdGFsbCg0KQpicm9r
ZW4tc3RlcCBidWlsZC1hbWQ2NC14c20gaG9zdC1pbnN0YWxsKDQpCgpQdXNoIG5vdCBhcHBsaWNh
YmxlLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgNjg2IGxpbmVzIGxvbmcuKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
