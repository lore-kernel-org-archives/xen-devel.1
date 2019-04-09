Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124EFC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9C820883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9C820883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDov8-0000cU-S3; Tue, 09 Apr 2019 11:28:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDov6-0000aO-TZ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:04 +0000
X-Inumbo-ID: 88d34e3c-5aba-11e9-af3d-bf0f088d2d4c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88d34e3c-5aba-11e9-af3d-bf0f088d2d4c;
 Tue, 09 Apr 2019 11:28:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096434"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:34 +0100
Message-ID: <20190409110844.14746-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 21/31] OvmfPkg/XenPlatformPei: Get E820 table
 via hypercall ...
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
Message-ID: <20190409110834.Z709GTo84ASMbnRLE9enTjtpmWnMPyqbmAlmrXTwYIw@z>

Li4gd2hlbiBodm1sb2FkZXIgaGF2ZW4ndCBydW5uZWQgYmVmb3JlIE9WTUYuIFRoZSBvbmx5IHdh
eSBsZWZ0IHRvIGdldAphbiBFODIwIHRhYmxlIGlzIHRvIGFzayBYZW4gdmlhIGFuIGh5cGVyY2Fs
bCwgdGhlIGNhbGwgY2FuIG9ubHkgYmUgbWFkZQpvbmNlIHNvIGtlZXAgdGhlIHJlc3VsdCBjYWNo
ZWQgZm9yIGxhdGVyLgoKQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24g
QWdyZWVtZW50IDEuMQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KLS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIHwgNDYgKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggMjNmZjMxMDJiNS4uZjhjZWU2NzFkOCAx
MDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCkBAIC0zMyw2ICszMyw3IEBACiAjaW5jbHVkZSA8TGlicmFyeS9N
dHJyTGliLmg+CiAjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYvaHZtL3N0
YXJ0X2luZm8uaD4KICNpbmNsdWRlIDxMaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi5oPgorI2luY2x1
ZGUgPEluZHVzdHJ5U3RhbmRhcmQvWGVuL21lbW9yeS5oPgogCiAjaW5jbHVkZSAiUGxhdGZvcm0u
aCIKICNpbmNsdWRlICJYZW4uaCIKQEAgLTQ2LDYgKzQ3LDggQEAgRUZJX1hFTl9JTkZPIG1YZW5J
bmZvOwogLy8gT25seSB0aGUgRTgyMCB0YWJsZSBpcyB1c2VkIGJ5IE9WTUYuCiAvLwogRUZJX1hF
Tl9PVk1GX0lORk8gKm1YZW5Idm1sb2FkZXJJbmZvOworRUZJX0U4MjBfRU5UUlk2NCBFODIwRW50
cmllc1sxMjhdOworVUlOVDMyIEU4MjBFbnRyaWVzQ291bnQ7CiAKIC8qKgogICBSZXR1cm5zIEU4
MjAgbWFwIHByb3ZpZGVkIGJ5IFhlbgpAQCAtNjEsNiArNjQsMTIgQEAgWGVuR2V0RTgyME1hcCAo
CiAgIFVJTlQzMiAqQ291bnQKICAgKQogeworICBJTlROIFJldHVybkNvZGU7CisgIHhlbl9tZW1v
cnlfbWFwX3QgUGFyYW1ldGVyczsKKyAgVUlOVE4gTG9vcEluZGV4OworICBVSU5UTiBJbmRleDsK
KyAgRUZJX0U4MjBfRU5UUlk2NCBUbXBFbnRyeTsKKwogICAvLwogICAvLyBHZXQgRTgyMCBwcm9k
dWNlZCBieSBodm1sb2FkZXIKICAgLy8KQEAgLTcyLDcgKzgxLDQyIEBAIFhlbkdldEU4MjBNYXAg
KAogICAgIHJldHVybiBFRklfU1VDQ0VTUzsKICAgfQogCi0gIHJldHVybiBFRklfTk9UX0ZPVU5E
OworICAvLworICAvLyBPdGhlcndpc2UsIGdldCB0aGUgRTgyMCB0YWJsZSBmcm9tIHRoZSBYZW4g
aHlwZXJ2aXNvcgorICAvLworCisgIGlmIChFODIwRW50cmllc0NvdW50ID4gMCkgeworICAgICpF
bnRyaWVzID0gRTgyMEVudHJpZXM7CisgICAgKkNvdW50ID0gRTgyMEVudHJpZXNDb3VudDsKKyAg
ICByZXR1cm4gRUZJX1NVQ0NFU1M7CisgIH0KKworICBQYXJhbWV0ZXJzLm5yX2VudHJpZXMgPSAx
Mjg7CisgIHNldF94ZW5fZ3Vlc3RfaGFuZGxlIChQYXJhbWV0ZXJzLmJ1ZmZlciwgRTgyMEVudHJp
ZXMpOworCisgIC8vIFJldHVybnMgYSBlcnJubworICBSZXR1cm5Db2RlID0gWGVuSHlwZXJjYWxs
TWVtb3J5T3AgKFhFTk1FTV9tZW1vcnlfbWFwLCAmUGFyYW1ldGVycyk7CisgIEFTU0VSVCAoUmV0
dXJuQ29kZSA9PSAwKTsKKworICBFODIwRW50cmllc0NvdW50ID0gUGFyYW1ldGVycy5ucl9lbnRy
aWVzOworCisgIC8vCisgIC8vIFNvcnQgRTgyMCBlbnRyaWVzCisgIC8vCisgIGZvciAoTG9vcElu
ZGV4ID0gMTsgTG9vcEluZGV4IDwgRTgyMEVudHJpZXNDb3VudDsgTG9vcEluZGV4KyspIHsKKyAg
ICBmb3IgKEluZGV4ID0gTG9vcEluZGV4OyBJbmRleCA8IEU4MjBFbnRyaWVzQ291bnQ7IEluZGV4
KyspIHsKKyAgICAgIGlmIChFODIwRW50cmllc1tJbmRleCAtIDFdLkJhc2VBZGRyID4gRTgyMEVu
dHJpZXNbSW5kZXhdLkJhc2VBZGRyKSB7CisgICAgICAgIFRtcEVudHJ5ID0gRTgyMEVudHJpZXNb
SW5kZXhdOworICAgICAgICBFODIwRW50cmllc1tJbmRleF0gPSBFODIwRW50cmllc1tJbmRleCAt
IDFdOworICAgICAgICBFODIwRW50cmllc1tJbmRleCAtIDFdID0gVG1wRW50cnk7CisgICAgICB9
CisgICAgfQorICB9CisKKyAgKkNvdW50ID0gRTgyMEVudHJpZXNDb3VudDsKKyAgKkVudHJpZXMg
PSBFODIwRW50cmllczsKKworICByZXR1cm4gRUZJX1NVQ0NFU1M7CiB9CiAKIC8qKgotLSAKQW50
aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
