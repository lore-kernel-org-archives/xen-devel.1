From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Thu, 15 Nov 2018 11:40:26 +0000
Message-ID: <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbOG=N2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gNG0c-0001ZE-FF
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 11:40:30 +0000
In-Reply-To: <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xNS8xOCAxMTozMyBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWxp
ZW4sCgpIaSwKCj4gCj4g0LLRgiwgNiDQu9C40YHRgi4gMjAxOCDQviAyMToxNiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiDQv9C40YjQtToKPj4gQEAgLTI3NSw3ICsyODAsMzgg
QEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKHN0cnVjdCBkb21haW4g
KmQsIGdmbl90IGdmbiwKPj4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlX2luZm8gKmdldF9w
YWdlX2Zyb21fZ2ZuKAo+PiAgICAgICBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdm
biwgcDJtX3R5cGVfdCAqdCwgcDJtX3F1ZXJ5X3QgcSkKPj4gICB7Cj4+IC0gICAgcmV0dXJuIHAy
bV9nZXRfcGFnZV9mcm9tX2dmbihkLCBfZ2ZuKGdmbiksIHQpOwo+PiArICAgIG1mbl90IG1mbjsK
Pj4gKyAgICBwMm1fdHlwZV90IF90Owo+IAo+IE1lIHBlcnNvbmFsbHksIGRvIG5vdCBsaWtlIGlu
dHJvZHVjaW5nIGludGVybWVkaWF0ZSBgX3RgIHZhcmlhYmxlLgo+IElNTywgY29uc3RydWN0cyBs
aWtlIGZvbGxvd2luZzoKPiAKPj4gKyAgICBpZiAoICF0ICkKPj4gKyAgICAgICAgdCA9ICZfdDsK
Pj4gKwo+PiArICAgICp0ID0gcDJtX2ludmFsaWQ7Cj4gCj4gbWFrZSB0aGUgY29kZSBoYXJkZXIg
dG8gdW5kZXJzdGFuZCB0aGFuIHNpbXBsZSBjaGVja2luZyBgdGAgZm9yIG51bAo+IGJlZm9yZSBh
c3NpZ25pbmcgaXQgYQo+IHZhbHVlLgoKSWYgSSBkcm9wIF90IHRoZW4gSSBuZWVkIHRvIGFkZCBp
ZiAoICp0ICkgaW4gMyBwbGFjZXMgaW4gdGhhdCBjb2RlLiBTbyBJIApkb24ndCB0aGluayB0aGUg
YXBwcm9hY2ggaXMgYW55IGJldHRlci4KCkZlZWwgZnJlZSB0byBzdWdnZXN0IGEgc29sdXRpb24g
dGhhdCBkb2VzIG5vdCByZXF1aXJlIHRvIGNoZWNrICd0JyAKZXZlcnl3aGVyZS4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
