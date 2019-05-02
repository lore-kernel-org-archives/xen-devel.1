Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C33C43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 06:58:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D362085A
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 06:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D362085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM5fX-0000Ua-D5; Thu, 02 May 2019 06:58:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM5fV-0000UU-Fm
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 06:58:09 +0000
X-Inumbo-ID: a3a6c216-6ca7-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a3a6c216-6ca7-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 06:58:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 00:58:06 -0600
Message-Id: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 00:58:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502065801.zZzm_vxje-OwP_Ir_IgGp2mKkFhG0ePyLbm7ppVgacc@z>

VGhpcyBpcyB3aGF0IGJvdGggY2FsbGVycyBvZiBndWVzdF9waHlzbWFwX2FkZF9wYWdlKCkgaW4g
bWVtb3J5LmMgd2FudAooZm9yIHRoZSAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKCkgY2FzZSksIGFu
ZCBpdCBpcyBhbHNvIHdoYXQgYm90aApjYWxsZXJzIGluIGdudHRhYl90cmFuc2ZlcigpIG5lZWQg
KGJ1dCBoYXZlIGJlZW4gbGFja2luZykuIFRoZSBvdGhlcgooeDg2LXNwZWNpZmljKSBjYWxsZXJz
IGFyZSBhbGwgSFZNLW9ubHksIGFuZCBoZW5jZSB1bmFmZmVjdGVkIGJ5IHRoaXMKY2hhbmdlLgoK
U2FkbHkgdGhpcyBpc24ndCBlbm91Z2ggeWV0IHRvIGRyb3AgQXJtJ3MgZHVtbXkgbWFjcm8sIGFz
IHRoZXJlJ3Mgb25lCm1vcmUgdXNlIGluIHBhZ2VfYWxsb2MuYy4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
YworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKQEAgLTg0MSwxNSArODQxLDE5IEBAIGd1ZXN0
X3BoeXNtYXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4gKmQKICAgICAgICAgICogYW55IGd1ZXN0
LXJlcXVlc3RlZCB0eXBlIGNoYW5nZXMgc3VjY2VlZCBhbmQgcmVtb3ZlIHRoZSBJT01NVQogICAg
ICAgICAgKiBlbnRyeSkuCiAgICAgICAgICAqLwotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0
X3N5bmMoZCkgfHwgdCAhPSBwMm1fcmFtX3J3ICkKKyAgICAgICAgaWYgKCB0ICE9IHAybV9yYW1f
cncgKQogICAgICAgICAgICAgcmV0dXJuIDA7CiAKICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAo
MVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsrcGFnZSApCiAgICAgICAgIHsKLSAgICAgICAgICAg
IGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRhYmxlX3BhZ2UpICkKKyAg
ICAgICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCisgICAgICAgICAgICAgICAg
Lyogbm90aGluZyAqLzsKKyAgICAgICAgICAgIGVsc2UgaWYgKCBnZXRfcGFnZV9hbmRfdHlwZShw
YWdlLCBkLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQogICAgICAgICAgICAgICAgIHB1dF9wYWdlX2Fu
ZF90eXBlKHBhZ2UpOwogICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOworCisgICAgICAgICAgICBzZXRfZ3Bmbl9mcm9tX21mbihtZm5feChtZm4pICsgaSwg
Z2ZuX3goZ2ZuKSArIGkpOwogICAgICAgICB9CiAKICAgICAgICAgcmV0dXJuIDA7Ci0tLSBhL3hl
bi9jb21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9tZW1vcnkuYwpAQCAtMjcwLDE2ICsy
NzAsMTAgQEAgc3RhdGljIHZvaWQgcG9wdWxhdGVfcGh5c21hcChzdHJ1Y3QgbWVtbwogCiAgICAg
ICAgICAgICBndWVzdF9waHlzbWFwX2FkZF9wYWdlKGQsIF9nZm4oZ3BmbiksIG1mbiwgYS0+ZXh0
ZW50X29yZGVyKTsKIAotICAgICAgICAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQp
ICkKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBmb3IgKCBqID0gMDsgaiA8ICgxVSA8
PCBhLT5leHRlbnRfb3JkZXIpOyBqKysgKQotICAgICAgICAgICAgICAgICAgICBzZXRfZ3Bmbl9m
cm9tX21mbihtZm5feChtZm5fYWRkKG1mbiwgaikpLCBncGZuICsgaik7Ci0KLSAgICAgICAgICAg
ICAgICAvKiBJbmZvcm0gdGhlIGRvbWFpbiBvZiB0aGUgbmV3IHBhZ2UncyBtYWNoaW5lIGFkZHJl
c3MuICovIAotICAgICAgICAgICAgICAgIGlmICggdW5saWtlbHkoX19jb3B5X21mbl90b19ndWVz
dF9vZmZzZXQoYS0+ZXh0ZW50X2xpc3QsIGksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZm4pKSApCi0gICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0OwotICAgICAgICAgICAgfQorICAgICAgICAgICAgaWYgKCAhcGFnaW5nX21vZGVf
dHJhbnNsYXRlKGQpICYmCisgICAgICAgICAgICAgICAgIC8qIEluZm9ybSB0aGUgZG9tYWluIG9m
IHRoZSBuZXcgcGFnZSdzIG1hY2hpbmUgYWRkcmVzcy4gKi8KKyAgICAgICAgICAgICAgICAgdW5s
aWtlbHkoX19jb3B5X21mbl90b19ndWVzdF9vZmZzZXQoYS0+ZXh0ZW50X2xpc3QsIGksIG1mbikp
ICkKKyAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgfQogICAgIH0KIApAQCAtNzU1
LDE1ICs3NDksMTEgQEAgc3RhdGljIGxvbmcgbWVtb3J5X2V4Y2hhbmdlKFhFTl9HVUVTVF9IQQog
ICAgICAgICAgICAgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShkLCBfZ2ZuKGdwZm4pLCBtZm4sCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4Y2gub3V0LmV4dGVudF9vcmRlcik7
CiAKLSAgICAgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCi0gICAgICAg
ICAgICB7Ci0gICAgICAgICAgICAgICAgZm9yICggayA9IDA7IGsgPCAoMVVMIDw8IGV4Y2gub3V0
LmV4dGVudF9vcmRlcik7IGsrKyApCi0gICAgICAgICAgICAgICAgICAgIHNldF9ncGZuX2Zyb21f
bWZuKG1mbl94KG1mbl9hZGQobWZuLCBrKSksIGdwZm4gKyBrKTsKLSAgICAgICAgICAgICAgICBp
ZiAoIF9fY29weV9tZm5fdG9fZ3Vlc3Rfb2Zmc2V0KGV4Y2gub3V0LmV4dGVudF9zdGFydCwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpIDw8IG91dF9j
aHVua19vcmRlcikgKyBqLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWZuKSApCi0gICAgICAgICAgICAgICAgICAgIHJjID0gLUVGQVVMVDsKLSAgICAg
ICAgICAgIH0KKyAgICAgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSAmJgor
ICAgICAgICAgICAgICAgICBfX2NvcHlfbWZuX3RvX2d1ZXN0X29mZnNldChleGNoLm91dC5leHRl
bnRfc3RhcnQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChp
IDw8IG91dF9jaHVua19vcmRlcikgKyBqLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtZm4pICkKKyAgICAgICAgICAgICAgICByYyA9IC1FRkFVTFQ7CiAgICAg
ICAgIH0KICAgICAgICAgQlVHX09OKCAhKGQtPmlzX2R5aW5nKSAmJiAoaiAhPSAoMVVMIDw8IG91
dF9jaHVua19vcmRlcikpICk7CiAKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
