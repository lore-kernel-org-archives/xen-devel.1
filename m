From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2 04/13] iommu: push use of type-safe BFN
 and MFN into iommu_ops
Date: Tue, 10 Jul 2018 17:38:06 +0100
Message-ID: <CAFLBxZbgDS7aKqV-Ru8q21+BqLkkMVro9oVB=Nw-N2BXgXPM+g@mail.gmail.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l1dt=j2=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fcveT-0002Cg-B4
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 16:38:09 +0000
Received: by mail-qt0-x242.google.com with SMTP id h4-v6so18860731qtj.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jul 2018 09:38:08 -0700 (PDT)
In-Reply-To: <20180707110526.35822-5-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdWwgNywgMjAxOCBhdCAxMjowNSBQTSwgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gQEAgLTc4Nyw3ICs3OTMsOSBAQCBpbnQgYW1kX2lvbW11
X3Jlc2VydmVfZG9tYWluX3VuaXR5X21hcChzdHJ1Y3QgZG9tYWluICpkb21haW4sCj4gICAgICBn
Zm4gPSBwaHlzX2FkZHIgPj4gUEFHRV9TSElGVDsKPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnBh
Z2VzOyBpKysgKQo+ICAgICAgewo+IC0gICAgICAgIHJ0ID0gYW1kX2lvbW11X21hcF9wYWdlKGRv
bWFpbiwgZ2ZuICtpLCBnZm4gK2ksIGZsYWdzKTsKPiArICAgICAgICB1bnNpZ25lZCBsb25nIGZy
YW1lID0gZ2ZuICsgaTsKPiArCj4gKyAgICAgICAgcnQgPSBhbWRfaW9tbXVfbWFwX3BhZ2UoZG9t
YWluLCBfYmZuKGZyYW1lKSwgX21mbihmcmFtZSksIGZsYWdzKTsKCkhlcmUncyBhbiBleGFtcGxl
IHdoZXJlIHRoZSBpbnRlcm1lZGlhdGUgdmFyaWFibGUgbWF5IGFjdHVhbGx5IGltcHJvdmUKdGhp
bmdzLCBpZiBvbmx5IGJ5IGF2b2lkaW5nIGNvZGUgZHVwbGljYXRpb24uIDotKQoKPiBAQCAtMjc2
NiwxNCArMjc2NiwxNCBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBhcm1fc21tdV9tYXBfcGFn
ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGJmbiwKPiAgICAgICAgICAqIFRoZSBm
dW5jdGlvbiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSByZXBsYWNlcyB0aGUgY3VycmVudCBtYXBw
aW5nCj4gICAgICAgICAgKiBpZiB0aGVyZSBpcyBhbHJlYWR5IG9uZS4uLgo+ICAgICAgICAgICov
Cj4gLSAgICAgICByZXR1cm4gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoZCwgX2dmbihnZm4pLCBf
bWZuKG1mbiksIDAsIHQpOwo+ICsgICAgICAgcmV0dXJuIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5
KGQsIGdmbiwgbWZuLCAwLCB0KTsKPiAgfQo+Cj4gLXN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGFy
bV9zbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBiZm4pCj4g
K3N0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGFybV9zbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFp
biAqZCwgYmZuX3QgYmZuKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZyYW1lID0gYmZu
Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBmcmFtZTsKPiAtICAgICAgIHVuc2lnbmVk
IGxvbmcgbWZuID0gZnJhbWU7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZyYW1lID0gYmZuX3go
YmZuKTsKPiArICAgICAgIGdmbl90IGdmbiA9IF9nZm4oZnJhbWUpOwo+ICsgICAgICAgbWZuX3Qg
bWZuID0gX21mbihmcmFtZSk7CgpFdmVuIGlmIHdlIGRlY2lkZSB0byB1c2UgYW4gaW50ZXJtZWRp
YXRlIHZhcmlhYmxlIGluIG1hbnkgb3RoZXIgY2FzZXMsCnRoaXMgY29uc3RydWN0IGluIHBhcnRp
Y3VsYXIgc2VlbXMgZXhjZXNzaXZlLgoKRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdvb2QsIHRoYW5r
cy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
