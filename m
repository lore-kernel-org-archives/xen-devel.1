From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 01/16] rbtree: remove redundant
 if()-condition in rb_erase()
Date: Wed, 20 Dec 2017 09:39:53 -0700
Message-ID: <5A3AA0690200007800198E84@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-2-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-2-kpraveen.lkml@gmail.com>
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

Pj4+IE9uIDIxLjExLjE3IGF0IDE2OjE5LCA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IFdvbGZyYW0gU3RyZXBwIDx3c3RyZXBwQGdteC5kZT4KPiAKPiBGdXJ0aGVybW9y
ZSwgbm90aWNlIHRoYXQgdGhlIGluaXRpYWwgY2hlY2tzOgo+IAo+ICAgICAgICAgICAgIGlmICgh
bm9kZS0+cmJfbGVmdCkKPiAgICAgICAgICAgICAgICAgICAgIGNoaWxkID0gbm9kZS0+cmJfcmln
aHQ7Cj4gICAgICAgICAgICAgZWxzZSBpZiAoIW5vZGUtPnJiX3JpZ2h0KQo+ICAgICAgICAgICAg
ICAgICAgICAgY2hpbGQgPSBub2RlLT5yYl9sZWZ0Owo+ICAgICAgICAgICAgIGVsc2UKPiAgICAg
ICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAgICAuLi4KPiAgICAgICAgICAgICB9Cj4gZ3Vh
cmFudGVlIHRoYXQgb2xkLT5yYl9yaWdodCBpcyBzZXQgaW4gdGhlIGZpbmFsIGVsc2UgYnJhbmNo
LCB0aGVyZWZvcmUKPiB3ZSBjYW4gb21pdCBjaGVja2luZyB0aGF0IGFnYWluLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFdvbGZyYW0gU3RyZXBwIDx3c3RyZXBwQGdteC5kZT4KPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBaaWpsc3RyYSA8YS5wLnppamxzdHJhQGNoZWxsby5ubD4KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBbTGlu
dXggY29tbWl0IDRiMzI0MTI2ZTBjNmMzYTUwODBjYTNlYzA5ODFlODc2NmVkNmYxZWVdCj4gCj4g
UG9ydGVkIHRvIFhlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcmF2ZWVuIEt1bWFyIDxrcHJhdmVl
bi5sa21sQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
