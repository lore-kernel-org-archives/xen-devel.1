From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Mon, 29 Oct 2018 08:28:07 -0600
Message-ID: <5BD718F702000078001F5D92@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH8Wc-0005X2-4d
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:28:14 +0000
In-Reply-To: <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
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

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhleSBhcmUgdXNlZnVsIHRvIFBWIG9ubHkuCgpDb25zaWRlcmluZyB0aGVyZSB3YXMgbm8gaXNf
e2h2bSxwdn1fLi4uKCkgY2hlY2sgc28gZmFyLCBJIHRoaW5rCnlvdSBuZWVkIHRvIGV4dGVuZCB0
aGlzIGEgbGl0dGxlIHBsdXMgLi4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+IEBAIC02MDgsNiArNjA4LDcgQEAgbG9uZyBhcmNo
X2RvX2RvbWN0bCgKPiAgICAgICAgICAgICAgY29weWJhY2sgPSB0cnVlOwo+ICAgICAgICAgIGJy
ZWFrOwo+ICAKPiArI2lmZGVmIENPTkZJR19QVgo+ICAgICAgY2FzZSBYRU5fRE9NQ1RMX3NldF9h
ZGRyZXNzX3NpemU6Cj4gICAgICAgICAgaWYgKCAoKGRvbWN0bC0+dS5hZGRyZXNzX3NpemUuc2l6
ZSA9PSA2NCkgJiYgIWQtPmFyY2guaXNfMzJiaXRfcHYpIHx8Cj4gICAgICAgICAgICAgICAoKGRv
bWN0bC0+dS5hZGRyZXNzX3NpemUuc2l6ZSA9PSAzMikgJiYgZC0+YXJjaC5pc18zMmJpdF9wdikg
KQo+IEBAIC02MjMsNiArNjI0LDcgQEAgbG9uZyBhcmNoX2RvX2RvbWN0bCgKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBC
SVRTX1BFUl9MT05HOwo+ICAgICAgICAgIGNvcHliYWNrID0gdHJ1ZTsKPiAgICAgICAgICBicmVh
azsKPiArI2VuZGlmCgouLi4gYWRkIHN1Y2ggYSBjaGVjayBzbyB0aGF0IHNpbWlsYXIgYmVoYXZp
b3Igd2lsbCByZXN1bHQgd2l0aCBQVgplbmFibGVkIGFuZCBkaXNhYmxlZCAoZXJyb3IgY29kZXMg
bWF5IGRpZmZlciwgYnV0IHN1Y2Nlc3MgdnMKZXJyb3Igb3VnaHQgdG8gbWF0Y2gpLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
