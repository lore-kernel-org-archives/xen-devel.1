From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 14:06:29 +0200
Message-ID: <20180704120629.GJ4670@olila.local.net-space.pl>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z+bn=ju=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fagYf-0001X8-4B
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 12:06:53 +0000
Content-Disposition: inline
In-Reply-To: <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMjUsIDIwMTggYXQgMDc6NDg6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE4IGF0IDE2OjM1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gLS0tIGEveGVuL01ha2VmaWxlCj4gPiArKysgYi94ZW4vTWFrZWZpbGUKPiA+
IEBAIC05LDcgKzksNyBAQCBleHBvcnQgWEVOX0ZVTExWRVJTSU9OICAgPSAkKFhFTl9WRVJTSU9O
KS4kKFhFTl9TVUJWRVJTSU9OKSQoWEVOX0VYVFJBVkVSU0lPTikKPiA+ICBleHBvcnQgWEVOX1dI
T0FNSQk/PSAkKFVTRVIpCj4gPiAgZXhwb3J0IFhFTl9ET01BSU4JPz0gJChzaGVsbCAoWyAteCAv
YmluL2Ruc2RvbWFpbm5hbWUgXSAmJiAvYmluL2Ruc2RvbWFpbm5hbWUpIHx8IChbIC14IC9iaW4v
ZG9tYWlubmFtZSBdICYmIC9iaW4vZG9tYWlubmFtZSB8fCBlY2hvIFt1bmtub3duXSkpCj4gPiAg
ZXhwb3J0IFhFTl9CVUlMRF9EQVRFCT89ICQoc2hlbGwgTENfQUxMPUMgZGF0ZSkKPiA+IC1leHBv
cnQgWEVOX0JVSUxEX1RJTUUJPz0gJChzaGVsbCBMQ19BTEw9QyBkYXRlICslVCkKPiA+ICtleHBv
cnQgWEVOX0JVSUxEX1RJTUUJPz0gJChzaGVsbCBMQ19BTEw9QyBkYXRlIC1kICckKFhFTl9CVUlM
RF9EQVRFKScgKyVUKQo+Cj4gTmljZSBpZGVhLCBidXQgSSdtIG5vdCBzdXJlIHdlIGNhbiByZWx5
IG9uIHRoZSBub24tc3RhbmRhcmQgLWQKPiBvcHRpb24gdG8gYmUgc3VwcG9ydGVkIGJ5IGFsbCBl
bnZpcm9ubWVudHMgWGVuIG1heSBiZSBidWlsdCBpbi4KPiBBcyBwZXIKPiBodHRwOi8vcHVicy5v
cGVuZ3JvdXAub3JnL29ubGluZXB1YnMvMDA3OTA0OTc1L3V0aWxpdGllcy9kYXRlLmh0bWwKPiB0
aGUgb25seSBzdGFuZGFyZCBvcHRpb24gc3VwcG9ydGVkIGJ5IGRhdGUgaXMgLXUuIEFzc3VtaW5n
IEMgYW5kCj4gUE9TSVggbG9jYWxlcyBwcm9kdWNlIHRoZSBzYW1lIHN0YW5kYXJkIGZvcm1hdCwg
SSdtIGFmcmFpZCB5b3UgbWF5Cj4gbmVlZCB0byByZXNvcnQgdG8gc2VkLWVyeSB0byBhY2hpZXZl
IHdoYXQgeW91IHdhbnQuCgpXZWxsLCB0aGlzIGNvbXBsaWNhdGVzIHNpdHVhdGlvbiBmdXJ0aGVy
IGFuZCBpdCBzZWVtcyB0byBtZSB0aGF0CnNlZC1lcnkgY2Fubm90IGJlIHN1ZmZpY2llbnQuIEFu
eXdheSwgSSB3aWxsIHRha2UgYSBsb29rIGhvdyB0bwpzb2x2ZSB0aGF0LgoKRGFuaWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
