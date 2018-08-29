From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 06:06:21 -0600
Message-ID: <5B868C3D02000078001E3005@prv1-mh.provo.novell.com>
References: <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
 <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
 <20180829110052.GC31376@aepfle.de>
 <314e3982-625d-118b-3c3e-61c852d0ffa3@citrix.com>
 <5B86773A0200004903F324A0@prv1-mh.provo.novell.com>
 <5B867B1A0200006D03F3278E@prv1-mh.provo.novell.com>
 <5B867D000200009103F328E2@prv1-mh.provo.novell.com>
 <5B867F020200009E04E46402@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuzEv-00088u-Tp
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 12:06:25 +0000
In-Reply-To: <5B867F020200009E04E46402@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDEzOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDgvMTggMTI6MDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+PiBPbiBXZWQsIEF1
ZyAyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4KPj4+IEFyY2hpdGVjdHVyYWxseSBzcGVha2lu
ZywgaGFuZGluZyAjTUMgYmFjayBpcyBwcm9iYWJseSB0aGUgY2xvc2VzdCB3ZQo+Pj4gY2FuIGdl
dCB0byBzZW5zaWJsZSBiZWhhdmlvdXIsIGJ1dCBpdCBpcyBzdGlsbCBhIGJ1ZyB0aGF0IExpbnV4
IGlzCj4+PiB0b3VjaGluZyB0aGUgYmFsbG9vbmVkIG91dCBwYWdlIGluIHRoZSBmaXJzdCBwbGFj
ZS4KPj4gV2VsbCwgdGhlIGlzc3VlIGlzIHRoYXQgYSByZWFkIGNyb3NzZXMgYSBwYWdlIGJvdW5k
YXJ5LiBJZiB0aGF0IHdvdWxkIGJlCj4+IGZvcmJpZGRlbiwgbG9hZF91bmFsaWduZWRfemVyb3Bh
ZCgpIHdvdWxkIG5vdCBleGlzdC4gSXQgY2FuIG5vdCBrbm93Cj4+IHdoYXQgaXMgaW4gdGhlIGZv
bGxvd2luZyBwYWdlLiBBbmQgc3VjaCBwYWdlIGNyb3NzaW5nIGhhcHBlbnMgYWxzbyBpbgo+PiB0
aGUgdW5iYWxsb29uZWQgY2FzZS4gU2FkbHkgSSBjYW4gbm90IHRyaWdnZXIgdGhlIHJlcG9ydGVk
IE5GUyBidWcKPj4gbXlzZWxmLiBCdXQgaXQgY2FuIGJlIGVuZm9yY2VkIGJ5IGJhbGxvb25pbmcg
ZW5vdWdoIHBhZ2VzIHNvIHRoYXQgYW4KPj4gYWxsb2NhdGVkIHJlYWRkaXIgcmVwbHkgZXZlbnR1
YWxseSBpcyByaWdodCBpbiBmcm9udCBvZiBhIGJhbGxvb25lZAo+PiBwYWdlLgo+IAo+IFRoZSBM
aW51eCBidWcgaXMgbm90IHNob290aW5nIHRoZSBiYWxsb29uZWQgcGFnZSBvdXQgb2YgdGhlIGRp
cmVjdG1hcC4gCj4gTGludXggc2hvdWxkIGJlIHRha2luZyBhIGZhdGFsICNQRiBmb3IgdGhhdCBy
ZWFkLCBiZWNhdXNlIGl0cyBhIHZpcnR1YWwKPiBtYXBwaW5nIGZvciBhIGZyYW1lIHdoaWNoIExp
bnV4IGhhcyB2b2x1bnRhcmlseSBlbGVjdGVkIHRvIG1ha2UgaW52YWxpZC4KPiAKPiBBcyBYZW4g
Y2FuJ3QgcHJldmVudCBMaW51eCBmcm9tIG1ha2luZy9tYWludGFpbmluZyBzdWNoIGFuIGludmFs
aWQKPiBtYXBwaW5nLCB0aHJvd2luZyAjTUMgYmFjayBpcyB0aGUgbmV4dCBiZXN0IHRoaW5nLCBi
ZWNhdXNlIHRlcm1pbmF0aW5nCj4gdGhlIGFjY2VzcyB3aXRoIH4wIGlzIGp1c3QgZ29pbmcgdG8g
aGlkZSB0aGUgYnVnLCBhbmQgcnVuIGF0IGEgZ2xhY2lhbAo+IHBhY2Ugd2hpbGUgZG9pbmcgc28u
CgpJIHN0aWxsIGRvIG5vdCB1bmRlcnN0YW5kIHdoeSB5b3UgdGhpbmsgc286IEhhbmRpbmcgYmFj
ayB+MCBpcyBmYXIgbW9yZQpjb3JyZWN0IHRoYW4gcmFpc2luZyAjTUMgaW1vLiBUaGUgeDg2IGFy
Y2hpdGVjdHVyZSBpcyBib3VuZCB0byBpdHMKaGlzdG9yeSwgYW5kIGluIHByZS1QZW50aXVtIGRh
eXMgdGhlcmUgd2FzIG5vICNNQyB0byBiZSByYWlzZWQgaW4gdGhlCmZpcnN0IHBsYWNlLiBGdXJ0
aGVybW9yZSwgd2hpbGUgSSBjYW4gc2VlIHRoYXQgX3NvbWUgb3RoZXJfIGJ1ZyBtYXkKYmUgaGlk
ZGVuIHRoaXMgd2F5LCB0aGVyZSdzIG5vIGJ1ZyBhdCBhbGwgdGhlIGJlIGhpZGRlbiBpbgpsb2Fk
X3VuYWxpZ25lZF96ZXJvcGFkKCkgKGxlYXZpbmcgYXNpZGUgdGhlIGJhbGxvb24gZHJpdmVyIGJl
aGF2aW9yKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
