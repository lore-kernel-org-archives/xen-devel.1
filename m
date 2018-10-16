From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 15/17] x86: expose CONFIG_PV
Date: Tue, 16 Oct 2018 17:37:02 +0100
Message-ID: <20181016163702.h5de4tjnpd4c2mar@zion.uk.xensource.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <7d4d6dc6e34b577c645dc950e0fe0cf2ebccaa64.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0BADA02000078001F114B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xwsc=m4=citrix.com=prvs=820afcec6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gCSLB-00058n-NM
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 16:37:05 +0000
Content-Disposition: inline
In-Reply-To: <5BC0BADA02000078001F114B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDk6MTY6NDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gKysrIGIveGVuL2FyY2gveDg2
L0tjb25maWcKPiA+IEBAIC0zNyw2ICszNywxNCBAQCBzb3VyY2UgImFyY2gvS2NvbmZpZyIKPiA+
ICAKPiA+ICBjb25maWcgUFYKPiA+ICAJZGVmX2Jvb2wgeQo+ID4gKwlwcm9tcHQgIlBWIHN1cHBv
cnQiCj4gPiArCS0tLWhlbHAtLS0KPiA+ICsJICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgUFYgZ3Vl
c3RzIHdoaWNoIGRvbid0IHJlcXVpcmUgaGFyZHdhcmUKPiA+ICsJICBzdXBwb3J0IGxpa2UgSW50
ZWwncyBWVC14IG9yIEFNRCdzIFNWTS4KPiA+ICsKPiA+ICsJICBUaGlzIG9wdGlvbiBpcyBuZWVk
ZWQgaWYgeW91IHdhbnQgdG8gcnVuIFBWIGd1ZXN0cy4KPiAKPiBXZSd2ZSBoYWQgYSBkaXNjdXNz
aW9uIHdpdGggKGlpcmMpIEdlb3JnZSBhbmQgcGVyaGFwcyBhIGZldyBvdGhlcnMKPiBhYm91dCAi
Z3Vlc3QiIHZzICJkb21haW4iLCBhbmQgSSd2ZSBsZWFybmVkIHRoYXQgZ2VuZXJhbGx5IHRoZQo+
IGZvcm1lciBpcyBtZWFudCB0byBleGNsdWRlIERvbTAgd2hpbGUgdGhlIGxhdHRlciB3b3VsZCBp
bmNsdWRlIGl0Lgo+IEluIHRoYXQgbGlnaHQgZWl0aGVyIHMvZ3Vlc3QvZG9tYWluLyBmb3IgdGhl
IGhlbHAgdGV4dCwgb3IgcGxlYXNlIGFkZAo+IGV4cGxpY2l0IG1lbnRpb24gb2YgRG9tMCB0aGVy
ZSAoYXMgUFYgaXMgc3RpbGwgdGhlIHByZXZhaWxpbmcga2luZCBvZgo+IERvbTAsIGFuZCB5b3Ug
d291bGRuJ3Qgd2FudCB0byB0cmlwIHBlb3BsZSBpbnRvIGRpc2FibGluZyB0aGlzIGp1c3QKPiBi
ZWNhdXNlIHRoZXkgb25seSBydW4gSFZNIGd1ZXN0cykuCgpJIHdpbGwgY2hhbmdlICJndWVzdCIg
dG8gImRvbWFpbiIuIE9uIHRoZSBzYW1lIG5vdGUgdGhlIHRleHQgZm9yIEhWTQpzaG91bGQgYmUg
Y2hhbmdlZCwgdG9vLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
