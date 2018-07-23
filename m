From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH v2 02/21] xen/arm: make allocate_memory work
 for non 1:1 mapped guests
Date: Mon, 23 Jul 2018 21:01:43 +0300
Message-ID: <94e6cecd-12d7-29bf-51f0-c9e997da6d58@epam.com>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530918736-13965-2-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, julien.grall@arm.com
Cc: Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCgpPbiAwNy4wNy4xOCAwMjoxMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOgo+IEV4dGVuZCBhbGxvY2F0ZV9tZW1vcnkgdG8gd29yayBmb3Igbm9uIDE6MSBtYXBwZWQg
ZG9tVXMuIFNwZWNpZmljYWxseSwKPiBtZW1vcnkgYWxsb2NhdGVkIGZvciBkb21VIHdpbGwgYmUg
bWFwcGVkIGludG8gdGhlIGRvbVUgcHNldWRvLXBoeXNpY2FsCj4gYWRkcmVzcyBzcGFjZSBhdCB0
aGUgYXBwcm9wcmlhdGUgYWRkcmVzc2VzIGFjY29yZGluZyB0byB0aGUgZ3Vlc3QgbWVtb3J5Cj4g
bWFwOiBHVUVTVF9SQU0wX0JBU0UgYW5kIEdVRVNUX1JBTTFfQkFTRS4KSSB3b3VsZCBzcGVjdWxh
dGUgYWJvdXQgR1VFU1RfUkFNeF9CQVNFIGFuZCBHVUVTVF9SQU14X1NJWkUgbWFjcm9zLiAKVGhv
c2UgdmFsdWVzIG1pZ2h0IG5vdCBmaXQgdGhlIHJlYWwgU29DIG1lbW9yeSBtYXAuIEFuZCBpdCBi
ZWNvbWVzIGEgCnByb2JsZW0gb25jZSB3ZSBkZWNpZGVkIHRvIGFzc2lnbiBzb21lIHBlcmlwaGVy
YWwgZGlyZWN0bHkgdG8gdGhlIGd1ZXN0IApiZWNhdXNlIGEgUkFNIHNwYWNlIHNwZWNpZmllZCB0
byBWTSB3b3VsZCBvdmVybGFwIHdpdGggSU8gcmFuZ2Ugb2YgdGhlIAphc3NpZ25lZCBkZXZpY2Uu
CkluIG15IHByYWN0aWNlLCB3ZSBhbHdheXMgYWxpZ24gdGhvc2UgbWFjcm9zIHdpdGggdGhlIFNv
QyBtZW1vcnkgbWFwLiAKVGhpcyBiZWNvbWVzIG1vcmUgY29udmVuaWVudCBhbmQgcHJhY3RpY2Fs
IHRoYW4gSU8gcmVtYXBwaW5nLgoKSXQgbWlnaHQgYmUgdGhlIG1vbWVudCB0byBnZXQgdGhvc2Ug
dmFsdWVzIGNvbmZpZ3VyYWJsZSBmb3IgdGhlIGd1ZXN0cy4gCkF0IGxlYXN0IGZvciB0aG9zZSwg
d2hpY2ggYXJlIGNvbmZpZ3VyZWQgZnJvbSB0aGUgZGV2aWNlIHRyZWUuIEhlcmUgCm5hdHVyYWxs
eSBmaXQgbWFraW5nIGBtZW1vcnlgIHByb3BlcnR5IHNpbWlsYXIgdG8gYHJlZ2AgLSB0aGUgbGlz
dCBvZiAKPGJhc2UsIHNpemU+IHZhbHVlcy4KCi0tIAoKKkFuZHJpaSBBbmlzb3YqCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
