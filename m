Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB66C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:28:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E4520663
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E4520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDVFr-0002Q0-AD; Mon, 08 Apr 2019 14:28:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVFq-0002P4-Jl
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:28:10 +0000
X-Inumbo-ID: 8854d40a-5a0a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8854d40a-5a0a-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 14:28:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83010351"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Mon, 8 Apr 2019 15:24:01 +0100
Message-ID: <20190408142408.30419-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 24/31] OvmfPkg/XenPlatformPei: Ignore missing
 PCI Host Bridge on Xen PVH
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
Message-ID: <20190408142401.MMX-RT9evwYDduJPdMWv3dDXpd7xIrqWdeIzSfLgzek@z>

V2hlbiB0aGUgZGV2aWNlIElEIG9mIHRoZSBob3N0IGJyaWRnZSBpcyB1bmtub3duLCBjaGVjayBp
ZiB3ZSBhcmUKcnVubmluZyBhcyBhIFBWSCBndWVzdCBhcyB0aGVyZSBpcyBubyBQQ0kgYnVzIGlu
IHRoYXQgY2FzZS4KCkNvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFn
cmVlbWVudCAxLjEKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MjoKICAgIC0gVXNlIG5ldyBYRU5fUFZIX1BD
SV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQgbWFjcm8KCiBPdm1mUGtnL0luY2x1ZGUvT3ZtZlBsYXRm
b3Jtcy5oICAgfCA2ICsrKysrKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jIHwg
NyArKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9Pdm1mUGtnL0luY2x1ZGUvT3ZtZlBsYXRmb3Jtcy5oIGIvT3ZtZlBrZy9JbmNsdWRlL092bWZQ
bGF0Zm9ybXMuaAppbmRleCBjYzY3ZjQwYTg4Li4xY2U3MWUxOGVjIDEwMDY0NAotLS0gYS9Pdm1m
UGtnL0luY2x1ZGUvT3ZtZlBsYXRmb3Jtcy5oCisrKyBiL092bWZQa2cvSW5jbHVkZS9Pdm1mUGxh
dGZvcm1zLmgKQEAgLTQzLDQgKzQzLDEwIEBACiAvLwogI2RlZmluZSBBQ1BJX1RJTUVSX09GRlNF
VCAweDgKIAorLy8KKy8vIFdoZW4gcnVubmluZyBPVk1GIG9uIGEgWGVuIFBWSCBndWVzdCB0aGVy
ZSBpcyBubyBQQ0ksCisvLyBzbyAtMSBpcyByZXR1cm4gZm9yIHRoZSBIb3N0IEJyaWRnZSBEZXZp
Y2UgSUQuCisvLworI2RlZmluZSBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQgMHhG
RkZGCisKICNlbmRpZgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9y
bS5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCmluZGV4IDVlNmQ1NTNhZDUu
LmQ5MWNkOThiZjQgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0u
YworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMKQEAgLTI3OCw2ICsyNzgs
MTMgQEAgTWlzY0luaXRpYWxpemF0aW9uICgKICAgICAgIEFjcGlFbkJpdCAgPSBJQ0g5X0FDUElf
Q05UTF9BQ1BJX0VOOwogICAgICAgYnJlYWs7CiAgICAgZGVmYXVsdDoKKyAgICAgIGlmIChYZW5Q
dmhEZXRlY3RlZCAoKSkgeworICAgICAgICAvLworICAgICAgICAvLyBUaGVyZSBpcyBubyBQQ0kg
YnVzIGluIHRoaXMgY2FzZQorICAgICAgICAvLworICAgICAgICBQY2RTZXQxNlMgKFBjZE92bWZI
b3N0QnJpZGdlUGNpRGV2SWQsIFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9JRCk7Cisg
ICAgICAgIHJldHVybjsKKyAgICAgIH0KICAgICAgIERFQlVHICgoRUZJX0RfRVJST1IsICIlYTog
VW5rbm93biBIb3N0IEJyaWRnZSBEZXZpY2UgSUQ6IDB4JTA0eFxuIiwKICAgICAgICAgX19GVU5D
VElPTl9fLCBtSG9zdEJyaWRnZURldklkKSk7CiAgICAgICBBU1NFUlQgKEZBTFNFKTsKLS0gCkFu
dGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
