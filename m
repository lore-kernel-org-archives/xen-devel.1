From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 08/16] gic: separate ppi processing
Date: Wed, 12 Dec 2018 13:46:28 +0000
Message-ID: <dbc7c922-a83c-d1e6-e1a8-5be059d7d46c@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-9-git-send-email-andrii.anisov@gmail.com>
 <3fa565bc-caa7-8711-e32c-af0738f8c5bf@gmail.com>
 <12b85eb7-9ce1-7a9f-dca2-c374637bf673@arm.com>
 <bfb503ac-b3a6-78aa-5785-546ac685cbac@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX4qP-0000v2-3h
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 13:46:33 +0000
In-Reply-To: <bfb503ac-b3a6-78aa-5785-546ac685cbac@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi8xMi8yMDE4IDEyOjUyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9u
IDEyLjEyLjE4IDE0OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEkgaGF2ZW4ndCBhbnN3ZXJl
ZCBiZWNhdXNlIEkgYW0gd2FpdGluZyB0aGUgbnVtYmVycy4KPiBJIGdvdCBpdC4KPiBCdXQgVEJN
IHdpbGwgbm90IHNob3cgZWZmZWN0IG9mIHRoaXMgcGF0Y2guCgpJZiBUQk0gZG9lcyBub3Qgc2hv
dyBlZmZlY3QsIHRoZW4geW91IG5lZWQgYSBkaWZmZXJlbnQgYmVuY2htYXJrLiBQcm9iYWJseSBi
eSAKbG9va2luZyBhdCBob3cgdGhlIFBQSSBsYXRlbmN5IGluIFhlbi4KCj4gRXZlbiB0aGUgcGF0
Y2ggYnJlYWtzIFRCTSdzIAo+IGZ1bmN0aW9uYWxpdHkgYmVjYXVzZSBUQk0gcmVsaWVzIG9uIGEg
cGh5cyB0aW1lciBpbnRlcnJ1cHQgdG8gYmUgYXNzaWduZWQgdG8gdGhlIAo+IGRvbWFpbiAoZ28g
dGhyb3VnaCB0aGUgc3BpIHBhdGgpLgoKV2VsbCwgdGhlIHByb2JsZW0gaXMgeW91ciBwYXRjaCBh
c3N1bWVzIFBQSSBjYW5ub3QgYmUgYXNzaWduZWQgdG8gdGhlIGd1ZXN0LiAKV2hpbGUgdGhpcyBp
cyB0aGUgY2FzZSB0b2RheSwgdGhlcmUgYXJlIHBsYW4gZm9yIGhhbmRpbmcgb3ZlciBQUEkgKHN1
Y2ggYXMgCnRpbWVyKSB0byBndWVzdC4gVGhpcyB3aWxsIGhlbHAgdG8gcmVtb3ZlIHRoZSBoYWNr
IHdlIGhhdmUgZm9yIHRoZSB0aW1lciBpbiBib3RoIApYZW4gY29kZSBiYXNlIGFuZCBHdWVzdCBj
b2RlIGJhc2UuCgpJIHdvdWxkIGFjdHVhbGx5IHByZWZlciBpZiB3ZSB0cnkgdG8gb3B0aW1pemUg
ZG9fSVJRLiBBY3R1YWxseSwgdGhpcyBwYXRjaCBoYXMgCnNvbWUgZ29vZCBpZGVhcyB0aGF0IGNh
biBiZSByZS11c2VkIGluIHRoZSBjdXJyZW50IGNvZGUuCgpGb3IgaW5zdGFuY2UsIEkgdGhpbmsg
eW91IGNhbiBkcm9wIHRoZSBsb2dpYyB0aGF0IHVzZSBfSVJRX1BFTkRJTkcgYmVjYXVzZSB0aGUg
CmludGVycnVwdCBjYW4gbmV2ZXIgYmUgcmVjZWl2ZWQgdG8gYW5vdGhlciBQRSB3aGlsZSBhY3Rp
dmUgKHRoaXMgd2lsbCBiZSBjbGVhcmVkIApieSBkZXNjLT5oYW5kbGVyLT5lbmQoKSkuCgpTaW1p
bGFybHkgdGhlIHRlc3Qgb24gX0lSUV9JTlBST0dSRVNTIGNvdWxkIGJlIGRyb3BwZWQuIEFsdGhv
dWdoLCBJIHdvdWxkIHN0aWxsIApsaWtlIHRvIGtlZXAgc2V0L2NsZWFyIF9JUlFfSU5QUk9HUkVT
Uy4KCldpdGggdGhvc2UgY2hhbmdlcywgZG9fSVJRIGJlY29tZXMgYSBsb3QgbW9yZSBsaWtlIHRo
ZSBmdW5jdGlvbiBkb19wcGkuIFRoZSBvbmx5IApkaWZmZXJlbmNlIGlzIHRoZSBzcGlubG9jay4g
QnV0IEkgZG9uJ3QgYmVsaWV2ZSB0aGlzIHdpbGwgYnJpbmcgdGhhdCBtdWNoIApkaWZmZXJlbmNl
IGluIHBlcmZvcm1hbmNlIGltcGFjdC4gQWZ0ZXIgYWxsIHRoZSBsb2NrIHNob3VsZCB1bmxpa2Vs
eSBiZSBjb250ZW5kZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
