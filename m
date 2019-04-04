From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: Prevent buffer overflow in privcmd
 ioctl
Date: Thu, 4 Apr 2019 12:07:01 -0400
Message-ID: <bbffb44b-4a08-4882-4c19-d1085cfeab2e__24196.3336871535$1554394123$gmane$org@oracle.com>
References: <20190404151217.GA22334@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Sr8=SG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hC4tn-0005uf-Eu
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 16:07:31 +0000
In-Reply-To: <20190404151217.GA22334@kadam>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gNC80LzE5IDExOjEyIEFNLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFRoZSAiY2FsbCIgdmFy
aWFibGUgY29tZXMgZnJvbSB0aGUgdXNlciBpbiBwcml2Y21kX2lvY3RsX2h5cGVyY2FsbCgpLgo+
IEl0J3MgYW4gb2Zmc2V0IGludG8gdGhlIGh5cGVyY2FsbF9wYWdlW10gd2hpY2ggaGFzIChQQUdF
X1NJWkUgLyAzMikKPiBlbGVtZW50cy4gIFdlIG5lZWQgdG8gcHV0IGFuIHVwcGVyIGJvdW5kIG9u
IGl0IHRvIHByZXZlbnQgYW4gb3V0IG9mCj4gYm91bmRzIGFjY2Vzcy4KPgo+IEZpeGVzOiAxMjQ2
YWUwYmI5OTIgKCJ4ZW46IGFkZCB2YXJpYWJsZSBoeXBlcmNhbGwgY2FsbGVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpSZXZpZXdl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCkkgYW0g
YWxzbyBhZGRpbmcgc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKLWJvcmlzCgo+IC0tLQo+ICBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmggfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL2h5cGVyY2FsbC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCj4g
aW5kZXggZGU2ZjBkNTlhMjRmLi4yODYzYzIwMjY2NTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL2h5cGVyY2FsbC5oCj4gQEAgLTIwNiw2ICsyMDYsOSBAQCB4ZW5fc2luZ2xlX2NhbGwodW5z
aWduZWQgaW50IGNhbGwsCj4gIAlfX0hZUEVSQ0FMTF9ERUNMUzsKPiAgCV9fSFlQRVJDQUxMXzVB
UkcoYTEsIGEyLCBhMywgYTQsIGE1KTsKPiAgCj4gKwlpZiAoY2FsbCA+PSBQQUdFX1NJWkUgLyBz
aXplb2YoaHlwZXJjYWxsX3BhZ2VbMF0pKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgCWFz
bSB2b2xhdGlsZShDQUxMX05PU1BFQwo+ICAJCSAgICAgOiBfX0hZUEVSQ0FMTF81UEFSQU0KPiAg
CQkgICAgIDogW3RodW5rX3RhcmdldF0gImEiICgmaHlwZXJjYWxsX3BhZ2VbY2FsbF0pCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
