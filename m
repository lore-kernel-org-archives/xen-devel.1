From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Mon, 16 Apr 2018 06:00:37 -0600
Message-ID: <5AD4906502000078001BBABF@prv1-mh.provo.novell.com>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
 <20180416103332.jqap6zhrsm3aul3z@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ulgz=hf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f82oF-00042X-Bl
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 12:00:35 +0000
In-Reply-To: <20180416103332.jqap6zhrsm3aul3z@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE4IGF0IDEyOjMzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMTIsIDIwMTggYXQgMDY6MDQ6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IE9sZGVyIGdjYyBkb2Vzbid0IGxpa2UgIiNwcmFnbWEgR0NDIGRpYWdub3N0aWMiIGlu
c2lkZSBmdW5jdGlvbnMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+IAo+PiAtLS0gYS90b29scy9kZWJ1Z2dlci9rZGQva2RkLmMKPj4gKysr
IGIvdG9vbHMvZGVidWdnZXIva2RkL2tkZC5jCj4+IEBAIC02OTUsMTAgKzY5NSwxMCBAQCBzdGF0
aWMgdm9pZCBrZGRfaGFuZGxlX3JlYWRfY3RybChrZGRfc3RhCj4+ICAgICAgICAgICAgICBLRERf
TE9HKHMsICJSZXF1ZXN0IG91dHNpZGUgb2Yga25vd24gY29udHJvbCBzcGFjZVxuIik7Cj4+ICAg
ICAgICAgICAgICBsZW4gPSAwOwo+PiAgICAgICAgICB9IGVsc2Ugewo+PiAtI3ByYWdtYSBHQ0Mg
ZGlhZ25vc3RpYyBwdXNoCj4+IC0jcHJhZ21hIEdDQyBkaWFnbm9zdGljIGlnbm9yZWQgIi1XYXJy
YXktYm91bmRzIgo+PiAtICAgICAgICAgICAgbWVtY3B5KGJ1ZiwgKCh1aW50OF90ICopJmN0cmwu
YzMyKSArIG9mZnNldCwgbGVuKTsKPj4gLSNwcmFnbWEgR0NDIGRpYWdub3N0aWMgcG9wCj4+ICsg
ICAgICAgICAgICAvKiBTdXBwcmVzcyBib2d1cyBnY2MgOCAib3V0IG9mIGJvdW5kcyIgd2Fybmlu
Zy4gKi8KPj4gKyAgICAgICAgICAgIGNvbnN0IHVpbnQ4X3QgKnNyYzsKPj4gKyAgICAgICAgICAg
IGFzbSAoIiIgOiAiPWciIChzcmMpIDogIjAiICgodWludDhfdCAqKSZjdHJsLmMzMiArIG9mZnNl
dCkpOwo+PiArICAgICAgICAgICAgbWVtY3B5KGJ1Ziwgc3JjLCBsZW4pOwo+IAo+IFRoZSBjb2Rl
IGxvb2tzIGNvcnJlY3QgdG8gbWU6Cj4gCj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4gCj4gVGhpcyB3aWxsIGhvcGVmdWxseSBhbHNvIGZpeCB0aGUgaXNzdWUg
Qm9yaXMgcmVwb3J0ZWQgdGhhdCBzb21lIG9sZGVyCj4gZ2NjICg8NC42KSBkb2Vzbid0IHN1cHBv
cnQgcHVzaCBhbmQgcG9wLgo+IAo+IFRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgSSBzZWUgaW5saW5l
IGFzc2VtYmx5IGlzIHVzZWQgdG8gc2lsZW5jZSBnY2MuCj4gOy0pCgpBbmQgSSdtIG5vdCBvdmVy
bHkgaGFwcHkgYWJvdXQgaXQsIGJ1dCBjb3VsZG4ndCB0aGluayBvZiBhIGJldHRlciB3YXkKd2l0
aG91dCBkaXNhYmxpbmcgc2FpZCB3YXJuaW5nIChvciAtV2Vycm9yKSBhbHRvZ2V0aGVyIGZvciB0
aGUgQ1UuIElmCklhbidzIHNrZXRjaGVkIG91dCBhcHByb2FjaCB3b3JrZWQsIEknZCBiZSBxdWl0
ZSBoYXBweSB0byBkcm9wIHRoZQpwYXRjaCBoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
