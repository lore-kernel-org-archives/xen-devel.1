From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 06/23] x86: don't call vpci function in
 physdev_op when !CONFIG_HAS_VPCI
Date: Mon, 27 Aug 2018 08:29:20 -0600
Message-ID: <5B840AC002000078001E2446@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9ba265aa00b8a2c0a97d192e267b237110c672a4.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jola=lk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuIWD-0000ER-3U
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 14:29:25 +0000
In-Reply-To: <9ba265aa00b8a2c0a97d192e267b237110c672a4.1535285866.git-series.wei.liu2@citrix.com>
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

Pj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L3BoeXNkZXYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2
LmMKPiBAQCAtNTU3LDYgKzU1Nyw3IEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4gIAo+ICAgICAgICAgIHJldCA9IHBjaV9t
bWNmZ19yZXNlcnZlZChpbmZvLmFkZHJlc3MsIGluZm8uc2VnbWVudCwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW5mby5zdGFydF9idXMsIGluZm8uZW5kX2J1cywgaW5mby5m
bGFncyk7Cj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0kKPiAgICAgICAgICBpZiAoICFyZXQgJiYg
aGFzX3ZwY2koY3VycmQpICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIC8qCj4gQEAgLTU2
Nyw2ICs1NjgsNyBAQCByZXRfdCBkb19waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0odm9pZCkgYXJnKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW5mby5zdGFydF9idXMsIGluZm8uZW5kX2J1cywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8uc2VnbWVudCk7Cj4gICAgICAg
ICAgfQo+ICsjZW5kaWYKClBlcmhhcHMgYmV0dGVyIHRvIG1ha2UgaGFzX3ZwY2koKSBldmFsdWF0
ZSB0byBmYWxzZSBpbiB0aGF0IGNhc2UsCmFuZCBvbmNlIGFnYWluIHJlbHkgb24gRENFPwoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
