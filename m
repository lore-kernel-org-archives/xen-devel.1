From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/xenstore: domain can sometimes
 disappear when destroying connection
Date: Thu, 29 Nov 2018 13:55:57 +0000
Message-ID: <20181129135557.6ns2o55utnpud4ac@zion.uk.xensource.com>
References: <20181126132204.16258-1-epetre@amazon.com>
 <20181129125255.uesjk4cyoqzgp53e@zion.uk.xensource.com>
 <49F3A10F-7400-4CFC-AAD6-29199555B365@amazon.com>
 <20181129133811.ocwry4sif5xjezvn@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wph9=oi=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSMoU-0005OL-GM
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 13:57:06 +0000
Content-Disposition: inline
In-Reply-To: <20181129133811.ocwry4sif5xjezvn@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Eftime, Petre" <epetre@amazon.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Shah,
 Amit" <aams@amazon.de>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDE6Mzg6MTFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIE5vdiAyOSwgMjAxOCBhdCAwMToxMDo1MlBNICswMDAwLCBFZnRpbWUsIFBldHJl
IHdyb3RlOgo+ID4gSSBkaWRuJ3QgZ28gZXh0cmVtZWx5IGRlZXAgaW4gbXkgZGVidWdnaW5nLCBh
cyB0aGUgdGFsbG9jIGxpYnJhcnkgaXMgYSBiaXQKPiA+IGRpZmZpY3VsdCB0byBkZWJ1ZywgYnV0
IHVuZGVyIHRoZSBkb19pbnRyb2R1Y2UgZnVuY3Rpb24geW91IGhhdmUgdGhlc2UKPiA+IHR3byBs
aW5lczoKPiAKPiBkaWZmaWN1bHQgdG8gZGVidWc+IEkgY29tcGxldGVseSBhZ3JlZS4gOy0pCj4g
Cj4gPiAKPiA+ICAgICAgICAgICAgICAgICAgLyogTm93IGRvbWFpbiBiZWxvbmdzIHRvIGl0cyBj
b25uZWN0aW9uLiAqLwo+ID4gICAgICAgICAgICAgICAgICB0YWxsb2Nfc3RlYWwoZG9tYWluLT5j
b25uLCBkb21haW4pOwo+ID4gCj4gCj4gVGhhbmtzLCBJIHRoaW5rIHRoaXMgaXMgd2hhdCBJIG1p
c3NlZC4gVGhpcyBpcyB1c2VmdWwgaW5mb3JtYXRpb24uIEkKPiB0aGluayBpdCBzaG91bGQgZ28g
aW50byB0aGUgY29tbWl0IG1lc3NhZ2UgaWYgd2UgZW5kIHVwIGNvbW1pdHRpbmcgeW91cgo+IHBh
dGNoLgo+IAoKSSBoYXZlIHRha2VuIGEgY2xvc2VyIGxvb2suIEkgZG9uJ3QgdGhpbmsgdGhlIGNp
cmN1bGFyIGxpbmsgZXhpc3RzLiBOb3RlCnRoYXQgYSBuZXcgY29ubmVjdGlvbiBpcyBhbHdheXMg
Y3JlYXRlZCB3aXRoIHRhbGxvY19hdXRvZnJlZV9jb250ZXh0LgoKRm9sbG93aW5nIHRoZSBjb2Rl
LCB3ZSBnZXQgKHRvIGRpc3Rpbmd1aXNoLCBJIHVzZSBjb25uKFgpKToKCiBjb25uKDEpIDwtIGJl
bG9uZ3MgdG8gdGFsbG9jX2F1dG9mcmVlX2NvbnRleHQsIGNyZWF0ZWQgYnkgbmV3X2Nvbm5lY3Rp
b24gd2hlbgogICAgICAgICAgICBhY2NlcHRpbmcgY29ubmVjdGlvbiBmcm9tIHNvY2tldHMuCiAK
IGNvbm4oMSktPmluIDwtIGFsbG9jYXRlZCB3aXRoIG5ld19idWZmZXIsIGJlbG9uZ3MgdG8gY29u
bigxKS4KIAogZG9tYWluIDwtIGFsbG9jYXRlZCB3aXRoIG5ld19kb21haW4sIGJlbG9uZ3MgdG8g
Y29ubigxKS0+aW4gLgogCiBkb21haW4tPmNvbm4oMikgPC0gYWxsb2NhdGVkIHdpdGggbmV3X2Nv
bm5lY3Rpb24sIGJlbG9uZ3MgdG8gdGFsbG9jX2F1dG9mcmVlX2NvbnRleHQuCiAKIHRhbGxvY19z
dGVhbChkb21haW4tPmNvbm4oMiksIGRvbWFpbikgPC0gbm93IGRvbWFpbiBiZWxvbmdzIHRvIGNv
bm4oMikuCgpTbyB0aGUgbi1hcnkgdHJlZSBlbmRzIHVwIGxpa2U6CgogIHRhbGxvY19hdXRvZnJl
ZV9jb250ZXh0LT5jb25uKDEpLT5pbgogICAgICBcLT5jb25uKDIpLT5kb21haW4KCklhbiwgY2Fu
IEkgaGF2ZSBhIHNlY29uZCBvcGluaW9uIGZyb20geW91PwoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
