From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Date: Sun, 23 Dec 2018 23:06:07 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1812232304130.2940__29166.6680750952$1545602693$gmane$org@hadrien>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HuYs=PA=lip6.fr=julia.lawall@srs-us1.protection.inumbo.net>)
 id 1gbBsy-0000w1-O6
 for xen-devel@lists.xenproject.org; Sun, 23 Dec 2018 22:06:12 +0000
In-Reply-To: <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiBTdW4sIDIzIERlYyAyMDE4LCBUb20gUHN5Ym9yZyB3cm90ZToKCj4gV2h5IGRvIHlvdSBD
QyB0aGlzIHRvIHNvIG1hbnkgbGlzdHM/CgpCZWNhdXNlIHRoZSBkaWZmZXJlbnQgZmlsZXMgYXJl
IGluIGRpZmZlcmVudCBzdWJzeXN0ZW1zLiAgVGhlIGNvdmVyIGxldHRlcgpnb2VzIHRvIGEgbGlz
dCBmb3IgZWFjaCBmaWxlLCBvciB0byBhIHBlcnNvbiBpZiB0aGVyZSBpcyBubyBsaXN0LiAgVGhl
CnBhdGNoZXMgZ28gdG8gdGhlIHBlb3BsZSBhbmQgbGlzdHMgYXNzb2NpYXRlZCB3aXRoIHRoZSBh
ZmZlY3RlZCBmaWxlcy4KCmp1bGlhCgo+Cj4gT24gMjMvMTIvMjAxOCwgSnVsaWEgTGF3YWxsIDxK
dWxpYS5MYXdhbGxAbGlwNi5mcj4gd3JvdGU6Cj4gPiBEcm9wIExJU1RfSEVBRCB3aGVyZSB0aGUg
dmFyaWFibGUgaXQgZGVjbGFyZXMgaXMgbmV2ZXIgdXNlZC4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiAg
ZHJpdmVycy9kbWEvYXRfaGRtYWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICA1IC0tLS0tCj4gPiAgZHJpdmVycy9kbWEvZHcvY29yZS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAxIC0KPiA+ICBkcml2ZXJzL2RtYS9wbDMzMC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ID4gIGRyaXZlcnMvZG1hL3NhMTF4MC1k
bWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiAtLQo+ID4gIGRyaXZlcnMv
ZG1hL3N0X2ZkbWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMyAtLS0K
PiA+ICBkcml2ZXJzL2luZmluaWJhbmQvdWxwL2lwb2liL2lwb2liX2liLmMgICAgICAgICAgICAg
ICB8ICAgIDEgLQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lbGxhbm94L21seDQvcmVzb3Vy
Y2VfdHJhY2tlci5jIHwgICAgNSAtLS0tLQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lbGxh
bm94L21seDUvY29yZS9lbl90Yy5jICAgICAgIHwgICAgMyAtLS0KPiA+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9tZWxsYW5veC9tbHhzdy9zcGVjdHJ1bS5jICAgICAgICB8ICAgIDEgLQo+ID4gIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL3N0L2N3MTIwMC9xdWV1ZS5jICAgICAgICAgICAgICAgIHwgICAg
MSAtCj4gPiAgZHJpdmVycy9zY3NpL2xwZmMvbHBmY19udm1lLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAyIC0tCj4gPiAgZHJpdmVycy9zY3NpL2xwZmMvbHBmY19zY3NpLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAyIC0tCj4gPiAgZHJpdmVycy9zY3NpL2xwZmMvbHBmY19z
bGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxIC0KPiA+ICBkcml2ZXJzL3Njc2kv
cWxhMnh4eC9xbGFfaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ID4gIGRy
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfZGV2X2Zyb250ZW5kLmMgICAgICAgICAgICAgIHwgICAg
MiAtLQo+ID4gIGZzL2J0cmZzL3JlbG9jYXRpb24uYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgMSAtCj4gPiAgZnMvbmZzL25mczRjbGllbnQuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAxIC0KPiA+ICBmcy9uZnNkL25mczRsYXlvdXRzLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ID4gIGZzL3hmcy94ZnNfYnVm
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCj4gPiAgZnMv
eGZzL3hmc19mc29wcy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAx
IC0KPiA+ICAyMCBmaWxlcyBjaGFuZ2VkLCAzNiBkZWxldGlvbnMoLSkKPiA+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
