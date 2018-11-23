From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Fri, 23 Nov 2018 14:40:10 +0100
Message-ID: <87cb7b80-28bf-cf99-7eca-83e46ed33565@suse.com>
References: <20181123132516.28681-1-jgross@suse.com>
 <e0cf196f-11ee-0e05-0966-c77161a0a949@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H732=OC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gQBgv-0002Gp-1Z
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:40:17 +0000
In-Reply-To: <e0cf196f-11ee-0e05-0966-c77161a0a949@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxNDoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMy8xMS8yMDE4
IDEzOjI1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJbiBkZWJ1ZyBidWlsZHMgdGhlIGh5cGVy
dmlzb3Igd2lsbCBkZWxpYmVyYXRlbHkgY2xvYmJlciBwcm9jZXNzZWQKPj4gZWxlbWVudHMgb2Yg
dGhlIG11bHRpY2FsbCBzdHJ1Y3R1cmUuIEluIG9yZGVyIHRvIGVhc2UgZGlhZ25vc3RpYyBkYXRh
Cj4+IHByaW50b3V0IGluIHRoZSBhZmZlY3RlZCBndWVzdCBvbmx5IGNsb2JiZXIgZWxlbWVudHMg
d2hpY2ggZGlkbid0Cj4+IHJldHVybiBhbiBlcnJvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gIHhlbi9jb21tb24vbXVsdGlj
YWxsLmMgfCAxICsKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9tdWx0aWNhbGwuYyBiL3hlbi9jb21tb24vbXVsdGljYWxsLmMK
Pj4gaW5kZXggNWExOTllYmY4Zi4uNDg2MjI2MTljZSAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1v
bi9tdWx0aWNhbGwuYwo+PiArKysgYi94ZW4vY29tbW9uL211bHRpY2FsbC5jCj4+IEBAIC03NCw2
ICs3NCw3IEBAIGRvX211bHRpY2FsbCgKPj4gICAgICAgICAgQVNTRVJUX05PVF9JTl9BVE9NSUMo
KTsKPj4gIAo+PiAgI2lmbmRlZiBOREVCVUcKPj4gKyAgICAgICAgaWYgKCAobG9uZyltY3MtPmNh
bGwucmVzdWx0ID49IDAgKQo+IAo+IFdoaWxlIEkgYXBwcmVjaWF0ZSB5b3VyIHBvaW50IGFuZCBh
Z3JlZSB0aGF0IHRoaXMgaXMgZ29vZCBpbiBwcmluY2lwbGUsCj4gdGhlIGZhaWx1cmUgY29uZGl0
aW9uIGlzIHBlci1oeXBlcmNhbGwsIGFuZCBub3QgYWx3YXlzIG5lZ2F0aXZlLgoKSW4gdGhlb3J5
IHlvdSBtYXkgYmUgcmlnaHQuCgpPVE9IIHRoZSByZWxhdGVkIGNvZGUgaW4gdGhlIExpbnV4IGtl
cm5lbCBjaGVja3MgZXhhY3RseSB3aGF0IEkgYW0KYWltaW5nIGF0OiBJbiBjYXNlIGFueSBtdWx0
aWNhbGwgZWxlbWVudCBoYXMgYSBuZWdhdGl2ZSByZXN1bHQgdGhpcyBpcwpyZWdhcmRlZCB0byBi
ZSBhbiBlcnJvciBhbmQgYSBXQVJOIGlzIGlzc3VlZC4KCkEgbmVnYXRpdmUgcmV0dXJuIHZhbHVl
IG9mIHRoZSBtdWx0aWNhbGwgaHlwZXJjYWxsIGlzIHJlZ2FyZGVkIHRvIGJlIGEKQlVHKCkuCgo+
IEkndmUgdHJpZWQgcGxheWluZyBhIHNpbWlsYXIgZ2FtZSBiZWZvcmUgYW5kIGNvdWxkbid0IGNv
bWUgdXAgd2l0aCBhCj4gdmlhYmxlIG9wdGlvbi4KCkluIHRoZSBlbmQgdGhlIHJlc3VsdCB3aWxs
IGJlIGJldHRlciB0aGFuIHRvZGF5LCBldmVuIGlmIHRoZSBoZXVyaXN0aWMKZm9yIGRldGVjdGlu
ZyBhbiBlcnJvciBpbiBhIG11bHRpY2FsbCBlbnRyeSBtaWdodCBiZSBub3Qgb3B0aW1hbC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
