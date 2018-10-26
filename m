From: Joe Jin <joe.jin@oracle.com>
Subject: Re: [PATCH] xen-swiotlb: exchange memory with Xen only
 when pages are contiguous
Date: Fri, 26 Oct 2018 07:40:22 -0700
Message-ID: <16606089-77c8-5701-e01e-1d2032c0e32a__33981.8672197454$1540564748$gmane$org@oracle.com>
References: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1@oracle.com>
 <20181024130246.GA22616@localhost.localdomain>
 <83900cf4-690c-9725-d022-d427fdeb4f7d@oracle.com>
 <581cb7ea-3112-791d-918d-9bb887e4744f@oracle.com>
 <24a62522-1629-5d0b-398e-6d2c1a0b97f7@oracle.com>
 <922914c9-22db-c5d1-33da-d07691ebd7d7@oracle.com>
 <a47fabe8-53d1-47b8-0efc-f9f1e5b4898a@oracle.com>
 <45f5ffe8-3f48-4485-53f0-5a056be69b0c@oracle.com>
 <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
 <20181026074802.GA4768@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=obby=ng=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1gG3Hn-0004B8-F9
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 14:40:27 +0000
In-Reply-To: <20181026074802.GA4768@lst.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Helwig <hch@lst.de>
Cc: John Sobecki <john.sobecki@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, konrad@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQ2hyaXN0b3BoLAoKT24gMTAvMjYvMTggMTI6NDggQU0sIENocmlzdG9waCBIZWx3aWcgd3Jv
dGU6Cj4gT24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMTE6NTY6MDJBTSAtMDcwMCwgSm9lIEppbiB3
cm90ZToKPj4gSSBqdXN0IGRpc2N1c3NlZCB0aGlzIHBhdGNoIHdpdGggQm9yaXMgaW4gcHJpdmF0
ZSwgaGlzIG9waW5pb25zKEJvcmlzLAo+PiBwbGVhc2UgY29ycmVjdCBtZSBpZiBhbnkgbWlzdW5k
ZXJzdG9vZCkgYXJlOgo+Pgo+PiAxLiBXaXRoL3dpdGhvdXQgdGhlIGNoZWNrLCBib3RoIGFyZSBp
bmNvcnJlY3QsIGhlIHRob3VnaHQgd2UgbmVlZCB0bwo+PiAgICBwcmV2ZW50ZWQgdW5hbGxvYydk
IGZyZWUgYXQgaGVyZS4gCj4+IDIuIE9uIGZyZWVpbmcsIGlmIHVwcGVyIGxheWVyIGFscmVhZHkg
Y2hlY2tlZCB0aGUgbWVtb3J5IHdhcyBETUEtYWJsZSwKPj4gICAgdGhlIGNoZWNraW5nIGF0IGhl
cmUgZG9lcyBub3QgbWFrZSBzZW5zZSwgd2UgY2FuIHJlbW92ZSBhbGwgY2hlY2tzLgo+PiAzLiB4
ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCkgYW5kIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNf
cmVnaW9uKCkKPj4gICAgdG8gY29tZSBpbiBwYWlycy4KPj4KPj4gRm9yICMxIGFuZCAjMywgSSB0
aGluayB3ZSBuZWVkIHNvbWV0aGluZyBhc3NvY2lhdGUgaXQsIGxpa2UgYSBsaXN0LCBvbgo+PiBh
bGxvY2F0aW5nLCBhZGQgYWRkciB0byBpdCwgb24gZnJlZWluZywgY2hlY2sgaWYgaW4gdGhlIGxp
c3QuCj4gCj4gSXMgdGhlcmUgYW55IHdheSB0byBmaWd1cmUgb3V0IGJhc2VkIG9uIGFuIGFkZHJl
c3MgaWYgdGhlIGV4Y2hhbmdlCj4gb3BlcmF0aW9uIGhhcHBlbmVkPwoKUmVhZCB0aGUgY29kZSBw
YXRoIGFuZCBJIHdhcyBub3QgZm91bmQgYW55d2hlcmUgd2lsbCBzdG9yZSByZWxhdGVkIGluZm8s
Cm9uIGN1cnJlbnQgY29kZSwgaXQgYXNzdW1pbmcgaWYgbWVtb3J5IGluIERNQSBhcmVhIGFsc28g
Y29udGlndW91cyB0aGVuCml0IGZyb20gWGVuLCBtb3N0IHRpbWUgaXQncyB0cnVlLCBidXQgaWYg
bHVja3kgdGhhdCBfX2dldF9mcmVlX3BhZ2VzKCkKcmV0dXJuZWQgbWVtb3J5IGlzIERNQWFibGUs
IGl0IHdpbGwgbm90IGV4Y2hhbmdlIHdpdGggWGVuLCBkdXJpbmcgbXkgdGVzdGluZwpJIG9ic2Vy
dmVkIHNhbWUoWGVuIERNQSBoZWFwIGluY3JlYXNlZCkuCgo+IAo+PiBGb3IgIzIsIEknbSB3YXMg
bm90IGZvdW5kIGFueXdoZXJlIHZhbGlkYXRlZCB0aGUgYWRkcmVzcyBvbiAKPj4gZG1hX2ZyZWVf
Y29oZXJlbnQoKSBjYWxscGF0aCwgbm90IGp1c3QgeGVuLXN3aW90bGIuCj4gCj4gQXQgbGVhc3Qg
Zm9yIHNpbXBsZSBkaXJlY3QgbWFwcGluZ3MgdGhlcmUgaXMgbm8gZWFzeSB3YXkgdG8gdmVyaWZ5
IHRoYXQKPiB3aXRob3V0IGtlZXBpbmcgYSBsaXN0LCBhbmQgZm9yIHNvbWUgb2YgdGhlIG9wcyB0
aGF0IGRvIHZtYXAgbGlrZT4gb3BlcmF0aW9ucyB3ZSBoYXZlIGJhc2ljIHNhbnRpeSBjaGVja3Ms
IGJ1dCBub3RoaW5nIHRoYXQgcmVhbGx5IGNhdGNoZXMKPiBhIHdyb25nIGZyZWUuCgpJIGFncmVl
IHdpdGggeW91LCBhZGQgYSBsaXN0IHdpbGwgaGVscCB0aGlzIGlzc3VlLCBidXQgaXQgbWF5IGlu
dHJvZHVjZSBzb21lCnBlcmZvcm1hbmNlIGlzc3VlLCBlc3BlY2lhbGx5IG9uIGhlYXZ5IERNQSBz
eXN0ZW0uCgpEcml2ZXIgdXNlIERNQSBwb29sIHdpbGwgaGVscCB0byBhdm9pZCB0aGlzIGlzc3Vl
LCBidXQgbm90IGFsbCBraW5kcyBETUEgb3BzCmFyZSBzdWl0YWJsZSB0byBjcmVhdGUgYSBwb29s
LgoKVGhhbmtzLApKb2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
