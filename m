From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86/svm: correct EFER.SVME intercept
	checks
Date: Mon, 05 Feb 2018 02:18:53 -0700
Message-ID: <5A782F8D02000078001A51B2@prv-mh.provo.novell.com>
References: <20180131203525.21660-1-brian.woods@amd.com>
 <20180131203525.21660-4-brian.woods@amd.com>
 <3afd1271-ae0c-7d44-0afe-0474c86b568c@oracle.com>
 <b79c8792-0b4a-8ad4-52cd-ea0b7e4c23c7@citrix.com>
 <a3fbe0dd-0038-eecd-3fd9-0198f61066f4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a3fbe0dd-0038-eecd-3fd9-0198f61066f4@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjAyLjE4IGF0IDE4OjE1LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDAyLzAzLzIwMTggMTI6MTAgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9u
IDAzLzAyLzE4IDE3OjAzLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDAx
LzMxLzIwMTggMDM6MzUgUE0sIEJyaWFuIFdvb2RzIHdyb3RlOgo+Pj4+IENvcnJlY3RzIHNvbWUg
RUZFUi5TVk1FIGNoZWNrcyBpbiBpbnRlcmNlcHRzLiAgU2VlIEFNRCBBUE0gdm9sMiBzZWN0aW9u
Cj4+Pj4gMTUuNCBmb3IgbW9yZSBkZXRhaWxzLiAgVk1NQ0FMTCBpc24ndCBjaGVja2VkIGR1ZSB0
byBndWVzdHMgbmVlZGluZyBpdAo+Pj4+IHRvIGJvb3QuCj4+Pj4KPj4+Cj4+PiBEb24ndCB5b3Ug
bmVlZCBTVk1FIGJlIG9uIGZvciBWTU1DQUxMPwo+PiAKPj4gSW4gcmVhbCBoYXJkd2FyZSwgeWVz
Lgo+PiAKPj4gSG93ZXZlciwgaXQncyBxdWl0ZSB1bnJlYXNvbmFibGUgdG8gcmVxdWlyZSB0aGUg
Z3Vlc3QgdG8gaGF2ZSBhY3RpdmF0ZWQKPj4gaXRzIGlkZWEgb2YgRUZFUi5TVk1FIGJlZm9yZSBp
dCBjYW4gbWFrZSBoeXBlcmNhbGxzIDopCj4gCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpJJ3ZlIGFwcGxpZWQgdGhpcyBw
YXRjaCB0b2dldGhlciB3aXRoIHBhdGNoIDEgb24gdGhlIGFzc3VtcHRpb24KdGhhdCBpdCBkb2Vz
bid0IGRlcGVuZCBvbiBwYXRjaCAyICh3aGljaCBJJ3ZlIGNvbW1lbnRlZCBvbikuCkxldCBtZSBr
bm93IGlmIHRoaXMgd2FzIGEgbWlzdGFrZSBhbmQgdGhlcmUgaXMgYSBkZXBlbmRlbmN5IChpbgp3
aGljaCBjYXNlIEknbGwgcmV2ZXJ0KS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
