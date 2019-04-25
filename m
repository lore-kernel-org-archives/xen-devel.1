From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Thu, 25 Apr 2019 11:07:11 +0200
Message-ID: <a1203397-9704-192a-c157-442dbeee62c5__13222.4203132623$1556183290$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJaLa-0000x2-KW
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 09:07:14 +0000
References: =?UTF-8?B?PDIwMTkwNDIzMTA1NDU3LjE3NTAy77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwNDIzMTA1NDU3LjE3NTAy77+9NO+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3calpine=2eDEB=2e2=2e10=2e1904230955190=2e24598=40sstabelli?=
 =?UTF-8?Q?ni=ef=bf=bdThinkPad=ef=bf=bdX260=3e_=3ce744c7eb-1685-13b6-7ae9-e9?=
 =?UTF-8?Q?52f8f53ab0=40suse=2ecom=3e_=3c5CC177740200007800228EB2=40suse=2ec?=
 =?UTF-8?B?b20+?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, lkml <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxMTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDQuMTkg
YXQgMjA6MzYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyMy8wNC8yMDE5IDE5OjA1
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBUdWUsIDIzIEFwciAyMDE5LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+IEluc3RlYWQgb2YgYWx3YXlzIGNhbGxpbmcgeGVuX2Rlc3Ry
b3lfY29udGlndW91c19yZWdpb24oKSBpbiBjYXNlIHRoZQo+Pj4+IG1lbW9yeSBpcyBETUEtYWJs
ZSBmb3IgdGhlIHVzZWQgZGV2aWNlLCBkbyBzbyBvbmx5IGluIGNhc2UgaXQgaGFzIGJlZW4KPj4+
PiBtYWRlIERNQS1hYmxlIHZpYSB4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCkgYmVmb3Jl
Lgo+Pj4+Cj4+Pj4gVGhpcyB3aWxsIGF2b2lkIGEgbG90IG9mIHhlbl9kZXN0cm95X2NvbnRpZ3Vv
dXNfcmVnaW9uKCkgY2FsbHMgZm9yCj4+Pj4gNjQtYml0IGNhcGFibGUgZGV2aWNlcy4KPj4+Pgo+
Pj4+IEFzIHRoZSBtZW1vcnkgaW4gcXVlc3Rpb24gaXMgb3duZWQgYnkgc3dpb3RsYi14ZW4gdGhl
IFBHX293bmVyX3ByaXZfMQo+Pj4+IGZsYWcgb2YgdGhlIGZpcnN0IGFsbG9jYXRlZCBwYWdlIGNh
biBiZSB1c2VkIGZvciByZW1lbWJlcmluZy4KPj4+Cj4+PiBBbHRob3VnaCB0aGUgcGF0Y2ggbG9v
a3MgT0ssIHRoaXMgc2VudGVuY2UgcHV6emxlcyBtZS4gV2h5IGRvIHlvdSBzYXkKPj4+IHRoYXQg
dGhlIG1lbW9yeSBpbiBxdWVzdGlvbiBpcyBvd25lZCBieSBzd2lvdGxiLXhlbj8gQmVjYXVzZSBp
dCB3YXMKPj4+IHJldHVybmVkIGJ5IHhlbl9hbGxvY19jb2hlcmVudF9wYWdlcz8gQm90aCB0aGUg
eDg2IGFuZCB0aGUgQXJtCj4+PiBpbXBsZW1lbnRhdGlvbiByZXR1cm4gZnJlc2ggbmV3IG1lbW9y
eSwgaGVuY2UsIGl0IHNob3VsZCBiZSBzYWZlIHRvIHNldAo+Pj4gdGhlIFBhZ2VPd25lclByaXYx
IGZsYWc/Cj4+Pgo+Pj4gTXkgY29uY2VybiB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgd2l0aCB0aGUg
c2VtYW50aWNzIG9mIFBHX293bmVyX3ByaXZfMS4KPj4+IElzIGEgcGFnZSBtYXJrZWQgd2l0aCBQ
R19vd25lcl9wcml2XzEgb25seSBzdXBwb3NlZCB0byBiZSB1c2VkIGJ5IHRoZQo+Pj4gb3duZXI/
Cj4+Cj4+IFRoZSBvd25lciBvZiB0aGUgcGFnZSBpcyBmcmVlIHRvIHVzZSB0aGUgZmxhZy4KPj4K
Pj4gTGlrZSBHcmFudCBwYWdlcyBhcmUgbWFya2VkIGJ5IHRoZSBncmFudCBkcml2ZXIgdXNpbmcg
dGhpcyBmbGFnLiBBbmQKPj4gWGVuIHBhZ2UgdGFibGVzIGFyZSB1c2luZyBpdCBpbiBQVi1ndWVz
dHMgZm9yIGluZGljYXRpbmcgYSAiUGlubmVkIgo+PiBwYWdlIHRhYmxlLgo+IAo+IENvbnNpZGVy
aW5nIHRoZSBiYWNrZ3JvdW5kIG9mIHRoZSBzZXJpZXMsIGlzbid0IHN1Y2ggbXVsdGktcHVycG9z
ZSB1c2UKPiBvZiB0aGUgZmxhZyBhIHBvc3NpYmxlIHByb2JsZW0/IFlvdSdyZSBhbHJlYWR5IHN1
c3BlY3RpbmcgYSB3cm9uZyBjYWxsCj4gaW50byBoZXJlLiBUaGUgZnVuY3Rpb24gZmluZGluZyB0
aGUgZmxhZyBzZXQgKGJ1dCBmb3IgYW5vdGhlciByZWFzb24pCj4gbWlnaHQgYWRkIHRvIHRoZSBj
b25mdXNpb24uIEJ1dCBJIHJlYWxpemUgdGhlcmUgYXJlIG9ubHkgc28gbWFueSBwYWdlCj4gZmxh
Z3MgYXZhaWxhYmxlLgoKUmlnaHQuCgo+IFBlcmhhcHMgdGhlIGZyZWVpbmcgZnVuY3Rpb24gc2hv
dWxkLCBmaXJzdCB0aGluZywgY2hlY2sgdGhlIGhhbmRlZAo+IHNwYWNlIGFjdHVhbGx5IG1hdGNo
ZXMgdGhlIGNyaXRlcmlhICh3aXRoaW4gZG1hX21hc2sgYW5kIGNvbnRpZ3VvdXMpPwoKWWVzLCBJ
IHRoaW5rIHRoaXMgaXMgYSBnb29kIGlkZWEuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
