Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F211EC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89BF2133D
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89BF2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE9fk-0004I8-KH; Wed, 10 Apr 2019 09:37:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hE9fj-0004I3-Bs
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:37:35 +0000
X-Inumbo-ID: 44dc3a19-5b74-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 44dc3a19-5b74-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 09:37:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 10 Apr 2019 03:37:33 -0600
Message-Id: <5CADB95A0200007800226174@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 10 Apr 2019 03:37:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] AMD/IOMMU: adjust IOMMU list head initialization
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
Message-ID: <20190410093730.Cf9T6z9hqNT4hmM60X6yaVgLXF3CzOmOwDA6rCG3vxM@z>

RG8gdGhpcyBzdGF0aWNhbGx5LCB3aGljaCB3aWxsIGFsbG93IGFjY2Vzc2luZyB0aGUgKGVtcHR5
KSBsaXN0IGV2ZW4Kd2l0aG91dCBoYXZpbmcgY29tZSB0aHJvdWdoIGFjcGlfaXZyc19pbml0KCku
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAgLTM2LDcgKzM2LDcgQEAgc3RhdGljIHN0
cnVjdCB0YXNrbGV0IGFtZF9pb21tdV9pcnFfdGFzawogdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0
bHkgaXZyc19iZGZfZW50cmllczsKIHU4IF9fcmVhZF9tb3N0bHkgaXZoZF90eXBlOwogc3RhdGlj
IHN0cnVjdCByYWRpeF90cmVlX3Jvb3QgaXZyc19tYXBzOwotc3RydWN0IGxpc3RfaGVhZCBhbWRf
aW9tbXVfaGVhZDsKK0xJU1RfSEVBRF9SRUFEX01PU1RMWShhbWRfaW9tbXVfaGVhZCk7CiBzdHJ1
Y3QgdGFibGVfc3RydWN0IGRldmljZV90YWJsZTsKIGJvb2xfdCBpb21tdXYyX2VuYWJsZWQ7CiAK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYworKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCkBAIC0xNTAsOCArMTUw
LDYgQEAgc3RhdGljIHZvaWQgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpYwogCiBpbnQgX19p
bml0IGFjcGlfaXZyc19pbml0KHZvaWQpCiB7Ci0gICAgSU5JVF9MSVNUX0hFQUQoJmFtZF9pb21t
dV9oZWFkKTsKLQogICAgIGlmICggIWlvbW11X2VuYWJsZSAmJiAhaW9tbXVfaW50cmVtYXAgKQog
ICAgICAgICByZXR1cm4gMDsKIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
