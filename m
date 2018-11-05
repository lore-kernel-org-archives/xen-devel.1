From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/9] viridian: separate time related
 enlightenment implementations...
Date: Mon, 05 Nov 2018 05:56:41 -0700
Message-ID: <5BE03E0902000078001F8001@prv1-mh.provo.novell.com>
References: <20181031124335.23867-1-paul.durrant@citrix.com>
 <20181031124335.23867-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJeQw-0003Eb-Qc
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 12:56:46 +0000
In-Reply-To: <20181031124335.23867-7-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEwLjE4IGF0IDEzOjQzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUu
Ywo+IEBAIC0wLDAgKzEsMjQ1IEBACj4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICoKPiArICogdGlt
ZS5jCj4gKyAqCj4gKyAqIEFuIGltcGxlbWVudGF0aW9uIG9mIHNvbWUgdGltZSByZWxhdGVkIFZp
cmlkaWFuIGVubGlnaHRlbm1lbnRzLgo+ICsgKiBTZWUgTWljcm9zb2Z0J3MgSHlwZXJ2aXNvciBU
b3AgTGV2ZWwgRnVuY3Rpb25hbCBTcGVjaWZpY2F0aW9uLgo+ICsgKiBmb3IgbW9yZSBpbmZvcm1h
dGlvbi4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+Cj4gKyNpbmNs
dWRlIDx4ZW4vaHlwZXJjYWxsLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiArI2luY2x1
ZGUgPHhlbi92ZXJzaW9uLmg+Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL2FwaWMuaD4KPiArI2luY2x1
ZGUgPGFzbS9odm0vc3VwcG9ydC5oPgo+ICsKPiArdHlwZWRlZiBzdHJ1Y3QgX0hWX1JFRkVSRU5D
RV9UU0NfUEFHRQo+ICt7Cj4gKyAgICB1aW50MzJfdCBUc2NTZXF1ZW5jZTsKPiArICAgIHVpbnQz
Ml90IFJlc2VydmVkMTsKPiArICAgIHVpbnQ2NF90IFRzY1NjYWxlOwo+ICsgICAgaW50NjRfdCAg
VHNjT2Zmc2V0Owo+ICsgICAgdWludDY0X3QgUmVzZXJ2ZWQyWzUwOV07Cj4gK30gSFZfUkVGRVJF
TkNFX1RTQ19QQUdFLCAqUEhWX1JFRkVSRU5DRV9UU0NfUEFHRTsKCkFuZCB5b3Ugd2FudCB0byBj
b250aW51ZSB0byBoYXZlIGl0IGFsbCB1cHBlciBjYXNlLCBkZXNwaXRlIHVzIG5vcm1hbGx5CnVz
aW5nIHN1Y2ggaWRlbnRpZmllcnMgZm9yICNkZWZpbmUtcyBvbmx5PwoKQXBhcnQgZnJvbSB0aGF0
IHNhbWUgcmVtYXJrIHJlZ2FyZGluZyB0aGUgcGxhY2VtZW50IG9mIHRoZSBmdW5jdGlvbgpkZWNs
YXJhdGlvbnMgYXMgZm9yIHRoZSBwcmV2aW91cyBwYXRjaC4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
