Return-Path: <SRS0=M2I+=XV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D89C4360C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 14:30:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EB0222C6
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 14:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EB0222C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUmI-0008VI-Nt; Thu, 26 Sep 2019 14:29:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDUmH-0008V2-TZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:29:53 +0000
X-Inumbo-ID: 1a399324-e06a-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 1a399324-e06a-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 14:29:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03F90AFC3;
 Thu, 26 Sep 2019 14:29:52 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
Message-ID: <c31e9184-2c63-2909-8ad4-4a8bd2e1b214@suse.com>
Date: Thu, 26 Sep 2019 16:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v7 3/3] AMD/IOMMU: pre-fill all DTEs right after
 table allocation
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFrZSBzdXJlIHdlIGRvbid0IGxlYXZlIGFueSBEVEVzIHVuZXhwZWN0ZWQgcmVxdWVzdHMgdGhy
b3VnaCB3aGljaAp3b3VsZCBiZSBwYXNzZWQgdGhyb3VnaCB1bnRyYW5zbGF0ZWQuIFNldCBWIGFu
ZCBJViByaWdodCBhd2F5ICh3aXRoCmFsbCBvdGhlciBmaWVsZHMgbGVmdCBhcyB6ZXJvKSwgcmVs
eWluZyBvbiB0aGUgViBhbmQvb3IgSVYgYml0cwpnZXR0aW5nIGNsZWFyZWQgb25seSBieSBhbWRf
aW9tbXVfc2V0X3Jvb3RfcGFnZV90YWJsZSgpIGFuZAphbWRfaW9tbXVfc2V0X2ludHJlbWFwX3Rh
YmxlKCkgdW5kZXIgc3BlY2lhbCBwYXNzLXRocm91Z2ggY2lyY3Vtc3RhbmNlcy4KU3dpdGNoIGJh
Y2sgdG8gaW5pdGlhbCBzZXR0aW5ncyBpbiBhbWRfaW9tbXVfZGlzYWJsZV9kb21haW5fZGV2aWNl
KCkuCgpUYWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNvIG1ha2UgdGhlIGxhdHRlciBmdW5jdGlvbiBz
dGF0aWMsIGNvbnN0aWZ5aW5nCml0cyBmaXJzdCBwYXJhbWV0ZXIgYXQgdGhlIHNhbWUgdGltZSwg
YXQgdGhpcyBvY2Nhc2lvbi4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+Ci0tLQp2NzogQXZvaWQgd3JpdGluZyB0aGUgRFQgdHdpY2UgZHVyaW5nIGluaXRpYWwgYWxs
b2NhdGlvbi4KdjY6IE5ldy4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21t
dV9pbml0LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpA
QCAtMTI2MiwxMiArMTI2MiwyOCBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBf
ZGV2aWNlCiAKICAgICBpZiAoICFkdCApCiAgICAgeworICAgICAgICB1bnNpZ25lZCBpbnQgc2l6
ZSA9IGR0X2FsbG9jX3NpemUoKTsKKwogICAgICAgICAvKiBhbGxvY2F0ZSAnZGV2aWNlIHRhYmxl
JyBvbiBhIDRLIGJvdW5kYXJ5ICovCiAgICAgICAgIGR0ID0gSVZSU19NQVBQSU5HU19ERVZUQUIo
aXZyc19tYXBwaW5ncykgPQotICAgICAgICAgICAgYWxsb2NhdGVfYnVmZmVyKGR0X2FsbG9jX3Np
emUoKSwgIkRldmljZSBUYWJsZSIsIHRydWUpOworICAgICAgICAgICAgYWxsb2NhdGVfYnVmZmVy
KHNpemUsICJEZXZpY2UgVGFibGUiLCBmYWxzZSk7CisgICAgICAgIGlmICggIWR0ICkKKyAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOworCisgICAgICAgIC8qCisgICAgICAgICAqIFByZWZpbGwg
ZXZlcnkgRFRFIHN1Y2ggdGhhdCBhbGwga2luZHMgb2YgcmVxdWVzdHMgd2lsbCBnZXQgYWJvcnRl
ZC4KKyAgICAgICAgICogQmVzaWRlcyB0aGUgdHdvIGJpdHMgc2V0IHRvIHRydWUgYmVsb3cgdGhp
cyBidWlsZHMgdXBvbgorICAgICAgICAgKiBJT01NVV9ERVZfVEFCTEVfU1lTX01HVF9ETUFfQUJP
UlRFRCwKKyAgICAgICAgICogSU9NTVVfREVWX1RBQkxFX0lPX0NPTlRST0xfQUJPUlRFRCwgYXMg
d2VsbCBhcworICAgICAgICAgKiBJT01NVV9ERVZfVEFCTEVfSU5UX0NPTlRST0xfQUJPUlRFRCBh
bGwgYmVpbmcgemVybywgYW5kIHVzIGFsc28KKyAgICAgICAgICogd2FudGluZyBhdCBsZWFzdCBU
ViwgR1YsIEksIGFuZCBFWCBzZXQgdG8gZmFsc2UuCisgICAgICAgICAqLworICAgICAgICBmb3Ig
KCBiZGYgPSAwLCBzaXplIC89IHNpemVvZigqZHQpOyBiZGYgPCBzaXplOyArK2JkZiApCisgICAg
ICAgICAgICBkdFtiZGZdID0gKHN0cnVjdCBhbWRfaW9tbXVfZHRlKXsKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgLnYgPSB0cnVlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSB0
cnVlLAorICAgICAgICAgICAgICAgICAgICAgIH07CiAgICAgfQotICAgIGlmICggIWR0ICkKLSAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CiAKICAgICAvKiBBZGQgZGV2aWNlIHRhYmxlIGVudHJpZXMg
Ki8KICAgICBmb3IgKCBiZGYgPSAwOyBiZGYgPCBpdnJzX2JkZl9lbnRyaWVzOyBiZGYrKyApCi0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwpAQCAtMjY3LDkgKzI2Nyw5
IEBAIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBhbWRfaW9tbXVfaHdkb20KICAgICBzZXR1cF9o
d2RvbV9wY2lfZGV2aWNlcyhkLCBhbWRfaW9tbXVfYWRkX2RldmljZSk7CiB9CiAKLXZvaWQgYW1k
X2lvbW11X2Rpc2FibGVfZG9tYWluX2RldmljZShzdHJ1Y3QgZG9tYWluICpkb21haW4sCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXUs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggZGV2Zm4sIHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQorc3RhdGljIHZvaWQgYW1kX2lvbW11X2Rpc2FibGVfZG9tYWluX2Rldmlj
ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkb21haW4sCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGRldmZuLCBzdHJ1Y3QgcGNp
X2RldiAqcGRldikKIHsKICAgICBzdHJ1Y3QgYW1kX2lvbW11X2R0ZSAqdGFibGUsICpkdGU7CiAg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsKQEAgLTI4NCw5ICsyODQsMjEgQEAgdm9pZCBhbWRfaW9t
bXVfZGlzYWJsZV9kb21haW5fZGV2aWNlKHN0cgogICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21t
dS0+bG9jaywgZmxhZ3MpOwogICAgIGlmICggZHRlLT50diB8fCBkdGUtPnYgKQogICAgIHsKKyAg
ICAgICAgLyogU2VlIHRoZSBjb21tZW50IGluIGFtZF9pb21tdV9zZXR1cF9kZXZpY2VfdGFibGUo
KS4gKi8KKyAgICAgICAgZHRlLT5pbnRfY3RsID0gSU9NTVVfREVWX1RBQkxFX0lOVF9DT05UUk9M
X0FCT1JURUQ7CisgICAgICAgIHNtcF93bWIoKTsKKyAgICAgICAgZHRlLT5pdiA9IHRydWU7CiAg
ICAgICAgIGR0ZS0+dHYgPSBmYWxzZTsKLSAgICAgICAgZHRlLT52ID0gZmFsc2U7CisgICAgICAg
IGR0ZS0+Z3YgPSBmYWxzZTsKICAgICAgICAgZHRlLT5pID0gZmFsc2U7CisgICAgICAgIGR0ZS0+
ZXggPSBmYWxzZTsKKyAgICAgICAgZHRlLT5zYSA9IGZhbHNlOworICAgICAgICBkdGUtPnNlID0g
ZmFsc2U7CisgICAgICAgIGR0ZS0+c2QgPSBmYWxzZTsKKyAgICAgICAgZHRlLT5zeXNfbWd0ID0g
SU9NTVVfREVWX1RBQkxFX1NZU19NR1RfRE1BX0FCT1JURUQ7CisgICAgICAgIGR0ZS0+aW9jdGwg
PSBJT01NVV9ERVZfVEFCTEVfSU9fQ09OVFJPTF9BQk9SVEVEOworICAgICAgICBzbXBfd21iKCk7
CisgICAgICAgIGR0ZS0+diA9IHRydWU7CiAKICAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2Rldmlj
ZShpb21tdSwgcmVxX2lkKTsKIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
