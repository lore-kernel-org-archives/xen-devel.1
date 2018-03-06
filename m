From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/5] x86: improve PDX <-> PFN and alike
 translations
Date: Tue, 06 Mar 2018 01:45:35 -0700
Message-ID: <5A9E633F02000078001AED99@prv-mh.provo.novell.com>
References: <5A96C1D602000078001ACCEC@prv-mh.provo.novell.com>
 <94e4562c-90fe-0cd4-ea5f-4c5c568a5023@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c2h8=f4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1et8E9-0007Zf-CQ
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 08:45:41 +0000
In-Reply-To: <94e4562c-90fe-0cd4-ea5f-4c5c568a5023@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAyLjE4IGF0IDE3OjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDIvMTggMTM6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAxOiByZW1vdmUg
cGFnZS5oIGFuZCBwcm9jZXNzb3IuaCBpbmNsdXNpb24gZnJvbSBhc21fZGVmbnMuaAo+PiAyOiB1
c2UgUERFUCBmb3IgUFRFIGZsYWdzIGluc2VydGlvbiB3aGVuIGF2YWlsYWJsZQo+PiAzOiB1c2Ug
UERFUC9QRVhUIGZvciBtYWRkci9kaXJlY3QtbWFwLW9mZnNldCBjb252ZXJzaW9uIHdoZW4gYXZh
aWxhYmxlCj4+IDQ6IHVzZSBQREVQL1BFWFQgZm9yIFBGTi9QRFggY29udmVyc2lvbiB3aGVuIGF2
YWlsYWJsZQo+PiA1OiB1c2UgTU9WIGZvciBQRk4vUERYIGNvbnZlcnNpb24gd2hlbiBwb3NzaWJs
ZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
Cj4gCj4gQWggLSBzbyB0aGlzIHdhcyB0aGUgc2VyaWVzIHlvdSB3ZXJlIG9uIGFib3V0IHdoaWNo
IHdvdWxkIGhhdmUgYW4KPiBpbnRlcmVzdGluZyB0aW1lIGluIGNvbWJpbmF0aW9uIHdpdGggbXkg
bm9wIGF1dG9zaXppbmcuCj4gCj4gRG8geW91IGhhdmUgcGVyZm9ybWFuY2UgbnVtYmVycyBmb3Ig
dGhlc2UgY2hhbmdlcz8gIEkgY2FuIGNlcnRhaW5seSBzZWUKPiB0aGUgYXR0cmFjdGlvbiBvZiB1
c2luZyBCTUkyIHdoZW4gYXZhaWxhYmxlLCBidXQgZG8gdGhlIGFzc29jaWF0ZWQgY29zdHMKPiBv
biBpbmNvbXBhdGlibGUgaGFyZHdhcmUgd29ydGggaXQ/ICBJJ20gdGhpbmtpbmcgc3BlY2lmaWNh
bGx5IG9mIHR1cm5pbmcKPiBhbGwgdGhpcyBpbmxpbmUgYml0IG1hbmlwdWxhdGlvbiBpbnRvIGZ1
bmN0aW9uIGNhbGxzPyAgKEkgZ2VudWluZWx5Cj4gZG9uJ3Qga25vdyB0aGUgYW5zd2VyLCBhbmQg
aXQgbWlnaHQgYmUgZW50aXJlbHkgZmluZSwgYnV0IEknbSBjb25jZXJuZWQKPiBhYm91dCB3aGV0
aGVyIGl0IG1heSBub3QgYmUpLgo+IAo+IFdoYXQgZ2VuZXJhdGlvbiBvZiBiaW51dGlscyBkbyB5
b3UgZXhwZWN0IHRoaXMgYWxsIHRvIHdvcmsgd2l0aD8KClNvIG9uZSBxdWVzdGlvbiBoZXJlIGlz
IHdoZXRoZXIgdG8gbWFrZSB0aGlzIGluZGVwZW5kZW50IG9mCmJpbnV0aWxzIHZlcnNpb24sIGFu
ZCBpbnN0ZWFkIG1ha2UgdXNlIG9mIGdjYydzIG5ldyBWIG9wZXJhbmQKbW9kaWZpZXIgKHdoaWNo
IGRpZG4ndCBleGlzdCB5ZXQgYmFjayB3aGVuIEkgd3JvdGUgdGhpcykuIFNpbmNlCnRob3NlIGlu
ZGlyZWN0IHRodW5rIHBhdGNoZXMgYXJlIGxpa2VseSB0byBiZSBiYWNrcG9ydGVkIGJ5CmRpc3Ry
b3MsIEknZCBleHBlY3QgdXMgdG8gYmUgYWJsZSB0byB1c2UgdGhlIG1vcmUgZmxleGlibGUKdmFy
aWFudCBvZiB0aGUgYWx0ZXJuYXRpdmVzIGhlcmUgaW4gYSB3aWRlciBzZXQgb2YgY2FzZXMgaWYg
d2UKd2VudCB0aGF0IHJvdXRlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
