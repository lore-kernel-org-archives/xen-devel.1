From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Fri, 18 Jan 2019 10:48:57 +0000
Message-ID: <ca2ed7b7-f0b6-6b06-a306-b7c693e354b1@arm.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <a0500e7bb7244b5aa6dc1282a2375ad0@dornerworks.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901161630210.18561@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901171701380.18561@sstabellini-ThinkPad-X260>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yjae=P2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkRiP-00071I-2a
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 10:49:33 +0000
In-Reply-To: <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTgvMDEvMjAxOSAwOTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDEuMTkgYXQgMDI6MjQsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4gT24g
VGh1LCAxNyBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxNy4wMS4xOSBh
dCAwMTozNywgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+IE9uIFdlZCwgMTYg
SmFuIDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IFN0b3AuIE5vLiBXZSB2ZXJ5IG11Y2ggY2Fu
IHByb3ZlIHRoZXkgYXJlIC0gX2VuZCBwb2ludHMgYXQKPiBvbmUgcGFzdCB0aGUgbGFzdCBlbGVt
ZW50IG9mIF9zdGFydFtdLiBJdCBpcyB0aGUgY29tcGlsZXIgd2hpY2gKPiBjYW4ndCBwcm92ZSB0
aGUgb3Bwb3NpdGUsIGFuZCBoZW5jZSBpdCBjYW4ndCBsZXZlcmFnZQo+IHVuZGVmaW5lZCBiZWhh
dmlvciBmb3Igb3B0aW1pemF0aW9uIHB1cnBvc2VzLgoKWW91IGtlZXAgc2F5aW5nIHRoZSBjb21w
aWxlciBjYW4ndCBsZXZlcmFnZSBpdCBmb3Igb3B0aW1pemF0aW9uIHB1cnBvc2UsIGhvd2V2ZXIg
CnRoZXJlIGFyZSBjb25maXJtYXRpb25zIHRoYXQgR0NDIG1heSBhY3R1YWxseSBsZXZlcmFnZSBp
dCAoZS5nIFsxXSkuIFlvdSAKYWN0dWFsbHkgbmVlZCB0byB0cmljayB0aGUgY29tcGlsZXIgdG8g
YXZvaWQgdGhlIG9wdGltaXphdGlvbiAoZS5nIFJFTE9DX0hJREUpLgoKU28gb2J2aW91c2x5LCB0
aGlzIGlzIG5vdCBvbmx5IGEgTUlTUkEgInByb2JsZW0iIGFzIHlvdSBzdGF0ZSBoZXJlIGFuZCBi
ZWxvdy4KCkkgYmVsaWV2ZSBTdGVmYW5vLCBTdGV3YXJ0IGFuZCBJIHByb3ZpZGVkIHBsZW50eSBv
ZiBkb2N1bWVudGF0aW9uL3RocmVhZCB0byAKc3VwcG9ydCBvdXIgcG9zaXRpb25zLiBDYW4geW91
IHByb3ZpZGUgdXMgZG9jdW1lbnRhdGlvbi90aHJlYWQgc2hvd2luZyB0aGUgCmNvbXBpbGVyIHdp
bGwgbm90IHRyeSB0byBsZXZlcmFnZSB0aGF0IGNhc2U/CgpDaGVlcnMsCgpbMV0gCmh0dHBzOi8v
a3Jpc3RlcncuYmxvZ3Nwb3QuY29tLzIwMTYvMTIvcG9pbnRlci1jb21wYXJpc29uLWludmFsaWQt
b3B0aW1pemF0aW9uLmh0bWw/bT0xCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
