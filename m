Return-Path: <SRS0=QKFq=WI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B9CC31E40
	for <xen-devel@archiver.kernel.org>; Mon, 12 Aug 2019 17:18:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7469D20644
	for <xen-devel@archiver.kernel.org>; Mon, 12 Aug 2019 17:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="AC1ZbQoA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7469D20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxDwv-0005Bi-Db; Mon, 12 Aug 2019 17:17:37 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxDwu-0005Bd-3V
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:17:36 +0000
X-Inumbo-ID: 1273b48e-bd25-11e9-9cfd-9fa67abaf090
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1273b48e-bd25-11e9-9cfd-9fa67abaf090;
 Mon, 12 Aug 2019 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565630253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=15oOx+kRR9kNeM4bgwzmh56Ql+RJzLZVepT7/OR4WbY=;
 b=AC1ZbQoAlc7WwEFZDeMeFBl3077ClhUVIxkMpn1BmxbBKQ1LVStVrvfZ
 OY8XPbGRP03dAwTjEdqn5Smdt3BMvLD85Oqyiu6orSHG2C7km/wV/6vnP
 dPmNz6np60nXboSCnQN0pOgibyCpNvUXxJERHY9e6zoslMyyjuYGU5e6V E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AhH+NDXUSmcC5hxKxpJ3c2hu9IxEFkn1b/j/ySNo0uNeZZJ/yeD/tJ4GT+/XLfJ8NguxO30ZSZ
 im4xzy9E+adteypK/m/58382a84lS+x7JnymWTx4tMPc5RuKe0oqgrXInyBZcxWVf9sfEMr7hO
 D7zRL/4Shi3rgXaxEfi88QTYxXsq7nqvbsla9Ih+Z+q5u3EN6F5EAEBdkJ05THv/UrjnBkUCr6
 uMx6QRcF3x176fj/iT7UVn7hz8LVNWkyDcSrGzf3SluAcL0V/9KfTd/nMJDZ7l8R8tafTs4iul
 c/c=
X-SBRS: 2.7
X-MesageID: 4368646
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,378,1559534400"; 
   d="scan'208";a="4368646"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 12 Aug 2019 18:17:29 +0100
Message-ID: <20190812171729.4984-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vtd: Fix S3 resume following c/s 650c31d3af
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIDY1MGMzMWQzYWYgIng4Ni9JUlE6IGZpeCBsb2NraW5nIGFyb3VuZCB2ZWN0b3IgbWFuYWdl
bWVudCIgYWRqdXN0ZWQgdGhlCmxvY2tpbmcgaW4gYWRqdXN0X2lycV9hZmZpbml0eSgpLgoKVGhl
IFMzIHBhdGggZW5kcyB1cCBoZXJlIHZpYSBpb21tdV9yZXN1bWUoKSBiZWZvcmUgaW50ZXJydXB0
cyBhcmUgZW5hYmxlZCwgYXQKd2hpY2ggcG9pbnQgc3Bpbl9sb2NrX2lycSgpIHdoaWNoIGZhaWwg
QVNTRVJUKGxvY2FsX2lycV9pc19lbmFibGVkKCkpOyBidXQKd2l0aCBubyB3b3JraW5nIGNvbnNv
bGUuCgpVc2Ugc3Bpbl9sb2NrX2lycXNhdmUoKSBpbnN0ZWFkIHRvIGNvcGUgd2l0aCBpbnRlcnJ1
cHRzIGFscmVhZHkgYmVpbmcKZGlzYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGlu
dGVsLmNvbT4KQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKSSdtIGZhaXJs
eSBjb25maWRlbnQgdGhhdCB0aGUgQU1EIHNpZGUgb2YgdGhpbmdzIGlzIGZpbmUsIGJlY2F1c2UK
ZW5hYmxlX2lvbW11KCkgaXMgZW5jb21wYXNlZCBieSBhIHNwaW5fbG9ja19pcnFzYXZlKCkgYmxv
Y2suCi0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgfCA1ICsrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMKaW5kZXggNWQ3MjI3MGM1Yi4uZGVmYTc0ZmFlMyAxMDA2NDQK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTIxMzUsMTUgKzIxMzUsMTYgQEAgc3RhdGlj
IHZvaWQgYWRqdXN0X2lycV9hZmZpbml0eShzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQgKmRyaGQpCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogTlVNQV9OT19OT0RFOwogICAgIGNvbnN0IGNw
dW1hc2tfdCAqY3B1bWFzayA9IE5VTEw7CiAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjOworICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKICAgICBpZiAoIG5vZGUgPCBNQVhfTlVNTk9ERVMgJiYg
bm9kZV9vbmxpbmUobm9kZSkgJiYKICAgICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cygmbm9kZV90
b19jcHVtYXNrKG5vZGUpLCAmY3B1X29ubGluZV9tYXApICkKICAgICAgICAgY3B1bWFzayA9ICZu
b2RlX3RvX2NwdW1hc2sobm9kZSk7CiAKICAgICBkZXNjID0gaXJxX3RvX2Rlc2MoZHJoZC0+aW9t
bXUtPm1zaS5pcnEpOwotICAgIHNwaW5fbG9ja19pcnEoJmRlc2MtPmxvY2spOworICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZkZXNjLT5sb2NrLCBmbGFncyk7CiAgICAgZG1hX21zaV9zZXRfYWZmaW5p
dHkoZGVzYywgY3B1bWFzayk7Ci0gICAgc3Bpbl91bmxvY2tfaXJxKCZkZXNjLT5sb2NrKTsKKyAg
ICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXNjLT5sb2NrLCBmbGFncyk7CiB9CiAKIHN0YXRp
YyBpbnQgYWRqdXN0X3Z0ZF9pcnFfYWZmaW5pdGllcyh2b2lkKQotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
