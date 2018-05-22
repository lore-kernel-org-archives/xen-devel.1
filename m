From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 3/6] arm: make it possible to disable the
 SMMU driver
Date: Mon, 21 May 2018 23:37:27 -0600
Message-ID: <5B03AC970200007800130854@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1804181324400.17714@sstabellini-ThinkPad-X260>
 <1524089752-22174-3-git-send-email-sstabellini@kernel.org>
 <7d79c66c-c252-71fa-bd64-7de7d5a09914@arm.com>
 <5AD9B53E02000078001BCE3B@prv1-mh.provo.novell.com>
 <b4ed1393-42fc-2f3e-8cc5-32fdb6956d66@arm.com>
 <alpine.DEB.2.10.1805211326420.4520@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1805211326420.4520@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org
Cc: julien.grall@arm.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDUvMjEvMTgg
MTA6MzUgUE0gPj4+Cj5PbiBUdWUsIDI0IEFwciAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
IE9uIDA0LzIwLzIwMTggMTA6MzkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiA+ID4gPiA+IE9u
IDE5LjA0LjE4IGF0IDE3OjQ0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiA+ID4g
T24gMTgvMDQvMTggMjM6MTUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gPiA+ID4gLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZwo+PiA+ID4gPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9LY29uZmlnCj4+ID4gPiA+IEBAIC0xLDMgKzEsNSBAQAo+PiA+ID4g
PiAgICAgICBjb25maWcgSEFTX1BBU1NUSFJPVUdICj4+ID4gPiA+ICAgICAgICBib29sCj4+ID4g
PiA+ICsKPj4gPiA+ID4gK3NvdXJjZSAiZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vS2NvbmZpZyIK
Pj4gPiA+IAo+PiA+ID4gQ2FuJ3Qgd2UgbG9hZCBhcm0vS2NvbmZpZyBvbmx5IHdoZW4gYXJtIGlz
IHNlbGVjdGVkPyBUaGlzIHdvdWxkIGF2b2lkCj4+ID4gPiB3ZWlyZCBvcHRpb24gb24geDg2Lgo+
PiA+IAo+PiA+IEhvdyB3b3VsZCB0aG9zZSBvcHRpb25zIGFwcGVhciBmb3IgeDg2LCBnaXZlbiAu
Li4KPj4gPiAKPj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+PiA+ID4gPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vS2NvbmZpZwo+PiA+ID4gPiBAQCAtMCwwICsxLDcgQEAKPj4gPiA+
ID4gKwo+PiA+ID4gPiArY29uZmlnIEhBU19TTU1VdjIKPj4gPiA+ID4gKyAgICBib29sICJBUk0g
U01NVXYyIGRyaXZlciIKPj4gPiA+ID4gKyAgICBkZWZhdWx0IHkKPj4gPiA+ID4gKyAgICBkZXBl
bmRzIG9uIEFSTQo+PiA+IAo+PiA+IC4uLiB0aGlzICJkZXBlbmRzIG9uIj8gT2YgY291cnNlIGlm
IG1vcmUgb3B0aW9ucyBhcmUgZ29pbmcgdG8gYXBwZWFyIGhlcmUsCj4+ID4gd3JhcHBpbmcgdGhl
IHdob2xlIGZpbGUgaW4gImlmIEFSTSIgd291bGQgYmUgdXNlZnVsIGFueXdheSwgZXZlbiBpZiBv
bmx5Cj4+ID4gdG8gbGltaXQgcmVkdW5kYW5jeS4KPgo+U29ycnksIEkgdGhpbmsgSSBhbSBtaXN1
bmRlcnN0YW5kaW5nIHlvdXIgc3VnZ2VzdGlvbi4gSWYgeW91IGFyZQo+c3VnZ2VzdGluZzoKPgo+
I2lmIEFSTQo+Y29uZmlnIEhBU19TTU1VdjIKPmJvb2wgIkFSTSBTTU1VdjIgZHJpdmVyIgo+ZGVm
YXVsdCB5Cj5kZXBlbmRzIG9uIEFSTQo+I2VuZGlmCj4KPnRoZW4sIHRoaXMgd29uJ3Qgd29yayBi
ZWNhdXNlIHdlIGFyZSBub3QgcnVubmluZyB0aGUga2NvbmZpZyBmaWxlcwo+dGhyb3VnaCB0aGUg
cHJlcHJvY2Vzc29yLgoKaWYgQVJNCmNvbmZpZyBIQVNfU01NVXYyCmJvb2wgIkFSTSBTTU1VdjIg
ZHJpdmVyIgpkZWZhdWx0IHkKZW5kaWYKClRoZSAiaWYiIGJhc2ljYWxseSBhZGRzIGEgcmVzcGVj
dGl2ZSAiZGVwZW5kcyBvbiIgZm9yIGFsbCBlbmNsb3NlZCBvcHRpb25zLgoKCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
