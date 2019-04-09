Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E937C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77DAF2084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77DAF2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDouu-0000L7-Et; Tue, 09 Apr 2019 11:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDout-0000JZ-17
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:27:51 +0000
X-Inumbo-ID: 7f769042-5aba-11e9-bbf8-6ffde6df3045
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f769042-5aba-11e9-bbf8-6ffde6df3045;
 Tue, 09 Apr 2019 11:27:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096415"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:33 +0100
Message-ID: <20190409110844.14746-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 20/31] OvmfPkg: Import XENMEM_memory_map
 hypercall to Xen/memory.h
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409110833.xse5IwFQw7lufwG9kcg-8yEkU6OU65b7Xb5iLo-4Nwc@z>

VGhpcyBpcyBjb3BpZWQgb3ZlciBmcm9tIHRoZSBwdWJsaWMgaGVhZGVyIG9mIHRoZSBYZW4gUHJv
amVjdCwgd2l0aCB0aGUKdHlwZSBuYW1lIG1vZGlmaWVkIHRvIGJ1aWxkIG9uIE9WTUYuCgpDb250
cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNpZ25l
ZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0K
IE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaCB8IDIzICsrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaCBiL092
bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaAppbmRleCAwMjAxNTU5
NjJjLi5iMDBhODcwOTdkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFu
ZGFyZC9YZW4vbWVtb3J5LmgKKysrIGIvT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQv
WGVuL21lbW9yeS5oCkBAIC04MSw2ICs4MSwyOSBAQCBzdHJ1Y3QgeGVuX3JlbW92ZV9mcm9tX3Bo
eXNtYXAgewogdHlwZWRlZiBzdHJ1Y3QgeGVuX3JlbW92ZV9mcm9tX3BoeXNtYXAgeGVuX3JlbW92
ZV9mcm9tX3BoeXNtYXBfdDsKIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9yZW1vdmVfZnJv
bV9waHlzbWFwX3QpOwogCisvKgorICogUmV0dXJucyB0aGUgcHNldWRvLXBoeXNpY2FsIG1lbW9y
eSBtYXAgYXMgaXQgd2FzIHdoZW4gdGhlIGRvbWFpbgorICogd2FzIHN0YXJ0ZWQgKHNwZWNpZmll
ZCBieSBYRU5NRU1fc2V0X21lbW9yeV9tYXApLgorICogYXJnID09IGFkZHIgb2YgeGVuX21lbW9y
eV9tYXBfdC4KKyAqLworI2RlZmluZSBYRU5NRU1fbWVtb3J5X21hcCAgICAgICAgICAgOQorc3Ry
dWN0IHhlbl9tZW1vcnlfbWFwIHsKKyAgICAvKgorICAgICAqIE9uIGNhbGwgdGhlIG51bWJlciBv
ZiBlbnRyaWVzIHdoaWNoIGNhbiBiZSBzdG9yZWQgaW4gYnVmZmVyLiBPbgorICAgICAqIHJldHVy
biB0aGUgbnVtYmVyIG9mIGVudHJpZXMgd2hpY2ggaGF2ZSBiZWVuIHN0b3JlZCBpbgorICAgICAq
IGJ1ZmZlci4KKyAgICAgKi8KKyAgICBVSU5UMzIgbnJfZW50cmllczsKKworICAgIC8qCisgICAg
ICogRW50cmllcyBpbiB0aGUgYnVmZmVyIGFyZSBpbiB0aGUgc2FtZSBmb3JtYXQgYXMgcmV0dXJu
ZWQgYnkgdGhlCisgICAgICogQklPUyBJTlQgMHgxNSBFQVg9MHhFODIwIGNhbGwuCisgICAgICov
CisgICAgWEVOX0dVRVNUX0hBTkRMRSh2b2lkKSBidWZmZXI7Cit9OwordHlwZWRlZiBzdHJ1Y3Qg
eGVuX21lbW9yeV9tYXAgeGVuX21lbW9yeV9tYXBfdDsKK0RFRklORV9YRU5fR1VFU1RfSEFORExF
KHhlbl9tZW1vcnlfbWFwX3QpOworCiAjZW5kaWYgLyogX19YRU5fUFVCTElDX01FTU9SWV9IX18g
Ki8KIAogLyoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
