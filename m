Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732B9C10F14
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:20:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D81C20870
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D81C20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDSJr-0002T6-Qi; Mon, 08 Apr 2019 11:20:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDSJr-0002St-0a
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:20:07 +0000
X-Inumbo-ID: 40d102c0-59f0-11e9-b1c4-070fb853d933
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40d102c0-59f0-11e9-b1c4-070fb853d933;
 Mon, 08 Apr 2019 11:20:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 05:20:02 -0600
Message-Id: <5CAB2E5F02000078002254F6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 05:19:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] AMD/IOMMU: disable previously enabled IOMMUs
 upon init failure
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408111959.oL-ifp79pcPAMRjJNxlEmU1Ei5uDlgBl_x9-7bEA-dk@z>

SWYgYW55IElPTU1VcyB3ZXJlIHN1Y2Nlc3NmdWxseSBpbml0aWFsaXplZCBiZWZvcmUgZW5jb3Vu
dGVyaW5nIGZhaWx1cmUsCnRoZSBzdWNjZXNzZnVsbHkgZW5hYmxlZCBvbmVzIHNob3VsZCBiZSBk
aXNhYmxlZCBhZ2FpbiBiZWZvcmUgY2xlYW5pbmcKdXAgdGhlaXIgcmVzb3VyY2VzLgoKTW92ZSBk
aXNhYmxlX2lvbW11KCkgbmV4dCB0byBlbmFibGVfaW9tbXUoKSB0byBhdm9pZCBhIGZvcndhcmQK
ZGVjbGFyYXRpb24sIGFuZCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byByZW1vdmUgc3RyYXkgYmxh
bmsgbGluZXMgYWhlYWQKb2YgYm90aCBmdW5jdGlvbnMnIGZpbmFsIGNsb3NpbmcgYnJhY2VzLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYworKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCkBAIC05MDksNyArOTA5LDM1IEBAIHN0YXRpYyB2
b2lkIGVuYWJsZV9pb21tdShzdHJ1Y3QgYW1kX2lvbW0KIAogICAgIGlvbW11LT5lbmFibGVkID0g
MTsKICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOworfQor
CitzdGF0aWMgdm9pZCBkaXNhYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQorewor
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CisKKyAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUt
PmxvY2ssIGZsYWdzKTsKKworICAgIGlmICggIWlvbW11LT5lbmFibGVkICkKKyAgICB7CisgICAg
ICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5sb2NrLCBmbGFncyk7CisgICAgICAg
IHJldHVybjsKKyAgICB9CisKKyAgICBhbWRfaW9tbXVfbXNpX2VuYWJsZShpb21tdSwgSU9NTVVf
Q09OVFJPTF9ESVNBQkxFRCk7CisgICAgc2V0X2lvbW11X2NvbW1hbmRfYnVmZmVyX2NvbnRyb2wo
aW9tbXUsIElPTU1VX0NPTlRST0xfRElTQUJMRUQpOworICAgIHNldF9pb21tdV9ldmVudF9sb2df
Y29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7CisKKyAgICBpZiAoIGFtZF9p
b21tdV9oYXNfZmVhdHVyZShpb21tdSwgSU9NTVVfRVhUX0ZFQVRVUkVfUFBSU1VQX1NISUZUKSAp
CisgICAgICAgIHNldF9pb21tdV9wcHJfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xf
RElTQUJMRUQpOworCisgICAgaWYgKCBhbWRfaW9tbXVfaGFzX2ZlYXR1cmUoaW9tbXUsIElPTU1V
X0VYVF9GRUFUVVJFX0dUU1VQX1NISUZUKSApCisgICAgICAgIHNldF9pb21tdV9ndWVzdF90cmFu
c2xhdGlvbl9jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FCTEVEKTsKKworICAgIHNl
dF9pb21tdV90cmFuc2xhdGlvbl9jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FCTEVE
KTsKIAorICAgIGlvbW11LT5lbmFibGVkID0gMDsKKworICAgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmlvbW11LT5sb2NrLCBmbGFncyk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBkZWFsbG9j
YXRlX2J1ZmZlcih2b2lkICpidWYsIHVpbnQzMl90IHN6KQpAQCAtMTA0Niw2ICsxMDc0LDcgQEAg
c3RhdGljIHZvaWQgX19pbml0IGFtZF9pb21tdV9pbml0X2NsZWFudQogICAgICAgICBsaXN0X2Rl
bCgmaW9tbXUtPmxpc3QpOwogICAgICAgICBpZiAoIGlvbW11LT5lbmFibGVkICkKICAgICAgICAg
eworICAgICAgICAgICAgZGlzYWJsZV9pb21tdShpb21tdSk7CiAgICAgICAgICAgICBkZWFsbG9j
YXRlX3JpbmdfYnVmZmVyKCZpb21tdS0+Y21kX2J1ZmZlcik7CiAgICAgICAgICAgICBkZWFsbG9j
YXRlX3JpbmdfYnVmZmVyKCZpb21tdS0+ZXZlbnRfbG9nKTsKICAgICAgICAgICAgIGRlYWxsb2Nh
dGVfcmluZ19idWZmZXIoJmlvbW11LT5wcHJfbG9nKTsKQEAgLTEyOTcsMzYgKzEzMjYsNiBAQCBl
cnJvcl9vdXQ6CiAgICAgcmV0dXJuIHJjOwogfQogCi1zdGF0aWMgdm9pZCBkaXNhYmxlX2lvbW11
KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQotewotICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0K
LSAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsKLQotICAgIGlmICgg
IWlvbW11LT5lbmFibGVkICkKLSAgICB7Ci0gICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmlvbW11LT5sb2NrLCBmbGFncyk7IAotICAgICAgICByZXR1cm47Ci0gICAgfQotCi0gICAgYW1k
X2lvbW11X21zaV9lbmFibGUoaW9tbXUsIElPTU1VX0NPTlRST0xfRElTQUJMRUQpOwotICAgIHNl
dF9pb21tdV9jb21tYW5kX2J1ZmZlcl9jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FC
TEVEKTsKLSAgICBzZXRfaW9tbXVfZXZlbnRfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRS
T0xfRElTQUJMRUQpOwotCi0gICAgaWYgKCBhbWRfaW9tbXVfaGFzX2ZlYXR1cmUoaW9tbXUsIElP
TU1VX0VYVF9GRUFUVVJFX1BQUlNVUF9TSElGVCkgKQotICAgICAgICBzZXRfaW9tbXVfcHByX2xv
Z19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FCTEVEKTsKLQotICAgIGlmICggYW1k
X2lvbW11X2hhc19mZWF0dXJlKGlvbW11LCBJT01NVV9FWFRfRkVBVFVSRV9HVFNVUF9TSElGVCkg
KQotICAgICAgICBzZXRfaW9tbXVfZ3Vlc3RfdHJhbnNsYXRpb25fY29udHJvbChpb21tdSwgSU9N
TVVfQ09OVFJPTF9ESVNBQkxFRCk7Ci0KLSAgICBzZXRfaW9tbXVfdHJhbnNsYXRpb25fY29udHJv
bChpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7Ci0KLSAgICBpb21tdS0+ZW5hYmxlZCA9
IDA7Ci0KLSAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOwot
Ci19Ci0KIHN0YXRpYyB2b2lkIGludmFsaWRhdGVfYWxsX2RvbWFpbl9wYWdlcyh2b2lkKQogewog
ICAgIHN0cnVjdCBkb21haW4gKmQ7CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
