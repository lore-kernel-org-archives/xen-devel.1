From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 6/8] xen/iommu: smmu-v3: Add Xen specific
 code to enable the ported driver
Date: Tue, 16 Jan 2018 13:13:47 +0000
Message-ID: <a484db15-c165-183b-a088-788789086037@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-7-sameer.goel@linaro.org>
 <9d4e3e05-b505-7147-2715-0a36069ea18a@caviumnetworks.com>
 <35f466dc-38c9-bad8-6908-e2a751a60f76@linaro.org>
 <5122539b-0ec0-33d0-b5a4-6f721c754187@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lndq=el=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ebR3r-0003jt-MG
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 13:13:55 +0000
Received: by mail-wr0-x244.google.com with SMTP id o7so15106511wro.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 05:13:54 -0800 (PST)
In-Reply-To: <5122539b-0ec0-33d0-b5a4-6f721c754187@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, shankerd@codeaurora.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNi8wMS8xOCAxMjozNywgTWFuaXNoIEphZ2dpIHdyb3RlOgo+IE9uIDAxLzE2LzIw
MTggMDI6MDQgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDEvMDMvMjAxOCAwNTo0NyBB
TSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+Pj4+ICtpbnQgZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2ly
cShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpcnEsIAo+Pj4+IGlycV9oYW5kbGVy
X3QgaGFuZGxlciwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcnFf
aGFuZGxlcl90IHRocmVhZF9mbiwgdW5zaWduZWQgbG9uZyBpcnFmbGFncywKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpkZXZuYW1lLCB2b2lkICpk
ZXZfaWQpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHJldHVybiBkZXZtX3JlcXVlc3RfaXJxKGRldiwg
aXJxLCB0aHJlYWRfZm4sIGlycWZsYWdzLCBkZXZuYW1lLCAKPj4+PiBkZXZfaWQpOwo+Pj4+ICt9
Cj4+PiBJcyBpdCBwb3NzaWJsZSB0byBjaGFuZ2UgdGhlIG5hbWUgZnJvbSB0aHJlYWRlZCB0byBz
b21ldGhpbmcgbW9yZSAKPj4+IG1lYW5pbmdmdWwgYXMgSUlVQyBpbiB4ZW4gd2UgZG9udMKgIGhh
dmUgdGhyZWFkZWQgaXJxcy4KPj4+IFRob3VnaCB0aGUgY29kZSBpcyBjb21pbmcgZnJvbSBsaW51
eCwgYnV0IGl0IGhhcyB0byBiZSBjYWxsZWQvbmFtZWQgCj4+PiBpbiB0aGUgcGxhY2UgaXQgaXMg
aW50ZW5kZWQgdG8gYmUgdXNlZAo+Pgo+PiBXaGF0IGRvIHlvdSBtZWFuPyBUaGlzIGlzIGEgd3Jh
cHBlciBmb3IgTGludXguIFNvIHdlIHNob3VsZCBrZWVwIHRoZSAKPj4gbmFtZSBhcyBpdCBpcy4K
PiBJdCBjcmVhdGVzIGNvbmZ1c2lvbiBhcyB4bmUgZG9lc250IHVzZSB0aHJlYWRzLiBTbyB3ZSBz
aG91bGQgcmVuYW1lIGl0Lgo+IFRoZXJlIGlzIG5vIHJlYXNvbiB3aHkgd2UgY2Fubm90IHJlbmFt
ZSBhIGZ1bmN0aW9uIHVzZWQgaW4gbGludXguCgpSZWFkIG15IHByZXZpb3VzIGUtbWFpbCB1bnRp
bCB0aGUgZW5kIHRvIHVuZGVyc3RhbmQgdGhlIHJlYXNvbi4uLgoKPj4KPj4gWy4uLl0KPj4KPj4+
PiBAQCAtNDMzLDYgKzgwNyw3IEBAIGVudW0gcHJpX3Jlc3Agewo+Pj4+IMKgwqDCoMKgwqAgUFJJ
X1JFU1BfU1VDQywKPj4+PiDCoCB9Owo+Pj4+ICsjaWYgMCAvKiBYZW46IE5vIE1TSSBzdXBwb3J0
IGluIHRoaXMgaXRlcmF0aW9uICovCj4+Pj4gwqAgZW51bSBhcm1fc21tdV9tc2lfaW5kZXggewo+
Pj4+IMKgwqDCoMKgwqAgRVZUUV9NU0lfSU5ERVgsCj4+Pj4gwqDCoMKgwqDCoCBHRVJST1JfTVNJ
X0lOREVYLAo+Pj4+IEBAIC00NTcsNiArODMyLDcgQEAgc3RhdGljIHBoeXNfYWRkcl90IAo+Pj4+
IGFybV9zbW11X21zaV9jZmdbQVJNX1NNTVVfTUFYX01TSVNdWzNdID0gewo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBBUk1fU01NVV9QUklRX0lSUV9DRkcyLAo+Pj4+IMKgwqDCoMKgwqAgfSwKPj4+
PiDCoCB9Owo+Pj4+ICsjZW5kaWYKPj4+IElNSE8gY2FuIHdlIGF2b2lkICNpZiAwIGZyb20gdGhl
IGNvZGUsIHVubGVzcyB3ZSBpbnRlbmQgdG8gdXNlIHRoZSAKPj4+IGNvZGUgaW4gZnV0dXJlLgo+
Pgo+PiBJbiB0aGUgcGFzdCwgSSBtYWRlIHRoZSBtaXN0YWtlIHRvIHJlbW92ZSBhbGwgdW5lY2Vz
c2FyeSBjb2RlIGZyb20gCj4+IFNNTVV2Mi4gRmV3IG1vbnRocyBhZnRlciwgd2UgZGVjaWRlZCB0
byBkZWxldGUgaXQgYW5kIGltcG9ydCBkaXJlY3RseSAKPj4gZnJvbSBMaW51eCB3aXRoIGxpbWl0
ZWQgbW9kaWZpY2F0aW9ucy4gVGhpcyB3YXMgdGhlIGJlc3QgY2hvaWNlIAo+PiBiZWNhdXNlIGl0
IGlzIGVhc2llciB0byB0cmFjayBkaWZmZXJlbmNlLgo+Pgo+PiBXZSBhcmUgaW4gdGhlIHNhbWUg
c2l0dWF0aW9uIGhlcmUuIFdlIHdhbnQgdG8gc3RheSBhcyBjbG9zZSBhcyBMaW51eC4gCj4+IFRo
aXMgbWVhbnMgbm8gcmVuYW1pbmcsIG5vIGNvZGUgcmVtb3ZhbCwgYW5kIHZlcnkgbGltaXRlZCBj
aGFuZ2UgaW4gCj4+IHRoZSBjb2RlIHRvIGFjY29tbW9kYXRlIFhlbi4KCi4uLiBwYXJ0aWN1bGFy
bHkgdGhpcyBwYXJhZ3JhcGguCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
