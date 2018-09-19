From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 19 Sep 2018 15:51:08 +0100
Message-ID: <20180919145108.vlkrfn2d4jajatlg@zion.uk.xensource.com>
References: <20180903154734.25361-1-apop@bitdefender.com>
 <20180919144451.xk4etvgaj3l4ojgw@zion.uk.xensource.com>
 <5BA261D602000078001E9F8C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2dov-0005PS-MO
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 14:51:13 +0000
Content-Disposition: inline
In-Reply-To: <5BA261D602000078001E9F8C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDg6NDg6NTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA5LjE4IGF0IDE2OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIFNlcCAwMywgMjAxOCBhdCAwNjo0NzozNFBNICswMzAwLCBBZHJpYW4g
UG9wIHdyb3RlOgo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPiA+
PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4gPj4gQEAgLTIzNCw2ICsy
MzQsNyBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fdmlldyB7Cj4gPj4gIHR5cGVkZWYgc3RydWN0
IHhlbl9odm1fYWx0cDJtX3ZpZXcgeGVuX2h2bV9hbHRwMm1fdmlld190Owo+ID4+ICBERUZJTkVf
WEVOX0dVRVNUX0hBTkRMRSh4ZW5faHZtX2FsdHAybV92aWV3X3QpOwo+ID4+ICAKPiA+PiArI2lm
IF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPCAweDAwMDQwYTAwCj4gPj4gIHN0cnVjdCB4ZW5f
aHZtX2FsdHAybV9zZXRfbWVtX2FjY2VzcyB7Cj4gPj4gICAgICAvKiB2aWV3ICovCj4gPj4gICAg
ICB1aW50MTZfdCB2aWV3Owo+ID4+IEBAIC0yNDUsNiArMjQ2LDE5IEBAIHN0cnVjdCB4ZW5faHZt
X2FsdHAybV9zZXRfbWVtX2FjY2VzcyB7Cj4gPj4gIH07Cj4gPj4gIHR5cGVkZWYgc3RydWN0IHhl
bl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzIHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNz
X3Q7Cj4gPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9odm1fYWx0cDJtX3NldF9tZW1f
YWNjZXNzX3QpOwo+ID4+ICsjZW5kaWYgLyogX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyA8IDB4
MDAwNDBhMDAgKi8KPiA+IAo+ID4gI2Vsc2UgaGVyZSBwbGVhc2UsIG90aGVyd2lzZSB5b3UncmUg
YWRkaW5nIHRoaXMgbmV3IGludGVyZmFjZSB0byBhIHNldAo+ID4gb2Ygb2xkIGludGVyZmFjZXMu
Cj4gCj4gSSBkb24ndCB0aGluayB3ZSBkbyBzbyBlbHNld2hlcmUsIHNvIEknZCBwcmVmZXIgaWYg
d2UgZGlkbid0IGRvIHNvCj4gaGVyZSBlaXRoZXIuIEJ5IHVuY29uZGl0aW9uYWxseSBleHBvc2lu
ZyB0aGUgbmV3IGludGVyZmFjZSB3ZQo+IGFsbG93IHBlb3BsZSB0byBtb3JwaCB0aGVpciBjb2Rl
IGluIHN0ZXBzLCByYXRoZXIgdGhhbiBhbGwgaW4gb25lCj4gZ28gYXQgdGhlIHBvaW50IHRoZXkg
YnVtcCB0aGVpciBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fCj4gc2V0dGluZy4KPiAKCk9rYXks
IEknbSBub3QgdG9vIGZ1c3NlZC4gWW91ciBhcmd1bWVudCBzb3VuZHMgcmVhc29uYWJsZS4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
