From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen: Add acpu_sleep=s3_fake command-line
 option for testing
Date: Tue, 22 May 2018 10:03:09 -0600
Message-ID: <5B043F3D02000078001C4C97@prv1-mh.provo.novell.com>
References: <20180522133504.11859-1-george.dunlap@citrix.com>
 <5B041DC202000078001C4B2A@prv1-mh.provo.novell.com>
 <a7b19732-c3a3-c918-2a00-29de0b5b87eb@citrix.com>
 <01515f54-ad31-f7ea-3cf9-d14b9ab0f26a@citrix.com>
 <f0879b1f-ad9f-d930-d256-0ec22daf9ed2@citrix.com>
 <1914f090-235b-28a1-bb68-59fdad2c7736@citrix.com>
 <0ce730de-52a9-12ea-5eb7-f5b5d727a030@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL9kr-0001zp-Df
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 16:03:17 +0000
In-Reply-To: <0ce730de-52a9-12ea-5eb7-f5b5d727a030@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE3OjI1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBXaXRoIHlvdXIgY29kZSBkdW1wIHBhdGNoIChzb3JyeSBmb3IgdGhlIHdyYXBwaW5nKToK
PiAKPiAoWEVOKSAqKiogRE9VQkxFIEZBVUxUICoqKgo+IChYRU4pIC0tLS1bIFhlbi00LjExLXJj
ICB4ODZfNjQgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQo+IChYRU4pIENQVTogICAgMAo+
IChYRU4pIFJJUDogICAgZTAwODpbPGZmZmY4MmQwODAzNzg5NjQ+XSBoYW5kbGVfZXhjZXB0aW9u
KzB4OWMvMHhmZgo+IChYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAxMDAwNiAgIENPTlRFWFQ6IGh5
cGVydmlzb3IKPiAoWEVOKSByYXg6IGZmZmZjOTAwNDAyMDQwZDggICByYng6IDAwMDAwMDAwMDAw
MDAwMDAgICByY3g6IDAwMDAwMDAwMDAwMDAwMDMKPiAoWEVOKSByZHg6IDAwMDAwMDAwMDAwMDAw
MDAgICByc2k6IDAwMDAwMDAwMDAwMDAwMDAgICByZGk6IDAwMDAwMDAwMDAwMDAwMDAKPiAoWEVO
KSByYnA6IDAwMDAzNmZmYmZkZmJmMDcgICByc3A6IGZmZmZjOTAwNDAyMDQwMDAgICByODogIDAw
MDAwMDAwMDAwMDAwMDAKPiAoWEVOKSByOTogIDAwMDAwMDAwMDAwMDAwMDAgICByMTA6IDAwMDAw
MDAwMDAwMDAwMDAgICByMTE6IDAwMDAwMDAwMDAwMDAwMDAKPiAoWEVOKSByMTI6IDAwMDAwMDAw
MDAwMDAwMDAgICByMTM6IDAwMDAwMDAwMDAwMDAwMDAgICByMTQ6IGZmZmZjOTAwNDAyMDdmZmYK
PiAoWEVOKSByMTU6IDAwMDAwMDAwMDAwMDAwMDAgICBjcjA6IDAwMDAwMDAwODAwNTAwM2IgICBj
cjQ6IDAwMDAwMDAwMDAwMDI2NjAKPiAoWEVOKSBjcjM6IDAwMDAwMDAxOTIwMGEwMDAgICBjcjI6
IGZmZmZjOTAwNDAyMDNmZjgKPiAoWEVOKSBmc2I6IDAwMDA3ZjgwMDA4M2Q3MDAgICBnc2I6IGZm
ZmY4ODAwM2RjNDAwMDAgICBnc3M6IDAwMDAwMDAwMDAwMDAwMDAKPiAoWEVOKSBkczogMDAyYiAg
IGVzOiAwMDJiICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiBlMDEwICAgY3M6IGUwMDgKPiAo
WEVOKSBYZW4gY29kZSBhcm91bmQgPGZmZmY4MmQwODAzNzg5NjQ+IChoYW5kbGVfZXhjZXB0aW9u
KzB4OWMvMHhmZik6Cj4gKFhFTikgIDAwIGYzIDkwIDBmIGFlIGU4IGViIGY5IDxlOD4gMDcgMDAg
MDAgMDAgZjMgOTAgMGYgYWUgZTggZWIgZjkgODMKClNvIHRoYXQncyBhIENBTEwgKGluIHRoZSBS
U0Igc3Rhc2hpbmcgbG9vcCksIG1lYW5pbmcgcHJlc3VtYWJseSB0aGUKcGFnZSByaWdodCBiZWxv
dyBSU1AgaXMgbm90IHByZXNlbnQgKGJhbGxvb25lZCBvdXQ/KSBvciByL28uIEknbSBhZnJhaWQK
d2UgbWF5IGhhdmUgYWNjdW11bGF0ZWQgYSByYXRoZXIgZGVlcCBzdGFjayBhbHJlYWR5LCBtYWtp
bmcgaXQKcmF0aGVyIGN1bWJlcnNvbWUgdG8gdW53aW5kIGFsbCBvZiB0aGF0IGFuZCBmaW5kIHdo
ZXJlIGJhZG5lc3MKc3RhcnRlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
