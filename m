From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/6] x86: bring up all CPUs even if not
 all are supposed to be used
Date: Wed, 18 Jul 2018 08:02:50 -0600
Message-ID: <5B4F488A02000078001D57A5@prv1-mh.provo.novell.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
 <20180718135614.ditib6tlvtra4flc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rjtn=kc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffn2b-0002l4-Qf
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 14:02:53 +0000
In-Reply-To: <20180718135614.ditib6tlvtra4flc@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA3LjE4IGF0IDE1OjU2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDI6MjE6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tcHBhcnNlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2
L21wcGFyc2UuYwo+PiBAQCAtNjgsMTkgKzY4LDI2IEBAIHBoeXNpZF9tYXNrX3QgcGh5c19jcHVf
cHJlc2VudF9tYXA7Cj4+ICAKPj4gIHZvaWQgX19pbml0IHNldF9ucl9jcHVfaWRzKHVuc2lnbmVk
IGludCBtYXhfY3B1cykKPj4gIHsKPj4gKwl1bnNpZ25lZCBpbnQgdG90X2NwdXMgPSBudW1fcHJv
Y2Vzc29ycyArIGRpc2FibGVkX2NwdXM7Cj4+ICsKPj4gIAlpZiAoIW1heF9jcHVzKQo+PiAtCQlt
YXhfY3B1cyA9IG51bV9wcm9jZXNzb3JzICsgZGlzYWJsZWRfY3B1czsKPj4gKwkJbWF4X2NwdXMg
PSB0b3RfY3B1czsKPj4gIAlpZiAobWF4X2NwdXMgPiBOUl9DUFVTKQo+PiAgCQltYXhfY3B1cyA9
IE5SX0NQVVM7Cj4+ICAJZWxzZSBpZiAoIW1heF9jcHVzKQo+PiAgCQltYXhfY3B1cyA9IDE7Cj4+
ICAJcHJpbnRrKFhFTkxPR19JTkZPICJTTVA6IEFsbG93aW5nICV1IENQVXMgKCVkIGhvdHBsdWcg
Q1BVcylcbiIsCj4+ICAJICAgICAgIG1heF9jcHVzLCBtYXhfdChpbnQsIG1heF9jcHVzIC0gbnVt
X3Byb2Nlc3NvcnMsIDApKTsKPj4gLQlucl9jcHVfaWRzID0gbWF4X2NwdXM7Cj4+ICsKPj4gKwlp
ZiAoIXBhcmtfb2ZmbGluZV9jcHVzKQo+PiArCQl0b3RfY3B1cyA9IG1heF9jcHVzOwo+PiArCW5y
X2NwdV9pZHMgPSBtaW4odG90X2NwdXMsIE5SX0NQVVMgKyAwdSk7Cj4+ICsJaWYgKHBhcmtfb2Zm
bGluZV9jcHVzICYmIG5yX2NwdV9pZHMgPCBudW1fcHJvY2Vzc29ycykKPj4gKwkJcHJpbnRrKFhF
TkxPR19XQVJOSU5HICJTTVA6IENhbm5vdCBicmluZyB1cCAldSBmdXJ0aGVyIENQVXNcbiIsCj4+
ICsJCSAgICAgICBudW1fcHJvY2Vzc29ycyAtIG5yX2NwdV9pZHMpOwo+IAo+IE1pbm9yIG5pdDoK
PiAKPiBNYXliZSBpdCBpcyBqdXN0IG1lLCBidXQgIkNhbm5vdCIgaXMgbm9ybWFsbHkgdXNlZCB3
aGVuIGFuIG9wZXJhdGlvbgo+IGZhaWxzLCBJIHdvdWxkIHVzZSAiV29uJ3QiIHRvIGluZGljYXRl
IHRoaXMgaXMgYSBkZWxpYmVyYXRlIGFjdGlvbiwgbm90Cj4gYSBjb25zZXF1ZW5jZSBvZiBmYWls
dXJlLCBvciBzYXkgIlNraXAgYnJpbmdpbmcgdXAgLi4uIi4KCkJ1dCBpdCBpc24ndCBhIGRlbGli
ZXJhdGUgYWN0aW9uIC0gd2UganVzdCBkb24ndCBoYXZlIGVub3VnaCBiaXRzIHRvCnJlcHJlc2Vu
dCBhbGwgb2YgdGhlbS4gVG8gbWUgdGhpcyBpcyB0aGUgaW5kaWNhdGlvbiBvZiBhIGZhaWx1cmUs
IGp1c3QKdGhhdCB3ZSBjYXRjaCBpdCBiZWZvcmUgaXQgY291bGQgYWN0dWFsbHkgY2F1c2UgcHJv
YmxlbXMuCgo+IFdoYXRldmVyIHRoaXMgbG9nIG1lc3NhZ2UgZW5kcyB1cCBsaWtlOgo+IAo+IFJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
