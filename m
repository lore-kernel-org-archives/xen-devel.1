Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF75C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:30:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4012084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC4012084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpte-0001al-Ox; Tue, 09 Apr 2019 12:30:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDptd-0001af-EM
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:30:37 +0000
X-Inumbo-ID: 459f6a02-5ac3-11e9-902a-8b5e4b688c02
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 459f6a02-5ac3-11e9-902a-8b5e4b688c02;
 Tue, 09 Apr 2019 12:30:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100947"
Date: Tue, 9 Apr 2019 13:30:32 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409123032.GF30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-28-wei.liu2@citrix.com>
 <1552943678.6788.104.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552943678.6788.104.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 27/55] x86_64/mm: drop lXe_to_lYe
 invocations from setup_m2p_table
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
Message-ID: <20190409123032.7MVD6tGteb95qtownbtiwooG_Jti-M9q5Z7hXjiDJ8I@z>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MzhQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+
ID4gLS0tCj4gPiDCoHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyB8IDE2ICsrKysrKysrKysrKy0t
LS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4vYXJj
aC94ODYveDg2XzY0L21tLmMKPiA+IGluZGV4IDBiODU5NjExMDUuLjIxNmY5N2M5NWYgMTAwNjQ0
Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfNjQvbW0uYwo+ID4gQEAgLTQwMCwxMSArNDAwLDEzIEBAIHN0YXRpYyBpbnQgc2V0dXBf
bTJwX3RhYmxlKHN0cnVjdAo+ID4gbWVtX2hvdGFkZF9pbmZvICppbmZvKQo+ID4gwqDCoMKgwqDC
oGwyX3BnZW50cnlfdCAqcGwyZSA9IE5VTEwsICpsMl9yb19tcHQgPSBOVUxMOwo+ID4gwqDCoMKg
wqDCoGwzX3BnZW50cnlfdCAqbDNfcm9fbXB0ID0gTlVMTDsKPiA+IMKgwqDCoMKgwqBpbnQgcmV0
ID0gMDsKPiA+IC3CoMKgwqDCoG1mbl90IGwyX3JvX21wdF9tZm47Cj4gPiArwqDCoMKgwqBtZm5f
dCBsMl9yb19tcHRfbWZuLCBsM19yb19tcHRfbWZuOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqBBU1NF
UlQobDRlX2dldF9mbGFncyhpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChST19NUFRfVklS
VF9TCj4gPiBUQVJUKV0pCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCYgX1BBR0VfUFJF
U0VOVCk7Cj4gPiAtwqDCoMKgwqBsM19yb19tcHQgPQo+ID4gbDRlX3RvX2wzZShpZGxlX3BnX3Rh
YmxlW2w0X3RhYmxlX29mZnNldChST19NUFRfVklSVF9TVEFSVCldKTsKPiA+ICvCoMKgwqDCoGwz
X3JvX21wdF9tZm4gPSBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCgK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFJPX01QVF9WSVJUX1NUQVJUKV0pOwo+ID4gK8Kg
wqDCoMKgbDNfcm9fbXB0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwzX3JvX21wdF9tZm4pOwo+
ID4gwqAKPiA+IMKgwqDCoMKgwqBzbWFwID0gKGluZm8tPnNwZm4gJiAofigoMVVMIDw8IChMMl9Q
QUdFVEFCTEVfU0hJRlQgLSAzKSkgLTEpKSk7Cj4gPiDCoMKgwqDCoMKgZW1hcCA9ICgoaW5mby0+
ZXBmbiArICgoMVVMIDw8IChMMl9QQUdFVEFCTEVfU0hJRlQgLSAzKSkgLSAxICkpCj4gPiAmCj4g
PiBAQCAtNDU5LDggKzQ2MSwxMyBAQCBzdGF0aWMgaW50IHNldHVwX20ycF90YWJsZShzdHJ1Y3QK
PiA+IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgX1BBR0VfUFNFKSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
ICggbDNlX2dldF9mbGFncyhsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0pICYKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9QQUdFX1BSRVNFTlQgKQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGwyZSA9IGwzZV90b19sMmUobDNfcm9fbXB0W2wzX3Rh
YmxlX29mZnNldCh2YSldKSArCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbDJfdGFibGVfb2Zmc2V0KHZhKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBVTk1BUF9YRU5fUEFHRVRBQkxFX05F
VyhsMl9yb19tcHQpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbDJfcm9f
bXB0X21mbiA9Cj4gPiBsM2VfZ2V0X21mbihsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0p
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbDJfcm9fbXB0ID0gbWFwX3hl
bl9wYWdldGFibGVfbmV3KGwyX3JvX21wdF9tZm4pOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgQVNTRVJUKGwyX3JvX21wdCk7Cj4gCj4gRG8gd2UgbmVlZCB0aGlzIGFzc2Vy
dCBoZXJlPyBXaGF0IGFyZSB0aGUgcG9zc2liaWxpdGllcyB0byByZWNvdmVyIGZyb20KPiB0aGF0
IHNpdHVhdGlvbj8gSSB0aGluayB0aGlzIHNob3VsZCBiZSBCVUdfT04gb3IgaXQgc2hvdWxkIGF0
IGxlYXN0Cj4gcmV0dXJuIHRocm91Z2ggdGhlIGVycm9yIHBhdGguCgpJJ20gbm90IHRvbyBmdXNz
ZWQuIFRoaXMgaXMgZWFybHkgaW5pdGlhbGlzYXRpb24gb2YgeGVuLiBJZiB0aGlzIGRvZXNuJ3QK
d29yaywgYWxsIGJldHMgYXJlIG9mZi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
