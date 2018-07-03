From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 10/10] vpci/sriov: add support for SR-IOV
 capability
Date: Tue, 3 Jul 2018 12:51:34 +0200
Message-ID: <20180703105134.hcbnz7emljfwkcxq@mac.bytemobile.com>
References: <20180620144234.51783-1-roger.pau@citrix.com>
 <20180620144234.51783-11-roger.pau@citrix.com>
 <20180703092759.etip2qie5gsibruy@citrix.com>
 <20180703102108.36bkr3glktzmc4pp@mac.bytemobile.com>
 <5B3B547302000078001D030D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iwop=jt=citrix.com=prvs=715f702c9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1faIuN-0008B7-U1
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 10:51:43 +0000
Content-Disposition: inline
In-Reply-To: <5B3B547302000078001D030D@prv1-mh.provo.novell.com>
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

T24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDQ6NDg6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAzLjA3LjE4IGF0IDEyOjIxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMTA6Mjc6NTlBTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+PiBPbiBXZWQsIEp1biAyMCwgMjAxOCBhdCAwNDo0MjozNFBNICswMjAwLCBS
b2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4gPiArICAgICAgICAgICAgc3Jpb3YtPm51bV92ZnMg
PSBwY2lfY29uZl9yZWFkMTYocGRldi0+c2VnLCBwZGV2LT5idXMsCj4gPj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NMT1QocGRldi0+ZGV2Zm4p
LAo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBD
SV9GVU5DKHBkZXYtPmRldmZuKSwKPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwb3MgKyBQQ0lfU1JJT1ZfTlVNX1ZGKTsKPiA+PiA+ICsKPiA+PiA+
ICsgICAgICAgICAgICAvKgo+ID4+ID4gKyAgICAgICAgICAgICAqIE5COiBWRkUgbmVlZHMgdG8g
YmUgZW5hYmxlZCBiZWZvcmUgY2FsbGluZyBwY2lfYWRkX2RldmljZSBzbyBYZW4KPiA+PiA+ICsg
ICAgICAgICAgICAgKiBjYW4gYWNjZXNzIHRoZSBjb25maWcgc3BhY2Ugb2YgVkZzLgo+ID4+ID4g
KyAgICAgICAgICAgICAqLwo+ID4+ID4gKyAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRl
di0+c2VnLCBwZGV2LT5idXMsIFBDSV9TTE9UKHBkZXYtPmRldmZuKSwKPiA+PiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgcmVnLAo+ID4+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udHJvbCB8IFBDSV9TUklPVl9DVFJMX1ZG
RSk7Cj4gPj4gPiArCj4gPj4gPiArICAgICAgICAgICAgLyoKPiA+PiA+ICsgICAgICAgICAgICAg
KiBUaGUgc3BlYyBzdGF0ZXMgdGhhdCB0aGUgc29mdHdhcmUgbXVzdCB3YWl0IGF0IGxlYXN0IDEw
MG1zCj4gPj4gPiArICAgICAgICAgICAgICogYmVmb3JlIGF0dGVtcHRpbmcgdG8gYWNjZXNzIFZG
IHJlZ2lzdGVycyB3aGVuIGVuYWJsaW5nIHZpcnR1YWwKPiA+PiA+ICsgICAgICAgICAgICAgKiBm
dW5jdGlvbnMgb24gdGhlIFBGLgo+ID4+ID4gKyAgICAgICAgICAgICAqLwo+ID4+ID4gKyAgICAg
ICAgICAgIG1kZWxheSgxMDApOwo+ID4+IAo+ID4+IElNSE8gZGVsYXlpbmcgMTAwbXMgbGlrZSB0
aGlzIGluIGFuIGFjdGl2ZSBzeXN0ZW0gaXMgZmFyIHRvbyBsb25nLiBJdAo+ID4+IHdvdWxkIGJl
IGJldHRlciB0byBwdXQgdGhpcyBpbnRvIGEgbG9vcCBhbmQgcHJvY2VzcyBzb2Z0aXJxcyBpbiBi
ZXR3ZWVuCj4gPj4gZGVsYXlzLgo+ID4gCj4gPiBBY2ssIGRvIHlvdSB0aGluayAxMG1zIGRlbGF5
cyB3b3VsZCBiZSBPSz8KPiAKPiBJIGhhdmVuJ3QgY2hlY2tlZCB5ZXQgd2hlcmUgd2UgYXJlIGhl
cmUgLSBnZW5lcmFsbHkgc3VjaCBkZWxheXMgd291bGQKPiBiZXR0ZXIgYmUgaW1wbGVtZW50ZWQg
YnkgcGF1c2luZyB0aGUgY2FsbGVyIGFuZCByZXN1bWluZyBpdCBvbmNlIHRoZQo+IG5lY2Vzc2Fy
eSB0aW1lIGhhcyBwYXNzZWQuIFdoaWxlIGluIERvbTAgY29udGV4dCBpdCBtaWdodCBiZSBhY2Nl
cHRhYmxlCj4gdG8gZG8gd2hhdCBXZWkgYW5kIHlvdSBzdWdnZXN0LCB0aGF0J2xsIGJlIHlldCBv
bmUgbW9yZSB0aGluZyB0byBkZWFsCj4gd2l0aCBvbmNlIHdlIHdhbnQgdG8gcmUtdXNlIHRoZSBj
b2RlIGZvciBEb21VLXMuCgpJIGRvbid0IHRoaW5rIHdlIGV2ZXIgd2FudCB0byBhbGxvdyBEb21V
LXMgdG8gbWFuYWdlIHRoZSBTUi1JT1YKY2FwYWJpbGl0eSwgc28gdGhpcyBjb2RlIGlzIGFsd2F5
cyBnb2luZyB0byBiZSBEb20wIG9ubHkgQUZBSUNULiBJbgpmYWN0IEkgdGhpbmsgSSdtIGdvaW5n
IHRvIGFkZCBhbiBhc3NlcnQgdG8gdGhhdCBlZmZlY3QgaW4gdGhlIFNSLUlPVgppbml0IGhhbmRs
ZXIuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
