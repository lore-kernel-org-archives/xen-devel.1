From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 09/16 RESEND] rbtree: low level
 optimizations in __rb_erase_color()
Date: Wed, 20 Dec 2017 09:59:19 -0700
Message-ID: <5A3AA4F70200007800198EEF@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-10-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-10-kpraveen.lkml@gmail.com>
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
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiBJbiBf
X3JiX2VyYXNlX2NvbG9yKCksIHdlIG9mdGVuIGFscmVhZHkgaGF2ZSBwb2ludGVycyB0byB0aGUg
bm9kZXMgYmVpbmcKPiByb3RhdGVkIGFuZC9vciBrbm93IHdoYXQgdGhlaXIgY29sb3JzIG11c3Qg
YmUsIHNvIHdlIGNhbiBnZW5lcmF0ZSBtb3JlCj4gZWZmaWNpZW50IGNvZGUgdGhhbiB0aGUgZ2Vu
ZXJpYyBfX3JiX3JvdGF0ZV9sZWZ0KCkgYW5kIF9fcmJfcm90YXRlX3JpZ2h0KCkKPiBmdW5jdGlv
bnMuCj4gCj4gQWxzbyB3aGVuIHRoZSBjdXJyZW50IG5vZGUgaXMgcmVkIG9yIHdoZW4gZmxpcHBp
bmcgdGhlIHNpYmxpbmcncyBjb2xvciwKPiB0aGUgcGFyZW50IGlzIGFscmVhZHkga25vd24gc28g
d2UgY2FuIHVzZSB0aGUgbW9yZSBlZmZpY2llbnQKPiByYl9zZXRfcGFyZW50X2NvbG9yKCkgZnVu
Y3Rpb24gdG8gc2V0IHRoZSBkZXNpcmVkIGNvbG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hl
bCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiBDYzogQW5kcmVhIEFyY2FuZ2VsaSA8
YWFyY2FuZ2VAcmVkaGF0LmNvbT4KPiBBY2tlZC1ieTogRGF2aWQgV29vZGhvdXNlIDxEYXZpZC5X
b29kaG91c2VAaW50ZWwuY29tPgo+IENjOiBSaWsgdmFuIFJpZWwgPHJpZWxAcmVkaGF0LmNvbT4K
PiBDYzogUGV0ZXIgWmlqbHN0cmEgPGEucC56aWpsc3RyYUBjaGVsbG8ubmw+Cj4gQ2M6IERhbmll
bCBTYW50b3MgPGRhbmllbC5zYW50b3NAcG9ib3guY29tPgo+IENjOiBKZW5zIEF4Ym9lIDxheGJv
ZUBrZXJuZWwuZGs+Cj4gQ2M6ICJFcmljIFcuIEJpZWRlcm1hbiIgPGViaWVkZXJtQHhtaXNzaW9u
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPiBbTGludXggY29tbWl0IDYyODBkMjM1NmZkOGFkMDkzNmE2M2MxMGRj
MWU2YWNjZjQ4ZDBjNjFdCj4gCj4gUG9ydGVkIHRvIFhlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
cmF2ZWVuIEt1bWFyIDxrcHJhdmVlbi5sa21sQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
