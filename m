From: Tom Psyborg <pozega.tomislav@gmail.com>
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Date: Tue, 25 Dec 2018 23:12:20 +0100
Message-ID: <CAKR_QVLeZBL43W4x1mzcfcakSZyyh9L81vgUMxfnSccKawEfdg__28836.3978070722$1545775889$gmane$org@mail.gmail.com>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
 <alpine.DEB.2.21.1812232304130.2940@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2AAK=PC=gmail.com=pozega.tomislav@srs-us1.protection.inumbo.net>)
 id 1gbuw3-00026v-JK
 for xen-devel@lists.xenproject.org; Tue, 25 Dec 2018 22:12:23 +0000
Received: by mail-ot1-x344.google.com with SMTP id a11so12915505otr.10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Dec 2018 14:12:20 -0800 (PST)
In-Reply-To: <alpine.DEB.2.21.1812232304130.2940@hadrien>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

dGhlcmUgd2FzIGRpc2N1c3Npb24gYWJvdXQgdGhpcyBqdXN0IHNvbWUgZGF5cyBhZ28uIENDIDQt
NSBsaXN0cyBpcwptb3JlIHRoYW4gZW5vdWdoCgpPbiAyMy8xMi8yMDE4LCBKdWxpYSBMYXdhbGwg
PGp1bGlhLmxhd2FsbEBsaXA2LmZyPiB3cm90ZToKPgo+Cj4gT24gU3VuLCAyMyBEZWMgMjAxOCwg
VG9tIFBzeWJvcmcgd3JvdGU6Cj4KPj4gV2h5IGRvIHlvdSBDQyB0aGlzIHRvIHNvIG1hbnkgbGlz
dHM/Cj4KPiBCZWNhdXNlIHRoZSBkaWZmZXJlbnQgZmlsZXMgYXJlIGluIGRpZmZlcmVudCBzdWJz
eXN0ZW1zLiAgVGhlIGNvdmVyIGxldHRlcgo+IGdvZXMgdG8gYSBsaXN0IGZvciBlYWNoIGZpbGUs
IG9yIHRvIGEgcGVyc29uIGlmIHRoZXJlIGlzIG5vIGxpc3QuICBUaGUKPiBwYXRjaGVzIGdvIHRv
IHRoZSBwZW9wbGUgYW5kIGxpc3RzIGFzc29jaWF0ZWQgd2l0aCB0aGUgYWZmZWN0ZWQgZmlsZXMu
Cj4KPiBqdWxpYQo+Cj4+Cj4+IE9uIDIzLzEyLzIwMTgsIEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3
YWxsQGxpcDYuZnI+IHdyb3RlOgo+PiA+IERyb3AgTElTVF9IRUFEIHdoZXJlIHRoZSB2YXJpYWJs
ZSBpdCBkZWNsYXJlcyBpcyBuZXZlciB1c2VkLgo+PiA+Cj4+ID4gLS0tCj4+ID4KPj4gPiAgZHJp
dmVycy9kbWEvYXRfaGRtYWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA1
IC0tLS0tCj4+ID4gIGRyaXZlcnMvZG1hL2R3L2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgMSAtCj4+ID4gIGRyaXZlcnMvZG1hL3BsMzMwLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCj4+ID4gIGRyaXZlcnMvZG1hL3NhMTF4MC1k
bWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiAtLQo+PiA+ICBkcml2ZXJz
L2RtYS9zdF9mZG1hLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgLS0t
Cj4+ID4gIGRyaXZlcnMvaW5maW5pYmFuZC91bHAvaXBvaWIvaXBvaWJfaWIuYyAgICAgICAgICAg
ICAgIHwgICAgMSAtCj4+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lbGxhbm94L21seDQvcmVz
b3VyY2VfdHJhY2tlci5jIHwgICAgNSAtLS0tLQo+PiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9t
ZWxsYW5veC9tbHg1L2NvcmUvZW5fdGMuYyAgICAgICB8ICAgIDMgLS0tCj4+ID4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L21lbGxhbm94L21seHN3L3NwZWN0cnVtLmMgICAgICAgIHwgICAgMSAtCj4+
ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL3N0L2N3MTIwMC9xdWV1ZS5jICAgICAgICAgICAgICAg
IHwgICAgMSAtCj4+ID4gIGRyaXZlcnMvc2NzaS9scGZjL2xwZmNfbnZtZS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMiAtLQo+PiA+ICBkcml2ZXJzL3Njc2kvbHBmYy9scGZjX3Njc2ku
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgLS0KPj4gPiAgZHJpdmVycy9zY3NpL2xw
ZmMvbHBmY19zbGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxIC0KPj4gPiAgZHJp
dmVycy9zY3NpL3FsYTJ4eHgvcWxhX2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgICAx
IC0KPj4gPiAgZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYyAgICAgICAg
ICAgICAgfCAgICAyIC0tCj4+ID4gIGZzL2J0cmZzL3JlbG9jYXRpb24uYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCj4+ID4gIGZzL25mcy9uZnM0Y2xpZW50LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCj4+ID4gIGZzL25mc2QvbmZz
NGxheW91dHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCj4+ID4g
IGZzL3hmcy94ZnNfYnVmLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgMSAtCj4+ID4gIGZzL3hmcy94ZnNfZnNvcHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgMSAtCj4+ID4gIDIwIGZpbGVzIGNoYW5nZWQsIDM2IGRlbGV0aW9ucygt
KQo+PiA+Cj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
