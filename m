From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Wed, 16 Jan 2019 06:43:29 +0000
Message-ID: <042fe794-dec6-6d9d-5b68-6f142790f5c7__28074.9070960612$1547620937$gmane$org@epam.com>
References: <20190115140420.4652-1-andr2000@gmail.com>
 <20190116063002.jq3aas6ofhaogmyk@sirius.home.kraxel.org>
 <20190116063631.GA10881@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=APxY=PY=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1gjevF-0003DM-91
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 06:43:33 +0000
In-Reply-To: <20190116063631.GA10881@infradead.org>
Content-Language: en-US
Content-ID: <A23AA4B1281BD945A6E3BB322C07423C@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "noralf@tronnes.org" <noralf@tronnes.org>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNi8xOSA4OjM2IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gT24gV2VkLCBK
YW4gMTYsIDIwMTkgYXQgMDc6MzA6MDJBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3cm90ZToNCj4+
ICAgIEhpLA0KPj4NCj4+PiArCWlmICghZG1hX21hcF9zZyhkZXYtPmRldiwgeGVuX29iai0+c2d0
LT5zZ2wsIHhlbl9vYmotPnNndC0+bmVudHMsDQo+Pj4gKwkJCURNQV9CSURJUkVDVElPTkFMKSkg
ew0KPj4+ICsJCXJldCA9IC1FRkFVTFQ7DQo+Pj4gKwkJZ290byBmYWlsX2ZyZWVfc2d0Ow0KPj4+
ICsJfQ0KPj4gSG1tLCBzbyBpdCBzZWVtcyB0aGUgYXJtIGd1eXMgY291bGQgbm90IGNvbWUgdXAg
d2l0aCBhIHN1Z2dlc3Rpb24gaG93IHRvDQo+PiBzb2x2ZSB0aGF0IG9uZSBpbiBhIGJldHRlciB3
YXkuICBPaywgbGV0cyBnbyB3aXRoIHRoaXMgdGhlbi4NCj4+DQo+PiBCdXQgZGlkbid0IHdlIGFn
cmVlIHRoYXQgdGhpcyBkZXNlcnZlcyBhIGNvbW1lbnQgZXhtcGxhaW5pbmcgdGhlIHB1cnBvc2UN
Cj4+IG9mIHRoZSBkbWFfbWFwX3NnKCkgY2FsbCBpcyB0byBmbHVzaCBjYWNoZXMgYW5kIHRoYXQg
dGhlcmUgaXMgbm8gYWN0dWFsDQo+PiBETUEgaGFwcGVuaW5nIGhlcmU/DQo+IFVzaW5nIGEgZG1h
IG1hcHBpbmcgY2FsbCB0byBmbHVzaCBjYWNoZXMgaXMgY29tcGxldGUgbm8tZ28uICBCdXQgdGhl
DQo+IHJlYWwgcXVlc3Rpb24gaXMgd2h5IHlvdSdkIGV2ZW4gd2FudCB0byBmbHVzaCBjYXNoZXMg
aWYgeW91IGRvIG5vdA0KPiB3YW50IGEgZG1hIG1hcHBpbmc/DQo+DQo+IFRoaXMgd2hvbGUgaXNz
dWUga2VlcHMgZ2V0dGluZyBtb3JlIGFuZCBtb3JlIGNvbmZ1c2luZy4NCldlbGwsIEkgZG9uJ3Qg
cmVhbGx5IGRvIERNQSBoZXJlLCBidXQgaW5zdGVhZCB0aGUgYnVmZmVycyBpbg0KcXVlc3Rpb24g
YXJlIHNoYXJlZCB3aXRoIG90aGVyIFhlbiBkb21haW4sIHNvIGVmZmVjdGl2ZWx5IGl0DQpjb3Vs
ZCBiZSB0aG91Z2h0IG9mIHNvbWUgc29ydCBvZiBETUEgaGVyZSwgd2hlcmUgdGhlICJkZXZpY2Ui
IGlzDQp0aGF0IHJlbW90ZSBkb21haW4uIElmIHRoZSBidWZmZXJzIGFyZSBub3QgZmx1c2hlZCB0
aGVuIHRoZQ0KcmVtb3RlIHBhcnQgc2VlcyBzb21lIGluY29uc2lzdGVuY3kgd2hpY2ggaW4gbXkg
Y2FzZSByZXN1bHRzDQppbiBhcnRpZmFjdHMgb24gc2NyZWVuIHdoaWxlIGRpc3BsYXlpbmcgdGhl
IGJ1ZmZlcnMuDQpXaGVuIGJ1ZmZlcnMgYXJlIGFsbG9jYXRlZCB2aWEgRE1BIEFQSSB0aGVuIHRo
ZXJlIGFyZSBubyBhcnRpZmFjdHM7DQppZiBidWZmZXJzIGFyZSBhbGxvY2F0ZWQgd2l0aCBzaG1l
bSArIERNQSBtYXBwaW5nIHRoZW4gdGhlcmUgYXJlIG5vDQphcnRpZmFjdHMgYXMgd2VsbC4NClRo
ZSBvbmx5IG9mZmVuZGluZyB1c2UtY2FzZSBpcyB3aGVuIEkgdXNlIHNobWVtIGJhY2tlZCBidWZm
ZXJzLA0KYnV0IGRvIG5vdCBmbHVzaCB0aGVtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
