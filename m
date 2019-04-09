Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D78C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E4C20883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E4C20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDovJ-0000px-24; Tue, 09 Apr 2019 11:28:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDovH-0000nI-1m
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:15 +0000
X-Inumbo-ID: 905e3e2f-5aba-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 905e3e2f-5aba-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:28:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096468"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:36 +0100
Message-ID: <20190409110844.14746-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 23/31] OvmfPkg/XenPlatformPei: Reserve VGA
 memory region, to boot Linux
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
Message-ID: <20190409110836.xkwjKTx-1mUxWy43nyVnspMAmZGXK6FjyF3jLftwikY@z>

TGludXggcGFuaWMgaWYgdGhpcyByZWdpb24gaXNuJ3QgcmVzZXJ2ZWQuCgpXaGVuIExpbnV4IGlz
IGJvb3RlZCBvbiBFRkkgc3lzdGVtLCBpdCBleHBlY3RzIHRoZSBtZW1vcnkgYXQgMHhhMDAwMCB0
bwpfbm90XyBiZSBjb252ZW50aW9uYWwgbWVtb3J5LiBPdGhlcndpc2UgYSB2YXJpYWJsZSBpc24n
dCBpbml0aWFsaXNlZApwcm9wZXJseSBhbmQgTGludXggcGFuaWMgd2hlbiBhIHZpcnR1YWwgY29u
c29sZS90ZXJtaW5hbCBpcyBhc2tlZCB0byBiZQpjcmVhdGVkLgoKU2VlIGZvciBtb3JlIGRldGFp
bDoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE5LTAzL21zZzAyMTM5Lmh0bWwKCkNvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJp
YnV0aW9uIEFncmVlbWVudCAxLjEKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyB8
IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvWGVuLmMKaW5kZXggN2I1MDNmMmM0ZS4uMjVmMTJjMmY5YyAxMDA2NDQKLS0tIGEv
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1hlbi5jCkBAIC0yOTQsNiArMjk0LDEyIEBAIFhlblB1Ymxpc2hSYW1SZWdpb25zICgKICAgU3Rh
dHVzID0gWGVuR2V0RTgyME1hcCAoJkU4MjBNYXAsICZFODIwRW50cmllc0NvdW50KTsKICAgQVNT
RVJUX0VGSV9FUlJPUiAoU3RhdHVzKTsKIAorICBBZGRNZW1vcnlCYXNlU2l6ZUhvYiAoMCwgMHhB
MDAwMCk7CisgIC8vCisgIC8vIFZpZGVvIG1lbW9yeSArIExlZ2FjeSBCSU9TIHJlZ2lvbiwgdG8g
YWxsb3cgTGludXggdG8gYm9vdC4KKyAgLy8KKyAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhv
YiAoMHhBMDAwMCwgQkFTRV8xTUIgLSAweEEwMDAwLCBUUlVFKTsKKwogICBmb3IgKEluZGV4ID0g
MDsgSW5kZXggPCBFODIwRW50cmllc0NvdW50OyBJbmRleCsrKSB7CiAgICAgVUlOVDY0IEJhc2U7
CiAgICAgVUlOVDY0IEVuZDsKQEAgLTMwNyw2ICszMTMsMTYgQEAgWGVuUHVibGlzaFJhbVJlZ2lv
bnMgKAogICAgIEJhc2UgPSBBTElHTl9WQUxVRSAoRW50cnktPkJhc2VBZGRyLCAoVUlOVDY0KUVG
SV9QQUdFX1NJWkUpOwogICAgIEVuZCA9IChFbnRyeS0+QmFzZUFkZHIgKyBFbnRyeS0+TGVuZ3Ro
KSAmIH4oVUlOVDY0KUVGSV9QQUdFX01BU0s7CiAKKyAgICAvLworICAgIC8vIElnbm9yZSB0aGUg
Zmlyc3QgMU1CLCB0aGlzIGlzIGhhbmRsZWQgYmVmb3JlIHRoZSBsb29wLgorICAgIC8vCisgICAg
aWYgKEJhc2UgPCBCQVNFXzFNQikgeworICAgICAgQmFzZSA9IEJBU0VfMU1COworICAgIH0KKyAg
ICBpZiAoQmFzZSA+PSBFbmQpIHsKKyAgICAgIGNvbnRpbnVlOworICAgIH0KKwogICAgIHN3aXRj
aCAoRW50cnktPlR5cGUpIHsKICAgICBjYXNlIEVmaUFjcGlBZGRyZXNzUmFuZ2VNZW1vcnk6CiAg
ICAgICBBZGRNZW1vcnlSYW5nZUhvYiAoQmFzZSwgRW5kKTsKLS0gCkFudGhvbnkgUEVSQVJECgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
