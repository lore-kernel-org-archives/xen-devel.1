From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 14/16] rbtree: handle 1-child recoloring
 in rb_erase() instead of rb_erase_color()
Date: Wed, 03 Jan 2018 04:35:12 -0700
Message-ID: <5A4CCE00020000780019A776@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-15-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-15-kpraveen.lkml@gmail.com>
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
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiBBbiBp
bnRlcmVzdGluZyBvYnNlcnZhdGlvbiBmb3IgcmJfZXJhc2UoKSBpcyB0aGF0IHdoZW4gYSBub2Rl
IGhhcwo+IGV4YWN0bHkgb25lIGNoaWxkLCB0aGUgbm9kZSBtdXN0IGJlIGJsYWNrIGFuZCB0aGUg
Y2hpbGQgbXVzdCBiZSByZWQuCj4gQW4gaW50ZXJlc3RpbmcgY29uc2VxdWVuY2UgaXMgdGhhdCBy
ZW1vdmluZyBzdWNoIGEgbm9kZSBjYW4gYmUgZG9uZSBieQo+IHNpbXBseSByZXBsYWNpbmcgaXQg
d2l0aCBpdHMgY2hpbGQgYW5kIG1ha2luZyB0aGUgY2hpbGQgYmxhY2ssCj4gd2hpY2ggd2UgY2Fu
IGRvIGVmZmljaWVudGx5IGluIHJiX2VyYXNlKCkuIF9fcmJfZXJhc2VfY29sb3IoKSB0aGVuCj4g
b25seSBuZWVkcyB0byBoYW5kbGUgdGhlIG5vLWNoaWxkcyBjYXNlIGFuZCBjYW4gYmUgbW9kaWZp
ZWQgYWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIExlc3BpbmFzc2UgPHdh
bGtlbkBnb29nbGUuY29tPgo+IEFja2VkLWJ5OiBSaWsgdmFuIFJpZWwgPHJpZWxAcmVkaGF0LmNv
bT4KPiBDYzogUGV0ZXIgWmlqbHN0cmEgPGEucC56aWpsc3RyYUBjaGVsbG8ubmw+Cj4gQ2M6IEFu
ZHJlYSBBcmNhbmdlbGkgPGFhcmNhbmdlQHJlZGhhdC5jb20+Cj4gQ2M6IERhdmlkIFdvb2Rob3Vz
ZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFRvcnZhbGRz
IDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBbTGludXggY29tbWl0IDQ2YjYxMzVh
NzQwMmFjMjNjNWIyNWYyYmQ3OWIwM2JhYjhmOTgyNzhdCj4gCj4gUG9ydGVkIHRvIFhlbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQcmF2ZWVuIEt1bWFyIDxrcHJhdmVlbi5sa21sQGdtYWlsLmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
