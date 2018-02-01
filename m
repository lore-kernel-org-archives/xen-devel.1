From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen: fix frontend driver disconnected from
 xenbus on removal
Date: Thu, 1 Feb 2018 22:24:47 +0200
Message-ID: <05dc798a-852a-aca4-8098-862ee566e1d8__43295.6663113602$1517516656$gmane$org@gmail.com>
References: <1517475439-10541-1-git-send-email-andr2000@gmail.com>
 <1517475439-10541-2-git-send-email-andr2000@gmail.com>
 <3943477e-7768-ceb3-38a3-3a20cb0e3082@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pmqj=e3=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ehLPg-0007Mb-Uq
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 20:24:53 +0000
Received: by mail-lf0-x244.google.com with SMTP id o89so28153005lfg.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 12:24:51 -0800 (PST)
In-Reply-To: <3943477e-7768-ceb3-38a3-3a20cb0e3082@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, otubo@redhat.com, david.vrabel@citrix.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMS8yMDE4IDEwOjA4IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gMDIv
MDEvMjAxOCAwMzo1NyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPj4KPj4gQ3VycmVudCB4ZW5idXMgZnJvbnRlbmQgZHJpdmVyIHJlbW92YWwgZmxvdyBmaXJz
dCBkaXNjb25uZWN0cwo+PiB0aGUgZHJpdmVyIGZyb20geGVuYnVzIGFuZCB0aGVuIGNhbGxzIGRy
aXZlcidzIHJlbW92ZSBjYWxsYmFjay4KPj4gVGhpcyBtYWtlcyBpdCBpbXBvc3NpYmxlIGZvciB0
aGUgZHJpdmVyIHRvIGxpc3RlbiB0byBiYWNrZW5kJ3MKPj4gc3RhdGUgY2hhbmdlcyBhbmQgc3lu
Y2hyb25pemUgdGhlIHJlbW92YWwgcHJvY2VkdXJlLgo+Pgo+PiBGaXggdGhpcyBieSByZW1vdmlu
ZyBvdGhlciBlbmQgWGVuQnVzIHdhdGNoZXMgYWZ0ZXIgdGhlCj4+IGRyaXZlcidzIHJlbW92ZSBj
YWxsYmFjayBpcyBjYWxsZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4gLS0tCj4+ICAgZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIHwgNCArKy0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmUuYwo+PiBpbmRleCA3NDg4OGNhY2QwYjAuLjljNjNjZDNmNDE2YiAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCj4+ICsrKyBiL2RyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+PiBAQCAtMjU4LDExICsyNTgsMTEgQEAgaW50IHhl
bmJ1c19kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKl9kZXYpCj4+ICAgCj4+ICAgCURQUklOVEso
IiVzIiwgZGV2LT5ub2RlbmFtZSk7Cj4+ICAgCj4+IC0JZnJlZV9vdGhlcmVuZF93YXRjaChkZXYp
Owo+PiAtCj4+ICAgCWlmIChkcnYtPnJlbW92ZSkKPj4gICAJCWRydi0+cmVtb3ZlKGRldik7Cj4K
PiBJcyBpdCBwb3NzaWJsZSBmb3IgdGhlIHdhdGNoIHRvIGZpcmUgaGVyZT8KSW5kZWVkLiBZZXMs
IEl0IGlzIHBvc3NpYmxlLCBzbyB3ZSBoYXZlIHRvIHNvbWVob3cgcHJvdGVjdCB0aGUgcmVtb3Zl
ZApkcml2ZXIgZnJvbSBiZWluZyBjYWxsZWQsIGUuZy4gdGhlIGRyaXZlciBjbGVhbnMgdXAgaW4g
aXRzIC5yZW1vdmUsCmJ1dCB3YXRjaCBtYXkgc3RpbGwgdHJpZ2dlciAub3RoZXJlbmRfY2hhbmdl
ZCBjYWxsYmFjay4KSXMgdGhpcyB3aGF0IHlvdSBtZWFuPwpJZiBzbywgZG8geW91IGhhdmUgc29t
ZXRoaW5nIG5lYXQgb24geW91ciBtaW5kIGhvdyB0byBzb2x2ZSB0aGlzPwo+IC1ib3Jpcwo+Cj4+
ICAgCj4+ICsJZnJlZV9vdGhlcmVuZF93YXRjaChkZXYpOwo+PiArCj4+ICAgCWZyZWVfb3RoZXJl
bmRfZGV0YWlscyhkZXYpOwo+PiAgIAo+PiAgIAl4ZW5idXNfc3dpdGNoX3N0YXRlKGRldiwgWGVu
YnVzU3RhdGVDbG9zZWQpOwpUaGFuayB5b3UsCk9sZWtzYW5kcgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
