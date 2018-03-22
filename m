From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v3 39/39] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Thu, 22 Mar 2018 10:39:06 +0000
Message-ID: <2b6012db-a0a4-7b3c-c1b6-adf41db037bd@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-40-andre.przywara@linaro.org>
 <903cfbf7-dcb4-d810-981e-6f59542bc6eb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sasr=gm=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eyxcv-0006qx-2p
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:39:21 +0000
Received: by mail-wm0-x234.google.com with SMTP id l9so15022435wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 03:39:19 -0700 (PDT)
In-Reply-To: <903cfbf7-dcb4-d810-981e-6f59542bc6eb@arm.com>
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

SGksCgpPbiAyMi8wMy8xOCAwODoxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDAzLzIxLzIwMTggMDQ6MzIgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdp
Yy5jCj4+IGluZGV4IDEzMTM1OGE1YTEuLjIyYzcwZmY3Y2QgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9h
cmNoL2FybS92Z2ljL3ZnaWMuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPj4g
QEAgLTk4MSw2ICs5ODEsMTYgQEAgdW5zaWduZWQgaW50IHZnaWNfbWF4X3ZjcHVzKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIG1pbl90KHVuc2lnbmVkIGludCwg
TUFYX1ZJUlRfQ1BVUywgdmdpY192Y3B1X2xpbWl0KTsKPj4gwqAgfQo+PiDCoCArI2lmZGVmIENP
TkZJR19IQVNfR0lDVjMKPj4gK3ZvaWQgdmdpY192M19zZXR1cF9odyhwYWRkcl90IGRiYXNlLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGlu
dCBucl9yZGlzdF9yZWdpb25zLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnN0IHN0cnVjdCByZGlzdF9yZWdpb24gKnJlZ2lvbnMsCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGludGlkX2Jp
dHMpCj4+ICt7Cj4+ICvCoMKgwqAgLyogRHVtbXkgaW1wbGVtZW50YXRpb24gdG8gYWxsb3cgYnVp
bGRpbmcgd2l0aG91dCBhY3R1YWwgdkdJQ3YzCj4+IHN1cHBvcnQuICovCj4gCj4gT25lIG1ham9y
IGluY29udmVuaWVuY2Ugd2l0aCB0aGF0IHNvbHV0aW9uIGlzIEdJQ3YzIGRyaXZlciBpcyBnb2lu
ZyB0bwo+IGJlIGluaXRpYWxpemVkIGJ1dCB0aGVuIHlvdSBoaXQgdGhlIEJVR19PTigpIGluIGRv
bWFpbl92Z2ljX3JlZ2lzdGVyLgo+IFRoaXMgaXMgcmVhbGx5IG5vdCBuaWNlIGZvciB0aGUgdXNl
ciBidXQgaXQgaXMgbm90IG9idmlvdXMgd2h5IHRoZQo+IEJVR19PTigpIGlzIGhpdC4KPiAKPiBJ
IGFtIG9rIGlmIHlvdSBkb24ndCB3YW50IHRvIHRvdWNoIHRoZSBLY29uZmlnLiBCdXQgSSB3b3Vs
ZCBhdCBsZWFzdAo+IGltcGxlbWVudCB0aGF0IGhlbHBlciB3aXRoIGEgcGFuaWMoInZHSUN2MyBu
b3QgeWV0IHN1cHBvcnRlZCB3aXRoIHRoZQo+IG5ldyB2R0lDIik7CgpZZXMsIHRoYXQncyBhIGdv
b2QgcG9pbnQgKGFuZCBlYXN5IHRvIGltcGxlbWVudCEpIDstKQoKQWxzbyBJIHRoaW5rIHdlIHNo
b3VsZCBoYXZlIHNvbWV0aGluZyBzYXlpbmcgdGhhdCB3ZSBhcmUgdXNpbmcgdGhlIG5ldwpWR0lD
LCBzbyB3ZSBoYXZlIGl0IGluIHRoZSBsb2dzLiBKdXN0IHJlYWxpc2VkIHRoaXMgd2hlbiBJIHdh
cyB3b25kZXJpbmcKaWYgbXkgbWFjaGluZSBpcyBjdXJyZW50bHkgdXNpbmcgdGhlIG5ldyBvciB0
aGUgb2xkIFZHSUMgOy0pCgpJIHB1dCBzb21ldGhpbmcgaW4gdGhlIHZnaWNfdjJfc2V0dXBfaHco
KSBpbXBsZW1lbnRhdGlvbi4KCkNoZWVycywKQW5kcmUuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
