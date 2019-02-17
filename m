From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Do not destroy context
 while dma-bufs are in use
Date: Sun, 17 Feb 2019 11:39:41 +0100
Message-ID: <302ff90b-32a9-58dd-ae8f-1b55813fed74__40949.8803013534$1550400034$gmane$org@suse.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=myTo=QY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gvJrM-00084z-Ed
 for xen-devel@lists.xenproject.org; Sun, 17 Feb 2019 10:39:44 +0000
In-Reply-To: <20190214142321.1138-1-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMjAxOSAxNToyMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+IAo+IElmIHRoZXJlIGFyZSBleHBvcnRlZCBETUEgYnVmZmVycyB3aGljaCBhcmUgc3Rp
bGwgaW4gdXNlIGFuZAo+IGdyYW50IGRldmljZSBpcyBjbG9zZWQgYnkgZWl0aGVyIG5vcm1hbCB1
c2VyLXNwYWNlIGNsb3NlIG9yIGJ5Cj4gYSBzaWduYWwgdGhpcyBsZWFkcyB0byB0aGUgZ3JhbnQg
ZGV2aWNlIGNvbnRleHQgdG8gYmUgZGVzdHJveWVkLAo+IHRodXMgbWFraW5nIGl0IG5vdCBwb3Nz
aWJsZSB0byBjb3JyZWN0bHkgZGVzdHJveSB0aG9zZSBleHBvcnRlZAo+IGJ1ZmZlcnMgd2hlbiB0
aGV5IGFyZSByZXR1cm5lZCBiYWNrIHRvIGdudGRldiBhbmQgbWFrZXMgdGhlIG1vZHVsZQo+IGNy
YXNoOgo+IAo+IFsgIDMzOS42MTc1NDBdIFs8ZmZmZjAwMDAwODU0YzBkOD5dIGRtYWJ1Zl9leHBf
b3BzX3JlbGVhc2UrMHg0MC8weGE4Cj4gWyAgMzM5LjYxNzU2MF0gWzxmZmZmMDAwMDA4NjdhNmU4
Pl0gZG1hX2J1Zl9yZWxlYXNlKzB4NjAvMHgxOTAKPiBbICAzMzkuNjE3NTc3XSBbPGZmZmYwMDAw
MDgyMjExZjA+XSBfX2ZwdXQrMHg4OC8weDFkMAo+IFsgIDMzOS42MTc1ODldIFs8ZmZmZjAwMDAw
ODIyMTM5ND5dIF9fX19mcHV0KzB4Yy8weDE4Cj4gWyAgMzM5LjYxNzYwN10gWzxmZmZmMDAwMDA4
MGVkNGU0Pl0gdGFza193b3JrX3J1bisweDljLzB4YzAKPiBbICAzMzkuNjE3NjIyXSBbPGZmZmYw
MDAwMDgwODk3MTQ+XSBkb19ub3RpZnlfcmVzdW1lKzB4ZmMvMHgxMDgKPiAKPiBGaXggdGhpcyBi
eSByZWZlcmVuY2luZyBnbnRkZXYgb24gZWFjaCBETUEgYnVmZmVyIGV4cG9ydCBhbmQKPiB1bnJl
ZmVyZW5jaW5nIG9uIGJ1ZmZlciByZWxlYXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KCkFwcGxp
ZWQgdG8geGVuL3RpcC5naXQgZm9yLWxpbnVzLTUuMQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
