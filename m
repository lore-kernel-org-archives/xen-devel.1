Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283D5C28CC6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 09:59:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A6E2805A
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 09:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A6E2805A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxnavi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjk9-0004rN-4A; Mon, 03 Jun 2019 09:59:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjk7-0004r9-Kc
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:59:03 +0000
X-Inumbo-ID: 35ca41bd-85e6-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35ca41bd-85e6-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 09:59:02 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 3 Jun 2019 17:56:48 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 17:58:30 +0800
Message-ID: <1559555910-3192-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH v1] xen: notifier: refine 'notifier_head',
 use 'list_head' directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603095830.qCynIHb_WeznKIYliMnMCzxfeWi6QmpS2webr2f0Sg8@z>

J25vdGlmaWVyX2Jsb2NrJyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVuIHVz
ZWQgZm9yCidub3RpZmllcl9oZWFkJywgdGhpcyBtYWtlcyBhIGxpdHRsZSBjbGVhcmVyLgoKU2ln
bmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPgotLS0KIHhl
bi9jb21tb24vbm90aWZpZXIuYyAgICAgIHwgMTIgKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS94
ZW4vbm90aWZpZXIuaCB8ICA3ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL25vdGlmaWVyLmMg
Yi94ZW4vY29tbW9uL25vdGlmaWVyLmMKaW5kZXggMzQ0ODhhOC4uYzllYTQ0ZCAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9ub3RpZmllci5jCisrKyBiL3hlbi9jb21tb24vbm90aWZpZXIuYwpAQCAt
MjEsMTAgKzIxLDEwIEBACiB2b2lkIF9faW5pdCBub3RpZmllcl9jaGFpbl9yZWdpc3RlcigKICAg
ICBzdHJ1Y3Qgbm90aWZpZXJfaGVhZCAqbmgsIHN0cnVjdCBub3RpZmllcl9ibG9jayAqbikKIHsK
LSAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjaGFpbiA9ICZuaC0+aGVhZC5jaGFpbjsKKyAgICBzdHJ1
Y3QgbGlzdF9oZWFkICpjaGFpbiA9ICZuaC0+aGVhZDsKICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxv
Y2sgKm5iOwogCi0gICAgd2hpbGUgKCBjaGFpbi0+bmV4dCAhPSAmbmgtPmhlYWQuY2hhaW4gKQor
ICAgIHdoaWxlICggY2hhaW4tPm5leHQgIT0gJm5oLT5oZWFkICkKICAgICB7CiAgICAgICAgIG5i
ID0gbGlzdF9lbnRyeShjaGFpbi0+bmV4dCwgc3RydWN0IG5vdGlmaWVyX2Jsb2NrLCBjaGFpbik7
CiAgICAgICAgIGlmICggbi0+cHJpb3JpdHkgPiBuYi0+cHJpb3JpdHkgKQpAQCAtNzEsMTYgKzcx
LDE2IEBAIGludCBub3RpZmllcl9jYWxsX2NoYWluKAogewogICAgIGludCByZXQgPSBOT1RJRllf
RE9ORTsKICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjdXJzb3I7Ci0gICAgc3RydWN0IG5vdGlmaWVy
X2Jsb2NrICpuYjsKKyAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iID0gTlVMTDsKICAgICBi
b29sX3QgcmV2ZXJzZSA9ICEhKHZhbCAmIE5PVElGWV9SRVZFUlNFKTsKIAotICAgIGN1cnNvciA9
ICYocGN1cnNvciAmJiAqcGN1cnNvciA/ICpwY3Vyc29yIDogJm5oLT5oZWFkKS0+Y2hhaW47Cisg
ICAgY3Vyc29yID0gcGN1cnNvciAmJiAqcGN1cnNvciA/ICYoKnBjdXJzb3IpLT5jaGFpbiA6ICZu
aC0+aGVhZDsKIAogICAgIGRvIHsKICAgICAgICAgY3Vyc29yID0gcmV2ZXJzZSA/IGN1cnNvci0+
cHJldiA6IGN1cnNvci0+bmV4dDsKLSAgICAgICAgbmIgPSBsaXN0X2VudHJ5KGN1cnNvciwgc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrLCBjaGFpbik7Ci0gICAgICAgIGlmICggY3Vyc29yID09ICZuaC0+
aGVhZC5jaGFpbiApCisgICAgICAgIGlmICggY3Vyc29yID09ICZuaC0+aGVhZCApCiAgICAgICAg
ICAgICBicmVhazsKKyAgICAgICAgbmIgPSBsaXN0X2VudHJ5KGN1cnNvciwgc3RydWN0IG5vdGlm
aWVyX2Jsb2NrLCBjaGFpbik7CiAgICAgICAgIHJldCA9IG5iLT5ub3RpZmllcl9jYWxsKG5iLCB2
YWwsIHYpOwogICAgIH0gd2hpbGUgKCAhKHJldCAmIE5PVElGWV9TVE9QX01BU0spICk7CiAKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9ub3RpZmllci5oIGIveGVuL2luY2x1ZGUveGVuL25v
dGlmaWVyLmgKaW5kZXggZDFmZjliMS4uMDkyMTIxMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
eGVuL25vdGlmaWVyLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL25vdGlmaWVyLmgKQEAgLTI5LDEz
ICsyOSwxMiBAQCBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgewogfTsKIAogc3RydWN0IG5vdGlmaWVy
X2hlYWQgewotICAgIHN0cnVjdCBub3RpZmllcl9ibG9jayBoZWFkOworICAgIHN0cnVjdCBsaXN0
X2hlYWQgaGVhZDsKIH07CiAKLSNkZWZpbmUgTk9USUZJRVJfSU5JVChuYW1lKSB7IC5oZWFkLmNo
YWluID0gTElTVF9IRUFEX0lOSVQobmFtZS5oZWFkLmNoYWluKSB9Ci0KICNkZWZpbmUgTk9USUZJ
RVJfSEVBRChuYW1lKSBcCi0gICAgc3RydWN0IG5vdGlmaWVyX2hlYWQgbmFtZSA9IE5PVElGSUVS
X0lOSVQobmFtZSkKKyAgICBzdHJ1Y3Qgbm90aWZpZXJfaGVhZCBuYW1lID0geyAuaGVhZCA9IExJ
U1RfSEVBRF9JTklUKG5hbWUuaGVhZCkgfQorCiAKIHZvaWQgbm90aWZpZXJfY2hhaW5fcmVnaXN0
ZXIoCiAgICAgc3RydWN0IG5vdGlmaWVyX2hlYWQgKm5oLCBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
Km5iKTsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
