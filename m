From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 05/11] common/grant_table:
 block speculative out-of-bound accesses
Date: Mon, 28 Jan 2019 08:09:36 -0700
Message-ID: <5C4F1B300200007800211CAE@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-6-git-send-email-nmanthey@amazon.de>
 <5C486E0A02000078002106DD@prv1-mh.provo.novell.com>
 <1063c835-3944-48bf-b082-c80ce726a0e6@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go8Xg-0005rP-HB
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 15:09:44 +0000
In-Reply-To: <1063c835-3944-48bf-b082-c80ce726a0e6@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDE1OjQ1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAxLzIzLzE5IDE0OjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjMuMDEuMTkgYXQg
MTI6NTEsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gQEAgLTIyMjMsNyArMjIzMSw4
IEBAIGdudHRhYl90cmFuc2ZlcigKPj4+ICAgICAgICAgIG9rYXkgPSBnbnR0YWJfcHJlcGFyZV9m
b3JfdHJhbnNmZXIoZSwgZCwgZ29wLnJlZik7Cj4+PiAgICAgICAgICBzcGluX2xvY2soJmUtPnBh
Z2VfYWxsb2NfbG9jayk7Cj4+PiAgCj4+PiAtICAgICAgICBpZiAoIHVubGlrZWx5KCFva2F5KSB8
fCB1bmxpa2VseShlLT5pc19keWluZykgKQo+Pj4gKyAgICAgICAgLyogTWFrZSBzdXJlIHRoaXMg
Y2hlY2sgaXMgbm90IGJ5cGFzc2VkIHNwZWN1bGF0aXZlbHkgKi8KPj4+ICsgICAgICAgIGlmICgg
ZXZhbHVhdGVfbm9zcGVjKHVubGlrZWx5KCFva2F5KSB8fCB1bmxpa2VseShlLT5pc19keWluZykp
ICkKPj4+ICAgICAgICAgIHsKPj4+ICAgICAgICAgICAgICBib29sX3QgZHJvcF9kb21fcmVmID0g
IWRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGUsIC0xKTsKPj4gV2hhdCBpcyBpdCB0aGF0IG1ha2Vz
IHRoaXMgcGFydGljdWxhciBpZigpIGRpZmZlcmVudCBmcm9tIG90aGVyCj4+IHN1cnJvdW5kaW5n
IG9uZXM/IEluIHBhcnRpY3VsYXIgdGhlIHZlcnNpb24gZGVwZW5kZW50IGNvZGUgKGEgZmV3Cj4+
IGxpbmVzIGRvd24gZnJvbSBoZXJlIGFzIHdlbGwgYXMgZWxzZXdoZXJlKSBsb29rIHRvIGJlIGVh
c2lseQo+PiBkaXZlcnRhYmxlIG9udG8gdGhlIHdyb25nIGJyYW5jaCwgdGhlbiBjYXVzaW5nIG91
dCBvZiBib3VuZHMKPj4gc3BlY3VsYXRpdmUgYWNjZXNzZXMgZHVlIHRvIHRoZSBkaWZmZXJlbnQg
KHZlcnNpb24gZGVwZW5kZW50KQo+PiBzaGFyZWQgZW50cnkgc2l6ZXMuCj4gVGhpcyBjaGVjayBl
dmFsdWF0ZXMgdGhlIHZhcmlhYmxlIG9rYXksIHdoaWNoIGluZGljYXRlcyB3aGV0aGVyIHRoZQo+
IHZhbHVlIG9mIGdvcC5yZWYgaXMgYm91bmRlZCBjb3JyZWN0bHkuCgpIb3cgZG9lcyBnb3AucmVm
IGNvbWUgaW50byBwbGF5IGhlcmU/IFRoZSBpZigpIGFib3ZlIGRvZXMgbm90IHVzZQpvciB1cGRh
dGUgaXQuCgo+IFRoZSBuZXh0IGNvbmRpdGlvbmFsIHRoYXQgdXNlcwo+IGNvZGUgYmFzZWQgb24g
YSB2ZXJzaW9uIHNob3VsZCBiZSBmaW5lLCBldmVuIHdoZW4gYmVpbmcgZW50ZXJlZAo+IHNwZWN1
bGF0aXZlbHkgd2l0aCB0aGUgd3JvbmcgdmVyc2lvbiBzZXR1cCwgYXMgdGhlIHZhbHVlIG9mIGdv
cC5yZWYgaXMKPiBjb3JyZWN0IChpLmUuIGFyY2hpdGVjdHVyYWxseSB2aXNpYmxlIGFmdGVyIHRo
aXMgbGZlbmNlKSBhbHJlYWR5LiBBcyB0aGUKPiB2ZXJzaW9uIGRlcGVuZGVudCBtYWNyb3MgYXJl
IHVzZWQsIGkuZS4gc2hhcmVkX2VudHJ5X3YxIGFuZAo+IHNoYXJlZF9lbnRyeV92MiwgSSBkbyBu
b3Qgc2VlIGEgcmlzayB3aHkgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzcwo+IHNob3Vs
ZCBoYXBwZW4gaGVyZS4KCkFzIHNhaWQgLSB2MiBlbnRyaWVzIGFyZSBsYXJnZXIgdGhhbiB2MSBv
bmVzLiBUaGVyZWZvcmUsIGlmIHRoZQpwcm9jZXNzb3Igd3JvbmdseSBzcGVjdWxhdGVzIGFsb25n
IHRoZSB2MiBwYXRoLCBpdCBtYXkgdXNlCmluZGV4ZXMgdmFsaWQgZm9yIHYxLCBidXQgYmV5b25k
IHRoZSBzaXplIHdoZW4gc2NhbGVkIGJ5IHYyCmVsZW1lbnQgc2l6ZSAod2hlcmVhcyAtPnNoYXJl
ZF9yYXdbXSwgYWxpYXNlZCB3aXRoCi0+c2hhcmVkX3YxW10gYW5kIC0+c2hhcmVkX3YyW10sIHdh
cyBhY3R1YWxseSBzZXQgdXAgd2l0aCB2MQplbGVtZW50IHNpemUpLgoKQW5kIHBsZWFzZSBkb24n
dCBmb3JnZXQgLSB0aGlzIHN1YnNlcXVlbnQgY29uZGl0aW9uYWwgd2FzIGp1c3QgYW4KZWFzeSBl
eGFtcGxlLiBXaGF0IEknbSByZWFsbHkgYWZ0ZXIgaXMgd2h5IHlvdSBtb2RpZnkgdGhlIGlmKCkK
YWJvdmUsIHdpdGhvdXQgdGhlcmUgYmVpbmcgYW55IGFycmF5IGluZGV4IGludm9sdmVkLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
