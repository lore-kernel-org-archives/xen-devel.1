From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] pvcalls-front: 64-bit align flags
Date: Tue, 27 Feb 2018 13:50:27 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802271349280.4239__44992.5999892459$1519768163$gmane$org@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1802271150020.4239@sstabellini-ThinkPad-X260>
 <b7ec592a-bbd1-48d3-1a1f-92a8ed4a1e48@oracle.com>
 <alpine.DEB.2.10.1802271328140.4239@sstabellini-ThinkPad-X260>
 <b5a80b70-30b4-2fe3-5fc2-347ce58573f1@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bhja=fv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eqn8s-0003kp-AV
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 21:50:34 +0000
In-Reply-To: <b5a80b70-30b4-2fe3-5fc2-347ce58573f1@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNyBGZWIgMjAxOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzI3LzIw
MTggMDQ6MzIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMjcgRmVi
IDIwMTgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+PiBPbiAwMi8yNy8yMDE4IDAyOjU0IFBN
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPj4+IFdlIGFyZSB1c2luZyB0ZXN0X2FuZF8q
IG9wZXJhdGlvbnMgb24gdGhlIHN0YXR1cyBhbmQgZmxhZyBmaWVsZHMgb2YKPiA+Pj4gc3RydWN0
IHNvY2tfbWFwcGluZy4gSG93ZXZlciwgdGhlc2UgZnVuY3Rpb25zIHJlcXVpcmUgdGhlIG9wZXJh
bmQgdG8gYmUKPiA+Pj4gNjQtYml0IGFsaWduZWQgb24gYXJtNjQuIEN1cnJlbnRseSwgb25seSBz
dGF0dXMgaXMgNjQtYml0IGFsaWduZWQuCj4gPj4+Cj4gPj4+IE1ha2UgZmxhZ3MgNjQtYml0IGFs
aWduZWQgYnkgaW50cm9kdWNpbmcgYW4gZXhwbGljaXQgcGFkZGluZyBmaWVsZC4KPiA+Pj4KPiA+
Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8uY29t
Pgo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jIGIv
ZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCj4gPj4+IGluZGV4IGNhNWI3NzMuLmFhMDdiMmEg
MTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwo+ID4+PiArKysg
Yi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKPiA+Pj4gQEAgLTc4LDYgKzc4LDcgQEAgc3Ry
dWN0IHNvY2tfbWFwcGluZyB7Cj4gPj4+ICAjZGVmaW5lIFBWQ0FMTFNfU1RBVFVTX0JJTkQgICAg
ICAgICAgMQo+ID4+PiAgI2RlZmluZSBQVkNBTExTX1NUQVRVU19MSVNURU4gICAgICAgIDIKPiA+
Pj4gIAkJCXVpbnQ4X3Qgc3RhdHVzOwo+ID4+PiArCQkJdWludDhfdCBwYWRbN107Cj4gPj4gRG9l
cyB0aGlzIGd1YXJhbnRlZSBhbGlnbm1lbnQgKGZvciBlaXRoZXIgc3RhdHVzIG9yIGZsYWcpPwo+
ID4gWWVzOiBzdGF0dXMgaXMgcGFydCBvZiBhIHN0cnVjdCBhbmQgYSB1bmlvbi4gVW5pb25zIGFu
ZCBzdHJ1Y3RzIGhhdmUgdGhlCj4gPiBhbGlnbm1lbnQgb2YgdGhlaXIgbW9zdCBhbGlnbmVkIHR5
cGUuIEluIHRoaXMgY2FzZSB0aGV5IGFyZSA2NC1iaXQKPiA+IGFsaWduZWQsIGFzIHNvbWUgb2Yg
dGhlIGZpZWxkcyBhcmUgcG9pbnRlcnMuCj4gPgo+ID4gVGhlIHBhZGRpbmcgbWFrZXMgc3VyZSB0
aGF0IGZsYWdzIGlzIDErNyBieXRlcyBmcm9tIGl0Lgo+IAo+IE9LLgo+IAo+IFdoYXQgYWJvdXQg
YWRkaW5nICBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDgpKSkgdG8gYm90aCAod2l0aCBhIGNvbW1l
bnQKPiBleHBsYWluaW5nIHJlYXNvbmluZyk/CgpUaGF0J3MgZmluZSBieSBtZQoKCj4gPgo+ID4g
IAo+ID4+PiAgCQkvKgo+ID4+PiAgCQkgKiBJbnRlcm5hbCBzdGF0ZS1tYWNoaW5lIGZsYWdzLgo+
ID4+PiAgCQkgKiBPbmx5IG9uZSBhY2NlcHQgb3BlcmF0aW9uIGNhbiBiZSBpbmZsaWdodCBmb3Ig
YSBzb2NrZXQuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
