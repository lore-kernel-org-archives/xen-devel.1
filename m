From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: backporting considerations (Re: [PATCH v9 0/9]
 xen/x86: various XPTI speedups)
Date: Wed, 16 May 2018 10:01:42 -0600
Message-ID: <5AFC55E602000078001C35C5@prv1-mh.provo.novell.com>
References: <20180426113318.21838-1-jgross@suse.com>
 <5AFBF47E02000078001C3211@prv1-mh.provo.novell.com>
 <CAFLBxZY5d=sArakZNm7gSbe2-kuQXu3v33uH9HS2bVgs-v6ZiQ@mail.gmail.com>
 <5AFC399E02000078001C3466@prv1-mh.provo.novell.com>
 <CAFLBxZYyspzYvD=hDq8aK5G2OFT+7nGFGE0dTy3hYpirS8uwMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iqfx=id=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIys9-00075V-0U
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 16:01:49 +0000
In-Reply-To: <CAFLBxZYyspzYvD=hDq8aK5G2OFT+7nGFGE0dTy3hYpirS8uwMg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA1LjE4IGF0IDE2OjUzLCA8ZHVubGFwZ0B1bWljaC5lZHU+IHdyb3RlOgo+IE9u
IFdlZCwgTWF5IDE2LCAyMDE4IGF0IDM6MDEgUE0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDE2LjA1LjE4IGF0IDE1OjE4LCA8ZHVubGFwZ0B1bWljaC5l
ZHU+IHdyb3RlOgo+Pj4gSWYgdGhlIGxhdHRlciwgSSB0aGluayB0aGUgc2FtZSBhcmd1bWVudCBh
cHBsaWVzOiB0dXJuaW5nIG9uIFhQVEkgaXMgYQo+Pj4gcmVxdWlyZW1lbnQgZm9yIG1hbnkgcGVv
cGxlLCBhbmQgdGh1cyByZXByZXNlbnRzIGEgcHJldHR5IGhlZnR5Cj4+PiBwZXJmb3JtYW5jZSBy
ZWdyZXNzaW9uLiAgV2hpbGUgd2UgZG9uJ3QgbmVlZCB0byBiYWNrcG9ydCBub3JtYWwgZml4ZXMK
Pj4+IHRvIHNlY3VyaXR5LW9ubHkgcmVsZWFzZXMsIHdlIHNob3VsZCBjZXJ0YWlubHkgdHJ5IHRv
IGF2b2lkCj4+PiByZWdyZXNzaW9ucy4KPj4KPj4gSSBkb24ndCB0aGluayB3ZSB3b3VsZCBoYXZl
IGFkZHJlc3NlZCBub24tc2VjdXJpdHkgZmFsbG91dCAob3Igb3RoZXIKPj4gdGhhbiByZWFsbHkg
c2V2ZXJlIHJlZ3Jlc3Npb25zKSBmcm9tIG90aGVyIHNlY3VyaXR5IHBhdGNoZXMgaW4gdGhlCj4+
IHBhc3Qgb24gc2VjdXJpdHkgb25seSBicmFuY2hlcy4gUGVvcGxlIGNhcmluZyBhYm91dCBwZXJm
b3JtYW5jZQo+PiBzaG91bGQgdXBncmFkZS4KPiAKPiBJZiBhIHNlY3VyaXR5IHBhdGNoLCB3aGVu
IGJhY2twb3J0ZWQgdG8gNC42LCBicm9rZSBzb21lIGZhaXJseQo+IGNyaXRpY2FsIGJpdCBvZiBm
dW5jdGlvbmFsaXR5IChzYXksICBvcGVudnN3aXRjaCBzdXBwb3J0KSwgeW91IHdvdWxkCj4gb3Bw
b3NlIGEgc3Vic2VxdWVudCBwYXRjaCB3aGljaCB3b3VsZCBmaXggdGhhdCByZWdyZXNzaW9uPwo+
IAo+IFRoYXQgZG9lc24ndCBzZWVtIHZlcnkgcmVhc29uYWJsZSB0byBtZS4gIFVzZXJzIHNob3Vs
ZG4ndCBoYXZlIHRvCj4gY2hvb3NlIGJldHdlZW4gYmVpbmcgdnVsbmVyYWJsZSB0byBhIHNlY3Vy
aXR5IGlzc3VlIGFuZCBsb3NpbmcKPiBmdW5jdGlvbmFsaXR5IHdoaWNoIHdhcyB3b3JraW5nIGF0
IHRoZSBsYXN0IHJlbGVhc2UuICBPdGhlcndpc2UsCj4gd2hhdCdzIHRoZSBwb2ludCBvZiBoYXZp
bmcgInNlY3VyaXR5IHN1cHBvcnRlZCIgcmVsZWFzZXM/CgpOb3RlIGhvdyBJIGRpZCBzYXkgIm9y
IG90aGVyIHRoYW4gcmVhbGx5IHNldmVyZSByZWdyZXNzaW9ucyIuIEkgdGhpbmsKeW91ciAiZmFp
cmx5IGNyaXRpY2FsIGJpdCBvZiBmdW5jdGlvbmFsaXR5IiBmYWxscyBpbnRvIGV4YWN0bHkgdGhh
dCBhcmVhLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
