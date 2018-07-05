From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/8] xen: Remove useless casts
Date: Thu, 05 Jul 2018 07:39:03 +0200
Message-ID: <87y3eqckco.fsf@dusky.pond.sub.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
 <20180704153919.12432-5-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k+bg=jv=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1fawyw-0007MO-Ky
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 05:39:06 +0000
In-Reply-To: <20180704153919.12432-5-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Jul 2018 12:39:15
 -0300")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
List-Id: xen-devel@lists.xenproject.org

UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JpdGVzOgoKPiBQYXRj
aCBjcmVhdGVkIG1lY2hhbmljYWxseSBieSByZXJ1bm5pbmc6Cj4KPiAgICQgIHNwYXRjaCAtLXNw
LWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL3R5cGVjYXN0LmNvY2NpIFwKPiAgICAgICAgICAgICAt
LW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggXAo+ICAgICAgICAgICAgIC0t
ZGlyIC4gLS1pbi1wbGFjZQo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4KPiAtLS0KPiAgaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgYi9ody94ZW4veGVu
X3B0X2NvbmZpZ19pbml0LmMKPiBpbmRleCBhZWUzMWM2MmJiLi41NWE4MzMzM2YyIDEwMDY0NAo+
IC0tLSBhL2h3L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYwo+ICsrKyBiL2h3L3hlbi94ZW5fcHRf
Y29uZmlnX2luaXQuYwo+IEBAIC01NDMsNyArNTQzLDcgQEAgc3RhdGljIGludCB4ZW5fcHRfZXhw
X3JvbV9iYXJfcmVnX3dyaXRlKFhlblBDSVBhc3N0aHJvdWdoU3RhdGUgKnMsCj4gIHsKPiAgICAg
IFhlblBUUmVnSW5mbyAqcmVnID0gY2ZnX2VudHJ5LT5yZWc7Cj4gICAgICBYZW5QVFJlZ2lvbiAq
YmFzZSA9IE5VTEw7Cj4gLSAgICBQQ0lEZXZpY2UgKmQgPSAoUENJRGV2aWNlICopJnMtPmRldjsK
PiArICAgIFBDSURldmljZSAqZCA9ICZzLT5kZXY7Cj4gICAgICB1aW50MzJfdCB3cml0YWJsZV9t
YXNrID0gMDsKPiAgICAgIHVpbnQzMl90IHRocm91Z2hhYmxlX21hc2sgPSBnZXRfdGhyb3VnaGFi
bGVfbWFzayhzLCByZWcsIHZhbGlkX21hc2spOwo+ICAgICAgcGNpYnVzX3Qgcl9zaXplID0gMDsK
ClJldmlld2VkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
