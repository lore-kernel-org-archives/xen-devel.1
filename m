From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 4/4] xen/common: use SYMBOL when required
Date: Tue, 8 Jan 2019 10:31:10 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901081028140.800@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901031114230.800@sstabellini-ThinkPad-X260>
 <1546543191-9206-4-git-send-email-sstabellini@kernel.org>
 <5C33281F020000780020AC2C@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901071059120.800@sstabellini-ThinkPad-X260>
 <5C345BC0020000780020B254@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ggw9h-0006mh-Gq
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 18:31:13 +0000
In-Reply-To: <5C345BC0020000780020B254@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA4IEphbiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDcuMDEuMTkg
YXQgMjA6MTYsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIE1vbiwgNyBK
YW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDAzLjAxLjE5IGF0IDIwOjE5
LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4gPiAtLS0gYS94ZW4vY29tbW9u
L3ZpcnR1YWxfcmVnaW9uLmMKPiA+PiA+ICsrKyBiL3hlbi9jb21tb24vdmlydHVhbF9yZWdpb24u
Ywo+ID4+ID4gQEAgLTExOSw3ICsxMTksMTEgQEAgdm9pZCBfX2luaXQgc2V0dXBfdmlydHVhbF9y
ZWdpb25zKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKnN0YXJ0LAo+ID4+ID4g
ICAgICAgICAgY29uc3Qgc3RydWN0IGJ1Z19mcmFtZSAqczsKPiA+PiA+ICAKPiA+PiA+ICAgICAg
ICAgIHMgPSBidWdfZnJhbWVzW2kgLSAxXTsKPiA+PiA+IC0gICAgICAgIHN6ID0gYnVnX2ZyYW1l
c1tpXSAtIHM7Cj4gPj4gPiArICAgICAgICAvKgo+ID4+ID4gKyAgICAgICAgICogQ2FzdCB0byB1
bnNpZ25lZCBsb25nIHRvIGNhbGN1bGF0ZSB0aGUgc2l6ZSB0byBhdm9pZAo+ID4+ID4gKyAgICAg
ICAgICogc3VidHJhY3Rpb25zIGJldHdlZW4gcG9pbnRlcnMgcG9pbnRpbmcgdG8gZGlmZmVyZW50
IG9iamVjdHMuCj4gPj4gPiArICAgICAgICAgKi8KPiA+PiA+ICsgICAgICAgIHN6ID0gKHVuc2ln
bmVkIGxvbmcpYnVnX2ZyYW1lc1tpXSAtICh1bnNpZ25lZCBsb25nKXM7Cj4gPj4gCj4gPj4gUGVy
aGFwcyBiZXR0ZXIgdG8gdXNlIFNZTUJPTCgpIGluIHRoZSBkZWZpbml0aW9uIG9mIGJ1Z19mcmFt
ZXNbXT8KPiA+IAo+ID4gVGhhdCB3YXMgbXkgaW5pdGlhbCB0aG91Z2h0LCBidXQgdGhlbiBidWdf
ZnJhbWVzIGNhbm5vdCBiZSBjb25zdCBhbmQKPiA+IGNhbm5vdCBiZSBzdGF0aWNhbGx5IGluaXRp
YWxpemVkLgo+IAo+IE9oLCBpbmRlZWQuIEJ1dCB0aGVyZSdzIG5vIHN0cm9uZyBuZWVkIGZvciB0
aGUgInN0YXRpYyIsIGl0IGp1c3QKPiBoZWxwcyBrZWVwaW5nIGNvZGUgc2l6ZSBzbWFsbC4gV2l0
aG91dCBpdCwgbm9uZSBvZiAuLi4KPiAKPiA+IFNvIHRoZSBjb2RlIHdvdWxkIGJlY29tZSBzb21l
dGhpbmcgbGlrZSB0aGlzOgo+ID4gCj4gPiB2b2lkIF9faW5pdCBzZXR1cF92aXJ0dWFsX3JlZ2lv
bnMoY29uc3Qgc3RydWN0IGV4Y2VwdGlvbl90YWJsZV9lbnRyeSAqc3RhcnQsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGV4Y2VwdGlvbl90YWJsZV9l
bnRyeSAqZW5kKQo+ID4gewo+ID4gICAgIHNpemVfdCBzejsKPiA+ICAgICB1bnNpZ25lZCBpbnQg
aSA9IDA7Cj4gPiAgICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgYnVnX2ZyYW1lc1s2XTsKPiA+ICAg
ICBidWdfZnJhbWVzW2krK10gPSBTWU1CT0woX19zdGFydF9idWdfZnJhbWVzKTsKPiA+ICAgICBi
dWdfZnJhbWVzW2krK10gPSBTWU1CT0woX19zdG9wX2J1Z19mcmFtZXNfMCksCj4gPiAgICAgYnVn
X2ZyYW1lc1tpKytdID0gU1lNQk9MKF9fc3RvcF9idWdfZnJhbWVzXzEpLAo+ID4gICAgIGJ1Z19m
cmFtZXNbaSsrXSA9IFNZTUJPTChfX3N0b3BfYnVnX2ZyYW1lc18yKSwKPiA+ICNpZmRlZiBDT05G
SUdfWDg2Cj4gPiAgICAgYnVnX2ZyYW1lc1tpKytdID0gU1lNQk9MKF9fc3RvcF9idWdfZnJhbWVz
XzMpLAo+ID4gI2VuZGlmCj4gPiAgICAgYnVnX2ZyYW1lc1tpKytdID0gMDsKPiAKPiAuLi4gdGhp
cyByZWFsbHkgbG9va3MgdG8gYmUgbmVjZXNzYXJ5LgoKWWVzLCB5b3UgYXJlIHJpZ2h0LCB0aGF0
IHdvcmtzLiBJJ2xsIGRvIHRoYXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
