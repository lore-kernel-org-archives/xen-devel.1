From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Fri, 05 Apr 2019 05:29:50 -0600
Message-ID: <5CA73C2E0200007800224D98@prv1-mh.provo.novell.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCN2j-0000jK-MT
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 11:29:57 +0000
In-Reply-To: <20190314135125.1958-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjUxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFNhdmluZyBhbmQgcmVzdG9yaW5nIHRoZSB2YWx1ZSBvZiB0aGlzIE1TUiBpcyBjdXJyZW50
bHkgaGFuZGxlZCBieQo+IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBi
ZWluZyBhcmNoaXRlY3R1cmFsLiBUaGlzIHBhdGNoCj4gbW92ZXMgaGFuZGxpbmcgb2YgYWNjZXNz
ZXMgdG8gdGhpcyBNU1IgZnJvbSBodm0uYyBpbnRvIHRoZSBtc3IuYywgdGh1cwo+IGFsbG93aW5n
IHRoZSBjb21tb24gTVNSIHNhdmUvcmVzdG9yZSBjb2RlIHRvIGhhbmRsZSBpdC4KPiAKPiBOT1RF
OiBCZWNhdXNlIHZteF9nZXQvc2V0X2d1ZXN0X2JuZGNmZ3MoKSBjYWxsIHZteF92bWNzX2VudGVy
KCksIHRoZQo+ICAgICAgIHN0cnVjdCB2Y3B1IHBvaW50ZXIgcGFzc2VkIGluLCBhbmQgaGVuY2Ug
dGhlIHZjcHUgcG9pbnRlciBwYXNzZWQgdG8KPiAgICAgICBndWVzdF9yZG1zcigpIGNhbm5vdCBi
ZSBjb25zdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+IC0tLQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4K
PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgo+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IENjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gCj4gdjQ6Cj4gIC0g
Q29zbWV0aWMgcmUtYXJyYW5nZW1lbnRzIGFuZCBhbiBhZGRpdGlvbmFsIEFTU0VSVCByZXF1ZXN0
ZWQgYnkgSmFuCj4gCj4gdjM6Cj4gIC0gQWRkcmVzcyBmdXJ0aGVyIGNvbW1lbnRzIGZyb20gSmFu
Cj4gIC0gRHJvcHBlZCBLZXZpbidzIFItYiBiZWNhdXNlIG9mIGNoYW5nZSB0byB2bXguYwoKS2V2
aW4sCgp5b3UgbWF5IG5vdCBoYXZlIG5vdGljZWQgdGhlIGFib3ZlLgoKVGhhbmtzLCBKYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
