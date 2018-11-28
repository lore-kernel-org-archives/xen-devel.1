From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 19:47:09 +0000
Message-ID: <20181128194708.GP30658__10749.6696211912$1543434376$gmane$org@n2100.armlinux.org.uk>
References: <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128.112717.149234960284639699.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dsg/=oh=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1gS5o4-0000oe-O9
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 19:47:32 +0000
Content-Disposition: inline
In-Reply-To: <20181128.112717.149234960284639699.davem@davemloft.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Miller <davem@davemloft.net>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, x86@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, dwmw2@infradead.org, torvalds@linux-foundation.org, hch@lst.de, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMTE6Mjc6MTdBTSAtMDgwMCwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9y
Zz4KPiBEYXRlOiBXZWQsIDI4IE5vdiAyMDE4IDEwOjAwOjA2IC0wODAwCj4gCj4gPiBOb3QgYWxs
IG1lbW9yeSBpcyBhY2Nlc3NpYmxlIGV2ZW4gdG8gdGhlIGtlcm5lbC4gSWYgeW91IGhhdmUgbWVt
b3J5Cj4gPiB0aGF0IHNob3dzIHVwIGluIHRoZSBsYXN0IHBhZ2Ugb2YgcGh5c19hZGRyX3QsIHlv
dSBqdXN0IG1hcmsgaXQKPiA+IHJlc2VydmVkIGF0IGJvb3QtdGltZS4KPiAKPiBJdCdzIG5vdCB0
aGUgcGh5c2ljYWwgbWVtb3J5IGF0IHRoZSBlbmQgdGhhdCBuZWVkcyB0byBiZSByZXNlcnZlZC4K
PiAKPiBJdCdzIHRoZSBJT01NVSBtYXBwaW5nIGFyZW5hLgoKVHJ1ZSwgaWYgYW5kIG9ubHkgaWYg
eW91IGhhdmUgYW4gSU9NTVUuCgpXaGVyZSB0aGVyZSBpc24ndCBhbiBJT01NVSwgdGhlbiB3ZSdk
IGhhdmUgdG8gcmVzZXJ2ZSBldmVyeSBwYWdlIHRoYXQKdGhhdCB0cmFuc2xhdGVzIHRvIGEgYnVz
IGFkZHJlc3MgaW4gdGhlIHRvcCA0SyBvZiBkbWFfYWRkcl90IG9uIGFueQpidXMgaW4gdGhlIHN5
c3RlbSAtIHRoYXQgbWVhbnMga25vd2luZyBlYXJseSBpbiB0aGUga2VybmVsCmluaXRpYWxpc2F0
aW9uIGFib3V0IGFsbCBidXNlcyBpbiB0aGUgc3lzdGVtIHNvIHdlIGNhbiBkZXRlY3QgYW5kCnJl
c2VydmUgdGhlc2UgcGFnZXMuCgpJIGRvbid0IHRoaW5rIHRoYXQncyB0cml2aWFsIHRvIGRvLgoK
LS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cDovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxv
cGVyL3BhdGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6
IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3Qu
bmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
