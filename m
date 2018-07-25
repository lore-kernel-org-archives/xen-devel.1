From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: Handle deprecation of QEMU's
 -usbdevice
Date: Wed, 25 Jul 2018 09:38:20 +0100
Message-ID: <20180725083820.2cbdejqibyvu2q7a@citrix.com>
References: <20180719172929.20866-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiFJQ-0005YF-Eu
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 08:38:24 +0000
Content-Disposition: inline
In-Reply-To: <20180719172929.20866-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMTksIDIwMTggYXQgMDY6Mjk6MjlQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gLXVzYmRldmljZSBpcyBkZXByZWNhdGVkIGFzIG9mIFFFTVUgMi4xMC4KPiAKPiBU
aGlzIHBhdGNoIHJlcGxhY2UgdGhlIGZldyBvcHRpb25zIGRvY3VtZW50ZWQgaW4geGwuY2ZnKDUp
IGJ5IHRoZQo+IHJlY29tbWFuZGVkIHN5bnRheC4gQW5kIGlmIHRoZSBvcHRpb24gaXNuJ3QgcmVj
b2duaXplLCBzaW1wbHkgdXNlCj4gLXVzYmRldmljZSB3aXRoIGEgd2FybmluZywgdGhlIG9wdGlv
bnMgaXNuJ3QgZW50aXJlbHkgcmVtb3ZlZCBmcm9tIFFFTVUKPiB1cHN0cmVhbS4KPiAKPiBBbHNv
LCByZW1vdmUgZnJvbSB0aGUgbWFudWFsIHRoZSBzZW50ZW5jZSBpbnZpdGluZyB0byByZWFkIFFF
TVUncwo+IGRvY3VtZW50YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIGRvY3MvbWFuL3hsLmNmZy5wb2Qu
NS5pbiB8ICAzIC0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICB8IDY2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5j
ZmcucG9kLjUuaW4gYi9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4KPiBpbmRleCAwOTlhMjhkYzdh
Li43NDM3NWUwMjI1IDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgo+ICsr
KyBiL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgo+IEBAIC0yNDY4LDkgKzI0NjgsNiBAQCB3cml0
ZSAiaG9zdDo4LjIiLgo+ICAKPiAgVGhlIGZvcm0gdXNiZGV2aWNlPURFVklDRSBpcyBhbHNvIGFj
Y2VwdGVkIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4KPiAgCj4gLU1vcmUgdmFsaWQgb3B0
aW9ucyBjYW4gYmUgZm91bmQgaW4gdGhlICJ1c2JkZXZpY2UiIHNlY3Rpb24gb2YgdGhlIFFFTVUK
PiAtZG9jdW1lbnRhdGlvbi4KPiAtCgpEb2VzIHRoaXMgbWVhbiB3ZSBpbnRlbmQgdG8gb25seSBz
dXBwb3J0IHRoZSBvcHRpb25zIGxpc3RlZCBpbgp4bC5jZmcoNSk/CgpJZiBzbywgSSB0aGluayB3
ZSBzaG91bGQgbWFrZSBjbGVhciBoZXJlIC0tIHRoaXMgaXMgYSByZWdyZXNzaW9uLiBBbmQKdGVs
bCB1c2VycyBpZiB0aGV5IGhhdmUgYXBwZW5kZWQgdGhlaXIgb3duIG9wdGlvbnMgdGhleSBzaG91
bGQgdGFrZQphY3Rpb25zLCBsaWtlIHVzaW5nIGRldmljZV9tb2RlbF9leHRyYV9hcmdzIG9yIHNv
bWV0aGluZyBlbHNlICg/KS4KCkhvdyBkb2VzIGxpYnZpcnQgaGFuZGxlIFFFTVUgb3B0aW9uIGRl
cHJlY2F0aW9uPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
