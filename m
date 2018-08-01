From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/gdbsx: use inttypes.h instead of
 custom macros
Date: Wed, 1 Aug 2018 10:33:23 +0100
Message-ID: <20180801093323.pxfwfpa4lgud545a@citrix.com>
References: <20180731201905.23112-1-marmarek@invisiblethingslab.com>
 <20180801091917.r4wlgb33iusmmjco@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pypw=kq=citrix.com=prvs=744347f87=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fknVv-0003ly-Ky
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:33:51 +0000
Content-Disposition: inline
In-Reply-To: <20180801091917.r4wlgb33iusmmjco@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDEsIDIwMTggYXQgMTA6MTk6MTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEp1bCAzMSwgMjAxOCBhdCAxMDoxOTowNVBNICswMjAwLCBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dz
a2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gPiAtLS0KPiA+
IFRoaXMgaXMgb24gdG9wIG9mICJ0b29scy9nZGJzeDogZml4ICdnJyBwYWNrZXQgcmVzcG9uc2Ug
Zm9yIDY0Yml0Cj4gPiBndWVzdHMiIHBhdGNoLgo+ID4gLS0tCj4gPiAgdG9vbHMvZGVidWdnZXIv
Z2Ric3gvZ3gvZ3hfbG9jYWwuYyAgfCAxNyArKysrKy0tLS0tCj4gPiAgdG9vbHMvZGVidWdnZXIv
Z2Ric3gvZ3gvZ3hfbWFpbi5jICAgfCAgNSArLS0KPiA+ICB0b29scy9kZWJ1Z2dlci9nZGJzeC94
Zy94Z19wdWJsaWMuaCB8ICA4IC0tLS0tCj4gPiAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVfY2xp
ZW50LmMgICAgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+IAo+IEl0IHNlZW1z
IHRoYXQgeW91IGFjY2lkZW50YWxseSBhZGRlZCBhIHhlbnN0b3JlIGZpbGUuCgpObyBuZWVkIHRv
IHJlc2VuZC4gSSBoYXZlIGZpeGVkIHVwIHRoaXMgcGF0Y2ggZm9yIHlvdS4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
