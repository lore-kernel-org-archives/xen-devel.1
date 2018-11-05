From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: put vcpumask_to_pcpumask under
 CONFIG_PV
Date: Mon, 5 Nov 2018 10:26:10 +0000
Message-ID: <20181105102610.nxcbjatx2xc27lky@zion.uk.xensource.com>
References: <20181102192851.733-1-wei.liu2@citrix.com>
 <9be8ae3b-fde9-f9ac-ffc1-6133f107653f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mtqo=nq=citrix.com=prvs=8406a2984=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJc5q-0005g9-Qq
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 10:26:50 +0000
Content-Disposition: inline
In-Reply-To: <9be8ae3b-fde9-f9ac-ffc1-6133f107653f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDc6MzA6NDNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMi8xMS8xOCAxOToyOCwgV2VpIExpdSB3cm90ZToKPiA+IFRoaXMgZnVuY3Rp
b24gaXMgdXNlZCBieSBQViBjb2RlIG9ubHkuIFRoaXMgaXNzdWUgaXMgZGlzY292ZXJlZCBieQo+
ID4gY2xhbmcgYnVpbGQuCj4gCj4gSW5kZWVkLsKgIEl0IGlzIG9ubHkgdXNlZCBieSB0d28gUFYg
aHlwZXJjYWxscy4KPiAKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L21tLmMgfCAyICstCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IGluZGV4IGY5
NjY3OGY0NmQuLjAxZWM2YWEyYmYgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+
ID4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IEBAIC0zMDU3LDYgKzMwNTcsNyBAQCBpbnQg
bmV3X2d1ZXN0X2NyMyhtZm5fdCBtZm4pCj4gPiAgI2VuZGlmCj4gPiAgfQo+ID4gIAo+ID4gKyNp
ZmRlZiBDT05GSUdfUFYKPiA+ICBzdGF0aWMgaW5saW5lIGludCB2Y3B1bWFza190b19wY3B1bWFz
aygKPiAKPiBNaW5kIGRyb3BwaW5nIHRoaXMgc3B1cmlvdXMgaW5saW5lIHdoaWxlIHlvdSdyZSBh
dCBpdD8KCldpbGwgZG8uCgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKPiAKPiA+ICAgICAgc3RydWN0IGRvbWFpbiAq
ZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lkKSBibWFwLCBjcHVtYXNrX3QgKnBt
YXNrKQo+ID4gIHsKPiA+IEBAIC0zMDk5LDcgKzMxMDAsNiBAQCBzdGF0aWMgaW5saW5lIGludCB2
Y3B1bWFza190b19wY3B1bWFzaygKPiA+ICAgICAgfQo+ID4gIH0KPiA+ICAKPiA+IC0jaWZkZWYg
Q09ORklHX1BWCj4gPiAgc3RhdGljIHN0cnVjdCBkb21haW4gKmdldF9wZ19vd25lcihkb21pZF90
IGRvbWlkKQo+ID4gIHsKPiA+ICAgICAgc3RydWN0IGRvbWFpbiAqcGdfb3duZXIgPSBOVUxMLCAq
Y3VyciA9IGN1cnJlbnQtPmRvbWFpbjsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
