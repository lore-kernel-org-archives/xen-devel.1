Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC38C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:17:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644D620870
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644D620870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDSGu-0001jr-Us; Mon, 08 Apr 2019 11:17:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDSGt-0001jm-AM
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:17:03 +0000
X-Inumbo-ID: d4f12040-59ef-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d4f12040-59ef-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 11:17:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 05:17:01 -0600
Message-Id: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 05:16:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/IOMMU: abstract Intel-specific
 adjust_vtd_irq_affinities()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408111658.xvs_gc0GxLUZSAlHgm3ahC8xA8izi-VTkltsVDi2N8g@z>

VGhpcyBjYW4ndCBiZSBmb2xkZWQgaW50byB0aGUgcmVzdW1lIGhvb2ssIGFzIHRoYXQgcnVucyBi
ZWZvcmUgYnJpbmdpbgpiYWNrIHVwIEFQcywgYnV0IHRoZSBhZmZpbml0eSBhZGp1c3RtZW50IHdh
bnRzIHRvIGhhcHBlbiB3aXRoIGFsbCBDUFVzCmJhY2sgb25saW5lLiBIZW5jZSBhIHNlcGFyYXRl
IGhvb2sgaXMgbmVlZGVkIHN1Y2ggdGhhdCBBTUQgY2FuIHRoZW4KbGV2ZXJhZ2UgaXQgYXMgd2Vs
bC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBh
L3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIu
YwpAQCAtMjc1LDcgKzI3NSw3IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQog
ICAgIG10cnJfYXBzX3N5bmNfYmVnaW4oKTsKICAgICBlbmFibGVfbm9uYm9vdF9jcHVzKCk7CiAg
ICAgbXRycl9hcHNfc3luY19lbmQoKTsKLSAgICBhZGp1c3RfdnRkX2lycV9hZmZpbml0aWVzKCk7
CisgICAgaW9tbXVfYWRqdXN0X2lycV9hZmZpbml0aWVzKCk7CiAgICAgYWNwaV9kbWFyX3phcCgp
OwogICAgIHRoYXdfZG9tYWlucygpOwogICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3Rp
dmU7Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCkBAIC0yMTQxLDcgKzIxNDEsNyBAQCBzdGF0
aWMgdm9pZCBhZGp1c3RfaXJxX2FmZmluaXR5KHN0cnVjdCBhCiAgICAgZG1hX21zaV9zZXRfYWZm
aW5pdHkoaXJxX3RvX2Rlc2MoZHJoZC0+aW9tbXUtPm1zaS5pcnEpLCBjcHVtYXNrKTsKIH0KIAot
aW50IGFkanVzdF92dGRfaXJxX2FmZmluaXRpZXModm9pZCkKK3N0YXRpYyBpbnQgYWRqdXN0X3Z0
ZF9pcnFfYWZmaW5pdGllcyh2b2lkKQogewogICAgIHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJo
ZDsKIApAQCAtMjcyNSw2ICsyNzI1LDcgQEAgY29uc3Qgc3RydWN0IGlvbW11X29wcyBfX2luaXRj
b25zdHJlbCBpbgogICAgIC5yZWFkX2FwaWNfZnJvbV9pcmUgPSBpb19hcGljX3JlYWRfcmVtYXBf
cnRlLAogICAgIC5yZWFkX21zaV9mcm9tX2lyZSA9IG1zaV9tc2dfcmVhZF9yZW1hcF9ydGUsCiAg
ICAgLnNldHVwX2hwZXRfbXNpID0gaW50ZWxfc2V0dXBfaHBldF9tc2ksCisgICAgLmFkanVzdF9p
cnFfYWZmaW5pdGllcyA9IGFkanVzdF92dGRfaXJxX2FmZmluaXRpZXMsCiAgICAgLnN1c3BlbmQg
PSB2dGRfc3VzcGVuZCwKICAgICAucmVzdW1lID0gdnRkX3Jlc3VtZSwKICAgICAuc2hhcmVfcDJt
ID0gaW9tbXVfc2V0X3BnZCwKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaApAQCAtODEsOCArODEsMTQgQEAgdm9pZCBpb21t
dV91cGRhdGVfaXJlX2Zyb21fYXBpYyh1bnNpZ25lZAogdW5zaWduZWQgaW50IGlvbW11X3JlYWRf
YXBpY19mcm9tX2lyZSh1bnNpZ25lZCBpbnQgYXBpYywgdW5zaWduZWQgaW50IHJlZyk7CiBpbnQg
aW9tbXVfc2V0dXBfaHBldF9tc2koc3RydWN0IG1zaV9kZXNjICopOwogCitzdGF0aWMgaW5saW5l
IGludCBpb21tdV9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCkKK3sKKyAgICByZXR1cm4gaW9t
bXVfb3BzLmFkanVzdF9pcnFfYWZmaW5pdGllcworICAgICAgICAgICA/IGlvbW11X29wcy5hZGp1
c3RfaXJxX2FmZmluaXRpZXMoKQorICAgICAgICAgICA6IDA7Cit9CisKIC8qIFdoaWxlIFZULWQg
c3BlY2lmaWMsIHRoaXMgbXVzdCBnZXQgZGVjbGFyZWQgaW4gYSBnZW5lcmljIGhlYWRlci4gKi8K
LWludCBhZGp1c3RfdnRkX2lycV9hZmZpbml0aWVzKHZvaWQpOwogaW50IF9fbXVzdF9jaGVjayBp
b21tdV9wdGVfZmx1c2goc3RydWN0IGRvbWFpbiAqZCwgdTY0IGdmbiwgdTY0ICpwdGUsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgb3JkZXIsIGludCBwcmVzZW50KTsKIAot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUu
aApAQCAtMjI0LDcgKzIyNCwxMCBAQCBzdHJ1Y3QgaW9tbXVfb3BzIHsKIAogICAgIHZvaWQgKCp1
cGRhdGVfaXJlX2Zyb21fYXBpYykodW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCByZWcs
IHVuc2lnbmVkIGludCB2YWx1ZSk7CiAgICAgdW5zaWduZWQgaW50ICgqcmVhZF9hcGljX2Zyb21f
aXJlKSh1bnNpZ25lZCBpbnQgYXBpYywgdW5zaWduZWQgaW50IHJlZyk7CisKICAgICBpbnQgKCpz
ZXR1cF9ocGV0X21zaSkoc3RydWN0IG1zaV9kZXNjICopOworCisgICAgaW50ICgqYWRqdXN0X2ly
cV9hZmZpbml0aWVzKSh2b2lkKTsKICNlbmRpZiAvKiBDT05GSUdfWDg2ICovCiAKICAgICBpbnQg
X19tdXN0X2NoZWNrICgqc3VzcGVuZCkodm9pZCk7CgoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
