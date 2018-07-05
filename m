From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 4/8] xen: Remove useless casts
Date: Thu, 5 Jul 2018 11:05:01 +0100
Message-ID: <20180705100501.GB2195@perard.uk.xensource.com>
References: <20180704153919.12432-1-f4bug@amsat.org>
 <20180704153919.12432-5-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=le9o=jv=citrix.com=prvs=7170a5bb2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fb18K-0007qd-RO
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 10:05:04 +0000
Content-Disposition: inline
In-Reply-To: <20180704153919.12432-5-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMTI6Mzk6MTVQTSAtMDMwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gUGF0Y2ggY3JlYXRlZCBtZWNoYW5pY2FsbHkgYnkgcmVydW5uaW5n
Ogo+IAo+ICAgJCAgc3BhdGNoIC0tc3AtZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUvdHlwZWNhc3Qu
Y29jY2kgXAo+ICAgICAgICAgICAgIC0tbWFjcm8tZmlsZSBzY3JpcHRzL2NvY2NpLW1hY3JvLWZp
bGUuaCBcCj4gICAgICAgICAgICAgLS1kaXIgLiAtLWluLXBsYWNlCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCkFja2VkLWJ5OiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCj4gLS0tCj4gIGh3L3hl
bi94ZW5fcHRfY29uZmlnX2luaXQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW5fcHRfY29u
ZmlnX2luaXQuYyBiL2h3L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYwo+IGluZGV4IGFlZTMxYzYy
YmIuLjU1YTgzMzMzZjIgMTAwNjQ0Cj4gLS0tIGEvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5j
Cj4gKysrIGIvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jCj4gQEAgLTU0Myw3ICs1NDMsNyBA
QCBzdGF0aWMgaW50IHhlbl9wdF9leHBfcm9tX2Jhcl9yZWdfd3JpdGUoWGVuUENJUGFzc3Rocm91
Z2hTdGF0ZSAqcywKPiAgewo+ICAgICAgWGVuUFRSZWdJbmZvICpyZWcgPSBjZmdfZW50cnktPnJl
ZzsKPiAgICAgIFhlblBUUmVnaW9uICpiYXNlID0gTlVMTDsKPiAtICAgIFBDSURldmljZSAqZCA9
IChQQ0lEZXZpY2UgKikmcy0+ZGV2Owo+ICsgICAgUENJRGV2aWNlICpkID0gJnMtPmRldjsKPiAg
ICAgIHVpbnQzMl90IHdyaXRhYmxlX21hc2sgPSAwOwo+ICAgICAgdWludDMyX3QgdGhyb3VnaGFi
bGVfbWFzayA9IGdldF90aHJvdWdoYWJsZV9tYXNrKHMsIHJlZywgdmFsaWRfbWFzayk7Cj4gICAg
ICBwY2lidXNfdCByX3NpemUgPSAwOwoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
