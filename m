Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D58C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB45620857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB45620857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpmJ-0008Jw-3w; Tue, 09 Apr 2019 12:23:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpmH-0008JJ-4z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:23:01 +0000
X-Inumbo-ID: 347e258e-5ac2-11e9-a7a7-7b6ef6322656
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347e258e-5ac2-11e9-a7a7-7b6ef6322656;
 Tue, 09 Apr 2019 12:22:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100329"
Date: Tue, 9 Apr 2019 13:22:50 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409122250.GQ1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-19-wei.liu2@citrix.com>
 <1552943668.6788.100.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552943668.6788.100.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 18/55] x86/mm: switch to new APIs in
 modify_xen_mappings
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122250.Af0Yd21SC49othJ2LQTRdjN4eFQiosxSPBPGgEKyrHY@z>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MjhQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBQYWdlIHRhYmxlcyBhbGxvY2F0ZWQgaW4gdGhhdCBmdW5jdGlvbiBzaG91bGQg
YmUgbWFwcGVkIGFuZCB1bm1hcHBlZAo+ID4gbm93Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiDCoHhlbi9hcmNoL3g4Ni9t
bS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IGluZGV4IDFlYTI5
NzRjMWYuLjE4YzdiNDM3MDUgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4g
KysrIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IEBAIC01NDM2LDYgKzU0MzYsNyBAQCBpbnQgbW9k
aWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsCj4gPiB1bnNpZ25lZCBsb25nIGUsIHVu
c2lnbmVkIGludCBuZikKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGlmICggbDNlX2dldF9mbGFncygq
cGwzZSkgJiBfUEFHRV9QU0UgKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgewo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsMl9wZ2VudHJ5X3QgKmwydDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBtZm5fdCBtZm47Cj4gCj4gbml0OiBJIHdvdWxkbid0IG1pbmQgaWYgdGhlc2Ugc2Nv
cGVkIG1mbnMgd2VyZSBjYWxlZCBsMnRfbWZuIC8gbDF0X21mbgo+IGluIHRoaXMgcGF0Y2gsIHRv
by4KPiAKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICggbDJfdGFibGVf
b2Zmc2V0KHYpID09IDAgJiYKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGwxX3RhYmxlX29mZnNldCh2KSA9PSAwICYmCj4gPiBAQCAtNTQ1MiwxMyArNTQ1MywxNSBAQCBp
bnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsCj4gPiB1bnNpZ25lZCBsb25n
IGUsIHVuc2lnbmVkIGludCBuZikKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4g
wqAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogUEFHRTFHQjogc2hhdHRlciB0aGUg
c3VwZXJwYWdlIGFuZCBmYWxsIHRocm91Z2guICovCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbDJ0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmICggIWwydCApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWZuID0gYWxsb2Nf
eGVuX3BhZ2V0YWJsZV9uZXcoKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIG1m
bl9lcShtZm4sIElOVkFMSURfTUZOKSApCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBBU1NFUlQocmMgPT0gLUVOT01F
TSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7Cj4gCj4gSXMgbWFwX3hlbl9w
YWdldGFibGUgYWx3YXlzIGd1YXJhbnRlZWQgdG8gc3VjY2VlZCBvbiBhIHZhbGlkIG1mbiAoYWxz
bwo+IGluIHRoZSBmdXR1cmUpPyBPdGhlcndpc2UgdGhlIHZhbGlkaXR5IGNoZWNrIHNob3VsZCBi
ZSBkb25lIG9uIGwydCBhcwo+IGJlZm9yZSBpbnN0ZWFkIG9mIG1mbi4gQnV0IGl0IGxvb2tzIGxp
a2UgbWFwX3hlbl9wYWdldGFibGV7X25ld30gZG9lcwo+IG5vdCBkZWFsIHdpdGggaW52YWxpZCBt
Zm5zLgoKSXQgaXMgZ3VhcmFudGVlZCB0byBzdWNjZWVkIGJ5IGRlc2lnbi4KCj4gCj4gPiArCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxF
X0VOVFJJRVM7IGkrKyApCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbDJl
X3dyaXRlKGwydCArIGksCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4oKnBsM2UpICsKPiA+IEBA
IC01NDY5LDE0ICs1NDcyLDE3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxv
bmcgcywKPiA+IHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAoIChsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNF
TlQpICYmCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAobDNlX2dldF9m
bGFncygqcGwzZSkgJiBfUEFHRV9QU0UpICkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbDNlX3dyaXRlX2F0b21pYyhw
bDNlLAo+ID4gbDNlX2Zyb21fbWZuKHZpcnRfdG9fbWZuKGwydCksCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX1BBR0VfSFlQRVJWSVNPCj4gPiBS
KSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsM2Vfd3JpdGVfYXRvbWlj
KHBsM2UsIGwzZV9mcm9tX21mbihtZm4sCj4gPiBfX1BBR0VfSFlQRVJWSVNPUikpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0
KTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsMnQgPSBOVUxMOwo+IAo+
IFRoYXQgTlVMTCBhc3NpZ25tZW50IGlzIHJlZHVuZGFudCBub3cuIEl0J3MgZG9uZSBieSB0aGUg
VU5NQVAgbWFjcm8uCgpOb3QgeWV0LiBUaGlzIGlzIGxlZnQgYXMtaXMgaW50ZW50aW9uYWxseS4g
SXQgZGVwZW5kcyBvbiB3aGF0IHdlIHdpbGwgZG8KcmVnYXJkaW5nIFVOTUFQX1hFTl9QQUdFVEFC
TEUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
