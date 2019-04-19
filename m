Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA0AC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 09:30:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052A9217D7
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 09:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 052A9217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHPpw-0002y6-7d; Fri, 19 Apr 2019 09:29:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=df5c=SV=xenproject.org=prvs=00559df13=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hHPpu-0002xm-A7
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 09:29:34 +0000
X-Inumbo-ID: 9f4cb9b4-6285-11e9-9e4a-c3748f1d8be4
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f4cb9b4-6285-11e9-9e4a-c3748f1d8be4;
 Fri, 19 Apr 2019 09:29:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,369,1549929600"; d="scan'208";a="83965614"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-84039-mainreport@xen.org>
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
 ovmf:build-amd64-pvops:host-install(4):broken:nonblocking
 ovmf:build-i386:host-install(4):broken:nonblocking
 ovmf:build-i386-pvops:host-install(4):broken:nonblocking
 ovmf:build-amd64:host-install(4):broken:nonblocking
 ovmf:build-i386-xsm:host-install(4):broken:nonblocking
 ovmf:build-amd64-xsm:host-install(4):broken:nonblocking
X-Osstest-Versions-This: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
X-Osstest-Versions-That: ovmf=0eccea3fbe2f6d4999d972d9310d4f2717f5100c
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Fri, 19 Apr 2019 10:29:22 +0100
Subject: [Xen-devel] [ovmf baseline-only test] 84039: trouble: blocked/broken
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
Message-ID: <20190419092922.c3-nek7Rp8aKPz8XBZM0tBZ1E-3-NnRt-dsyY2jRLC0@z>

VGhpcyBydW4gaXMgY29uZmlndXJlZCBmb3IgYmFzZWxpbmUgdGVzdHMgb25seS4KCmZsaWdodCA4
NDAzOSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9vc3N0ZXN0LnhlbnNvdXJjZS5jb20vb3NzdGVz
dC9sb2dzLzg0MDM5LwoKRmFpbHVyZXMgYW5kIHByb2JsZW1zIHdpdGggdGVzdHMgOi0oCgpUZXN0
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
L2EKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAg
IGJyb2tlbiBiYXNlbGluZSB1bnRlc3RlZAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAg
NCBob3N0LWluc3RhbGwoNCkgICAgICAgYnJva2VuIGJhc2VsaW5lIHVudGVzdGVkCiBidWlsZC1p
Mzg2LXB2b3BzICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICBicm9rZW4gYmFz
ZWxpbmUgdW50ZXN0ZWQKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0
YWxsKDQpICAgICAgIGJyb2tlbiBiYXNlbGluZSB1bnRlc3RlZAogYnVpbGQtaTM4Ni14c20gICAg
ICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgYnJva2VuIGJhc2VsaW5lIHVudGVz
dGVkCiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAg
ICBicm9rZW4gYmFzZWxpbmUgdW50ZXN0ZWQKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6
CiBvdm1mICAgICAgICAgICAgICAgICBjMmY2NDM0NzllYjNmMDBkOTMwYzQ2MWNkZWMzYmE0MjBh
MzYwNzJjCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAwZWNjZWEzZmJl
MmY2ZDQ5OTlkOTcyZDkzMTBkNGYyNzE3ZjUxMDBjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAgODQw
MDMgIDIwMTktMDQtMTcgMDQ6NTY6MjEgWiAgICAyIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAg
IDg0MDM5ICAyMDE5LTA0LTE5IDA3OjI5OjI2IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQXJkIEJpZXNoZXV2
ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgQnJldCBCYXJrZWxldyA8QnJldC5CYXJr
ZWxld0BtaWNyb3NvZnQuY29tPgogIEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVsLmNvbT4K
ICBHYXJ5IExpbiA8Z2xpbkBzdXNlLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQu
Y29tPgogIFphaWxpYW5nIFN1biA8emFpbGlhbmcuc3VuQGludGVsLmNvbT4KICBaaGljaGFvIEdh
byA8emhpY2hhby5nYW9AaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5j
b20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVp
bGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyb2tlbiAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYmxvY2tlZCAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogYnVpbGQtYW1kNjQtcHZvcHMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWls
ZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YnJva2VuICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAg
ICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1k
NjQgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC54cy5jaXRyaXRlLm5ldApsb2dzOiAvaG9tZS9vc3N0ZXN0L2xvZ3MKaW1h
Z2VzOiAvaG9tZS9vc3N0ZXN0L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBh
dmFpbGFibGUgYXQKICAgIGh0dHA6Ly9vc3N0ZXN0LnhlbnNvdXJjZS5jb20vb3NzdGVzdC9sb2dz
CgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bnNvdXJjZS5jb20vZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5Cgpicm9rZW4tam9iIGJ1
aWxkLWFtZDY0LXhzbSBicm9rZW4KYnJva2VuLWpvYiBidWlsZC1pMzg2IGJyb2tlbgpicm9rZW4t
am9iIGJ1aWxkLWFtZDY0LXB2b3BzIGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWkzODYteHNtIGJy
b2tlbgpicm9rZW4tam9iIGJ1aWxkLWFtZDY0IGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWkzODYt
cHZvcHMgYnJva2VuCmJyb2tlbi1zdGVwIGJ1aWxkLWFtZDY0LXB2b3BzIGhvc3QtaW5zdGFsbCg0
KQpicm9rZW4tc3RlcCBidWlsZC1pMzg2IGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWls
ZC1pMzg2LXB2b3BzIGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWlsZC1hbWQ2NCBob3N0
LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtaTM4Ni14c20gaG9zdC1pbnN0YWxsKDQpCmJy
b2tlbi1zdGVwIGJ1aWxkLWFtZDY0LXhzbSBob3N0LWluc3RhbGwoNCkKClB1c2ggbm90IGFwcGxp
Y2FibGUuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA1MDQgbGluZXMgbG9uZy4pCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
