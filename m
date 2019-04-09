Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EC8C10F14
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:13:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C47720880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C47720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDhBy-0006lO-DZ; Tue, 09 Apr 2019 03:12:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMgv=SL=citrix.com=prvs=995126bee=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hDhBw-0006l0-Ps
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:12:56 +0000
X-Inumbo-ID: 5eb50e31-5a75-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5eb50e31-5a75-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 03:12:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549929600"; d="scan'208";a="83070518"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Tue, 9 Apr 2019 04:12:40 +0100
Message-ID: <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org,
 jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, lersek@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409031240.5PSNJ3nYVlyY089G7mSz7Z-BCJbtG73n13ZuGiKs6Is@z>

T24gWGVuLCBodm1sb2FkZXIgZmlybXdhcmUgbGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxl
ZCBmb3IKZW51bWVyYXRlZCBQQ0kgZGV2aWNlIGJlZm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZN
RiBzZWVtcyB0bwpleHBlY3QgaXQgdG8gYmUgZGlzYWJsZWQgYW5kIHRyaWVzIHRvIHNpemUgUENJ
IEJBUnMgaW4gc2V2ZXJhbCBwbGFjZXMKd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2Vz
IEJBUjY0LCBmb3IgZXhhbXBsZSwgYmVpbmcKaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCgpG
aXggaXQgYnkgZGlzYWJsaW5nIFBDSSBhZGRyZXNzIGRlY29kaW5nIGV4cGxpY2l0bHkgYmVmb3Jl
IHRoZQpmaXJzdCBhdHRlbXB0IHRvIHNpemUgQkFScyBvbiBYZW4uCgpDb250cmlidXRlZC11bmRl
cjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNpZ25lZC1vZmYtYnk6IEln
b3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBpbiB2
MjoKKiBjb2Rpbmcgc3R5bGUgaXNzdWVzIGFuZCBtaW5vciBzdWdnZXN0aW9ucwotLS0KIE92bWZQ
a2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYyB8IDM1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMgYi9P
dm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKaW5kZXggZjc2MzEz
NC4uNjdhMzdjZCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIv
WGVuU3VwcG9ydC5jCisrKyBiL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1
cHBvcnQuYwpAQCAtNTUsNiArNTUsMzUgQEAgUGNhdFBjaVJvb3RCcmlkZ2VCYXJFeGlzdGVkICgK
ICAgRW5hYmxlSW50ZXJydXB0cyAoKTsKIH0KIAorI2RlZmluZSBQQ0lfQ09NTUFORF9ERUNPREUg
KChVSU5UMTYpKEVGSV9QQ0lfQ09NTUFORF9JT19TUEFDRSB8IFwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBFRklfUENJX0NPTU1BTkRfTUVNT1JZX1NQQUNFKSkKK1NUQVRJ
QworVk9JRAorUGNhdFBjaVJvb3RCcmlkZ2VEZWNvZGluZyAoCisgIElOICBVSU5UTiAgICAgICAg
ICAgICAgICAgICAgICAgICAgQWRkcmVzcywKKyAgSU4gIEJPT0xFQU4gICAgICAgICAgICAgICAg
ICAgICAgICBFbmFibGVkLAorICBPVVQgVUlOVDE2ICAgICAgICAgICAgICAgICAgICAgICAgICpP
cmlnaW5hbFZhbHVlCisgICkKK3sKKyAgVUlOVDE2ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBWYWx1ZTsKKworICAvLworICAvLyBQcmVzZXJ2ZSB0aGUgb3JpZ2luYWwgdmFsdWUKKyAgLy8K
KyAgVmFsdWUgPSAqT3JpZ2luYWxWYWx1ZTsKKyAgKk9yaWdpbmFsVmFsdWUgPSBQY2lSZWFkMTYg
KEFkZHJlc3MpOworCisgIGlmICghRW5hYmxlZCkgeworICAgIGlmICgqT3JpZ2luYWxWYWx1ZSAm
IFBDSV9DT01NQU5EX0RFQ09ERSkgeworICAgICAgUGNpV3JpdGUxNiAoQWRkcmVzcywgKk9yaWdp
bmFsVmFsdWUgJiB+UENJX0NPTU1BTkRfREVDT0RFKTsKKyAgICB9CisgIH0gZWxzZSB7CisgICAg
aWYgKFZhbHVlICYgUENJX0NPTU1BTkRfREVDT0RFKSB7CisgICAgICBQY2lXcml0ZTE2IChBZGRy
ZXNzLCBWYWx1ZSk7CisgICAgfQorICB9Cit9CisKIFNUQVRJQwogVk9JRAogUGNhdFBjaVJvb3RC
cmlkZ2VQYXJzZUJhcnMgKApAQCAtODEsNiArMTEwLDEyIEBAIFBjYXRQY2lSb290QnJpZGdlUGFy
c2VCYXJzICgKICAgVUlOVDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIExpbWl0OwogICBQ
Q0lfUk9PVF9CUklER0VfQVBFUlRVUkUgICAgICAgICAgKk1lbUFwZXJ0dXJlOwogCisgIC8vIERp
c2FibGUgYWRkcmVzcyBkZWNvZGluZyBmb3IgZXZlcnkgZGV2aWNlIGJlZm9yZSBPVk1GIHN0YXJ0
cyBzaXppbmcgaXQKKyAgUGNhdFBjaVJvb3RCcmlkZ2VEZWNvZGluZyAoCisgICAgUENJX0xJQl9B
RERSRVNTIChCdXMsIERldmljZSwgRnVuY3Rpb24sIFBDSV9DT01NQU5EX09GRlNFVCksCisgICAg
RkFMU0UsIChVSU5UMTYgKikmT3JpZ2luYWxWYWx1ZQorICApOworCiAgIGZvciAoT2Zmc2V0ID0g
QmFyT2Zmc2V0QmFzZTsgT2Zmc2V0IDwgQmFyT2Zmc2V0RW5kOyBPZmZzZXQgKz0gc2l6ZW9mIChV
SU5UMzIpKSB7CiAgICAgUGNhdFBjaVJvb3RCcmlkZ2VCYXJFeGlzdGVkICgKICAgICAgIFBDSV9M
SUJfQUREUkVTUyAoQnVzLCBEZXZpY2UsIEZ1bmN0aW9uLCBPZmZzZXQpLAotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
