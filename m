From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 10/10] vpci/sriov: add support for SR-IOV
 capability
Date: Tue, 3 Jul 2018 13:07:20 +0200
Message-ID: <20180703110720.icsnmpwdkp2nopqv@mac.bytemobile.com>
References: <20180620144234.51783-1-roger.pau@citrix.com>
 <20180620144234.51783-11-roger.pau@citrix.com>
 <20180703092759.etip2qie5gsibruy@citrix.com>
 <20180703102108.36bkr3glktzmc4pp@mac.bytemobile.com>
 <5B3B547302000078001D030D@prv1-mh.provo.novell.com>
 <20180703105134.hcbnz7emljfwkcxq@mac.bytemobile.com>
 <5B3B566602000078001D0343@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iwop=jt=citrix.com=prvs=715f702c9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1faJ9c-0001vi-KN
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 11:07:28 +0000
Content-Disposition: inline
In-Reply-To: <5B3B566602000078001D0343@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDQ6NTY6MzhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAzLjA3LjE4IGF0IDEyOjUxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gSSBkb24ndCB0aGluayB3ZSBldmVyIHdhbnQgdG8gYWxsb3cgRG9tVS1zIHRvIG1h
bmFnZSB0aGUgU1ItSU9WCj4gPiBjYXBhYmlsaXR5LCBzbyB0aGlzIGNvZGUgaXMgYWx3YXlzIGdv
aW5nIHRvIGJlIERvbTAgb25seSBBRkFJQ1QuIEluCj4gPiBmYWN0IEkgdGhpbmsgSSdtIGdvaW5n
IHRvIGFkZCBhbiBhc3NlcnQgdG8gdGhhdCBlZmZlY3QgaW4gdGhlIFNSLUlPVgo+ID4gaW5pdCBo
YW5kbGVyLgo+IAo+IERpZCB5b3UgY29uc2lkZXIgbmVzdGVkIHZpcnQgaGVyZT8KCkkgY2FuIHNl
ZSB0aGlzIG1ha2luZyBtb3JlIHNlbnNlIGZvciBuZXN0ZWQgdmlydCwgc3RpbGwgaXQncyBnb2lu
ZyB0bwpyZXF1aXJlIGEgbm9uLXRyaXZpYWwgYW1vdW50IG9mIHdvcmsgdG8gbWFrZSBTUi1JT1Yg
c2FmZSBmb3IgRG9tVXMgdG8KbWFuYWdlLCBub3QgdG8gbWVudGlvbiB0aGF0IERvbVVzIHdvdWxk
IHRoZW4gYmUgYWJsZSB0byBtYWtlIHBjaQpkZXZpY2VzIChWRnMpIGFwcGVhciBhbmQgZGlzYXBw
ZWFyLCBhbmQgbGlrZWx5IGNvbGxpZGUgd2l0aCBleGlzdGluZwpkZXZpY2VzPwoKSW4gYW55IGNh
c2UsIEkgY2FuIHNlZSBhYm91dCBwYXVzaW5nIHRoZSB2Y3B1IGFuZCByZXN1bWluZyBhZnRlciB0
aGUKdGltZW91dCwgZG9lc24ndCBzZWVtIHRoYXQgY29tcGxleC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
