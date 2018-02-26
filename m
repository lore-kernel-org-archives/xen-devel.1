From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] xen: fix out-of-bounds irq unbind for
 MSI message groups
Date: Mon, 26 Feb 2018 15:02:33 -0500
Message-ID: <db4a0e0b-31cf-9c37-ba89-c0e7b6c99d87__35522.0394944356$1519675269$gmane$org@oracle.com>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
 <1519666595-41362-2-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mvhl=fu=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eqOyU-0006GS-7X
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 20:02:14 +0000
In-Reply-To: <1519666595-41362-2-git-send-email-aams@amazon.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Shah <aams@amazon.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, Liu Shuo <shuo.a.liu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>, Anoob Soman <anoob.soman@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjYvMjAxOCAxMjozNiBQTSwgQW1pdCBTaGFoIHdyb3RlOgo+IFdoZW4gYW4gTVNJIGRl
c2NyaXB0b3Igd2FzIG5vdCBhdmFpbGFibGUsIHRoZSBlcnJvciBwYXRoIHdvdWxkIHRyeSB0bwo+
IHVuYmluZCBhbiBpcnEgdGhhdCB3YXMgbmV2ZXIgYWNxdWlyZWQgLSBwb3RlbnRpYWxseSB1bmJp
bmRpbmcgYW4KPiB1bnJlbGF0ZWQgaXJxLgo+Cj4gRml4ZXM6IDQ4OTJjOWI0YWRhOWY5ICgieGVu
OiBhZGQgc3VwcG9ydCBmb3IgTVNJIG1lc3NhZ2UgZ3JvdXBzIikKPiBSZXBvcnRlZC1ieTogSG9v
bWFuIE1pcmhhZGkgPG1pcmhhZGloQGFtYXpvbi5jb20+Cj4gQ0M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBD
QzogRGF2aWQgVnJhYmVsIDxkYXZpZC52cmFiZWxAY2l0cml4LmNvbT4KPiBDQzogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDQzogRWR1YXJkbyBWYWxlbnRp
biA8ZWR1dmFsQGFtYXpvbi5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiBDQzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ0M6ICJLLiBZ
LiBTcmluaXZhc2FuIiA8a3lzQG1pY3Jvc29mdC5jb20+Cj4gQ0M6IExpdSBTaHVvIDxzaHVvLmEu
bGl1QGludGVsLmNvbT4KPiBDQzogQW5vb2IgU29tYW4gPGFub29iLnNvbWFuQGNpdHJpeC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaGFoIDxhYW1zQGFtYXpvbi5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNf
YmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBpbmRleCAxYWI0YmQx
Li5iNmI4YjI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5j
Cj4gKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBAQCAtNzQ5LDYgKzc0
OSw3IEBAIGludCB4ZW5fYmluZF9waXJxX21zaV90b19pcnEoc3RydWN0IHBjaV9kZXYgKmRldiwg
c3RydWN0IG1zaV9kZXNjICptc2lkZXNjLAo+ICAJfQo+ICAKPiAgCXJldCA9IGlycV9zZXRfbXNp
X2Rlc2MoaXJxLCBtc2lkZXNjKTsKPiArCWktLTsKPiAgCWlmIChyZXQgPCAwKQo+ICAJCWdvdG8g
ZXJyb3JfaXJxOwoKV2UgcmVhbGx5IG9ubHkgbmVlZCB0byBkbyB0aGlzIGluIGNhc2Ugb2YgYW4g
ZXJyb3IuCgooQW5kIHRoaXMgcGF0Y2ggbmVlZHMgdG8gZ28gdG8gc3RhYmxlIHRyZWVzIGFzIHdl
bGwuKQoKVGhhbmtzCi1ib3JpcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
