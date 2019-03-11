From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Mon, 11 Mar 2019 10:17:24 -0600
Message-ID: <5C868A14020000780021D591@prv1-mh.provo.novell.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-2-paul.durrant@citrix.com>
 <5C829ACB020000780021CC33@prv1-mh.provo.novell.com>
 <45d8874e930b4384b70a3db1d73970a7@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3NcL-0006i0-2N
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:17:33 +0000
In-Reply-To: <45d8874e930b4384b70a3db1d73970a7@AMSPEX02CL02.citrite.net>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDE3OjEwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwOCBNYXJjaCAyMDE5IDE2OjQwCj4+IAo+PiA+Pj4gT24gMDcuMDEuMTkgYXQgMTM6MDIsIDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gQEAgLTM0NzIsMTIgKzM0OTQsNiBA
QCBpbnQgaHZtX21zcl9yZWFkX2ludGVyY2VwdCh1bnNpZ25lZCBpbnQgbXNyLCB1aW50NjRfdCAq
bXNyX2NvbnRlbnQpCj4+ID4gICAgICAgICAgKm1zcl9jb250ZW50ID0gdi0+YXJjaC5odm0ubXNy
X3hzczsKPj4gPiAgICAgICAgICBicmVhazsKPj4gPgo+PiA+IC0gICAgY2FzZSBNU1JfSUEzMl9C
TkRDRkdTOgo+PiA+IC0gICAgICAgIGlmICggIWQtPmFyY2guY3B1aWQtPmZlYXQubXB4IHx8Cj4+
ID4gLSAgICAgICAgICAgICAhaHZtX2dldF9ndWVzdF9ibmRjZmdzKHYsIG1zcl9jb250ZW50KSAp
Cj4+ID4gLSAgICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7Cj4+ID4gLSAgICAgICAgYnJlYWs7Cj4+
IAo+PiBOb3RlIGhvdyB0aGlzIGFscmVhZHkgY2hlY2tzIHRoZSBDUFVJRCBwb2xpY3ksIHNvbWV3
aGF0IGNvbnRyYXJ5IHRvCj4+IHdoYXQgeW91IHNheSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEkg
dGhpbmsgdGhpcyB3YW50cyB0byByZW1haW4gdGhpcwo+PiB3YXkgaW4gZ3Vlc3Rfe3JkLHdyfW1z
cigpIC0gc2VlIGFsbCB0aGUgb3RoZXIgQ1BVSUQgcG9saWN5IGNoZWNrcyB0aGVyZS4KPj4gVGhh
dCB3YXkgaHZtX2dldF9ndWVzdF9ibmRjZmdzKCkgY2FuIGJlIG1hZGUgY29uc2lzdGVudCB3aXRo
IHRoZQo+PiBob29rIHBvaW50ZXIgdHlwZSBhZ2FpbiwgYW5kIGl0IGNhbiByZW1haW4gYW4gaW5s
aW5lIGZ1bmN0aW9uIGFzIGJlZm9yZS4KPiAKPiBJIHRob3VnaHQgaXQgd2FzIG5lYXRlciB0byBw
dXQgdGhlIGNoZWNrIGluc2lkZSB0aGUgaGVscGVyIGJ1dCBJIGNhbiBwdWxsIGl0IAo+IG91dCBp
bnRvIHRoZSBzd2l0Y2ggc3RhdGVtZW50IGlmIHRoYXQncyBwcmVmZXJyZWQuCgpVbmxlc3MgQW5k
cmV3IGV4cGxpY2l0bHkgdGVsbHMgeW91IG90aGVyd2lzZSwgcGxlYXNlIGRvIGZvciB0aGUgc2Fr
ZSBvZgpjb25zaXN0ZW5jeSB3aXRoIG90aGVyIGNvZGUgaW4gdGhhdCBzd2l0Y2goKS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
