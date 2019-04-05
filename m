Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9017CC282DA
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 17:58:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677342063F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 17:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677342063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCT6h-0000fo-1M; Fri, 05 Apr 2019 17:58:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8q43=SH=citrix.com=prvs=991ec766c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hCT6g-0000fc-5c
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 17:58:26 +0000
X-Inumbo-ID: 66b7a3a2-57cc-11e9-8acc-ff6a018b07fb
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66b7a3a2-57cc-11e9-8acc-ff6a018b07fb;
 Fri, 05 Apr 2019 17:58:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="82881080"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Apr 2019 18:58:11 +0100
Message-ID: <20190405175811.7446-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190405175811.7446-1-anthony.perard@citrix.com>
References: <20190405175811.7446-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] libxl: Document device_add_domain_config
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405175811.5pWKwXEBqcYp6-r4XrFQfzrRhaFEz35YpJNqyO88EiY@z>

Q29tbWl0IDAzZTFhNTZkODFjMTZlZWNlNzM1ZTRkMGVmNzRiZmIxMGVhYWJhMDcgcmVwbGFjZWQg
REVWSUNFX0FERCgpCmNhbGxzIGJ5IGRldmljZV9hZGRfZG9tYWluX2NvbmZpZygpIGNhbGxzIGJ1
dCBhbHNvIHJlbW92ZWQgdGhlIGNvbW1lbnQKb2YgREVWSUNFX0FERCgpLiBDb3B5IHRoZSB1c2Vm
dWwgcGFydCBvZiB0aGF0IGNvbW1lbnQgdG8KZGV2aWNlX2FkZF9kb21haW5fY29uZmlnKCkuCgpB
bHNvLCByZW5hbWUgdGhlIHBhcmFtZXRlciBgdHlwZWAgdG8gYGRldmAsIGJlY2F1c2UgdGhhdCBw
YXJhbWV0ZXIgaXNuJ3QKdXNlZCBhcyBhIHR5cGUgYnV0IGFzIHRoZSBkZXZpY2Ugd2Ugd2FudCB0
byBhZGQvdXBkYXRlIHRvIGRfY29uZmlnLgoKQWxzbywgY29uc3RpZnkgYGRldmAgYmVjYXVzZSBp
dCBpc24ndCBtb2RpZmllZC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jICAgfCAg
NiArKystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAxNSArKysrKysrKysrKysr
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2RldmljZS5jCmluZGV4IGE0YThlOWFjMzIuLjg3ZGRmYzNhYzcgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RldmljZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCkBA
IC0xODUyLDcgKzE4NTIsNyBAQCBpbnQgbGlieGxfZGV2aWNlX2V2ZW50c19oYW5kbGVyKGxpYnhs
X2N0eCAqY3R4LAogfQogCiB2b2lkIGRldmljZV9hZGRfZG9tYWluX2NvbmZpZyhsaWJ4bF9fZ2Mg
KmdjLCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlwZSAqZHQsIHZvaWQgKnR5cGUp
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbGlieGxfZGV2aWNl
X3R5cGUgKmR0LCBjb25zdCB2b2lkICpkZXYpCiB7CiAgICAgaW50ICpudW1fZGV2OwogICAgIHVu
c2lnbmVkIGludCBpOwpAQCAtMTg2Miw3ICsxODYyLDcgQEAgdm9pZCBkZXZpY2VfYWRkX2RvbWFp
bl9jb25maWcobGlieGxfX2djICpnYywgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAK
ICAgICAvKiBDaGVjayBmb3IgZXhpc3RpbmcgZGV2aWNlICovCiAgICAgZm9yIChpID0gMDsgaSA8
ICpudW1fZGV2OyBpKyspIHsKLSAgICAgICAgaWYgKGR0LT5jb21wYXJlKGxpYnhsX19kZXZpY2Vf
dHlwZV9nZXRfZWxlbShkdCwgZF9jb25maWcsIGkpLCB0eXBlKSkgeworICAgICAgICBpZiAoZHQt
PmNvbXBhcmUobGlieGxfX2RldmljZV90eXBlX2dldF9lbGVtKGR0LCBkX2NvbmZpZywgaSksIGRl
dikpIHsKICAgICAgICAgICAgIGl0ZW0gPSBsaWJ4bF9fZGV2aWNlX3R5cGVfZ2V0X2VsZW0oZHQs
IGRfY29uZmlnLCBpKTsKICAgICAgICAgfQogICAgIH0KQEAgLTE4NzgsNyArMTg3OCw3IEBAIHZv
aWQgZGV2aWNlX2FkZF9kb21haW5fY29uZmlnKGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RvbWFpbl9j
b25maWcgKmRfY29uZmlnLAogICAgIH0KIAogICAgIGR0LT5pbml0KGl0ZW0pOwotICAgIGR0LT5j
b3B5KENUWCwgaXRlbSwgdHlwZSk7CisgICAgZHQtPmNvcHkoQ1RYLCBpdGVtLCBkZXYpOwogfQog
CiB2b2lkIGxpYnhsX19kZXZpY2VfYWRkX2FzeW5jKGxpYnhsX19lZ2MgKmVnYywgdWludDMyX3Qg
ZG9taWQsCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMv
bGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAzNGRjODg2NTA1Li40NGUwMjIxMjg0IDEwMDY0
NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmgKQEAgLTQ1ODEsOCArNDU4MSwyMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
bGlieGxfX2FjcGlfZGVmYm9vbF92YWwoY29uc3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmJf
aW5mbwogICAgICAgICAgICBsaWJ4bF9kZWZib29sX3ZhbChiX2luZm8tPnUuaHZtLmFjcGkpOwog
fQogCisvKgorICogQWRkIGEgZGV2aWNlIGluIGxpYnhsX2RvbWFpbl9jb25maWcgc3RydWN0dXJl
CisgKgorICogSWYgdGhlcmUgaXMgYWxyZWFkeSBhIGRldmljZSB3aXRoIHRoZSBzYW1lIGlkZW50
aWZpZXIgaW4gZF9jb25maWcsCisgKiB0aGF0IGVudHJ5IGlzIHVwZGF0ZWQuCisgKgorICogcGFy
YW1ldGVyczoKKyAqICBkX2NvbmZpZzogcG9pbnRlciB0byB0ZW1wbGF0ZSBkb21haW4gY29uZmln
CisgKiAgZHQ6ICAgICAgIHR5cGUgb2YgYGRldicKKyAqICBkZXY6ICAgICAgdGhlIGRldmljZSB0
aGF0IGlzIHRvIGJlIGFkZGVkIC8gcmVtb3ZlZCAvIHVwZGF0ZWQKKyAqICAgICAgICAgICAgKGEg
Y29weSBvZiBgZGV2JyB3aWxsIGJlIG1hZGUpCisgKi8KIHZvaWQgZGV2aWNlX2FkZF9kb21haW5f
Y29uZmlnKGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGxpYnhsX2RldmljZV90eXBl
ICpkdCwgdm9pZCAqdHlwZSk7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgbGlieGxfZGV2aWNlX3R5cGUgKmR0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgdm9pZCAqZGV2KTsKIAogdm9pZCBsaWJ4bF9fZGV2aWNlX2FkZF9hc3luYyhsaWJ4
bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgbGlieGxfZGV2aWNlX3R5cGUgKmR0LCB2b2lkICp0eXBlLAotLSAKQW50
aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
