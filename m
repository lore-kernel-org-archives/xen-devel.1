From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/mm-locks: apply a bias to lock
 levels for current domain
Date: Wed, 19 Dec 2018 12:17:51 +0000
Message-ID: <3fd6258c-9a89-1764-8813-02c9b094ed8a@citrix.com>
References: <20181218160542.56173-1-roger.pau@citrix.com>
 <20181218160542.56173-4-roger.pau@citrix.com>
 <6475a09e-07c8-cb0e-36eb-d7c024b5239f@citrix.com>
 <20181219121027.foezgrkovz7yddl2@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zx63=O4=citrix.com=prvs=884ade4f2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZaoJ-0004Ta-UM
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 12:18:47 +0000
In-Reply-To: <20181219121027.foezgrkovz7yddl2@mac>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMjAxOCAxMjoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBIeXBlcmNhbGxz
IEFGQUlLIGhhdmUgYSBzaW5nbGUgdGFyZ2V0IChvciBzdWJqZWN0KSBkb21haW4sIHNvIGV2ZW4g
aWYKPiB0aGVyZSdzIGEgc3R1YmRvbWFpbiByZWxhdGlvbiBJJ20gbm90IHN1cmUgSSBzZWUgd2h5
IHRoYXQgd291bGQKPiByZXF1aXJlIHRoaXMga2luZCBvZiBsb2NraW5nLCBhbnkgZG9tYWluIGNh
biBwZXJmb3JtIGh5cGVyY2FsbHMKPiBhZ2FpbnN0IGEgc2luZ2xlIHN1YmplY3QgZG9tYWluLCBh
bmQgdGhlIGh5cGVydmlzb3IgaXRzZWxmIGRvZXNuJ3QKPiBldmVuIGtub3cgYWJvdXQgc3R1YmRv
bWFpbiByZWxhdGlvbnMuCgpHcmFudCBjb3B5IGhhcyB0d28gZG9tYWlucywgYW5kIG5laXRoZXIg
bmVlZCB0byBiZSB0aGUgY2FsbGVlLsKgClNwZWNpZmljYWxseSwgd2UgZGlzY292ZXJlZCBkdXJp
bmcgdGhlIFNJTE8gd29yayB0aGF0IGRvbTAgb2NjYXNvbmFsbHkKaXNzdWVzIGEgZG9tMSA9PiBk
b20yIGdyYW50IGNvcHkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
