From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 39/57] ARM: new VGIC: Add ACTIVE registers
	handlers
Date: Tue, 13 Mar 2018 17:16:41 +0000
Message-ID: <7155b0e2-0807-75e3-5289-24feb47e948b@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-40-andre.przywara@linaro.org>
 <5cfb7bb1-c7c8-5b44-5838-a0c3a582499b@arm.com>
 <2cb568e9-7f92-ab2c-8b79-17b4365d67c7@linaro.org>
 <ff733893-a7f7-b761-4b9d-22db2d316e66@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=l4at=gd=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1evnXd-0004Es-Nk
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 17:16:49 +0000
In-Reply-To: <ff733893-a7f7-b761-4b9d-22db2d316e66@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMy8wMy8xOCAxNzoxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEzLzAzLzE4IDE3
OjAyLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4gT24gMDgvMDMvMTggMTU6MzksIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+IE9uIDA1LzAzLzE4IDE2OjAzLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
Pj4+IEkgYWRtaXQgdGhlIGJhaWxvdXQgaXMgYSBiaXQgd2VpcmQgaGVyZS4gWW91IHdvdWxkIG9u
bHkgcHJpbnQgdGhlCj4+PiB3YXJuaW5nIGZvciB0aGUgZmlyc3QgYWN0aXZhdGVkIElSUSBhbmQg
Z2l2ZSB0aGUgaW1wcmVzc2lvbiBpdCBpcyBmaW5lCj4+PiBmb3IgdGhlIHJlc3QuIFNvIG1heWJl
IHlvdSB3YW50IHRvIGRyb3AgSVJRJWQ/Cj4+Cj4+IEZvciB0aGUgYWJvdmUgcmVhc29ucyBJIHdh
bnRlZCB0byBrZWVwIHRoZW0gY29uY2lzZSwgc28gdGhhdCB3ZSBzZWUgdGhhdAo+PiB0aGUgaXNz
dWUgaGFzIGhhcHBlbmVkLCBidXQgYXZvaWQgZ2V0dGluZyB0b25zIG9mIGVycm9yIG1lc3NhZ2Vz
IGFib3V0Cj4+IHRoZSBzYW1lIHByb2JsZW0gKGFzIHRoaXMgbWF5IGFmZmVjdCB1cCB0byAzMiBJ
UlFzKS4KPj4gQnV0IGZvciBkZWJ1Z2dpbmcgaXQgbWlnaHQgYmUgZ29vZCB0byBrbm93IHdoaWNo
IElSUSB3YXMgYWZmZWN0ZWQuIEkgc2VlCj4+IHR3byB1c2UgY2FzZXMgZm9yIGEgZ3Vlc3Q6Cj4+
IC0gKERlLSlhY3RpdmF0aW5nIGEgc2luZ2xlIElSUTogd2UgZ2V0IG9uZSBtZXNzYWdlIGFuZCBr
bm93IHdoaWNoIElSUSBpdAo+PiB3YXMsIHNvIGFuIGFkbWluIGNhbiBjaGFzZSB0aGlzIGRvd24g
dG8gYSBjZXJ0YWluIGRldmljZSAoZHJpdmVyKS4KPj4gLSAoRGUtKWFjdGl2YXRpbmcgKmV2ZXJ5
KiBJUlEgaW4gdGhpcyByYW5nZSAofjApOiB3ZSBzdGlsbCBnZXQgb25lCj4+IG1lc3NhZ2UgcGVy
IDMyIElSUXMsIGJ1dCBjYW4gc2VlIHdoZXRoZXIgaXQgY292ZXJzIFNQSXMgb25seSAoSVJRPj0z
MikKPj4gYW5kIHdoaWNoIG9uZXMuCj4+Cj4+IFNvIHdoYXQgYWJvdXQgYSBjb21wcm9taXNlOiBJ
IHVzZSBkcHJpbnRrKFhFTkxPR19HX0VSUiwgIiVwdiAuLi4pLCBwcmludAo+PiB0aGUgKGZpcnN0
KSBJUlEgYW5kIHRoZSAqdmFsdWUqIHRvIGJlIHdyaXR0ZW4uIFNvIGEga25vd2xlZGdlYWJsZSBh
ZG1pbgo+PiBjYW4gdGVsbCB3aGV0aGVyIGl0J3MgYSBzaW5nbGUgSVJRIG9yIGEgImNsZWFyL3Nl
dC1hbGwiIGNhc2UuIFRoYXQKPj4gc2hvdWxkIGFsc28gZ2l2ZSBlbm91Z2ggaW5mbyBmb3IgZGVi
dWdnaW5nLCBidXQga2VlcHMgaXQgc2hvcnQuCj4gCj4gSSBjYW4ndCBzZWUgaG93IGEga25vd2xl
ZGdlYWJsZSBhZG1pbiB3aWxsIGJlIGFibGUgdG8ga25vdyB0aGF0IElSUSAyIGlzIAo+IGFjdGl2
ZSB3aXRoIGp1c3QgdGhlIHJlZ2lzdGVyIHZhbHVlLgo+IAo+Pgo+PiBEb2VzIHRoYXQgc291bmQg
T0s/Cj4gCj4gSSB3b3VsZCBzdGlsbCBwcmVmZXIgdGhlIG9uZSBwZXIgSVJRIGFuZCB1c2luZyBw
cmludGsoWEVOTE9HX0dfKikuIEkgID4gZG9uJ3QgbXVjaCBjYXJlIGFib3V0IHRoZSBzcGFtLCBz
ZWUgd2h5IGFib3ZlLgoKWEVOTE9HX0dfREVCVUcgaXMgYSBnb29kIGNhbmRpZGF0ZSBhY3R1YWxs
eS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
