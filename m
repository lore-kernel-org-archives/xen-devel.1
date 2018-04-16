From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Mon, 16 Apr 2018 11:33:32 +0100
Message-ID: <20180416103332.jqap6zhrsm3aul3z@citrix.com>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9bxm=hf=citrix.com=prvs=6379ded41=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f81SQ-0004hD-Gz
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 10:33:58 +0000
Content-Disposition: inline
In-Reply-To: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTIsIDIwMTggYXQgMDY6MDQ6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT2xkZXIgZ2NjIGRvZXNuJ3QgbGlrZSAiI3ByYWdtYSBHQ0MgZGlhZ25vc3RpYyIgaW5z
aWRlIGZ1bmN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gCj4gLS0tIGEvdG9vbHMvZGVidWdnZXIva2RkL2tkZC5jCj4gKysrIGIvdG9v
bHMvZGVidWdnZXIva2RkL2tkZC5jCj4gQEAgLTY5NSwxMCArNjk1LDEwIEBAIHN0YXRpYyB2b2lk
IGtkZF9oYW5kbGVfcmVhZF9jdHJsKGtkZF9zdGEKPiAgICAgICAgICAgICAgS0REX0xPRyhzLCAi
UmVxdWVzdCBvdXRzaWRlIG9mIGtub3duIGNvbnRyb2wgc3BhY2VcbiIpOwo+ICAgICAgICAgICAg
ICBsZW4gPSAwOwo+ICAgICAgICAgIH0gZWxzZSB7Cj4gLSNwcmFnbWEgR0NDIGRpYWdub3N0aWMg
cHVzaAo+IC0jcHJhZ21hIEdDQyBkaWFnbm9zdGljIGlnbm9yZWQgIi1XYXJyYXktYm91bmRzIgo+
IC0gICAgICAgICAgICBtZW1jcHkoYnVmLCAoKHVpbnQ4X3QgKikmY3RybC5jMzIpICsgb2Zmc2V0
LCBsZW4pOwo+IC0jcHJhZ21hIEdDQyBkaWFnbm9zdGljIHBvcAo+ICsgICAgICAgICAgICAvKiBT
dXBwcmVzcyBib2d1cyBnY2MgOCAib3V0IG9mIGJvdW5kcyIgd2FybmluZy4gKi8KPiArICAgICAg
ICAgICAgY29uc3QgdWludDhfdCAqc3JjOwo+ICsgICAgICAgICAgICBhc20gKCIiIDogIj1nIiAo
c3JjKSA6ICIwIiAoKHVpbnQ4X3QgKikmY3RybC5jMzIgKyBvZmZzZXQpKTsKPiArICAgICAgICAg
ICAgbWVtY3B5KGJ1Ziwgc3JjLCBsZW4pOwoKVGhlIGNvZGUgbG9va3MgY29ycmVjdCB0byBtZToK
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKVGhpcyB3aWxsIGhv
cGVmdWxseSBhbHNvIGZpeCB0aGUgaXNzdWUgQm9yaXMgcmVwb3J0ZWQgdGhhdCBzb21lIG9sZGVy
CmdjYyAoPDQuNikgZG9lc24ndCBzdXBwb3J0IHB1c2ggYW5kIHBvcC4KClRoaXMgaXMgdGhlIGZp
cnN0IHRpbWUgSSBzZWUgaW5saW5lIGFzc2VtYmx5IGlzIHVzZWQgdG8gc2lsZW5jZSBnY2MuCjst
KQoKPiAgICAgICAgICB9Cj4gICAgICB9Cj4gIAo+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
