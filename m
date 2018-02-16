From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] vmx/hap: optimize CR4 trapping
Date: Fri, 16 Feb 2018 12:37:47 +0000
Message-ID: <20180216123747.fqmqfgc7xqmof2oq@MacBook-Pro-de-Roger.local>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-3-roger.pau@citrix.com>
 <338ca9c5-d5f5-c0e9-4e35-154c9919ae75@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=c1s1=fk=citrix.com=prvs=57802d2d1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1emfH6-0005sV-CZ
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:38:00 +0000
Content-Disposition: inline
In-Reply-To: <338ca9c5-d5f5-c0e9-4e35-154c9919ae75@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDI6MzA6NTVQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDAyLzE2LzIwMTggMDI6MTAgUE0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
PiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW9uaXRvci5jIGIveGVuL2FyY2gveDg2L21v
bml0b3IuYwo+ID4gaW5kZXggZjIyOWU2OTk0OC4uNDMxNzY1OGM1NiAxMDA2NDQKPiA+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tb25pdG9yLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tb25pdG9yLmMK
PiA+IEBAIC0xODksMTAgKzE4OSwxMSBAQCBpbnQgYXJjaF9tb25pdG9yX2RvbWN0bF9ldmVudChz
dHJ1Y3QgZG9tYWluICpkLAo+ID4gICAgICAgICAgICAgIGFkLT5tb25pdG9yLndyaXRlX2N0cmxy
ZWdfZW5hYmxlZCAmPSB+Y3RybHJlZ19iaXRtYXNrOwo+ID4gICAgICAgICAgfQo+ID4gIAo+ID4g
LSAgICAgICAgaWYgKCBWTV9FVkVOVF9YODZfQ1IzID09IG1vcC0+dS5tb3ZfdG9fY3IuaW5kZXgg
KQo+ID4gKyAgICAgICAgaWYgKCBWTV9FVkVOVF9YODZfQ1IzID09IG1vcC0+dS5tb3ZfdG9fY3Iu
aW5kZXggfHwKPiA+ICsgICAgICAgICAgICAgVk1fRVZFTlRfWDg2X0NSNCA9PSBtb3AtPnUubW92
X3RvX2NyLmluZGV4ICkKPiA+ICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICBzdHJ1Y3QgdmNw
dSAqdjsKPiA+IC0gICAgICAgICAgICAvKiBMYXRjaGVzIG5ldyBDUjMgbWFzayB0aHJvdWdoIENS
MCBjb2RlLiAqLwo+ID4gKyAgICAgICAgICAgIC8qIExhdGNoZXMgbmV3IENSMyBvciBDUjQgbWFz
ayB0aHJvdWdoIENSMCBjb2RlLiAqLwo+ID4gICAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBk
LCB2ICkKPiA+ICAgICAgICAgICAgICAgICAgaHZtX3VwZGF0ZV9ndWVzdF9jcih2LCAwKTsKPiA+
ICAgICAgICAgIH0KPiAKPiBEaWQgeW91LCBieSBhbnkgY2hhbmNlLCB0ZXN0IHRoaXMgY29kZSB3
aXRoIHhlbi1hY2Nlc3MuYyAoaXQgYWxyZWFkeSBoYXMKPiBhIHRlc3QgZm9yIENSNCBmb3IgdGhl
IFBHRSBzdHVmZik/IEknbSBub3QgY29udmluY2VkIHRoZQo+IGh2bV91cGRhdGVfZ3Vlc3RfY3Io
diwgMCk7IGNhbGwgc3VmZmljZXMgdG8gZW5hYmxlIENSNCBsb2FkIGV4aXRzLgoKaHZtX3VwZGF0
ZV9ndWVzdF9jciBpcyBqdXN0IGEgd3JhcHBlciB0byB2bXhfdXBkYXRlX2d1ZXN0X2NyIHdoZW4K
dXNpbmcgdm14LCB3aGljaCB3aWxsIHVuY29uZGl0aW9uYWxseSByZS1jYWxjdWxhdGUgdGhlIENS
NCBtYXNrIHdoZW4KY2FsbGVkIHdpdGggY3IgPT0gMCBvciBjciA9PSA0LgoKSSBoYXZlIG5vdCB0
ZXN0ZWQgaXQgd2l0aCB4ZW4tYWNjZXNzLCBidXQgaXQgc2VlbXMgcXVpdGUKc3RyYWlnaHRmb3J3
YXJkIHRvIG1lLiBBcmUgeW91IHNlZWluZyBhbnkgb3RoZXIgcGF0aCB0aGF0IGNvdWxkCmVuYWJs
ZSBDUjQgbG9hZCBhY2Nlc3NlcyB3aXRob3V0IGNhbGxpbmcgaHZtX3VwZGF0ZV9ndWVzdF9jcj8K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
