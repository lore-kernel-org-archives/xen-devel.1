From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Fri, 18 Jan 2019 09:40:00 +0000
Message-ID: <1cfc5cb4-e481-5d71-29df-958db76fb681__40723.8565072932$1547804348$gmane$org@epam.com>
References: <20190115140420.4652-1-andr2000@gmail.com>
 <20190116063002.jq3aas6ofhaogmyk@sirius.home.kraxel.org>
 <20190116063631.GA10881@infradead.org>
 <042fe794-dec6-6d9d-5b68-6f142790f5c7@epam.com>
 <20190117091815.GA7090@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AQhn=P2=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1gkQdO-0001T4-QK
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 09:40:18 +0000
In-Reply-To: <20190117091815.GA7090@infradead.org>
Content-Language: en-US
Content-ID: <204A5FE564B9DB4094A3E9EF25F30501@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: "jgross@suse.com" <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "noralf@tronnes.org" <noralf@tronnes.org>, Gerd Hoffmann <kraxel@redhat.com>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNy8xOSAxMToxOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IE9uIFdlZCwg
SmFuIDE2LCAyMDE5IGF0IDA2OjQzOjI5QU0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+IFRoaXMgd2hvbGUgaXNzdWUga2VlcHMgZ2V0dGluZyBtb3JlIGFuZCBtb3Jl
IGNvbmZ1c2luZy4NCj4+IFdlbGwsIEkgZG9uJ3QgcmVhbGx5IGRvIERNQSBoZXJlLCBidXQgaW5z
dGVhZCB0aGUgYnVmZmVycyBpbg0KPj4gcXVlc3Rpb24gYXJlIHNoYXJlZCB3aXRoIG90aGVyIFhl
biBkb21haW4sIHNvIGVmZmVjdGl2ZWx5IGl0DQo+PiBjb3VsZCBiZSB0aG91Z2h0IG9mIHNvbWUg
c29ydCBvZiBETUEgaGVyZSwgd2hlcmUgdGhlICJkZXZpY2UiIGlzDQo+PiB0aGF0IHJlbW90ZSBk
b21haW4uIElmIHRoZSBidWZmZXJzIGFyZSBub3QgZmx1c2hlZCB0aGVuIHRoZQ0KPj4gcmVtb3Rl
IHBhcnQgc2VlcyBzb21lIGluY29uc2lzdGVuY3kgd2hpY2ggaW4gbXkgY2FzZSByZXN1bHRzDQo+
PiBpbiBhcnRpZmFjdHMgb24gc2NyZWVuIHdoaWxlIGRpc3BsYXlpbmcgdGhlIGJ1ZmZlcnMuDQo+
PiBXaGVuIGJ1ZmZlcnMgYXJlIGFsbG9jYXRlZCB2aWEgRE1BIEFQSSB0aGVuIHRoZXJlIGFyZSBu
byBhcnRpZmFjdHM7DQo+PiBpZiBidWZmZXJzIGFyZSBhbGxvY2F0ZWQgd2l0aCBzaG1lbSArIERN
QSBtYXBwaW5nIHRoZW4gdGhlcmUgYXJlIG5vDQo+PiBhcnRpZmFjdHMgYXMgd2VsbC4NCj4+IFRo
ZSBvbmx5IG9mZmVuZGluZyB1c2UtY2FzZSBpcyB3aGVuIEkgdXNlIHNobWVtIGJhY2tlZCBidWZm
ZXJzLA0KPj4gYnV0IGRvIG5vdCBmbHVzaCB0aGVtDQo+IFRoZSByaWdodCBhbnN3ZXIgd291bGQg
YmUgdG8gaW1wbGVtZW50IGNhY2hlIG1haW50YWluYW5jZSBob29rcyBmb3INCj4gdGhpcyBjYXNl
IGluIHRoZSBYZW4gYXJjaCBjb2RlLiAgVGhlc2Ugd291bGQgYmFzaWNhbGx5IGxvb2sgdGhlIHNh
bWUNCj4gYXMgdGhlIGxvdy1sZXZlbCBjYWNoZSBtYWludGFpbmFuY2UgdXNlZCBieSB0aGUgRE1B
IG9wcywgYnV0IHdpdGhvdXQNCj4gZ29pbmcgdGhyb3VnaCB0aGUgRE1BIG1hcHBpbmcgbGF5ZXIs
IGluIGZhY3QgdGhleSBzaG91bGQgcHJvYmFibHkNCj4gcmV1c2UgdGhlIHNhbWUgbG93LWxldmVs
IGFzc2VtYmx5IHJvdXRpbmVzLg0KPg0KPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdGhlIGZpcnN0
IHVzYWdlIG9mIHN1Y2ggWGVuIGJ1ZmZlciBzaGFyaW5nLCBzbw0KPiB3aGF0IGRvIHRoZSBvdGhl
ciB1c2VycyBkbz8NCkknbGwgaGF2ZSB0byBnZXQgZXZlbiBkZWVwZXIgaW50byBpdC4gSW5pdGlh
bGx5IEkNCmxvb2tlZCBhdCB0aGUgY29kZSwgYnV0IGRpZG4ndCBmaW5kIGFueXRoaW5nIHVzZWZ1
bC4NCk9yIG1heWJlIEkgaGF2ZSBqdXN0IG92ZXJsb29rZWQgb2J2aW91cyB0aGluZ3MgdGhlcmUN
Cg0KVGhhbmsgeW91LA0KT2xla3NhbmRyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
