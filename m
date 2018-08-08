From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] x86/hvm: remove default ioreq server
Date: Wed, 08 Aug 2018 05:50:38 -0600
Message-ID: <5B6AD90E02000078001DC00A@prv1-mh.provo.novell.com>
References: <20180807154201.13943-1-paul.durrant@citrix.com>
 <5B6AC1D102000078001DBEDC@prv1-mh.provo.novell.com>
 <762f1ad90c794a358c848fb3f5f9c9f2@AMSPEX02CL03.citrite.net>
 <5B6ACA9502000078001DBF64@prv1-mh.provo.novell.com>
 <d7c86002-171c-b9c6-a8fe-dc34f724331e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnMzD-0003tk-Q3
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 11:50:43 +0000
In-Reply-To: <d7c86002-171c-b9c6-a8fe-dc34f724331e@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA4LjE4IGF0IDEzOjM4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDgvMTggMTE6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOC4w
OC4xOCBhdCAxMjozOSwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBGcm9t
OiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+Pj4+IFNlbnQ6IDA4IEF1
Z3VzdCAyMDE4IDExOjExCj4+Pj4KPj4+Pj4+PiBPbiAwNy4wOC4xOCBhdCAxNzo0MiwgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGlj
L2h2bS9wYXJhbXMuaAo+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5o
Cj4+Pj4+IEBAIC04MSw5ICs4MSwxMyBAQAo+Pj4+PiAgI2RlZmluZSBIVk1fUEFSQU1fUEFFX0VO
QUJMRUQgIDQKPj4+Pj4KPj4+Pj4gICNkZWZpbmUgSFZNX1BBUkFNX0lPUkVRX1BGTiAgICA1Cj4+
Pj4+IC0KPj4+Pj4gICNkZWZpbmUgSFZNX1BBUkFNX0JVRklPUkVRX1BGTiA2Cj4+Pj4+ICsKPj4+
Pj4gKyNpZmRlZiBfX1hFTl9fCj4+Pj4+ICsvKiBUaGVzZSBwYXJhbWV0ZXJzIGlzIGRlcHJlY2F0
ZWQgYW5kIGl0cyBtZWFuaW5nIGlzIHVuZGVmaW5lZCAqLwo+Pj4+PiArI2RlZmluZSBIVk1fUEFS
QU1fRE1fRE9NQUlOIDEzCj4+Pj4+ICAjZGVmaW5lIEhWTV9QQVJBTV9CVUZJT1JFUV9FVlRDSE4g
MjYKPj4+Pj4gKyNlbmRpZgo+Pj4+IFRoZSBjb21tZW50IHdhcyBvbmx5IHBhcnRseSBzd2l0Y2hl
ZCB0byBwbHVyYWwuCj4+Pj4KPj4+IE9oLCBzbyBpdCB3YXMuIEkgZ3Vlc3MgdGhpcyBjYW4gYmUg
Zml4ZWQgb24gY29tbWl0IHVubGVzcyB5b3UnZCBwcmVmZXIgSSAKPj4+IHNlbmQgYSB2NC4KPj4g
T2gsIG9mIGNvdXJzZSBpdCBjYW4gLSBJIG1lYW50IHRvIHNheSBzbywgYnV0IHRoZW4gZm9yZ290
Lgo+IAo+IE9uZSBub3RlIGhvd2V2ZXIuICBUaGlzIHBhdGNoIGNhbm5vdCBiZSBjb21taXR0ZWQg
dW50aWwgdGhlIGFzc29jaWF0ZWQKPiBwYXRjaCBpcyBjb21taXR0ZWQgaW50byBxZW11LXRyYWQs
IHdoaWNoIGlzIHdhaXRpbmcgb24gSWFuSiBhcyB0aGUKPiBtYWludGFpbmVyIG9mIHRoYXQgdHJl
ZS4KCkFuZCBub3QganVzdCBjb21taXR0ZWQsIGJ1dCBhbHNvIGhhcyBwYXNzZWQgdGhhdCBvdGhl
ciBwdXNoIGdhdGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
