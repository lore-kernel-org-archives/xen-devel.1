Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54942C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:06:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2220B2075B
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1yT/MuaN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2220B2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9kA-0008CB-Nw; Mon, 15 Apr 2019 22:06:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hG9k9-0008C6-6H
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:06:25 +0000
X-Inumbo-ID: b4fcb56a-5fca-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b4fcb56a-5fca-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:06:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF2872075B;
 Mon, 15 Apr 2019 22:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555365953;
 bh=BQpqMQg0UMDtvhW6SnrpRjNdsKHjoI3aQjaLwg68dgs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1yT/MuaN71pciVPhceusxUZGAjIlzCY9DakJ5zyrWTSTU0DrRYCbf+LRMjzU7Xen/
 W161YBAN6qSs3Q/973GdUb9EivUhSNDH+8SMJRX85rSkuqDY9h63RkIRoLSODt5sd8
 00//++/9cp0OJYY0KLjySCELbqrx64n7nWkX/30g=
Date: Mon, 15 Apr 2019 15:05:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190218113600.9540-7-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904151505440.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-7-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next 6/9] xen: Convert is_xen_fixed_mfn
 to use typesafe MFN
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
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>,
 xen-devel@lists.xenproject.org, Gang Wei <gang.wei@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415220552.khqlta2ATROSyE1iReAqMJb4qSAmh36bgbwB5YzFd7I@z>

T24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KCgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvdGJvb3QuYyAgICAgfCAyICstCj4gIHhlbi9j
b21tb24vcGFnZV9hbGxvYy5jICB8IDIgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIHwg
NCArKy0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCB8IDQgKystLQo+ICA0IGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L3Rib290LmMgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwo+IGluZGV4IGYzZmRl
ZTRkMzkuLjMwZDE1OWNjNjIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3Rib290LmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwo+IEBAIC0yODAsNyArMjgwLDcgQEAgc3RhdGljIHZv
aWQgdGJvb3RfZ2VuX3hlbmhlYXBfaW50ZWdyaXR5KGNvbnN0IHVpbnQ4X3Qga2V5W1RCX0tFWV9T
SVpFXSwKPiAgCj4gICAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKF9tZm4obWZuKSkgKQo+ICAgICAg
ICAgICAgICBjb250aW51ZTsKPiAtICAgICAgICBpZiAoIGlzX3hlbl9maXhlZF9tZm4obWZuKSAp
Cj4gKyAgICAgICAgaWYgKCBpc194ZW5fZml4ZWRfbWZuKF9tZm4obWZuKSkgKQo+ICAgICAgICAg
ICAgICBjb250aW51ZTsgLyogc2tpcCBYZW4gKi8KPiAgICAgICAgICBpZiAoIChtZm4gPj0gUEZO
X0RPV04oZ190Ym9vdF9zaGFyZWQtPnRib290X2Jhc2UgLSAzICogUEFHRV9TSVpFKSkKPiAgICAg
ICAgICAgICAgICYmIChtZm4gPCBQRk5fVVAoZ190Ym9vdF9zaGFyZWQtPnRib290X2Jhc2UKPiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYwo+IGluZGV4IDU2ODRhMTM1NTcuLjVkZTM2ODZkODUgMTAwNjQ0Cj4gLS0tIGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMKPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBAIC0x
NTg0LDcgKzE1ODQsNyBAQCBpbnQgb2ZmbGluZV9wYWdlKG1mbl90IG1mbiwgaW50IGJyb2tlbiwg
dWludDMyX3QgKnN0YXR1cykKPiAgICAgICpzdGF0dXMgPSAwOwo+ICAgICAgcGcgPSBtZm5fdG9f
cGFnZShtZm4pOwo+ICAKPiAtICAgIGlmICggaXNfeGVuX2ZpeGVkX21mbihtZm5feChtZm4pKSAp
Cj4gKyAgICBpZiAoIGlzX3hlbl9maXhlZF9tZm4obWZuKSApCj4gICAgICB7Cj4gICAgICAgICAg
KnN0YXR1cyA9IFBHX09GRkxJTkVfWEVOUEFHRSB8IFBHX09GRkxJTkVfRkFJTEVEIHwKPiAgICAg
ICAgICAgIChET01JRF9YRU4gPDwgUEdfT0ZGTElORV9PV05FUl9TSElGVCk7Cj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+
IGluZGV4IDdiNmFhZjVlM2YuLmI1NjAxOGFhY2UgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9tbS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gQEAgLTE1MSw4
ICsxNTEsOCBAQCBleHRlcm4gdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfc3RhcnQ7Cj4gICNlbmRpZgo+
ICAKPiAgI2RlZmluZSBpc194ZW5fZml4ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAtICAgICgocGZuX3RvX3BhZGRyKG1mbikgPj0gdmlydF90b19tYWRk
cigmX3N0YXJ0KSkgJiYgICAgICAgXAo+IC0gICAgIChwZm5fdG9fcGFkZHIobWZuKSA8PSB2aXJ0
X3RvX21hZGRyKCZfZW5kKSkpCj4gKyAgICAoKG1mbl90b19tYWRkcihtZm4pID49IHZpcnRfdG9f
bWFkZHIoJl9zdGFydCkpICYmICAgICAgICAgICBcCj4gKyAgICAgKG1mbl90b19tYWRkcihtZm4p
IDw9IHZpcnRfdG9fbWFkZHIoJl9lbmQpKSkKPiAgCj4gICNkZWZpbmUgcGFnZV9nZXRfb3duZXIo
X3ApICAgIChfcCktPnYuaW51c2UuZG9tYWluCj4gICNkZWZpbmUgcGFnZV9zZXRfb3duZXIoX3As
X2QpICgoX3ApLT52LmludXNlLmRvbWFpbiA9IChfZCkpCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+IGluZGV4IDZmYWE1
NjMxNjcuLmYxMjRmNTc5NjQgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
Cj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gQEAgLTI4MCw4ICsyODAsOCBAQCBz
dHJ1Y3QgcGFnZV9pbmZvCj4gICNkZWZpbmUgaXNfeGVuX2hlYXBfbWZuKG1mbikgXAo+ICAgICAg
KF9fbWZuX3ZhbGlkKG1mbikgJiYgaXNfeGVuX2hlYXBfcGFnZShtZm5fdG9fcGFnZShfbWZuKG1m
bikpKSkKPiAgI2RlZmluZSBpc194ZW5fZml4ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAg
ICBcCj4gLSAgICAoKCgobWZuKSA8PCBQQUdFX1NISUZUKSA+PSBfX3BhKCZfc3RleHQpKSAmJiAg
XAo+IC0gICAgICgoKG1mbikgPDwgUEFHRV9TSElGVCkgPD0gX19wYSgmX18yTV9yd2RhdGFfZW5k
KSkpCj4gKyAgICAoKChtZm5fdG9fbWFkZHIobWZuKSkgPj0gX19wYSgmX3N0ZXh0KSkgJiYgICAg
XAo+ICsgICAgICgobWZuX3RvX21hZGRyKG1mbikpIDw9IF9fcGEoJl9fMk1fcndkYXRhX2VuZCkp
KQo+ICAKPiAgI2RlZmluZSBQUnR5cGVfaW5mbyAiMDE2bHgiLyogc2hvdWxkIG9ubHkgYmUgdXNl
ZCBmb3IgcHJpbnRrJ3MgKi8KPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
