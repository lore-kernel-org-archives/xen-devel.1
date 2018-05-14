From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 5/5] docs/pvh: document initial MTRR state
Date: Mon, 14 May 2018 17:18:52 +0100
Message-ID: <20180514161852.mvwylcax5tb7ywsj@citrix.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-6-roger.pau@citrix.com>
 <20180514160352.3niqmzctpntjhoeg@citrix.com>
 <5AF9B5BB02000078001C299B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpky=ib=citrix.com=prvs=66564b2c0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fIGBb-0006Kp-V1
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:18:55 +0000
Content-Disposition: inline
In-Reply-To: <5AF9B5BB02000078001C299B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMTA6MTM6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA1LjE4IGF0IDE4OjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUaHUsIE1heSAxMCwgMjAxOCBhdCAwNjoxNTowNVBNICswMTAwLCBSb2dlciBQ
YXUgTW9ubmUgd3JvdGU6Cj4gPj4gLS0tIGEvZG9jcy9taXNjL3B2aC5tYXJrZG93bgo+ID4+ICsr
KyBiL2RvY3MvbWlzYy9wdmgubWFya2Rvd24KPiA+PiBAQCAtOTIsMyArOTIsMTggQEAgZXZlbnQg
Y2hhbm5lbHMuIERlbGl2ZXJ5IG9mIHRob3NlIGludGVycnVwdHMgY2FuIGJlIGNvbmZpZ3VyZWQg
aW4gdGhlIHNhbWUgd2F5Cj4gPj4gIGFzIEhWTSBndWVzdHMsIGNoZWNrIHhlbi9pbmNsdWRlL3B1
YmxpYy9odm0vcGFyYW1zLmggYW5kCj4gPj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtXF9v
cC5oIGZvciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IGF2YWlsYWJsZSBkZWxpdmVyeQo+ID4+ICBt
ZXRob2RzLgo+ID4+ICsKPiA+PiArIyMgTVRSUiAjIwo+ID4+ICsKPiA+PiArIyMjIFVucHJpdmls
ZWdlZCBndWVzdHMgIyMjCj4gPj4gKwo+ID4+ICtQVkggZ3Vlc3RzIGFyZSBib290ZWQgd2l0aCB0
aGUgZGVmYXVsdCBNVFJSIHR5cGUgc2V0IHRvIHdyaXRlLWJhY2sgYW5kIE1UUlIKPiA+PiArZW5h
YmxlZC4gVGhpcyBhbGxvd3MgRG9tVXMgdG8gc3RhcnQgd2l0aCBhIHNhbmUgTVRSUiBzdGF0ZS4g
Tm90ZSB0aGF0IHRoaXMgd2lsbAo+ID4+ICtoYXZlIHRvIGJlIHJldmlzaXRlZCB3aGVuIHBjaS1w
YXNzdGhyb3VnaCBpcyBhZGRlZCB0byBQVkggaW4gb3JkZXIgdG8gc2V0IE1NSU8KPiA+PiArcmVn
aW9ucyBhcyBVQy4KPiA+IAo+ID4gTXkgcmVhZGluZyBpcyAicmV2aXNpdGVkIiBpbXBsaWVzIHRo
ZSBkZWZhdWx0IHR5cGUgd2lsbCBjaGFuZ2UuIEluIGZhY3QKPiA+IGl0IHNob3VsZG4ndC4gV2Ug
c2hvdWxkIGNsYXJpZnk6IGZvciByYW0gaXQgd2lsbCByZW1haW4gV0IsIGZvciBNTUlPCj4gPiBo
b2xlcyBpdCB3aWxsIGJlIFVDLgo+IAo+IFdoeSB3b3VsZCBjaGFuZ2luZyB0aGUgZGVmYXVsdCBs
YXRlIGJlIGEgcHJvYmxlbT8gQSBmaXJtd2FyZSB1cGRhdGUgb24KPiBiYXJlIGhhcmR3YXJlIG1p
Z2h0IGFsc28gaGF2ZSBzdWNoIGFuIGVmZmVjdC4gVGhlIGRlZmF1bHQgdHlwZSByZWFkIGZyb20K
PiB0aGUgTVNSIG11c3Qgbm90IGNoYW5nZSBhY3Jvc3MgdGhlIGxpZmV0aW1lIG9mIGEgVk0sIGJ1
dCBpbW8gbWF5IGNoYW5nZQo+IGFjcm9zcyByZWJvb3RzIG9mIGl0Lgo+IAoKVGhlbiBzZXR0aW5n
IGEgZGVmYXVsdCBoZXJlIGRvZXNuJ3QgcmVhbGx5IGhlbHAgT1MgZGV2ZWxvcGVycyBiZWNhdXNl
CnRoZXkgd2lsbCBhbHdheXMgbmVlZCB0byB3cml0ZSBjb2RlIHRvIHNldCB0aGUgY29ycmVjdCB0
eXBlIC0tIG5vdCB0aGF0CnRoaXMgaXMgYSBiaWcgaXNzdWUsIGJ1dCBhcyBJIHVuZGVyc3RhbmQg
aXQgdGhlIHBvaW50IGhlcmUgaXMgdG8gYXZvaWQKdGhhdC4KCldlaS4KCj4gSmFuCj4gCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
