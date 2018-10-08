From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/xsm: Add new SILO mode for XSM
Date: Mon, 08 Oct 2018 02:28:49 -0600
Message-ID: <5BBB154102000078001EF628@prv1-mh.provo.novell.com>
References: <20180929092251.17661-1-xin.li@citrix.com>
 <20180929092251.17661-2-xin.li@citrix.com>
 <5BB33B6502000078001ED999@prv1-mh.provo.novell.com>
 <b0a28faa0d0f43b4a05936ec8dc59df8@SINPEX02CL01.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b0a28faa0d0f43b4a05936ec8dc59df8@SINPEX02CL01.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xin Li <xin.li@citrix.com>, Xin Li <talons.lee@gmail.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel@lists.xen.org, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEwLjE4IGF0IDA5OjQ5LCA8eGluLmxpQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBG
cm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDIsIDIwMTggNTozMyBQTQo+PiAKPj4gPj4+IE9uIDI5LjA5LjE4IGF0IDEx
OjIyLCA8dGFsb25zLmxlZUBnbWFpbC5jb20+IHdyb3RlOgo+PiA+IC0tLSBhL3hlbi94c20vZHVt
bXkuYwo+PiA+ICsrKyBiL3hlbi94c20vZHVtbXkuYwo+PiA+IEBAIC0xMSw3ICsxMSw2IEBACj4+
ID4gICAqLwo+PiA+Cj4+ID4gICNkZWZpbmUgWFNNX05PX1dSQVBQRVJTCj4+ID4gLSNkZWZpbmUg
WFNNX0lOTElORSAvKiAqLwo+PiA+ICAjaW5jbHVkZSA8eHNtL2R1bW15Lmg+Cj4+IAo+PiBUaGUg
Y2hhbmdlIGxvb2tzIHVubW90aXZhdGVkIGhlcmUsIHBlcmhhcHMgYmVjYXVzZSBvZiB0aGUgcXVl
c3Rpb25hYmxlCj4+IENPTkZJR19YU01fU0lMTyBkZXBlbmRlbmN5IGZ1cnRoZXIgdXAuIFRoYXQg
c2FpZCwgaXQgbG9va3MgYXMgaWYgdGhlICNkZWZpbmUKPj4gY291bGQgZ28gYXdheSBjdXJyZW50
bHksIGFzIGJlaW5nIHJlZHVuZGFudCB3aXRoIHdoYXQgZHVtbXkuaCBhbHJlYWR5IGhhcy4KPj4g
VGhhdCB3b3VsZCB0aGVuIGJldHRlciBiZSBhIHNtYWxsIHNlcGFyYXRlIHByZXJlcSBwYXRjaCBp
bW8uCj4gCj4gVGhpcyBpcyBpbnRlbmRlZCwgdG8gYXZvaWQgY29tcGlsZSBlcnJvciwgY2FuJ3Qg
cmVmaW5lIFhTTV9JTkxJTkUuCj4gRG8geW91IG1lYW4gYSBzZXBhcmF0ZSBwYXRjaCB0byBqdXN0
IHJlbW92ZSB0aGlzIGxpbmU/CgpZZXMsIGFuZCB0aGVuIHdpdGggYW4gZXhwbGFuYXRpb24gb2Yg
d2h5IHRoaXMgbGluZSBpcyBub3QgbmVlZGVkLgoKPj4gPiAtLS0gL2Rldi9udWxsCj4+ID4gKysr
IGIveGVuL3hzbS9zaWxvLmMKPj4gPiBAQCAtMCwwICsxLDEwOSBAQAo+PiA+Cj4+ICsvKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Cj4+ICoqKioqCj4+ID4gKyoqKioqKioqKioKPj4gPiArICogeHNtL3NpbG8uYwo+PiA+ICsgKgo+
PiA+ICsgKiBTSUxPIG1vZHVsZSBmb3IgWFNNKFhlbiBTZWN1cml0eSBNb2R1bGVzKQo+PiAKPj4g
V291bGQgeW91IG1pbmQgYWRkaW5nIHRoZSBtaXNzaW5nIGJsYW5rIGhlcmU/Cj4gCj4gRG8geW91
IG1lYW4gYWRkIG9uZSBzcGFjZSBhZnRlciBYU00/Cj4gKiBTSUxPIG1vZHVsZSBmb3IgWFNNIChY
ZW4gU2VjdXJpdHkgTW9kdWxlcykKClllcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
