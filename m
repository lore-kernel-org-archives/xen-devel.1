From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/9] x86: move arch_evtchn_inject to x86
 common code
Date: Tue, 07 Aug 2018 05:36:10 -0600
Message-ID: <5B69842A02000078001DB832@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <cdb8122af69109bce7ffd9e0b1b16b40f6d25b54.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fn0Hf-00063R-8g
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 11:36:15 +0000
In-Reply-To: <cdb8122af69109bce7ffd9e0b1b16b40f6d25b54.1533636027.git-series.wei.liu2@citrix.com>
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

Pj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2lycS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4gQEAg
LTI3MzIsMyArMjczMiwxMSBAQCBpbnQgYWxsb2NhdGVfYW5kX21hcF9tc2lfcGlycShzdHJ1Y3Qg
ZG9tYWluICpkLCBpbnQgaW5kZXgsIGludCAqcGlycV9wLAo+ICAKPiAgICAgIHJldHVybiByZXQ7
Cj4gIH0KPiArCj4gK3ZvaWQgYXJjaF9ldnRjaG5faW5qZWN0KHN0cnVjdCB2Y3B1ICp2KQo+ICt7
Cj4gKyNpZiBDT05GSUdfSFZNCj4gKyAgICBpZiAoIGlzX2h2bV92Y3B1KHYpICkKPiArICAgICAg
ICBodm1fYXNzZXJ0X2V2dGNobl9pcnEodik7Cj4gKyNlbmRpZgo+ICt9CgpXaXRob3V0IHRoZSAj
aWZkZWYKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
