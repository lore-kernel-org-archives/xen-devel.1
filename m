Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72B1C10F14
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:28:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FBEB20663
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FBEB20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDVG8-0002ml-FH; Mon, 08 Apr 2019 14:28:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVG6-0002kA-Mz
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:28:26 +0000
X-Inumbo-ID: 91a55164-5a0a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 91a55164-5a0a-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 14:28:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83010387"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Mon, 8 Apr 2019 15:23:47 +0100
Message-ID: <20190408142408.30419-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 10/31] OvmfPkg/XenPlatformPei: Detect
 OVMF_INFO from hvmloader
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
Message-ID: <20190408142347.fcQlcFObr5nPfxfsHacEHIdyOq3ishJDFIIPh8HLJLs@z>

VGhpcyBzdHJ1Y3QgaXMgb25seSB1c2VmdWwgdG8gcmV0cmlldmUgdGhlIEU4MjAgdGFibGUuIFRo
ZQptWGVuSHZtbG9hZGVySW5mbyBpc24ndCB1c2VkIHlldCwgYnV0IHdpbGwgYmUgdXNlIGluIGEg
ZnVydGhlciBwYXRjaCB0bwpyZXRyaWV2ZSB0aGUgRTgyMCB0YWJsZS4KCkFsc28gcmVtb3ZlIHRo
ZSB1bnVzZWQgcG9pbnRlciBmcm9tIHRoZSBYZW5JbmZvIEhPQiBhcyB0aGF0IGluZm9ybWF0aW9u
CmlzIG9ubHkgdXNlZnVsIGluIHRoZSBYZW5QbGF0Zm9ybVBlaS4KCkNvbnRyaWJ1dGVkLXVuZGVy
OiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogT3ZtZlBrZy9JbmNs
dWRlL0d1aWQvWGVuSW5mby5oIHwgIDQgLS0tLQogT3ZtZlBrZy9QbGF0Zm9ybVBlaS9YZW4uYyAg
ICAgIHwgIDMgLS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jICAgfCAyMyArKysrKysr
KysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvSW5jbHVkZS9HdWlkL1hlbkluZm8uaCBiL092
bWZQa2cvSW5jbHVkZS9HdWlkL1hlbkluZm8uaAppbmRleCBkNTEyYjBiNjNmLi41ZDQ1NzlmMjQ0
IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZvLmgKKysrIGIvT3ZtZlBr
Zy9JbmNsdWRlL0d1aWQvWGVuSW5mby5oCkBAIC0yNCwxMCArMjQsNiBAQCB0eXBlZGVmIHN0cnVj
dCB7CiAgIC8vLwogICBWT0lEICpIeXBlclBhZ2VzOwogICAvLy8KLSAgLy8vIExvY2F0aW9uIG9m
IHRoZSBodm1faW5mbyBwYWdlLgotICAvLy8KLSAgVk9JRCAqSHZtSW5mbzsKLSAgLy8vCiAgIC8v
LyBIeXBlcnZpc29yIG1ham9yIHZlcnNpb24uCiAgIC8vLwogICBVSU5UMTYgVmVyc2lvbk1ham9y
OwpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvUGxhdGZv
cm1QZWkvWGVuLmMKaW5kZXggYWIzOGY5N2E2Ny4uNzUxODFiZTJmZCAxMDA2NDQKLS0tIGEvT3Zt
ZlBrZy9QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1BsYXRmb3JtUGVpL1hlbi5jCkBA
IC0xMDQsOSArMTA0LDYgQEAgWGVuQ29ubmVjdCAoCiAgIG1YZW5JbmZvLlZlcnNpb25NYWpvciA9
IChVSU5UMTYpKFhlblZlcnNpb24gPj4gMTYpOwogICBtWGVuSW5mby5WZXJzaW9uTWlub3IgPSAo
VUlOVDE2KShYZW5WZXJzaW9uICYgMHhGRkZGKTsKIAotICAvKiBUQkQ6IExvY2F0ZSBodm1faW5m
byBhbmQgcmVzZXJ2ZSBpdCBhd2F5LiAqLwotICBtWGVuSW5mby5Idm1JbmZvID0gTlVMTDsKLQog
ICBCdWlsZEd1aWREYXRhSG9iICgKICAgICAmZ0VmaVhlbkluZm9HdWlkLAogICAgICZtWGVuSW5m
bywKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCmluZGV4IDdjODJlNWI2OWIuLmE4NjY2NDFiNjcgMTAwNjQ0Ci0t
LSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYwpAQCAtMzksNiArMzksMTIgQEAgU1RBVElDIFVJTlQzMiBtWGVuTGVhZiA9IDA7
CiAKIEVGSV9YRU5fSU5GTyBtWGVuSW5mbzsKIAorLy8KKy8vIExvY2F0aW9uIG9mIHRoZSBmaXJt
d2FyZSBpbmZvIHN0cnVjdCBzZXR1cCBieSBodm1sb2FkZXIuCisvLyBPbmx5IHRoZSBFODIwIHRh
YmxlIGlzIHVzZWQgYnkgT1ZNRi4KKy8vCitFRklfWEVOX09WTUZfSU5GTyAqbVhlbkh2bWxvYWRl
ckluZm87CisKIC8qKgogICBSZXR1cm5zIEU4MjAgbWFwIHByb3ZpZGVkIGJ5IFhlbgogCkBAIC04
NCw2ICs5MCw4IEBAIFhlbkNvbm5lY3QgKAogICBVSU5UMzIgVHJhbnNmZXJSZWc7CiAgIFVJTlQz
MiBUcmFuc2ZlclBhZ2VzOwogICBVSU5UMzIgWGVuVmVyc2lvbjsKKyAgRUZJX1hFTl9PVk1GX0lO
Rk8gKkluZm87CisgIENIQVI4IFNpZ1tzaXplb2YgKEluZm8tPlNpZ25hdHVyZSkgKyAxXTsKIAog
ICBBc21DcHVpZCAoWGVuTGVhZiArIDIsICZUcmFuc2ZlclBhZ2VzLCAmVHJhbnNmZXJSZWcsIE5V
TEwsIE5VTEwpOwogICBtWGVuSW5mby5IeXBlclBhZ2VzID0gQWxsb2NhdGVQYWdlcyAoVHJhbnNm
ZXJQYWdlcyk7CkBAIC0xMDMsOCArMTExLDE5IEBAIFhlbkNvbm5lY3QgKAogICBtWGVuSW5mby5W
ZXJzaW9uTWFqb3IgPSAoVUlOVDE2KShYZW5WZXJzaW9uID4+IDE2KTsKICAgbVhlbkluZm8uVmVy
c2lvbk1pbm9yID0gKFVJTlQxNikoWGVuVmVyc2lvbiAmIDB4RkZGRik7CiAKLSAgLyogVEJEOiBM
b2NhdGUgaHZtX2luZm8gYW5kIHJlc2VydmUgaXQgYXdheS4gKi8KLSAgbVhlbkluZm8uSHZtSW5m
byA9IE5VTEw7CisgIC8vCisgIC8vIENoZWNrIGlmIHRoZXJlIGFyZSBpbmZvcm1hdGlvbiBsZWZ0
IGJ5IGh2bWxvYWRlcgorICAvLworCisgIEluZm8gPSAoRUZJX1hFTl9PVk1GX0lORk8gKikoVUlO
VE4pIE9WTUZfSU5GT19QSFlTSUNBTF9BRERSRVNTOworICAvLyBDb3B5IHRoZSBzaWduYXR1cmUs
IGFuZCBtYWtlIGl0IG51bGwtdGVybWluYXRlZC4KKyAgQXNjaWlTdHJuQ3B5UyhTaWcsIHNpemVv
ZiAoU2lnKSwKKyAgICAgICAgICAgICAgICAoQ0hBUjggKikgJkluZm8tPlNpZ25hdHVyZSwgc2l6
ZW9mIChJbmZvLT5TaWduYXR1cmUpKTsKKyAgaWYgKEFzY2lpU3RyQ21wIChTaWcsICJYZW5IVk1P
Vk1GIikgPT0gMCkgeworICAgIG1YZW5Idm1sb2FkZXJJbmZvID0gSW5mbzsKKyAgfSBlbHNlIHsK
KyAgICBtWGVuSHZtbG9hZGVySW5mbyA9IE5VTEw7CisgIH0KIAogICBCdWlsZEd1aWREYXRhSG9i
ICgKICAgICAmZ0VmaVhlbkluZm9HdWlkLAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
