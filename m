From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - signal the backend
 that we disconnect
Date: Fri, 22 Mar 2019 13:09:22 +0200
Message-ID: <9b814fc6-d130-ec63-65a1-fbfd957de52b__8736.49303555197$1553253028$gmane$org@gmail.com>
References: <20190315092348.32613-1-andr2000@gmail.com>
 <32add426-ae36-ecc9-aa3e-6169fe04f231@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qdr=RZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1h7I3C-0003xN-Gq
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 11:09:26 +0000
Received: by mail-lj1-x241.google.com with SMTP id q66so1676707ljq.7
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2019 04:09:25 -0700 (PDT)
In-Reply-To: <32add426-ae36-ecc9-aa3e-6169fe04f231@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, boris.ostrovsky@oracle.com
Cc: Volodymyr_Babchuk@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yMi8xOSAxOjAzIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE1LzAzLzIwMTkg
MTA6MjMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IFdo
aWxlIGRpc2Nvbm5lY3RpbmcgZnJvbSB0aGUgYmFja2VuZCB3ZSBjbGVhbiB1cCBzaGFyZWQgcmVz
b3VyY2VzCj4+IChldmVudCBjaGFubmVsLCByaW5nIGJ1ZmZlciksIGJ1dCBuZXZlciBsZXQgdGhl
IGJhY2tlbmQga25vdyBhYm91dAo+PiB0aGF0LiBUaGlzIG1heSBsZWFkIHRvIGluY29uc2lzdGVu
dCBiYWNrZW5kIHN0YXRlIGFuZC9vciBzaGFyZWQKPj4gcmVzb3VyY2VzIHVzZS4KPj4gRml4IHRo
aXMgYnkgZXhwbGljaXRseSBsZXR0aW5nIHRoZSBiYWNrZW5kIGtub3cgdGhhdCBmcm9udGVuZCBo
YXMKPj4gZGVzdHJveWVkIHNoYXJlZCByZXNvdXJjZXMgYnkgY2hhbmdpbmcgaXRzIFhlbiBidXMg
c3RhdGUgYWNjb3JkaW5nbHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4gLS0tCj4+ICAgZHJp
dmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jIHwgMiArKwo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbWlzYy94
ZW4ta2JkZnJvbnQuYyBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+PiBpbmRl
eCAyNGJjNWM1ZDg3NmYuLmVjYjZlNzE5ZTBlMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pbnB1
dC9taXNjL3hlbi1rYmRmcm9udC5jCj4+ICsrKyBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2Jk
ZnJvbnQuYwo+PiBAQCAtNDg4LDYgKzQ4OCw4IEBAIHN0YXRpYyBpbnQgeGVua2JkX2Nvbm5lY3Rf
YmFja2VuZChzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LAo+PiAgIAo+PiAgIHN0YXRpYyB2b2lk
IHhlbmtiZF9kaXNjb25uZWN0X2JhY2tlbmQoc3RydWN0IHhlbmtiZF9pbmZvICppbmZvKQo+PiAg
IHsKPj4gKwl4ZW5idXNfc3dpdGNoX3N0YXRlKGluZm8tPnhiZGV2LCBYZW5idXNTdGF0ZUNsb3Np
bmcpOwo+PiArCj4+ICAgCWlmIChpbmZvLT5pcnEgPj0gMCkKPj4gICAJCXVuYmluZF9mcm9tX2ly
cWhhbmRsZXIoaW5mby0+aXJxLCBpbmZvKTsKPj4gICAJaW5mby0+aXJxID0gLTE7Cj4+Cj4gQXMg
YWxyZWFkeSBzdGF0ZWQgZm9yIHRoZSByZWxhdGVkIG5ldGZyb250IHBhdGNoOiBJJ20gbm90IHN1
cmUgdGhpcwo+IGlzIHJlYWxseSB3aGF0IHdlIHdhbnQuIEhhdmUgeW91IHRlc3RlZCB4bCBzYXZl
L3Jlc3RvcmUgb3IgbWlncmF0aW9uCj4gb2YgdGhlIGd1ZXN0IHdpdGggeW91ciBwYXRjaCBhcHBs
aWVkPwpXZWxsLCBpdCBjb21lcyBvdXQgdGhhdCB0aGlzIGlzIG5vdCBlbm91Z2ggYW5kIG5lZWRz
IG11Y2ggbW9yZSB3b3JrLApzbyBwbGVhc2UgbGV0J3MgYWJhbmRvbiB0aGlzIHBhdGNoCj4KPiBK
dWVyZ2VuClRoYW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
