From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 16/16] configure: do_compiler: Dump some
 extra info under bash
Date: Wed, 25 Apr 2018 05:04:28 +0200
Message-ID: <779c1429-b78d-076e-3376-34a9d4efdd13__8747.55632034994$1524625436$gmane$org@redhat.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-17-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eao0=ho=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1fBAjW-0007hi-KF
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 03:04:38 +0000
In-Reply-To: <1524592709-6553-17-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Janosch Frank <frankja@linux.vnet.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Kent R. Spillner" <kspillner@acm.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjQuMDQuMjAxOCAxOTo1OCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gVGhpcyBtYWtlcyBpdCBt
dWNoIGVhc2llciB0byBmaW5kIGEgcGFydGljdWxhciB0aGluZyBpbiBjb25maWcubG9nLgo+IAo+
IFdlIGhhdmUgdG8gdXNlIHRoZSAke0JBU0hfTElORU5PWypdfSBzeW50YXggd2hpY2ggaXMgYSBz
eW50YXggZXJyb3IgaW4KPiBvdGhlciBzaGVsbHMsIHNvIHRlc3Qgd2hhdCBzaGVsbCB3ZSBhcmUg
cnVubmluZyBhbmQgdXNlIGV2YWwuCj4gCj4gVGhlIGV4dHJhIG91dHB1dCBpcyBvbmx5IHByaW50
ZWQgaWYgY29uZmlndXJlIGlzIHJ1biB3aXRoIGJhc2guICBPbgo+IHN5c3RlbXMgd2hlcmUgL2Jp
bi9zaCBpcyBub3QgYmFzaCwgaXQgaXMgbmVjZXNzYXJ5IHRvIHNheSBiYXNoCj4gLi9jb25maWd1
cmUgdG8gZ2V0IHRoZSBleHRyYSBkZWJ1ZyBpbmZvIGluIHRoZSBsb2cuCj4gCj4gU3VnZ2VzdGVk
LWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogS2VudCBSLiBTcGlsbG5l
ciA8a3NwaWxsbmVyQGFjbS5vcmc+Cj4gQ0M6IEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgu
dm5ldC5pYm0uY29tPgo+IENDOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KPiBDQzog
UGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgo+IENDOiBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IC0tLQo+IHY4OiBGaXggc28gdGhhdCBpdCBhY3R1
YWxseSB3b3JrcyBhcyBpbnRlbmRlZCB3aXRoIGJhc2guCj4gdjY6IEZpeCBjb21taXQgbWVzc2Fn
ZSB3b3JkaW5nLgo+IHY0OiBObyBsb25nZXIgdGFnIHRoaXMgcGF0Y2ggUkZDLgo+IC0tLQo+ICBj
b25maWd1cmUgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCj4gaW5kZXggYWEzNWFlZi4uZjli
YTllYSAxMDA3NTUKPiAtLS0gYS9jb25maWd1cmUKPiArKysgYi9jb25maWd1cmUKPiBAQCAtNjAs
NiArNjAsMTEgQEAgZG9fY29tcGlsZXIoKSB7Cj4gICAgICAjIGlzIGNvbXBpbGVyIGJpbmFyeSB0
byBleGVjdXRlLgo+ICAgICAgbG9jYWwgY29tcGlsZXI9IiQxIgo+ICAgICAgc2hpZnQKPiArICAg
IGlmIHRlc3QgLW4gIiRCQVNIX1ZFUlNJT04iOyB0aGVuIGV2YWwgJwo+ICsgICAgICAgIGVjaG8g
Pj5jb25maWcubG9nICIKPiArZnVuY3M6ICR7RlVOQ05BTUVbKl19Cj4gK2xpbmVzOiAke0JBU0hf
TElORU5PWypdfSIKPiArICAgICc7IGZpCj4gICAgICBlY2hvICRjb21waWxlciAiJEAiID4+IGNv
bmZpZy5sb2cKPiAgICAgICRjb21waWxlciAiJEAiID4+IGNvbmZpZy5sb2cgMj4mMSB8fCByZXR1
cm4gJD8KPiAgICAgICMgVGVzdCBwYXNzZWQuIElmIHRoaXMgaXMgYW4gLS1lbmFibGUtd2Vycm9y
IGJ1aWxkLCByZXJ1bgoKSSBqdXN0IGFwcGxpZWQgdGhlIHBhdGNoIGFuZCBoYWQgYSBsb29rIGF0
IGNvbmZpZy5sb2csIGFuZCB0aGlzIGxvb2tzCnVzZWZ1bCBpbmRlZWQuCgpUZXN0ZWQtYnk6IFRo
b21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
