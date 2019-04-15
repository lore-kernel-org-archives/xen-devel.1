Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EB2C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:52:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC6C2073F
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC6C2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG09r-0000uH-Qx; Mon, 15 Apr 2019 11:52:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbw4=SR=citrix.com=prvs=001b8ac9c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hG09q-0000uC-Vi
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 11:52:19 +0000
X-Inumbo-ID: eaa9dbc8-5f74-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eaa9dbc8-5f74-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 11:52:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,353,1549929600"; d="scan'208";a="83568941"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Apr 2019 12:51:58 +0100
Message-ID: <20190415115158.18478-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] ts-host-install: Do not force MAC
 address of Xen vifs
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
Cc: Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415115158.A12s3_vL5PX2UTJvwQKxzn-QK_HqekpYhjecsFljhFI@z>

Rm9yIHNvbWUgYnJva2VuIGhvc3RzIHdlIGV4cGxpY2l0bHkgZm9yY2UgdGhlIG1hYyBhZGRyZXNz
IGluCnNvZnR3YXJlLiAgKFRoaXMgaXMgY29udHJvbGxlZCBieSB0aGUgRm9yY2VNYWNBZGRyZXNz
IGhvc3QgcHJvcGVydHkuKQoKV2UgYWNoaWV2ZSB0aGlzIGJ5IHdyaXRpbmcgYSB1ZGV2IHJ1bGUg
KHdoaWNoIGVuZHMgdXAgYm90aCBpbiB0aGUKaW5zdGFsbGVyIGFuZCBpbiB0aGUgaW5pdHJhbWZz
KSB3aGljaCBjYWxscyBgaXAgbGluayBzZXQgLi4uIGFkZHJlc3MnLgoKSG93ZXZlcjogaW4gc29t
ZSBjYXNlcyB3ZSBzaGFyZSB0aGUgaW5pdHJhbWZzIHdpdGggZ3Vlc3RzLiAgSW4KcGFydGljdWxh
ciwgdGhlIGB4ZW4tdG9vbHMnIHBhY2thZ2UgbGlrZXMgdG8gdXNlIHRoZSBob3N0IGluaXRyYW1m
cy4KCkluIHN0cmV0Y2ggYXQgbGVhc3QsIHRoaXMgcnVsZSwgZW1waXJpY2FsbHksIGFwcGxpZXMg
aW4gdGhlIGd1ZXN0IHRvby4KVGhlIHJlc3VsdCBpcyB0aGF0IHdpdGggRm9yY2VNYWNBZGRyZXNz
LCB0aGUgZ3Vlc3QgZW5kcyB1cCB3aXRoIHRoZQpzYW1lIG1hYyBhZGRyZXNzIGFzIHRoZSBob3N0
LCBicmVha2luZyBldmVyeXRoaW5nLgoKRml4IHRoaXMgYnkgZXhwbGljaXRseSBleGNsdWRpbmcg
WGVuIG5ldHdvcmsgaW50ZXJmYWNlcy4gIFRoZXNlIGFsbApnZXQgYSBwcm9wZXIgbWFjIGFkZHJl
c3MgZnJvbSB4ZW5zdG9yZSAodWx0aW1hdGVseSwgZnJvbSBvc3N0ZXN0Cml0c2VsZiB2aWEgdGhl
IGd1ZXN0IGNvbmZpZywgb3IgaW4gb3RoZXIgY29uZmlndXJhdGlvbnMgZnJvbSBsaWJ4bCkuCgpJ
IGRvbid0IGtub3cgd2h5IHRoaXMgYXBwYXJlbnRseSB3b3JrZWQgb24gamVzc2llLiAgU3RhcnR1
cCBvcmRlcgpjaGFuZ2VzIGFyZSBhIHBvc3NpYmlsaXR5LgoKQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgotLS0KIHRzLWhvc3QtaW5zdGFsbCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3Qt
aW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFsbAppbmRleCBlYTA4N2EyNS4uNDIxM2MzYTIgMTAwNzU1
Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAorKysgYi90cy1ob3N0LWluc3RhbGwKQEAgLTIxMiw3ICsy
MTIsNyBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJzdGJvb3QoJCkgewogICAgICAgICBmaWxlX3Np
bXBsZV93cml0ZV9jb250ZW50cwogICAgICAgICAgICAgKCRwZXJzaXN0ZW50X25ldF9ydWxlcywK
ICAgICAgICAgICAgICAkaG8tPntGbGFnc317J2ZvcmNlLW1hYy1hZGRyZXNzJ30gPyA8PEVORCA6
IDw8RU5EKTsKLVNVQlNZU1RFTT09Im5ldCIsIEFDVElPTj09ImFkZCIsIERSSVZFUlM9PSI/KiIs
IEtFUk5FTD09IiR3YW50cGh5c2lmIiwgUlVOICs9ICIkaXBjbWQgbGluayBzZXQgJHdhbnRwaHlz
aWYgYWRkcmVzcyAkaG8tPntFdGhlcn0iCitTVUJTWVNURU09PSJuZXQiLCBBQ1RJT049PSJhZGQi
LCBEUklWRVJTPT0iPyoiLCBTVUJTWVNURU1TIT0ieGVuIiwgS0VSTkVMPT0iJHdhbnRwaHlzaWYi
LCBSVU4gKz0gIiRpcGNtZCBsaW5rIHNldCAkd2FudHBoeXNpZiBhZGRyZXNzICRoby0+e0V0aGVy
fSIKIEVORAogU1VCU1lTVEVNPT0ibmV0IiwgQUNUSU9OPT0iYWRkIiwgRFJJVkVSUz09Ij8qIiwg
QVRUUnthZGRyZXNzfT09IiRoby0+e0V0aGVyfSIsIEFUVFJ7ZGV2X2lkfT09IjB4MCIsIEFUVFJ7
dHlwZX09PSIxIiwgS0VSTkVMPT0iZXRoKiIsIE5BTUU9IiR3YW50cGh5c2lmIgogRU5ECi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
