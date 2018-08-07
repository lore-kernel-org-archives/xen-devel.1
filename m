From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v15 12/14] x86/hvm: Drop the use of save
 functions
Date: Tue, 07 Aug 2018 06:41:15 -0600
Message-ID: <5B69936B02000078001DB8C8@prv1-mh.provo.novell.com>
References: <1533304431-27897-1-git-send-email-aisaila@bitdefender.com>
 <1533304431-27897-13-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533304431-27897-13-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA4LjE4IGF0IDE1OjUzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC0yMjYsMTUgKzIyNSwxNCBAQCBpbnQgaHZtX3NhdmUoc3RydWN0IGRvbWFpbiAqZCwg
aHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpCj4gICAgICAvKiBTYXZlIGFsbCBhdmFpbGFibGUga2lu
ZHMgb2Ygc3RhdGUgKi8KPiAgICAgIGZvciAoIGkgPSAwOyBpIDw9IEhWTV9TQVZFX0NPREVfTUFY
OyBpKysgKQo+ICAgICAgewo+IC0gICAgICAgIGhhbmRsZXIgPSBodm1fc3JfaGFuZGxlcnNbaV0u
c2F2ZTsKPiAtICAgICAgICBzYXZlX29uZV9oYW5kbGVyID0gaHZtX3NyX2hhbmRsZXJzW2ldLnNh
dmVfb25lOwo+IC0gICAgICAgIGlmICggc2F2ZV9vbmVfaGFuZGxlciAhPSBOVUxMICkKPiArICAg
ICAgICBoYW5kbGVyID0gaHZtX3NyX2hhbmRsZXJzW2ldLnNhdmVfb25lOwo+ICsgICAgICAgIGlm
ICggaGFuZGxlciAhPSBOVUxMICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIGZvcl9lYWNo
X3ZjcHUgKCBkLCB2ICkKPiAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19HX0lORk8gIkhWTSAlcHYgc2F2ZTogJXNcbiIsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgdiwgaHZtX3NyX2hhbmRsZXJzW2ldLm5hbWUpOwo+IC0gICAgICAgICAgICAgICAgcmMg
PSBzYXZlX29uZV9oYW5kbGVyKHYsIGgpOwo+ICsgICAgICAgICAgICAgICAgcmMgPSBoYW5kbGVy
KHYsIGgpOwoKQXMgYWxyZWFkeSBzYWlkIG9uIHYxNDogWW91IG11c3Qgbm90IGludm9rZSB0aGUg
aGFuZGxlciBvbmNlIHBlcgp2Q1BVIGZvciBIVk1TUl9QRVJfRE9NIHR5cGUgcmVjb3Jkcy4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
