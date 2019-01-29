From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] drm/xen-front: Fix mmap attributes for
 display buffers
Date: Tue, 29 Jan 2019 19:07:41 +0000
Message-ID: <bf8cf8d9-7092-d956-44d2-e55233f495d2__24046.3577023306$1548788929$gmane$org@arm.com>
References: <20190129150422.19867-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSfb=QF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goYjb-0004ZH-Lc
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 19:07:47 +0000
In-Reply-To: <20190129150422.19867-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, jgross@suse.com, boris.ostrovsky@oracle.com, kraxel@redhat.com, noralf@tronnes.org, hch@infradead.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMS8yOS8xOSAzOjA0IFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+Cj4gCj4gV2hlbiBHRU0gYmFja2luZyBzdG9yYWdlIGlzIGFsbG9j
YXRlZCB0aG9zZSBhcmUgbm9ybWFsIHBhZ2VzLAo+IHNvIHRoZXJlIGlzIG5vIHBvaW50IHVzaW5n
IHBncHJvdF93cml0ZWNvbWJpbmUgd2hpbGUgbW1hcGluZy4KPiBUaGlzIGZpeGVzIG1pc21hdGNo
IG9mIGJ1ZmZlciBwYWdlcycgbWVtb3J5IGF0dHJpYnV0ZXMgYmV0d2Vlbgo+IHRoZSBmcm9udGVu
ZCBhbmQgYmFja2VuZCB3aGljaCBtYXkgY2F1c2Ugc2NyZWVuIGFydGlmYWN0cy4KPiAKPiBGaXhl
czogYzU3NWI3ZWViODlmICgiZHJtL3hlbi1mcm9udDogQWRkIHN1cHBvcnQgZm9yIFhlbiBQViBk
aXNwbGF5IGZyb250ZW5kIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgNSArKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250X2dlbS5jCj4gaW5kZXggZDMwM2EyZTE3ZjVlLi45ZDVjMDNkNzY2OGQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jCj4gQEAgLTIzNSw4ICsy
MzUsNyBAQCBzdGF0aWMgaW50IGdlbV9tbWFwX29iaihzdHJ1Y3QgeGVuX2dlbV9vYmplY3QgKnhl
bl9vYmosCj4gICAJdm1hLT52bV9mbGFncyAmPSB+Vk1fUEZOTUFQOwo+ICAgCXZtYS0+dm1fZmxh
Z3MgfD0gVk1fTUlYRURNQVA7Cj4gICAJdm1hLT52bV9wZ29mZiA9IDA7Cj4gLQl2bWEtPnZtX3Bh
Z2VfcHJvdCA9Cj4gLQkJCXBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEt
PnZtX2ZsYWdzKSk7Cj4gKwl2bWEtPnZtX3BhZ2VfcHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qodm1h
LT52bV9mbGFncyk7CgpUaGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4gSXQgd291bGQgYmUgd29y
dGggZXhwYW5kaW5nIHRoZSBjb21tZW50IGEgCmJpdCBiZWZvcmUgdG8gZXhwbGFpbiB0aGF0IHdl
IG92ZXJ3cml0ZSB2bV9wYWdlX3Byb3QgdG8gdXNlIGNhY2hlYWJsZSAKYXR0cmlidXRlIGFzIHJl
cXVpcmVkIGJ5IHRoZSBYZW4gQUJJLgoKV2l0aCB0aGUgY29tbWVudCB1cGRhdGVkOgoKQWNrZWQt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
