Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A9BC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DBFC2133D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DBFC2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpml-000076-2P; Tue, 09 Apr 2019 12:23:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpmj-00006C-En
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:23:29 +0000
X-Inumbo-ID: 466f1546-5ac2-11e9-aa44-13322f0aa2cd
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 466f1546-5ac2-11e9-aa44-13322f0aa2cd;
 Tue, 09 Apr 2019 12:23:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100381"
Date: Tue, 9 Apr 2019 13:23:24 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409122324.GC30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-40-wei.liu2@citrix.com>
 <1553013923.6788.126.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553013923.6788.126.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 39/55] x86: switch root_pgt to mfn_t and
 use new APIs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122324.MSiNAezBxEn-L-BBKyMQL4qw19Kset3CN738f9eLJT8@z>

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDQ6NDU6MjRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBUaGlzIHRoZW4gcmVxdWlyZXMgbW92aW5nIGRlY2xhcmF0aW9uIG9mIHJvb3Qg
cGFnZSB0YWJsZSBtZm4gaW50bwo+ID4gbW0uaAo+ID4gYW5kIG1vZGlmeSBzZXR1cF9jcHVfcm9v
dF9wZ3QgdG8gaGF2ZSBhIHNpbmdsZSBleGl0IHBhdGguCj4gPiAKPiA+IFdlIGFsc28gbmVlZCB0
byBmb3JjZSBtYXBfZG9tYWluX3BhZ2UgdG8gdXNlIGRpcmVjdCBtYXAgd2hlbgo+ID4gc3dpdGNo
aW5nCj4gPiBwZXItZG9tYWluIG1hcHBpbmdzLiBUaGlzIGlzIGNvbnRyYXJ5IHRvIG91ciBlbmQg
Z29hbCBvZiByZW1vdmluZwo+ID4gZGlyZWN0IG1hcCwgYnV0IHRoaXMgd2lsbCBiZSByZW1vdmVk
IG9uY2Ugd2UgbWFrZSBtYXBfZG9tYWluX3BhZ2UKPiA+IGNvbnRleHQtc3dpdGNoIHNhZmUgaW4g
YW5vdGhlciAobGFyZ2UpIHBhdGNoIHNlcmllcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gwqB4ZW4vYXJjaC94ODYvZG9t
YWluLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfCAxNSArKysrKysrKysrKystLS0KPiA+IMKgeGVu
L2FyY2gveDg2L2RvbWFpbl9wYWdlLmPCoMKgwqDCoMKgwqB8wqDCoDIgKy0KPiA+IMKgeGVuL2Fy
Y2gveDg2L21tLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8wqDCoDIgKy0KPiA+IMKg
eGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jwqDCoMKgwqDCoMKgwqDCoHzCoMKgMiArLQo+ID4gwqB4
ZW4vYXJjaC94ODYvc21wYm9vdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqB8IDQwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tCj4gPiAtLS0tLS0tLS0tLQo+ID4gwqB4ZW4vaW5jbHVkZS9hc20t
eDg2L21tLmjCoMKgwqDCoMKgwqDCoMKgfMKgwqAyICsrCj4gPiDCoHhlbi9pbmNsdWRlL2FzbS14
ODYvcHJvY2Vzc29yLmggfMKgwqAxIC0KPiA+IMKgNyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ID4gaW5kZXggMzJkYzQyNTNmZi4u
NjAzNDk1ZTU1YSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gPiBAQCAtNjgsNiArNjgsNyBAQAo+ID4gwqAjaW5j
bHVkZSA8YXNtL3B2L2RvbWFpbi5oPgo+ID4gwqAjaW5jbHVkZSA8YXNtL3B2L21tLmg+Cj4gPiDC
oCNpbmNsdWRlIDxhc20vc3BlY19jdHJsLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPgo+
ID4gwqAKPiA+IMKgREVGSU5FX1BFUl9DUFUoc3RydWN0IHZjcHUgKiwgY3Vycl92Y3B1KTsKPiA+
IMKgCj4gPiBAQCAtMTU4OSwxMiArMTU5MCwyMCBAQCB2b2lkIHBhcmF2aXJ0X2N0eHRfc3dpdGNo
X2Zyb20oc3RydWN0IHZjcHUKPiA+ICp2KQo+ID4gwqAKPiA+IMKgdm9pZCBwYXJhdmlydF9jdHh0
X3N3aXRjaF90byhzdHJ1Y3QgdmNwdSAqdikKPiA+IMKgewo+ID4gLcKgwqDCoMKgcm9vdF9wZ2Vu
dHJ5X3QgKnJvb3RfcGd0ID0gdGhpc19jcHUocm9vdF9wZ3QpOwo+ID4gK8KgwqDCoMKgbWZuX3Qg
cnB0X21mbiA9IHRoaXNfY3B1KHJvb3RfcGd0X21mbik7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgaWYg
KCByb290X3BndCApCj4gPiAtwqDCoMKgwqDCoMKgwqDCoHJvb3RfcGd0W3Jvb3RfdGFibGVfb2Zm
c2V0KFBFUkRPTUFJTl9WSVJUX1NUQVJUKV0gPQo+ID4gK8KgwqDCoMKgaWYgKCAhbWZuX2VxKHJw
dF9tZm4sIElOVkFMSURfTUZOKSApCj4gPiArwqDCoMKgwqB7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oHJvb3RfcGdlbnRyeV90ICpycHQ7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoG1hcGNhY2hl
X292ZXJyaWRlX2N1cnJlbnQoSU5WQUxJRF9WQ1BVKTsKPiAKPiBDYW4geW91IGVsYWJvcmF0ZSB3
aHkgdGhpcyBpcyByZXF1aXJlZD8gQSBjb21tZW50IG1pZ2h0IGhlbHAuIEkgYXNzdW1lCj4gdGhp
cyBmb3JjZXMgdGhlIHJvb3QgcHQgdG8gYmUgbWFwcGVkIGluIGlkbGUgZG9tYWluIGNvbnRleHQg
aW5zdGVhZCBvZgo+IGN1cnJlbnQgdmNwdT8KPiAKCgpTdXJlLiBGcmFua2x5IHRoaXMgY2hhbmdl
IGlzIG5vdCBzb21ldGhpbmcgSSBsaWtlLgoKCiAgLyoKICAgKiBYWFggV2UncmUgbWFuaXB1bGF0
aW5nIGxpdmUgcGFnZSB0YWJsZXMgaGVyZS4gbWFwX2RvbWFpbl9wYWdlCiAgICogcmVsaWVzIG9u
IHRoaXMgZXhhY3Qgc25pcHBldCB0byB3b3JrLiBGb3Igbm93LCBmb3JjZQogICAqIG1hcF9kb21h
aW5fcGFnZSB0byB1c2UgZGlyZWN0IG1hcC4gVGhpcyBoYWNrIGNhbiBiZSByZW1vdmVkIG9uY2Ug
d2UKICAgKiBoYXZlIHBlci1jcHUgbWFwX2RvbWFpbl9wYWdlIGltcGxlbWVudGF0aW9uLgogICAq
LwoKSWYgd2Ugd291bGQgcmF0aGVyIG5vdCBoYXZlIHRoaXMgZm9yIG5vdywgd2UgY2FuIGFwcGx5
IHRoaXMgc2VyaWVzIHVwIHRvCnRoZSBwYXRjaCB0byBzd2l0Y2ggZnJvbSB4ZW5oZWFwIHRvIGRv
bWhlYXAuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
