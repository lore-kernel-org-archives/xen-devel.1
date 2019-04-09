Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44008C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0972133D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0972133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDovJ-0000qk-Go; Tue, 09 Apr 2019 11:28:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDovI-0000oj-AC
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:16 +0000
X-Inumbo-ID: 909ca635-5aba-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 909ca635-5aba-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:28:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096470"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:24 +0100
Message-ID: <20190409110844.14746-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 11/31] OvmfPkg/XenPlatformPei: Use
 mXenHvmloaderInfo to get E820
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
Message-ID: <20190409110824.xBGo6DnZGxzv4fxo4JsTMxIZdyA-ZLerH-G_Jp2aDB0@z>

VXNlIHRoZSBhbHJlYWR5IGNoZWNrZWQgcG9pbnRlciBtWGVuSHZtbG9hZGVySW5mbyB0byByZXRy
aWV2ZSB0aGUgRTgyMAp0YWJsZSBwcm9kdWNlZCBieSBodm1sb2FkZXIuCgpDb250cmlidXRlZC11
bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNpZ25lZC1vZmYtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIE92bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5k
ZXggYTg2NjY0MWI2Ny4uZGY5MDZiNmJlNSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCkBAIC01OSwxOCAr
NTksMTggQEAgWGVuR2V0RTgyME1hcCAoCiAgIFVJTlQzMiAqQ291bnQKICAgKQogewotICBFRklf
WEVOX09WTUZfSU5GTyAqSW5mbyA9Ci0gICAgKEVGSV9YRU5fT1ZNRl9JTkZPICopKFVJTlROKSBP
Vk1GX0lORk9fUEhZU0lDQUxfQUREUkVTUzsKKyAgLy8KKyAgLy8gR2V0IEU4MjAgcHJvZHVjZWQg
YnkgaHZtbG9hZGVyCisgIC8vCisgIGlmIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKSB7Cisg
ICAgQVNTRVJUIChtWGVuSHZtbG9hZGVySW5mby0+RTgyMCA8IE1BWF9BRERSRVNTKTsKKyAgICAq
RW50cmllcyA9IChFRklfRTgyMF9FTlRSWTY0ICopKFVJTlROKSBtWGVuSHZtbG9hZGVySW5mby0+
RTgyMDsKKyAgICAqQ291bnQgPSBtWGVuSHZtbG9hZGVySW5mby0+RTgyMEVudHJpZXNDb3VudDsK
IAotICBpZiAoQXNjaWlTdHJDbXAgKChDSEFSOCAqKSBJbmZvLT5TaWduYXR1cmUsICJYZW5IVk1P
Vk1GIikpIHsKLSAgICByZXR1cm4gRUZJX05PVF9GT1VORDsKKyAgICByZXR1cm4gRUZJX1NVQ0NF
U1M7CiAgIH0KIAotICBBU1NFUlQgKEluZm8tPkU4MjAgPCBNQVhfQUREUkVTUyk7Ci0gICpFbnRy
aWVzID0gKEVGSV9FODIwX0VOVFJZNjQgKikoVUlOVE4pIEluZm8tPkU4MjA7Ci0gICpDb3VudCA9
IEluZm8tPkU4MjBFbnRyaWVzQ291bnQ7Ci0KLSAgcmV0dXJuIEVGSV9TVUNDRVNTOworICByZXR1
cm4gRUZJX05PVF9GT1VORDsKIH0KIAogLyoqCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
