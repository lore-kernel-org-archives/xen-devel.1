From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 4/6] x86: bring up all CPUs even if not
 all are supposed to be used
Date: Wed, 18 Jul 2018 14:56:14 +0100
Message-ID: <20180718135614.ditib6tlvtra4flc@citrix.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffmwE-0001tP-HS
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 13:56:18 +0000
Content-Disposition: inline
In-Reply-To: <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDI6MjE6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21wcGFyc2UuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
cHBhcnNlLmMKPiBAQCAtNjgsMTkgKzY4LDI2IEBAIHBoeXNpZF9tYXNrX3QgcGh5c19jcHVfcHJl
c2VudF9tYXA7Cj4gIAo+ICB2b2lkIF9faW5pdCBzZXRfbnJfY3B1X2lkcyh1bnNpZ25lZCBpbnQg
bWF4X2NwdXMpCj4gIHsKPiArCXVuc2lnbmVkIGludCB0b3RfY3B1cyA9IG51bV9wcm9jZXNzb3Jz
ICsgZGlzYWJsZWRfY3B1czsKPiArCj4gIAlpZiAoIW1heF9jcHVzKQo+IC0JCW1heF9jcHVzID0g
bnVtX3Byb2Nlc3NvcnMgKyBkaXNhYmxlZF9jcHVzOwo+ICsJCW1heF9jcHVzID0gdG90X2NwdXM7
Cj4gIAlpZiAobWF4X2NwdXMgPiBOUl9DUFVTKQo+ICAJCW1heF9jcHVzID0gTlJfQ1BVUzsKPiAg
CWVsc2UgaWYgKCFtYXhfY3B1cykKPiAgCQltYXhfY3B1cyA9IDE7Cj4gIAlwcmludGsoWEVOTE9H
X0lORk8gIlNNUDogQWxsb3dpbmcgJXUgQ1BVcyAoJWQgaG90cGx1ZyBDUFVzKVxuIiwKPiAgCSAg
ICAgICBtYXhfY3B1cywgbWF4X3QoaW50LCBtYXhfY3B1cyAtIG51bV9wcm9jZXNzb3JzLCAwKSk7
Cj4gLQlucl9jcHVfaWRzID0gbWF4X2NwdXM7Cj4gKwo+ICsJaWYgKCFwYXJrX29mZmxpbmVfY3B1
cykKPiArCQl0b3RfY3B1cyA9IG1heF9jcHVzOwo+ICsJbnJfY3B1X2lkcyA9IG1pbih0b3RfY3B1
cywgTlJfQ1BVUyArIDB1KTsKPiArCWlmIChwYXJrX29mZmxpbmVfY3B1cyAmJiBucl9jcHVfaWRz
IDwgbnVtX3Byb2Nlc3NvcnMpCj4gKwkJcHJpbnRrKFhFTkxPR19XQVJOSU5HICJTTVA6IENhbm5v
dCBicmluZyB1cCAldSBmdXJ0aGVyIENQVXNcbiIsCj4gKwkJICAgICAgIG51bV9wcm9jZXNzb3Jz
IC0gbnJfY3B1X2lkcyk7CgpNaW5vciBuaXQ6CgpNYXliZSBpdCBpcyBqdXN0IG1lLCBidXQgIkNh
bm5vdCIgaXMgbm9ybWFsbHkgdXNlZCB3aGVuIGFuIG9wZXJhdGlvbgpmYWlscywgSSB3b3VsZCB1
c2UgIldvbid0IiB0byBpbmRpY2F0ZSB0aGlzIGlzIGEgZGVsaWJlcmF0ZSBhY3Rpb24sIG5vdAph
IGNvbnNlcXVlbmNlIG9mIGZhaWx1cmUsIG9yIHNheSAiU2tpcCBicmluZ2luZyB1cCAuLi4iLgoK
V2hhdGV2ZXIgdGhpcyBsb2cgbWVzc2FnZSBlbmRzIHVwIGxpa2U6CgpSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
