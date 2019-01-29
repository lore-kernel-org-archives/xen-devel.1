From: Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Tue, 29 Jan 2019 09:26:41 +0000
Message-ID: <AM0PR04MB448123F7FEBCEBD63DE0AF8088970__14399.2471903161$1548754062$gmane$org@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
 <20190123211405.GA4971@infradead.org>
 <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20190128080028.GA18476@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n1m/=QF=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1goPfI-0000yo-N3
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 09:26:44 +0000
In-Reply-To: <20190128080028.GA18476@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "hch@infradead.org" <hch@infradead.org>
Cc: "jgross@suse.com" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andy Duan <fugang.duan@nxp.com>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "luto@kernel.org" <luto@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaGNoQGluZnJhZGVhZC5v
cmcgW21haWx0bzpoY2hAaW5mcmFkZWFkLm9yZ10NCj4gU2VudDogMjAxOeW5tDHmnIgyOOaXpSAx
NjowMA0KPiBUbzogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IENjOiBoY2hAaW5mcmFk
ZWFkLm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4g
bXN0QHJlZGhhdC5jb207IGphc293YW5nQHJlZGhhdC5jb207IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsNCj4gbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnOyBsdXRvQGtlcm5lbC5vcmc7IGpncm9zc0BzdXNlLmNvbTsNCj4gYm9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb207IEFuZHkgRHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFtSRkNdIHZpcnRpb19yaW5nOiBjaGVjayBkbWFfbWVtIGZv
ciB4ZW5fZG9tYWluDQo+IA0KPiBPbiBGcmksIEphbiAyNSwgMjAxOSBhdCAwOTo0NToyNkFNICsw
MDAwLCBQZW5nIEZhbiB3cm90ZToNCj4gPiBKdXN0IGhhdmUgYSBxdWVzdGlvbiwNCj4gPg0KPiA+
IFNpbmNlIHZtYWxsb2NfdG9fcGFnZSBpcyBvayBmb3IgY21hIGFyZWEsIG5vIG5lZWQgdG8gdGFr
ZSBjbWEgYW5kIHBlcg0KPiA+IGRldmljZSBjbWEgaW50byBjb25zaWRlcmF0aW9uIHJpZ2h0Pw0K
PiANCj4gVGhlIENNQSBhcmVhIGl0c2VsZiBpdCBhIHBoeXNpY2FsIG1lbW9yeSByZWdpb24uICBJ
ZiBpdCBpcyBhIG5vbi1oaWdobWVtDQo+IHJlZ2lvbiB5b3UgY2FuIGNhbGwgdmlydF90b19wYWdl
IG9uIHRoZSB2aXJ0dWFsIGFkZHJlc3NlcyBmb3IgaXQuICBJZiBpdCBpcyBpbg0KPiBoaWdobWVt
IGl0IGRvZXNuJ3QgZXZlbiBoYXZlIGEga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBieSBkZWZhdWx0
Lg0KPiANCj4gPiB3ZSBvbmx5IG5lZWQgdG8gaW1wbGVtZW50IGEgcGllY2UgY29kZSB0byBoYW5k
bGUgcGVyIGRldmljZSBzcGVjaWZpYw0KPiA+IHJlZ2lvbiB1c2luZyBSRVNFUlZFRE1FTV9PRl9E
RUNMQVJFLCBqdXN0IGxpa2U6DQo+ID4gUkVTRVJWRURNRU1fT0ZfREVDTEFSRShycG1zZy1kbWEs
ICJycG1zZy1kbWEtcG9vbCIsDQo+ID4gcm1lbV9ycG1zZ19kbWFfc2V0dXApOyBBbmQgaW1wbGVt
ZW50IHRoZSBkZXZpY2VfaW5pdCBjYWxsIGJhY2sgYW5kDQo+ID4gYnVpbGQgYSBtYXAgYmV0d2Vl
biBwYWdlIGFuZCBwaHlzLg0KPiA+IFRoZW4gaW4gcnBtc2cgZHJpdmVyLCBzY2F0dGVyIGxpc3Qg
Y291bGQgdXNlIHBhZ2Ugc3RydWN0dXJlLCBubyBuZWVkDQo+ID4gdm1hbGxvY190b19wYWdlIGZv
ciBwZXIgZGV2aWNlIGRtYS4NCj4gPg0KPiA+IElzIHRoaXMgdGhlIHJpZ2h0IHdheT8NCj4gDQo+
IEkgdGhpbmsgdGhpcyBzaG91bGQgd29yayBmaW5lLiAgSWYgeW91IGhhdmUgdGhlIGN5Y2xlcyBm
b3IgaXQgSSdkIGFjdHVhbGx5IGxvdmUgdG8NCj4gYmUgYWJsZSB0byBoYXZlIGdlbmVyaWMgQ01B
IERUIGdsdWUgZm9yIG5vbiBETUEgQVBJIGRyaXZlciBhbGxvY2F0aW9ucywgYXMNCj4gdGhlcmUg
b2J2aW91c2x5IGlzIGEgbmVlZCBmb3IgaXQuICBTbyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgYWJv
dmUsIGp1c3QgYWRkZWQNCj4gdG8ga2VybmVsL2NtYS5jIGFzIGEgZ2VuZXJpYyBBUEkuDQoNClRo
YW5rcyBmb3IgdGhlIGhpbnRzLiBJJ2xsIHRyeSB0byBhZGQgdGhhdC4NCg0KVGhhbmtzLA0KUGVu
Zy4NCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
