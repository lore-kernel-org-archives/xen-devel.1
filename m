From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 17/23] x86/mm: put
 paging_update_nestedmode under CONFIG_HVM
Date: Mon, 3 Sep 2018 15:27:01 +0100
Message-ID: <20180903142701.77qmhjoiep6film7@zion.uk.xensource.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
 <5B8528ED02000078001E2870@prv1-mh.provo.novell.com>
 <20180830074226.qfcxcwllii4cyanz@citrix.com>
 <5B87AC5902000078001E36A7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=42l1=lr=citrix.com=prvs=7777b264b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fwpon-0005bn-Rf
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 14:27:05 +0000
Content-Disposition: inline
In-Reply-To: <5B87AC5902000078001E36A7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgMDI6MzU6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjA4LjE4IGF0IDA5OjQyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIEF1ZyAyOCwgMjAxOCBhdCAwNDo1MDoyMUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjYuMDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwo+ID4+
ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCj4gPj4gPiBAQCAtOTE5LDYgKzkxOSw3
IEBAIGNvbnN0IHN0cnVjdCBwYWdpbmdfbW9kZSAqcGFnaW5nX2dldF9tb2RlKHN0cnVjdCB2Y3B1
IAo+ID4gKnYpCj4gPj4gPiAgICAgIHJldHVybiBwYWdpbmdfZ2V0X25lc3RlZG1vZGUodik7Cj4g
Pj4gPiAgfQo+ID4+ID4gIAo+ID4+ID4gKyNpZmRlZiBDT05GSUdfSFZNCj4gPj4gPiAgdm9pZCBw
YWdpbmdfdXBkYXRlX25lc3RlZG1vZGUoc3RydWN0IHZjcHUgKnYpCj4gPj4gPiAgewo+ID4+ID4g
ICAgICBBU1NFUlQobmVzdGVkaHZtX2VuYWJsZWQodi0+ZG9tYWluKSk7Cj4gPj4gPiBAQCAtOTMw
LDYgKzkzMSw3IEBAIHZvaWQgcGFnaW5nX3VwZGF0ZV9uZXN0ZWRtb2RlKHN0cnVjdCB2Y3B1ICp2
KQo+ID4+ID4gICAgICAgICAgdi0+YXJjaC5wYWdpbmcubmVzdGVkbW9kZSA9IE5VTEw7Cj4gPj4g
PiAgICAgIGh2bV9hc2lkX2ZsdXNoX3ZjcHUodik7Cj4gPj4gPiAgfQo+ID4+ID4gKyNlbmRpZgo+
ID4+IAo+ID4+IEp1c3QgYSBjb25zaWRlcmF0aW9uIChubyBvYmplY3Rpb24pOiBXb3VsZCBpdCBi
ZSB3b3J0aHdoaWxlIHRvCj4gPj4gaW50cm9kdWNlIENPTkZJR19ORVNURURfSFZNIGF0IHRoZSBz
YW1lIHRpbWUgKGZvciBub3cgaGFyZAo+ID4+IGNvZGVkIHRvIFksIGFuZCBvZiBjb3Vyc2UgZGVw
ZW5kaW5nIG9uIEhWTSkgdG8gYXZvaWQgaGF2aW5nIHRvCj4gPj4gdG91Y2ggYWxsIHN1Y2ggcGxh
Y2VzIGEgc2Vjb25kIHRpbWUgbGF0ZXIgb24/Cj4gPiAKPiA+IElmIHdlIHBsYW4gdG8gbWFrZSBu
ZXN0ZWQgaHZtIGNvbmZpZ3VyYWJsZSBpbiB0aGUgZnV0dXJlLCB0aGF0IHdvdWxkIGJlCj4gPiBh
IHdvcnRod2hpbGUgdGhpbmcgdG8gZG87IG90aGVyd2lzZSBpdCBpcyBqdXN0IGFub3RoZXIgY29u
Y2VwdCB0aGF0Cj4gPiB1c2VycyBuZWVkIHRvIGNhcmUgYWJvdXQsIHdoaWNoIGNyZWF0ZXMgc29t
ZSBtZW50YWwgYnVyZGVuLgo+IAo+IEFuZHJldywgZG8geW91IGhhdmUgYW55IG9waW5pb24gLyBw
cmVmZXJlbmNlIGVpdGhlciB3YXk/CgpJIGRpc2N1c3NlZCB0aGlzIHdpdGggQW5kcmV3IG9uIElS
QyBhbmQgY2FtZSB0byB0aGUgY29uY2x1c2lvbiBpdCBpcyBub3QKd29ydGggaXQgdG8gaW50cm9k
dWNlIENPTkZJR19ORVNURURfSFZNLCBiZWNhdXNlOgoKMS4gTmVzdGVkIHZpcnQgd2lsbCBiZWNv
bWUgY29tbW9ucGxhY2UgZm9yIFhlbi4KMi4gVHJ5aW5nIHRvIHNwbGl0IG5lc3RlZCBwYXJ0cyBm
cm9tIG5vbi1uZXN0ZWQgcGFydHMgd2lsbCBiZSBtYXNzaXZlbHkKICAgY29tcGxpY2F0ZWQuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
