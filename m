From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 4/7] pvh/dom0: warn when
 dom0_mem is not set
Date: Thu, 14 Feb 2019 01:09:25 -0700
Message-ID: <5C65223502000078002168FD@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-5-roger.pau@citrix.com>
 <5C643F430200007800216632@prv1-mh.provo.novell.com>
 <20190213171351.ts3m54hup2536xgq@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guCU5-0003ja-46
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 08:35:05 +0000
In-Reply-To: <20190213171351.ts3m54hup2536xgq@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE5IGF0IDE4OjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDEzLCAyMDE5IGF0IDA5OjAxOjA3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTEuMDIuMTkgYXQgMTg6NDYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gVGhlcmUgaGF2ZSBiZWVuIHNldmVyYWwgcmVwb3J0cyBvZiB0aGUgZG9tMCBi
dWlsZGVyIHJ1bm5pbmcgb3V0IG9mCj4+ID4gbWVtb3J5IHdoZW4gYnVpbGRpbmcgYSBQVkggZG9t
MCB3aXRob3V0IGhhdmluZyBzcGVjaWZpZWQgYSBkb20wX21lbQo+PiA+IHZhbHVlLiBQcmludCBh
IHdhcm5pbmcgbWVzc2FnZSBpZiBkb20wX21lbSBpcyBub3Qgc2V0IHdoZW4gYm9vdGluZyBpbgo+
PiA+IFBWSCBtb2RlLgo+PiA+IAo+PiA+IFRoaXMgaXMgYSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCB1
bnRpbCBhY2NvdW50aW5nIGZvciBpbnRlcm5hbCBtZW1vcnkKPj4gPiByZXF1aXJlZCBieSBYZW4g
KGllOiBwYWdpbmcgc3RydWN0dXJlcykgaXMgaW1wcm92ZWQuCj4+ID4gCj4+ID4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IAo+PiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAKPj4gSSB0YWtlIGl0IHRo
YXQgLi4uCj4+IAo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKPj4gPiArKysg
Yi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4+ID4gQEAgLTM3OCw4ICszNzgsMTggQEAgdW5z
aWduZWQgbG9uZyBfX2luaXQgZG9tMF9jb21wdXRlX25yX3BhZ2VzKAo+PiA+ICAgICAgICAgICAq
IG1heGltdW0gb2YgMTI4TUIuCj4+ID4gICAgICAgICAgICovCj4+ID4gICAgICAgICAgaWYgKCAh
bnJfcGFnZXMgKQo+PiA+ICsgICAgICAgIHsKPj4gPiAgICAgICAgICAgICAgbnJfcGFnZXMgPSBh
dmFpbCAtIChwdl9zaGltID8gcHZfc2hpbV9tZW0oYXZhaWwpCj4+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDogbWluKGF2YWlsIC8gMTYsIDEyOFVMIDw8ICgyMCAtIFBBR0Vf
U0hJRlQpKSk7Cj4+ID4gKyAgICAgICAgICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCj4+ID4g
KyAgICAgICAgICAgICAgICAvKgo+PiA+ICsgICAgICAgICAgICAgICAgICogVGVtcG9yYXJ5IHdv
cmthcm91bmQgbWVzc2FnZSB1bnRpbCBpbnRlcm5hbCAocGFnaW5nKSBtZW1vcnkKPj4gPiArICAg
ICAgICAgICAgICAgICAqIGFjY291bnRpbmcgcmVxdWlyZWQgdG8gYnVpbGQgYSBwdmggZG9tMCBp
cyBpbXByb3ZlZC4KPj4gPiArICAgICAgICAgICAgICAgICAqLwo+PiA+ICsgICAgICAgICAgICAg
ICAgcHJpbnRrKCJXQVJOSU5HOiBQVkggZG9tMCB3aXRob3V0IGRvbTBfbWVtIHNldCBpcyBzdGls
bCB1bnN0YWJsZS4gIgo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICJJZiB5b3UgZ2V0IGNy
YXNoZXMgZHVyaW5nIGJvb3QsIHRyeSBhZGRpbmcgYSBkb20wX21lbSBwYXJhbWV0ZXJcbiIpOwo+
PiA+ICsgICAgICAgIH0KPj4gCj4+IC4uLiB5b3UgY29uc2lkZXIgaXQgYWNjZXB0YWJsZSBmb3Ig
dGhlIG1lc3NhZ2UgdG8gYmUgbG9nZ2VkIHR3aWNlCj4+IGluIGNlcnRhaW4gY2FzZXM/Cj4gCj4g
UmlnaHQsIG5yX3BhZ2VzIGNvdWxkIGJlIHNldCB0byAwIGFnYWluIGlmIHRoZXJlIGFyZSAyIGl0
ZXJhdGlvbnMgb2YKPiB0aGUgcGFyZW50IGZvciBsb29wLCBpbiB3aGljaCBjYXNlIHVzaW5nIGEg
Ym9vbGVhbiB3b3VsZCBiZSBiZXR0ZXIuIEkKPiBjYW4gZml4IHRoaXMgaW4gdGhlIG5leHQgdmVy
c2lvbi4KCkFzICJhIGJvb2xlYW4iIEkgdGhpbmsgeW91IGNhbiB1c2UgdGhlIGFscmVhZHkgcHJl
c2VudCBuZWVkX3BhZ2luZwpvbmUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
