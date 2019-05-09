Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57639C04AB1
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 13:45:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA19205C9
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 13:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA19205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjMk-0006Oq-Fb; Thu, 09 May 2019 13:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOjMk-0006Ok-3O
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:45:42 +0000
X-Inumbo-ID: ba397754-7260-11e9-9740-0f0c7ea2df55
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba397754-7260-11e9-9740-0f0c7ea2df55;
 Thu, 09 May 2019 13:45:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 07:45:37 -0600
Message-Id: <5CD42EFC020000780022D335@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 07:45:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
In-Reply-To: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 3/3] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_page()
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
 Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509134532.DxqlE3nKsYVthW4UsfnSCwdCVX1hLtO9D0JSWHy2G9Q@z>

VGhlIHR3byBjYWxsZXJzIGluIGNvbW1vbi9tZW1vcnkuYyBjdXJyZW50bHkgY2FsbCBzZXRfZ3Bm
bl9mcm9tX21mbigpCnRoZW1zZWx2ZXMsIHNvIG1vdmluZyB0aGUgY2FsbCBpbnRvIGd1ZXN0X3Bo
eXNtYXBfYWRkX3BhZ2UoKSBoZWxwcwp0aWR5IHRoZWlyIGNvZGUuCgpUaGUgdHdvIGNhbGxlcnMg
aW4gY29tbW9uL2dyYW50X3RhYmxlLmMgZmFpbCB0byBtYWtlIHRoYXQgY2FsbCBhbG9uZ3NpZGUK
dGhlIG9uZSB0byBndWVzdF9waHlzbWFwX2FkZF9wYWdlKCksIHNvIHdpbGwgYWN0dWFsbHkgZ2V0
IGZpeGVkIGJ5IHRoZQpjaGFuZ2UuCgpPdGhlciAoeDg2KSBjYWxsZXJzIGFyZSBIVk0gb25seSBh
bmQgYXJlIGhlbmNlIHVuYWZmZWN0ZWQgYnkgYSBjaGFuZ2UKdG8gdGhlIGZ1bmN0aW9uJ3MgIXBh
Z2luZ19tb2RlX3RyYW5zbGF0ZSgpIHBhcnQuCgpTYWRseSB0aGlzIGlzbid0IGVub3VnaCB5ZXQg
dG8gZHJvcCBBcm0ncyBkdW1teSBtYWNybywgYXMgdGhlcmUncyBvbmUKbW9yZSB1c2UgaW4gcGFn
ZV9hbGxvYy5jLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCnYyOiBS
ZS1iYXNlIG92ZXIgYWRkZWQgZWFybGllciBwYXRjaC4gUmUtd3JpdGUgZGVzY3JpcHRpb24uCgot
LS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBA
IC04MzMsMTUgKzgzMywxNiBAQCBndWVzdF9waHlzbWFwX2FkZF9wYWdlKHN0cnVjdCBkb21haW4g
KmQsCiAgICAgICAgICAqIGFueSBndWVzdC1yZXF1ZXN0ZWQgdHlwZSBjaGFuZ2VzIHN1Y2NlZWQg
YW5kIHJlbW92ZSB0aGUgSU9NTVUKICAgICAgICAgICogZW50cnkpLgogICAgICAgICAgKi8KLSAg
ICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKLSAgICAgICAgICAgIHJldHVybiAw
OwotCiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDFVTCA8PCBwYWdlX29yZGVyKTsgKytpLCAr
K3BhZ2UgKQogICAgICAgICB7Ci0gICAgICAgICAgICBpZiAoIGdldF9wYWdlX2FuZF90eXBlKHBh
Z2UsIGQsIFBHVF93cml0YWJsZV9wYWdlKSApCisgICAgICAgICAgICBpZiAoICFuZWVkX2lvbW11
X3B0X3N5bmMoZCkgKQorICAgICAgICAgICAgICAgIC8qIG5vdGhpbmcgKi87CisgICAgICAgICAg
ICBlbHNlIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRhYmxlX3BhZ2Up
ICkKICAgICAgICAgICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKICAgICAgICAgICAg
IGVsc2UKICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKworICAgICAgICAgICAgc2V0
X2dwZm5fZnJvbV9tZm4obWZuX3gobWZuKSArIGksIGdmbl94KGdmbikgKyBpKTsKICAgICAgICAg
fQogCiAgICAgICAgIHJldHVybiAwOwotLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCisrKyBiL3hl
bi9jb21tb24vbWVtb3J5LmMKQEAgLTI3MCwxNiArMjcwLDEwIEBAIHN0YXRpYyB2b2lkIHBvcHVs
YXRlX3BoeXNtYXAoc3RydWN0IG1lbW8KIAogICAgICAgICAgICAgZ3Vlc3RfcGh5c21hcF9hZGRf
cGFnZShkLCBfZ2ZuKGdwZm4pLCBtZm4sIGEtPmV4dGVudF9vcmRlcik7CiAKLSAgICAgICAgICAg
IGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCi0gICAgICAgICAgICB7Ci0gICAgICAg
ICAgICAgICAgZm9yICggaiA9IDA7IGogPCAoMVUgPDwgYS0+ZXh0ZW50X29yZGVyKTsgaisrICkK
LSAgICAgICAgICAgICAgICAgICAgc2V0X2dwZm5fZnJvbV9tZm4obWZuX3gobWZuX2FkZChtZm4s
IGopKSwgZ3BmbiArIGopOwotCi0gICAgICAgICAgICAgICAgLyogSW5mb3JtIHRoZSBkb21haW4g
b2YgdGhlIG5ldyBwYWdlJ3MgbWFjaGluZSBhZGRyZXNzLiAqLyAKLSAgICAgICAgICAgICAgICBp
ZiAoIHVubGlrZWx5KF9fY29weV9tZm5fdG9fZ3Vlc3Rfb2Zmc2V0KGEtPmV4dGVudF9saXN0LCBp
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbWZuKSkgKQotICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgICAgIH0K
KyAgICAgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSAmJgorICAgICAgICAg
ICAgICAgICAvKiBJbmZvcm0gdGhlIGRvbWFpbiBvZiB0aGUgbmV3IHBhZ2UncyBtYWNoaW5lIGFk
ZHJlc3MuICovCisgICAgICAgICAgICAgICAgIHVubGlrZWx5KF9fY29weV9tZm5fdG9fZ3Vlc3Rf
b2Zmc2V0KGEtPmV4dGVudF9saXN0LCBpLCBtZm4pKSApCisgICAgICAgICAgICAgICAgZ290byBv
dXQ7CiAgICAgICAgIH0KICAgICB9CiAKQEAgLTc1NSwxNSArNzQ5LDExIEBAIHN0YXRpYyBsb25n
IG1lbW9yeV9leGNoYW5nZShYRU5fR1VFU1RfSEEKICAgICAgICAgICAgIGd1ZXN0X3BoeXNtYXBf
YWRkX3BhZ2UoZCwgX2dmbihncGZuKSwgbWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBleGNoLm91dC5leHRlbnRfb3JkZXIpOwogCi0gICAgICAgICAgICBpZiAoICFwYWdp
bmdfbW9kZV90cmFuc2xhdGUoZCkgKQotICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIGZv
ciAoIGsgPSAwOyBrIDwgKDFVTCA8PCBleGNoLm91dC5leHRlbnRfb3JkZXIpOyBrKysgKQotICAg
ICAgICAgICAgICAgICAgICBzZXRfZ3Bmbl9mcm9tX21mbihtZm5feChtZm5fYWRkKG1mbiwgaykp
LCBncGZuICsgayk7Ci0gICAgICAgICAgICAgICAgaWYgKCBfX2NvcHlfbWZuX3RvX2d1ZXN0X29m
ZnNldChleGNoLm91dC5leHRlbnRfc3RhcnQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoaSA8PCBvdXRfY2h1bmtfb3JkZXIpICsgaiwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbikgKQotICAgICAgICAg
ICAgICAgICAgICByYyA9IC1FRkFVTFQ7Ci0gICAgICAgICAgICB9CisgICAgICAgICAgICBpZiAo
ICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgJiYKKyAgICAgICAgICAgICAgICAgX19jb3B5X21m
bl90b19ndWVzdF9vZmZzZXQoZXhjaC5vdXQuZXh0ZW50X3N0YXJ0LAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoaSA8PCBvdXRfY2h1bmtfb3JkZXIpICsgaiwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuKSApCisgICAg
ICAgICAgICAgICAgcmMgPSAtRUZBVUxUOwogICAgICAgICB9CiAgICAgICAgIEJVR19PTiggIShk
LT5pc19keWluZykgJiYgKGogIT0gKDFVTCA8PCBvdXRfY2h1bmtfb3JkZXIpKSApOwogCgoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
