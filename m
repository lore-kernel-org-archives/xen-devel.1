From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] timers: limit heap size
Date: Tue, 9 Apr 2019 14:38:42 +0100
Message-ID: <08968726-0f4a-f267-b1f7-c1e08893c5a6@citrix.com>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rl/Z=SL=citrix.com=prvs=995435944=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hDr3p-00007j-HN
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:45:13 +0000
In-Reply-To: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMjAxOSAxNDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTQ2Myw5ICs0NjMs
MTQgQEAgc3RhdGljIHZvaWQgdGltZXJfc29mdGlycV9hY3Rpb24odm9pZCkKPiAgICAgIGlmICgg
dW5saWtlbHkodHMtPmxpc3QgIT0gTlVMTCkgKQo+ICAgICAgewo+ICAgICAgICAgIC8qIG9sZF9s
aW1pdCA9PSAoMl5uKS0xOyBuZXdfbGltaXQgPT0gKDJeKG4rNCkpLTEgKi8KPiAtICAgICAgICBp
bnQgb2xkX2xpbWl0ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7Cj4gLSAgICAgICAgaW50
IG5ld19saW1pdCA9ICgob2xkX2xpbWl0ICsgMSkgPDwgNCkgLSAxOwo+IC0gICAgICAgIHN0cnVj
dCB0aW1lciAqKm5ld2hlYXAgPSB4bWFsbG9jX2FycmF5KHN0cnVjdCB0aW1lciAqLCBuZXdfbGlt
aXQgKyAxKTsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgb2xkX2xpbWl0ID0gaGVhcF9tZXRhZGF0
YShoZWFwKS0+bGltaXQ7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IG5ld19saW1pdCA9ICgob2xk
X2xpbWl0ICsgMSkgPDwgNCkgLSAxOwo+ICsgICAgICAgIHN0cnVjdCB0aW1lciAqKm5ld2hlYXAg
PSBOVUxMOwo+ICsKPiArICAgICAgICAvKiBEb24ndCBncm93IHRoZSBoZWFwIGJleW9uZCB3aGF0
IGlzIHJlcHJlc2VudGFibGUgaW4gaXRzIG1ldGFkYXRhLiAqLwo+ICsgICAgICAgIGlmICggbmV3
X2xpbWl0ID09ICh0eXBlb2YoaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQpKW5ld19saW1pdCAm
Jgo+ICsgICAgICAgICAgICAgbmV3X2xpbWl0ICsgMSApCj4gKyAgICAgICAgICAgIG5ld2hlYXAg
PSB4bWFsbG9jX2FycmF5KHN0cnVjdCB0aW1lciAqLCBuZXdfbGltaXQgKyAxKTsKCkl0IHdvdWxk
IHByb2JhYmx5IGJlIGhlbHBmdWwgdG8gaGF2ZSBhIHdhcm5fb25jZS9wcmludF9vbmNlIGluIHRo
ZSBjYXNlCnRoYXQgd2UgZG8gaGl0IHRoZSBtZXRhZGF0YSBsaW1pdAoKV2hhdCBpcyB0aGUgbmV3
X2xpbWl0ICsgMSBmb3I/wqAgSXMgaXQgYW4gb3ZlcmZsb3cgY2hlY2s/CgpHaXZlbiBhKSB0aGF0
IHdlJ3JlIG5vdCBtb3ZpbmcgZnJvbSB1aW50MTZfdCB3aGlsZSB3ZSBoYXZlIDMyYml0Cmh5cGVy
dmlzb3IgYnVpbGRzIGluIHVzZSwgYW5kIGIpIHRoZSBjYWxjdWxhdGlvbiBvZiBuZXdfbGltaXQg
d2lsbAp0cnVuY2F0ZSBiZWZvcmUgZ2V0dGluZyBpbnRvIGEgcG9zaXRpb24gd2hlcmUgdGhpcyBv
dmVyZmxvdyBjaGVjayB3b3VsZAp0cmlwLCBJIGRvbid0IHRoaW5rIGl0IGlzIGhlbHBmdWwgdG8g
cmV0YWluLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
