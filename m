From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v2 45/45] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Tue, 20 Mar 2018 15:57:46 +0000
Message-ID: <49a1dfe2-55d0-810d-c58f-bfcb48174316@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-46-andre.przywara@linaro.org>
 <95219304-383b-5c41-a842-1d8068b016a4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zldk=gk=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eyJeD-0005TI-Ne
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 15:58:01 +0000
Received: by mail-wm0-x22a.google.com with SMTP id t7so4443710wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 08:57:59 -0700 (PDT)
In-Reply-To: <95219304-383b-5c41-a842-1d8068b016a4@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMC8wMy8xOCAwMzoxMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDAzLzE1LzIwMTggMDg6MzAgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vdmdpYy9N
YWtlZmlsZQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi44MDY4
MjY5NDhlCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIveGVuL2FyY2gvYXJtL3ZnaWMvTWFrZWZp
bGUKPj4gQEAgLTAsMCArMSw1IEBACj4+ICtvYmoteSArPSB2Z2ljLm8KPj4gK29iai15ICs9IHZn
aWMtdjIubwo+PiArb2JqLXkgKz0gdmdpYy1tbWlvLm8KPj4gK29iai15ICs9IHZnaWMtbW1pby12
Mi5vCj4+ICtvYmoteSArPSB2Z2ljLWluaXQubwo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4+IGluZGV4IDRiOTY2NGYz
MTMuLjM0MmI5NWJlMzEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwo+
PiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPj4gQEAgLTk2OCw2ICs5NjgsMTYgQEAg
dW5zaWduZWQgaW50IHZnaWNfbWF4X3ZjcHVzKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4+IMKg
wqDCoMKgwqAgcmV0dXJuIG1pbl90KHVuc2lnbmVkIGludCwgTUFYX1ZJUlRfQ1BVUywgdmdpY192
Y3B1X2xpbWl0KTsKPj4gwqAgfQo+PiDCoCArI2lmZGVmIENPTkZJR19IQVNfR0lDVjMKPj4gK3Zv
aWQgdmdpY192M19zZXR1cF9odyhwYWRkcl90IGRiYXNlLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBucl9yZGlzdF9yZWdpb25zLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVj
dCByZGlzdF9yZWdpb24gKnJlZ2lvbnMsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGludGlkX2JpdHMpCj4+ICt7Cj4+ICvCoMKgwqAg
LyogRHVtbXkgaW1wbGVtZW50YXRpb24gdG8gYWxsb3cgYnVpbGRpbmcgd2l0aG91dCBhY3R1YWwg
dkdJQ3YzCj4+IHN1cHBvcnQuICovCj4+ICt9Cj4+ICsjZW5kaWYKPiAKPiBXaHkgbm90IGp1c3Qg
YXZvaWQgc2VsZWN0aW5nIEhBU19HSUNWMz8KCkJlY2F1c2UgImNvbmZpZyBBUk1fNjQiIHNlbGVj
dHMgSEFTX0dJQ1YzLCBhbmQgSSBkaWRuJ3QgZGFyZSB0byB0b3VjaAp0aGlzLiBTaG91bGRuJ3Qg
YmUgYXJvdW5kIGZvciBsb25nIGFueXdheXMuCgpDaGVlcnMsCkFuZHJlLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
