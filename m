From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/5] xen/domain: Stricter configuration
 checking
Date: Tue, 13 Nov 2018 09:54:06 -0700
Message-ID: <5BEB01AE02000078001FB920@prv1-mh.provo.novell.com>
References: <1542039391-32406-1-git-send-email-andrew.cooper3@citrix.com>
 <1542039391-32406-4-git-send-email-andrew.cooper3@citrix.com>
 <5BEADC4002000078001FB7F7@prv1-mh.provo.novell.com>
 <277a9d4b-0684-74ad-4928-5c41606f37f9@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <277a9d4b-0684-74ad-4928-5c41606f37f9@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDE2OjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMTEvMjAxOCAxNDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEy
LjExLjE4IGF0IDE3OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4u
Ywo+Pj4gQEAgLTQyMCw2ICs0MjAsNDYgQEAgdm9pZCBhcmNoX3ZjcHVfZGVzdHJveShzdHJ1Y3Qg
dmNwdSAqdikKPj4+ICAKPj4+ICBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVj
dCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQo+Pj4gIHsKPj4+ICsgICAgYm9vbCBo
dm07Cj4+PiArCj4+PiArICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX1BWKSAmJiAhKGNvbmZp
Zy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpICkKPj4+ICsgICAgewo+Pj4gKyAg
ICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlBWIHN1cHBvcnQgbm90IGF2YWlsYWJsZVxuIik7
Cj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBp
ZiAoICFodm1fZW5hYmxlZCAmJiAoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9n
dWVzdCkgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSFZN
IHN1cHBvcnQgbm90IGF2YWlsYWJsZVxuIik7Cj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsK
Pj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBodm0gPSBjb25maWctPmZsYWdzICYgWEVOX0RPTUNU
TF9DREZfaHZtX2d1ZXN0Owo+PiBXb3VsZCB5b3UgbWluZCBtYWtpbmcgdGhpcyB0aGUgaW5pdGlh
bGl6ZXIgb2YgdGhlIHZhcmlhYmxlIGFuZCB1c2luZwo+PiB0aGUgdmFyaWFibGUgaW4gdGhlIHR3
byBpZigpLXMgYWJvdmU/IFBlcnNvbmFsbHkgSSBhbHNvIHRoaW5rIHRoZSB0d28KPj4gaWYoKS1z
IHdvdWxkIGJldHRlciBiZSBmb2xkZWQsIHVzaW5nIGEgY29uZGl0aW9uYWwgZXhwcmVzc2lvbiBh
cyBpdHMKPj4gY29uZGl0aW9uLgo+IAo+IEkgY2FuIG1vdmUgdGhlIGluaXRpYWxpc2VyLCBidXQg
aG93IGRvIHlvdSBwcm9wb3NlIGZvbGRpbmcgdGhlCj4gY29uZGl0aW9uYWxzIGdpdmVuIHRoZWly
IGRpZmZlcmVudCBjb250ZW50cz8KCiAgICBpZiAoIGh2bSA/ICFodm1fZW5hYmxlZCA6ICFJU19F
TkFCTEVEKENPTkZJR19QVikgKQogICAgewogICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICIl
cyBzdXBwb3J0IG5vdCBhdmFpbGFibGVcbiIsIGh2bSA/ICJIVk0iIDogIlBWIik7CiAgICAgICAg
cmV0dXJuIC1FSU5WQUw7CiAgICB9CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
