From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Add RING_COPY_RESPONSE()
Date: Wed, 02 May 2018 01:19:26 -0600
Message-ID: <5AE9667E02000078001BFF04@prv1-mh.provo.novell.com>
References: <20180430215436.21062-1-marmarek@invisiblethingslab.com>
 <a8517064-40fb-d873-2879-bb4047e1ebc4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a8517064-40fb-d873-2879-bb4047e1ebc4@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE4IGF0IDA3OjI5LCA8YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToKPiBP
biAwNS8wMS8yMDE4IDEyOjU0IEFNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6
Cj4+IFVzaW5nIFJJTkdfR0VUX1JFU1BPTlNFKCkgb24gYSBzaGFyZWQgcmluZyBpcyBlYXN5IHRv
IHVzZSBpbmNvcnJlY3RseQo+PiAoaS5lLiwgYnkgbm90IGNvbnNpZGVyaW5nIHRoYXQgdGhlIG90
aGVyIGVuZCBtYXkgYWx0ZXIgdGhlIGRhdGEgaW4gdGhlCj4+IHNoYXJlZCByaW5nIHdoaWxlIGl0
IGlzIGJlaW5nIGluc3BlY3RlZCkuICBTYWZlIHVzYWdlIG9mIGEgcmVzcG9uc2UKPj4gZ2VuZXJh
bGx5IHJlcXVpcmVzIHRha2luZyBhIGxvY2FsIGNvcHkuCj4gSSBkbyBub3QgYWdyZWUgd2l0aCB0
aGF0LiBDb3B5aW5nIHN0aWxsIGRvZXNuJ3QgbWFrZSBhbGwgdGhlIGFib3ZlIHNhZmUKPiBhcyBu
b3RoaW5nIHByZXZlbnRzIHRoZSBiYWNrZW5kIGZyb20gb3ZlcndyaXRpbmcgdGhlIHJlc3BvbnNl
IHdoaWxlCj4gZnJvbnRlbmQgbWFrZXMgaXRzIGxvY2FsIGNvcHkuCgpCdXQgdGhhdCdzIG5vdCB0
aGUgcG9pbnQgaGVyZTogV2hhdCB0aGUgZnJvbnRlbmQgd2FudHMgaXMgYSBzaW5nbGUsIGNvbnNp
c3RlbnQKKGkuZS4gbm90IGZ1cnRoZXIgY2hhbmdpbmcpIHZpZXcgb2YgdGhlIHJlc3BvbnNlLCBp
LmUuIGF2b2lkIHRoZSBtdWx0aXBsZSByZWFkcwppc3N1ZSBhZGRyZXNzZWQgaW4gWFNBLTE1NSBm
b3IgYmFja2VuZHMuIE9uY2UgaXQgaGFzIHRoYXQsIGl0IGNvdWxkIHN0aWxsIGFwcGx5CihzYW5p
dHkpIGNoZWNrcyB0byB0aGF0IGxvY2FsIGNvcHkgKGp1c3QgbGlrZSBiYWNrZW5kcyB0byBmb3Ig
cmVxdWVzdHMpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
