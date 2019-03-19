From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/pvshim: use 2M alignment
Date: Tue, 19 Mar 2019 13:50:07 +0000
Message-ID: <20190319135007.GH14641@zion.uk.xensource.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-3-wei.liu2@citrix.com>
 <5C90F1E00200007800220499@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yczf=RW=citrix.com=prvs=9744cf058=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6F89-0003we-61
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:50:13 +0000
Content-Disposition: inline
In-Reply-To: <5C90F1E00200007800220499@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDc6NDI6NTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAzLjE5IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCj4gPiAr
KysgYi94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCj4gPiBAQCAtNSw2ICs1
LDcgQEAgQ09ORklHX1BWSF9HVUVTVD15Cj4gPiAgQ09ORklHX1BWX1NISU09eQo+ID4gIENPTkZJ
R19QVl9TSElNX0VYQ0xVU0lWRT15Cj4gPiAgQ09ORklHX05SX0NQVVM9MzIKPiA+ICtDT05GSUdf
WEVOX0FMSUdOXzJNPXkKPiA+ICAjIERpc2FibGUgZmVhdHVyZXMgbm90IHVzZWQgYnkgdGhlIFBW
IHNoaW0KPiA+ICAjIENPTkZJR19TSEFET1dfUEFHSU5HIGlzIG5vdCBzZXQKPiA+ICAjIENPTkZJ
R19CSUdNRU0gaXMgbm90IHNldAo+IAo+IEluc3RlYWQgb2YgdGhpcywgd2h5IG5vdCBhZGQKPiAK
PiAgICAgZGVmYXVsdCBYRU5fQUxJR05fMk0gaWYgUFZfU0hJTV9FWENMVVNJVkUKPiAKPiB0byB0
aGUgY29uZmlnIG9wdGlvbiBpdHNlbGYsIGFoZWFkIG9mIHRoZSBkZWZhdWx0IHBhdGNoIDEgZXN0
YWJsaXNoZXM/CgpUaGlzIHNlZW1zIHRvIHdvcmsgLS0gSSBkaWRuJ3Qga25vdyB5b3UgY2FuIGhh
dmUgdHdvIGRlZmF1bHQncyBmb3IgdGhlCnNhbWUgb3B0aW9uLgoKV2VpLgoKPiAKPiBKYW4KPiAK
PiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
