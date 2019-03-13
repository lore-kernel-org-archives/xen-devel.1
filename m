From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 5/9] xen: Convert hotplug page
 function to use typesafe MFN
Date: Wed, 13 Mar 2019 08:57:26 -0600
Message-ID: <5C891A56020000780021E327@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h45Jy-000217-0v
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 14:57:30 +0000
In-Reply-To: <20190218113600.9540-6-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDEyOjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IENvbnZlcnQgb25saW5lX3BhZ2UsIG9mZmxpbmVfcGFnZSBhbmQgcXVlcnlfcGFnZV9vZmZsaW5l
IHRvIHVzZQo+IHR5cGVzYWZlIE1GTi4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkJ1dCAuLi4KCj4gLS0tIGEveGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMKPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBA
IC0xNTY4LDIzICsxNTY4LDIzIEBAIHN0YXRpYyBpbnQgcmVzZXJ2ZV9oZWFwX3BhZ2Uoc3RydWN0
IHBhZ2VfaW5mbyAqcGcpCj4gIAo+ICB9Cj4gIAo+IC1pbnQgb2ZmbGluZV9wYWdlKHVuc2lnbmVk
IGxvbmcgbWZuLCBpbnQgYnJva2VuLCB1aW50MzJfdCAqc3RhdHVzKQo+ICtpbnQgb2ZmbGluZV9w
YWdlKG1mbl90IG1mbiwgaW50IGJyb2tlbiwgdWludDMyX3QgKnN0YXR1cykKPiAgewo+ICAgICAg
dW5zaWduZWQgbG9uZyBvbGRfaW5mbyA9IDA7Cj4gICAgICBzdHJ1Y3QgZG9tYWluICpvd25lcjsK
PiAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOwo+ICAKPiAtICAgIGlmICggIW1mbl92YWxpZChf
bWZuKG1mbikpICkKPiArICAgIGlmICggIW1mbl92YWxpZChtZm4pICkKPiAgICAgIHsKPiAgICAg
ICAgICBkcHJpbnRrKFhFTkxPR19XQVJOSU5HLAo+IC0gICAgICAgICAgICAgICAgInRyeSB0byBv
ZmZsaW5lIHBhZ2Ugb3V0IG9mIHJhbmdlICVseFxuIiwgbWZuKTsKPiArICAgICAgICAgICAgICAg
ICJ0cnkgdG8gb2ZmbGluZSBwYWdlIG91dCBvZiByYW5nZSAlIlBSSV9tZm4iXG4iLCBtZm5feCht
Zm4pKTsKCi4uLiB3b3VsZCB5b3UgbWluZCBhZGp1c3RpbmcgdGhlIHdvcmRpbmcgaGVyZSBhcyB3
ZWxsOgoiYXR0ZW1wdCB0byBvZmZsaW5lIG91dCBvZiByYW5nZSBwYWdlICUiUFJJX21mbiJcbiIg
b3IKc29tZSBzdWNoPwoKT2YgY291cnNlIHRoZSB1c2VmdWxuZXNzIG9mIHRoZSBtZXNzYWdlIGFz
IGEgd2hvbGUgaXMKcXVlc3Rpb25hYmxlLCBzbyBJJ2QgYWxzbyBiZSBoYXBweSB0byBzZWUgaXQg
ZGVsZXRlZCBhbHRvZ2V0aGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
