From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Thu, 4 Apr 2019 15:46:00 +0300
Message-ID: <0c0c0933-bf70-ac3d-57c8-68c14827bcae@bitdefender.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PucN=SG=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hC1kx-0000xl-1o
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 12:46:11 +0000
In-Reply-To: <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8zLzE5IDY6MzAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAzLjA0LjE5IGF0
IDE3OjE3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IE9uIDQvMy8xOSA1
OjU4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDAzLjA0LjE5IGF0IDE2OjI5LCA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4+IEBAIC0zMDExLDgg
KzMwMTEsMTYgQEAgaW50IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2Zu
X3QgZ2ZuLCBib29sIHN1cHByZXNzX3ZlLAo+Pj4+ICAgICAgICBtZm4gPSBwMm0tPmdldF9lbnRy
eShwMm0sIGdmbiwgJnQsICZhLCAwLCBOVUxMLCBOVUxMKTsKPj4+PiAgICAgICAgaWYgKCAhbWZu
X3ZhbGlkKG1mbikgKQo+Pj4+ICAgICAgICB7Cj4+Pj4gLSAgICAgICAgcmMgPSAtRVNSQ0g7Cj4+
Pj4gLSAgICAgICAgZ290byBvdXQ7Cj4+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3Jk
ZXI7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2Vzcyhob3N0
X3AybSwgZ2ZuX3goZ2ZuKSwgJnQsICZhLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOwo+Pj4K
Pj4+IEknbSBub3QgZW50aXJlbHkgY2VydGFpbiBhYm91dCBQMk1fQUxMT0MsIGJ1dCBJJ20gcHJl
dHR5IHN1cmUgdGhhdAo+Pj4gYXQgbGVhc3QgUDJNX1VOU0hBUkUgaXMgdG9vIGhlYXZ5OiBXaHkg
d291bGQgeW91IHdhbnQgdG8gZm9yY2UKPj4+IHVuLXNoYXJpbmcgb2YgYSBwYWdlIHdoZW4gYWxs
IHlvdSB3YW50IHRvIGFsdGVyIGlzICNWRSBiZWhhdmlvcj8KPj4KPj4gVGhhdCBsb2dpYyB3YXMg
dGFrZW4gZnJvbSBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKCksIHdlIHRob3VnaHQgdGhlCj4+
IHR3byBjYXNlcyBhcmUgdmVyeSBzaW1pbGFyLgo+IAo+IEkgc2VlLgoKT24gdGhlIFVOU0hBUkUg
b2JzZXJ2YXRpb24sIHdlIGRvbid0IGtub3cgd2h5IHRoZSBhdXRob3Igb3JpZ2luYWxseSAKcmVx
dWVzdGVkIHRoZSBmbGFnLiBXZSBkZWNpZGVkIHRvIGtlZXAgaXQgb24gdGhlIGFzc3VtcHRpb24g
dGhhdCBpdCAKX3Byb2JhYmx5XyBoYW5kbGVzIHNvbWUgY29ybmVyLWNhc2UgdGhhdCBzb21lYm9k
eSBoYXMgY29tZSBhY2Nyb3NzLgoKV2UnbGwgcHJlcGFyZSBhIG1pbmktc2VyaWVzIGZhY3Rvcmlu
ZyBvdXQgdGhlIGNvZGUgd2UndmUgYmVlbiBkaXNjdXNzaW5nIAppbiBzZXBhcmF0ZSBmdW5jdGlv
bnM6IG9uZSBmb3IgZ2V0dGluZyB0aGluZ3Mgb3V0IG9mIHRoZSBob3N0cDJtIGlmIHRoZSAKZW50
cnkgaXMgbm90IHByZXNlbnQgaW4gdGhlIGFsdHAybSwgYW5kIG9uZSBmb3IgdGhlIHNwZWNpYWwg
CnBhZ2Utb3JkZXItZGVwZW5kZW50IGNvZGUgKHdoaWNoIGlzIGR1cGxpY2F0ZWQgaW4gCnAybV9z
ZXRfYWx0cDJtX21lbV9hY2Nlc3MoKSBhbmQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKCkpLgoKQmVm
b3JlIGdvaW5nIGludG8gdGhhdCwgYXJlIHdlIG5vdyBjZXJ0YWluIHRoYXQgQUxMT0MgaXMgc3Vm
ZmljaWVudD8gSSAKYmVsaWV2ZSBpdCBzaG91bGQgYmUgZm9yIF9vdXJfIHVzZS1jYXNlcywgYnV0
IHdlIGRvbid0IHdhbnQgdG8gYnJlYWsgCmFueW9uZSdzIGNvZGUuIE1heWJlIFRhbWFzIGtub3dz
IG1vcmUgYWJvdXQgdGhpcy4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
