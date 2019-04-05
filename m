Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29066C282CE
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 20:52:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED4582146F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 20:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED4582146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCVof-0006U4-NO; Fri, 05 Apr 2019 20:52:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MFU5=SH=citrix.com=prvs=991f7b3e9=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hCVod-0006Tz-Pr
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 20:51:59 +0000
X-Inumbo-ID: a6e871bf-57e4-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a6e871bf-57e4-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 20:51:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="82896979"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Apr 2019 21:51:48 +0100
Message-ID: <1554497508-32708-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/xl: use libxl_domain_info to get domain
 type for vcpu-pin
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
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405205148.5G-ys2OUd47mczJcdeA2tWQ31BxvK27JsPj15omdi-8@z>

UGFyc2luZyB0aGUgY29uZmlnIHNlZW1zIHRvIGJlIGFuIG92ZXJraWxsIGZvciB0aGlzIHBhcnRp
Y3VsYXIgdGFzawphbmQgdGhlIGNvbmZpZyBtaWdodCBzaW1wbHkgYmUgYWJzZW50LiBUeXBlIHJl
dHVybmVkIHNob3VsZCBiZSBlaXRoZXIKTElCWExfRE9NQUlOX1RZUEVfSFZNIG9yIExJQlhMX0RP
TUFJTl9UWVBFX1BWIGJ1dCBpbiB0aGF0IGNvbnRleHQKZGlzdGluY3Rpb24gYmV0d2VlbiBQVkgg
YW5kIEhWTSBzaG91bGQgYmUgaXJyZWxldmFudC4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhp
bmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KIHRvb2xzL3hsL3hsX3ZjcHUuYyB8
IDEzICsrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfdmNwdS5jIGIvdG9vbHMveGwveGxf
dmNwdS5jCmluZGV4IDcxZDNhNWMuLjRhNGQwZmEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3Zj
cHUuYworKysgYi90b29scy94bC94bF92Y3B1LmMKQEAgLTI4NCwxOSArMjg0LDE0IEBAIGludCBt
YWluX3ZjcHVwaW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCiAgICAgLyogT25seSBoYXJkIGFm
ZmluaXR5IG1hdHRlcnMgaGVyZSAqLwogICAgIGlmICghaWdub3JlX21hc2tzKSB7Ci0gICAgICAg
IGxpYnhsX2RvbWFpbl9jb25maWcgZF9jb25maWc7CisgICAgICAgIGxpYnhsX2RvbWluZm8gZG9t
aW5mbzsKIAotICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnX2luaXQoJmRfY29uZmlnKTsKLSAg
ICAgICAgcmMgPSBsaWJ4bF9yZXRyaWV2ZV9kb21haW5fY29uZmlndXJhdGlvbihjdHgsIGRvbWlk
LCAmZF9jb25maWcpOwotICAgICAgICBpZiAocmMpIHsKLSAgICAgICAgICAgIGZwcmludGYoc3Rk
ZXJyLCAiQ291bGQgbm90IHJldHJpZXZlIGRvbWFpbiBjb25maWd1cmF0aW9uXG4iKTsKLSAgICAg
ICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWdfZGlzcG9zZSgmZF9jb25maWcpOworICAgICAgICBp
ZiAobGlieGxfZG9tYWluX2luZm8oY3R4LCAmZG9taW5mbywgZG9taWQpKSB7CisgICAgICAgICAg
ICBmcHJpbnRmKHN0ZGVyciwgIkNvdWxkIG5vdCBnZXQgZG9tYWluIGluZm9cbiIpOwogICAgICAg
ICAgICAgZ290byBvdXQ7CiAgICAgICAgIH0KIAotICAgICAgICBhcHBseV9nbG9iYWxfYWZmaW5p
dHlfbWFza3MoZF9jb25maWcuYl9pbmZvLnR5cGUsIGhhcmQsIDEpOwotCi0gICAgICAgIGxpYnhs
X2RvbWFpbl9jb25maWdfZGlzcG9zZSgmZF9jb25maWcpOworICAgICAgICBhcHBseV9nbG9iYWxf
YWZmaW5pdHlfbWFza3MoZG9taW5mby5kb21haW5fdHlwZSwgaGFyZCwgMSk7CiAgICAgfQogCiAg
ICAgaWYgKGZvcmNlKSB7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
