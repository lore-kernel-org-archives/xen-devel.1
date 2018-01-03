From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 11/16 RESEND] rbtree: optimize fetching
 of sibling node
Date: Wed, 03 Jan 2018 04:29:18 -0700
Message-ID: <5A4CCC9E020000780019A766@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-12-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-12-kpraveen.lkml@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, dario.faggioli@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE3IGF0IDE2OjIwLCA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiBXaGVu
IGxvb2tpbmcgdG8gZmV0Y2ggYSBub2RlJ3Mgc2libGluZywgd2Ugd2VudCB0aHJvdWdoIGEgc2Vx
dWVuY2Ugb2Y6Cj4gLSBjaGVjayBpZiBub2RlIGlzIHRoZSBwYXJlbnQncyBsZWZ0IGNoaWxkCj4g
LSBpZiBpdCBpcywgdGhlbiBmZXRjaCB0aGUgcGFyZW50J3MgcmlnaHQgY2hpbGQKPiAKPiBUaGlz
IGNhbiBiZSByZXBsYWNlZCB3aXRoOgo+IC0gZmV0Y2ggdGhlIHBhcmVudCdzIHJpZ2h0IGNoaWxk
IGFzIGFuIGFzc3VtZWQgc2libGluZwo+IC0gY2hlY2sgdGhhdCBub2RlIGlzIE5PVCB0aGUgZmV0
Y2hlZCBjaGlsZAo+IAo+IFRoaXMgYXZvaWRzIGZldGNoaW5nIHRoZSBwYXJlbnQncyBsZWZ0IGNo
aWxkIHdoZW4gbm9kZSBpcyBhY3R1YWxseQo+IHRoYXQgY2hpbGQuIFNhdmVzIGEgYml0IG9uIGNv
ZGUgc2l6ZSwgdGhvdWdoIGl0IGRvZXNuJ3Qgc2VlbSB0byBtYWtlCj4gYSBsYXJnZSBkaWZmZXJl
bmNlIGluIHNwZWVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxr
ZW5AZ29vZ2xlLmNvbT4KPiBDYzogQW5kcmVhIEFyY2FuZ2VsaSA8YWFyY2FuZ2VAcmVkaGF0LmNv
bT4KPiBDYzogRGF2aWQgV29vZGhvdXNlIDxEYXZpZC5Xb29kaG91c2VAaW50ZWwuY29tPgo+IEFj
a2VkLWJ5OiBSaWsgdmFuIFJpZWwgPHJpZWxAcmVkaGF0LmNvbT4KPiBDYzogUGV0ZXIgWmlqbHN0
cmEgPGEucC56aWpsc3RyYUBjaGVsbG8ubmw+Cj4gQ2M6IERhbmllbCBTYW50b3MgPGRhbmllbC5z
YW50b3NAcG9ib3guY29tPgo+IENjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Cj4gQ2M6
ICJFcmljIFcuIEJpZWRlcm1hbiIgPGViaWVkZXJtQHhtaXNzaW9uLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBb
TGludXggY29tbWl0IDU5NjMzYWJmMzRlMmY0NGI4ZTc3MmEyYzEyYTkyMTMyYWE3YzIyMjBdCj4g
Cj4gUG9ydGVkIHRvIFhlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcmF2ZWVuIEt1bWFyIDxrcHJh
dmVlbi5sa21sQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
