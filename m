From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Mon, 16 Apr 2018 16:20:44 +0100
Message-ID: <20180416152044.GA84326@deinos.phlegethon.org>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
 <20180416082948.g6yhqwilqlorfciw@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2gfa=hf=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1f85w3-0004Fl-LY
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 15:20:51 +0000
Content-Disposition: inline
In-Reply-To: <20180416082948.g6yhqwilqlorfciw@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

CgpBdCAwOToyOSArMDEwMCBvbiAxNiBBcHIgKDE1MjM4NzA5ODkpLCBXZWkgTGl1IHdyb3RlOgo+
IENjIFRpbQo+IE9uIFRodSwgQXByIDEyLCAyMDE4IGF0IDA2OjA0OjQ5QU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+ID4gT2xkZXIgZ2NjIGRvZXNuJ3QgbGlrZSAiI3ByYWdtYSBHQ0MgZGlh
Z25vc3RpYyIgaW5zaWRlIGZ1bmN0aW9ucy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gCj4gPiAtLS0gYS90b29scy9kZWJ1Z2dlci9r
ZGQva2RkLmMKPiA+ICsrKyBiL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYwo+ID4gQEAgLTY5NSwx
MCArNjk1LDEwIEBAIHN0YXRpYyB2b2lkIGtkZF9oYW5kbGVfcmVhZF9jdHJsKGtkZF9zdGEKPiA+
ICAgICAgICAgICAgICBLRERfTE9HKHMsICJSZXF1ZXN0IG91dHNpZGUgb2Yga25vd24gY29udHJv
bCBzcGFjZVxuIik7Cj4gPiAgICAgICAgICAgICAgbGVuID0gMDsKPiA+ICAgICAgICAgIH0gZWxz
ZSB7Cj4gPiAtI3ByYWdtYSBHQ0MgZGlhZ25vc3RpYyBwdXNoCj4gPiAtI3ByYWdtYSBHQ0MgZGlh
Z25vc3RpYyBpZ25vcmVkICItV2FycmF5LWJvdW5kcyIKPiA+IC0gICAgICAgICAgICBtZW1jcHko
YnVmLCAoKHVpbnQ4X3QgKikmY3RybC5jMzIpICsgb2Zmc2V0LCBsZW4pOwo+ID4gLSNwcmFnbWEg
R0NDIGRpYWdub3N0aWMgcG9wCj4gPiArICAgICAgICAgICAgLyogU3VwcHJlc3MgYm9ndXMgZ2Nj
IDggIm91dCBvZiBib3VuZHMiIHdhcm5pbmcuICovCj4gPiArICAgICAgICAgICAgY29uc3QgdWlu
dDhfdCAqc3JjOwo+ID4gKyAgICAgICAgICAgIGFzbSAoIiIgOiAiPWciIChzcmMpIDogIjAiICgo
dWludDhfdCAqKSZjdHJsLmMzMiArIG9mZnNldCkpOwoKVGhhdCdzIHRlcnJpZnlpbmchICBEb2Vz
IGNhc3RpbmcgdGhlIG9mZnNldCB0byB1aW50MzJfdCBub3QgRFRSVD8KClRpbS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
