From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] arm/irq: skip action availability
 check for non-debug build
Date: Fri, 14 Dec 2018 15:23:12 +0000
Message-ID: <fd9581d6-8386-2ad1-74fd-995999bed967@arm.com>
References: <1544638855-9432-1-git-send-email-andrii.anisov@gmail.com>
 <1544638855-9432-3-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=16tG=OX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gXpJ6-0006h4-VJ
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 15:23:17 +0000
In-Reply-To: <1544638855-9432-3-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMTIvMTIvMTggNjoyMCBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBG
cm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IFVuZGVyIGRl
c2MtPmxvY2sgdGFrZW46Cj4gQW4gSVJRIHdpdGggX0lSUV9HVUVTVCBmbGFnIHNldCBhbHdheXMg
aGFzIGFuIGFjdGlvbi4KPiBBbiBJUlEgd2l0aCBfSVJRX0RJU0FCTEVEIGZsYWcgY2xlYXJlZCBh
bHdheXMgaGFzIGFuIGFjdGlvbi4KPiBUaG9zZSBmbGFncyBjaGVja3MgY292ZXIgYWxsIGFjY2Vz
c2VzIHRvIGRlc2MtPmFjdGlvbiBpbiBkb19JUlEsCj4gc28gd2UgY2FuIHNraXAgZGVzYy0+YWN0
aW9uIGNoZWNrIGluIG5vbi1kZWJ1ZyBidWlsZC4KPiBLZWVwIGluIHBsYWNlIGZvciBkZWJ1ZyBi
dWlsZCB0byBoZWxwIGRpYWdub3N0aWNzIHBvdGVudGlhbAo+IG1pc2NvbmZpZ3VyYXRpb24uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4K
CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoK
PiAtLS0KPiAgIHhlbi9hcmNoL2FybS9pcnEuYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2lycS5jIGIveGVu
L2FyY2gvYXJtL2lycS5jCj4gaW5kZXggZDZhMDI3My4uNGEwMmNjMSAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vaXJxLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiBAQCAtMjA5LDEy
ICsyMDksMTQgQEAgdm9pZCBkb19JUlEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2ln
bmVkIGludCBpcnEsIGludCBpc19maXEpCj4gICAgICAgc3Bpbl9sb2NrKCZkZXNjLT5sb2NrKTsK
PiAgICAgICBkZXNjLT5oYW5kbGVyLT5hY2soZGVzYyk7Cj4gICAKPiArI2lmbmRlZiBOREVCVUcK
PiAgICAgICBpZiAoICFkZXNjLT5hY3Rpb24gKQo+ICAgICAgIHsKPiAgICAgICAgICAgcHJpbnRr
KCJVbmtub3duICVzICUjMy4zeFxuIiwKPiAgICAgICAgICAgICAgICAgIGlzX2ZpcSA/ICJGSVEi
IDogIklSUSIsIGlycSk7Cj4gICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgIH0KPiArI2VuZGlm
Cj4gICAKPiAgICAgICBpZiAoIHRlc3RfYml0KF9JUlFfR1VFU1QsICZkZXNjLT5zdGF0dXMpICkK
PiAgICAgICB7Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
