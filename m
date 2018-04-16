From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Mon, 16 Apr 2018 09:29:49 +0100
Message-ID: <20180416082948.g6yhqwilqlorfciw@citrix.com>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9bxm=hf=citrix.com=prvs=6379ded41=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f7zWL-0003Ph-RZ
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 08:29:53 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, tim@xen.org, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Q2MgVGltCgpPbiBUaHUsIEFwciAxMiwgMjAxOCBhdCAwNjowNDo0OUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiBPbGRlciBnY2MgZG9lc24ndCBsaWtlICIjcHJhZ21hIEdDQyBkaWFnbm9z
dGljIiBpbnNpZGUgZnVuY3Rpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS90b29scy9kZWJ1Z2dlci9rZGQva2RkLmMKPiAr
KysgYi90b29scy9kZWJ1Z2dlci9rZGQva2RkLmMKPiBAQCAtNjk1LDEwICs2OTUsMTAgQEAgc3Rh
dGljIHZvaWQga2RkX2hhbmRsZV9yZWFkX2N0cmwoa2RkX3N0YQo+ICAgICAgICAgICAgICBLRERf
TE9HKHMsICJSZXF1ZXN0IG91dHNpZGUgb2Yga25vd24gY29udHJvbCBzcGFjZVxuIik7Cj4gICAg
ICAgICAgICAgIGxlbiA9IDA7Cj4gICAgICAgICAgfSBlbHNlIHsKPiAtI3ByYWdtYSBHQ0MgZGlh
Z25vc3RpYyBwdXNoCj4gLSNwcmFnbWEgR0NDIGRpYWdub3N0aWMgaWdub3JlZCAiLVdhcnJheS1i
b3VuZHMiCj4gLSAgICAgICAgICAgIG1lbWNweShidWYsICgodWludDhfdCAqKSZjdHJsLmMzMikg
KyBvZmZzZXQsIGxlbik7Cj4gLSNwcmFnbWEgR0NDIGRpYWdub3N0aWMgcG9wCj4gKyAgICAgICAg
ICAgIC8qIFN1cHByZXNzIGJvZ3VzIGdjYyA4ICJvdXQgb2YgYm91bmRzIiB3YXJuaW5nLiAqLwo+
ICsgICAgICAgICAgICBjb25zdCB1aW50OF90ICpzcmM7Cj4gKyAgICAgICAgICAgIGFzbSAoIiIg
OiAiPWciIChzcmMpIDogIjAiICgodWludDhfdCAqKSZjdHJsLmMzMiArIG9mZnNldCkpOwo+ICsg
ICAgICAgICAgICBtZW1jcHkoYnVmLCBzcmMsIGxlbik7Cj4gICAgICAgICAgfQo+ICAgICAgfQo+
ICAKPiAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
