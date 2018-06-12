From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the IEC
 binary prefix definitions
Date: Tue, 12 Jun 2018 16:04:33 -0500
Message-ID: <76aa5170-1d18-8799-6ff1-a7c0dba0b489__48278.9179929115$1528837404$gmane$org@redhat.com>
References: <20180611011501.10235-1-f4bug@amsat.org>
 <20180611011501.10235-12-f4bug@amsat.org>
 <15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=elvj=i6=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fSqT1-00024B-8K
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 21:04:39 +0000
In-Reply-To: <15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAwMzo1MSBQTSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6Cj4gT24gMDYv
MTAvMjAxOCAwMzoxNCBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+ICAgICAg
IHhlbl9wdl9wcmludGYoeGVuZGV2LCAxLCAidHlwZSBcIiVzXCIsIGZpbGVwcm90byBcIiVzXCIs
IGZpbGVuYW1lIFwiJXNcIiwiCj4+IC0gICAgICAgICAgICAgICAgICAiIHNpemUgJSIgUFJJZDY0
ICIgKCUiIFBSSWQ2NCAiIE1CKVxuIiwKPj4gKyAgICAgICAgICAgICAgICAgICIgc2l6ZSAlIiBQ
UklkNjQgIiAoJWxsdSBNQilcbiIsCj4+ICAgICAgICAgICAgICAgICAgICAgYmxrZGV2LT50eXBl
LCBibGtkZXYtPmZpbGVwcm90bywgYmxrZGV2LT5maWxlbmFtZSwKPj4gLSAgICAgICAgICAgICAg
ICAgIGJsa2Rldi0+ZmlsZV9zaXplLCBibGtkZXYtPmZpbGVfc2l6ZSA+PiAyMCk7Cj4+ICsgICAg
ICAgICAgICAgICAgICBibGtkZXYtPmZpbGVfc2l6ZSwgYmxrZGV2LT5maWxlX3NpemUgLyBNaUIp
Owo+IAo+IEhhdmluZyB0byBjaGFuZ2UgcHJpbnRmIG1hcmt1cCBpcyBleGFjdGx5IHdoeSB5b3Ug
c2hvdWxkbid0IHVzZSBVTEwgaW4gTWlCLgoKQ29udmVyc2VseSwgTV9CWVRFIHdhcyBhbHJlYWR5
IFVMTCwgc28gaWYgeW91IGRvbid0IHVzZSBpdCBpbiBNaUIsIAp5b3UnbGwgaGF2ZSB0byBjaGFu
Z2Ugb3RoZXIgcHJpbnRmIG1hcmt1cCB3aGVyZSB5b3Ugd2VyZSBjaGFuZ2luZyB0aG9zZSAKdXNl
cy4KCk9uZSBiZW5lZml0IG9mIHVzaW5nIHRoZSB3aWRlc3QgcG9zc2libGUgdHlwZTogd2UgYXZv
aWQgcmlzayBvZiBzaWxlbnQgCnRydW5jYXRpb24uICBQb3RlbnRpYWwgZG93bnNpZGVzOiB3YXN0
ZWQgcHJvY2Vzc2luZyB0aW1lICh3aGVuIDMyIGJpdHMgCndhcyBzdWZmaWNpZW50KSwgYW5kIGNv
bXBpbGVycyBtaWdodCBzdGFydCB3YXJuaW5nIHdoZW4gd2UgbmFycm93IGEgCjY0LWJpdCB2YWx1
ZSBpbnRvIGEgMzItYml0IHZhcmlhYmxlIChidXQgSSB0aGluayB3ZSBhbHJlYWR5IGlnbm9yZSB0
aGF0KS4KCk9uZSBiZW5lZml0IG9mIHVzaW5nIHRoZSBuYXR1cmFsIHR5cGUgdGhhdCBob2xkcyB0
aGUgdmFsdWU6IHVzZSBvZiAKNjQtYml0IG1hdGggaXMgZXhwbGljaXQgYmFzZWQgb24gdGhlIHR5
cGUgb2Ygd2hhdCBlbHNlIGlzIGJlaW5nIAptdWx0aXBsaWVkIGJ5IHRoZSBtYWNyby4gIFBvdGVu
dGlhbCBkb3duc2lkZTogMzIqMzIgYXNzaWduZWQgdG8gYSA2NC1iaXQgCnJlc3VsdCBtYXkgYmUg
Ym90Y2hlZCAoYnV0IGhvcGVmdWxseSBDb3Zlcml0eSB3aWxsIGZsYWcgaXQpLgoKU28gdGhlcmUn
cyB0cmFkZW9mZnMgZWl0aGVyIHdheSwgYW5kIHlvdSBhdCBsZWFzdCBuZWVkIHRvIGRvY3VtZW50
IGluIAp5b3VyIGNvbW1pdCBtZXNzYWdlcyB3aGF0IGF1ZGl0aW5nIHlvdSBoYXZlIGRvbmUgdGhh
dCBhbnkgdHlwZSBjaGFuZ2VzIAppbnRyb2R1Y2VkIGJ5IHlvdXIgY2hhbmdlcyBhcmUgc2FmZS4K
Ci0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhhdCwgSW5j
LiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjY2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBs
aWJ2aXJ0Lm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
