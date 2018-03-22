From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] xen/x86: support per-domain flag for
 xpti
Date: Thu, 22 Mar 2018 09:44:26 -0600
Message-ID: <5AB3DD6A02000078001B538B@prv-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-4-jgross@suse.com>
 <5AB3D92D02000078001B5326@suse.com>
 <34ba119f-37fe-8f9e-dbbf-0852b4d5b17b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez2OE-00039J-PQ
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 15:44:30 +0000
In-Reply-To: <34ba119f-37fe-8f9e-dbbf-0852b4d5b17b@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDE2OjI5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Mi8wMy8xOCAxNjoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIxLjAzLjE4IGF0IDEz
OjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+ICt2b2lkIHhwdGlfZG9tYWluX2luaXQo
c3RydWN0IGRvbWFpbiAqZCkKPj4+ICt7Cj4+PiArICAgIGlmICggIWlzX3B2X2RvbWFpbihkKSB8
fCBpc19wdl8zMmJpdF9kb21haW4oZCkgKQo+Pj4gKyAgICAgICAgcmV0dXJuOwo+PiAKPj4gQXMg
eW91IHJlbHkgb24gdGhlIHplcm8taW5pdGlhbGl6YXRpb24gb2YgdGhlIGZpZWxkIGhlcmUsIC4u
Lgo+PiAKPj4+ICsgICAgc3dpdGNoICggb3B0X3hwdGkgKQo+Pj4gKyAgICB7Cj4+PiArICAgIGNh
c2UgWFBUSV9PRkY6Cj4+PiArICAgICAgICBkLT5hcmNoLnB2X2RvbWFpbi54cHRpID0gZmFsc2U7
Cj4+IAo+PiAuLi4gdGhpcyBjb3VsZCBnbyBhd2F5IGFzIHdlbGwuCj4gCj4gSSB3YW50ZWQgdG8g
bWFrZSB0aGUgc3dpdGNoIHN0YXRlbWVudCBjb21wbGV0ZS4gTm8gcHJvYmxlbSB0byBkcm9wCj4g
c2V0dGluZyBvZiB4cHRpIGhlcmUgb2YgeW91IGxpa2UgdGhhdCBiZXR0ZXIuCgpGQU9EIEkgZGlk
bid0IG1lYW4gZHJvcHBpbmcgdGhlIGVudGlyZSBjYXNlIGJsb2NrLgoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
