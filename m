From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12] vpci: reduce verboseness of BAR
 write warnings
Date: Mon, 18 Feb 2019 17:53:06 +0100
Message-ID: <20190218165306.gtbv4tbpkfotthkw@Air-de-Roger>
References: <20190218162428.19056-1-roger.pau@citrix.com>
 <5C6AE1130200007800217C10@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VanW=QZ=citrix.com=prvs=945e29c39=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gvmAN-0007JF-T9
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 16:53:15 +0000
Content-Disposition: inline
In-Reply-To: <5C6AE1130200007800217C10@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMDk6NDU6MDdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjAyLjE5IGF0IDE3OjI0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQXZvaWQgcHJpbnRpbmcgYSB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiB3cml0aW5nIHRv
IGEgQkFSIHJlZ2lzdGVyIHdpdGgKPiA+IG1lbW9yeSBkZWNvZGluZyBlbmFibGVkIGlmIHRoZSB2
YWx1ZSB3cml0dGVuIGlzIHRoZSBzYW1lIGFzIHRoZQo+ID4gY3VycmVudCBvbmUuCj4gPiAKPiA+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggb25lIGNvc21ldGljIHF1ZXN0aW9uOgo+IAo+
ID4gQEAgLTM4MSw2ICszNzEsMTkgQEAgc3RhdGljIHZvaWQgYmFyX3dyaXRlKGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLAo+ID4gICAgICBlbHNlCj4gPiAgICAg
ICAgICB2YWwgJj0gUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSzsKPiA+ICAKPiA+ICsgICAgaWYg
KCBwY2lfY29uZl9yZWFkMTYocGRldi0+c2VnLCBwZGV2LT5idXMsIHNsb3QsIGZ1bmMsIFBDSV9D
T01NQU5EKSAmCj4gPiArICAgICAgICAgUENJX0NPTU1BTkRfTUVNT1JZICkKPiA+ICsgICAgewo+
ID4gKyAgICAgICAgLyogSWYgdGhlIHZhbHVlIHdyaXR0ZW4gaXMgdGhlIGN1cnJlbnQgb25lIGF2
b2lkIHByaW50aW5nIGEgd2FybmluZy4gKi8KPiA+ICsgICAgICAgIGlmICggdmFsICE9ICh1aW50
MzJfdCkoYmFyLT5hZGRyID4+IChoaSA/IDMyIDogMCkpICkKPiA+ICsgICAgICAgICAgICBncHJp
bnRrKFhFTkxPR19XQVJOSU5HLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIiUwNHg6JTAyeDol
MDJ4LiV1OiBpZ25vcmVkIEJBUiAlbHUgd3JpdGUgd2l0aCBtZW1vcnkgZGVjb2RpbmcgZW5hYmxl
ZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgIHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90
LCBmdW5jLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgYmFyIC0gcGRldi0+dnBjaS0+aGVhZGVy
LmJhcnMgKyAoaGkgPyAxIDogMCkpOwo+IAo+IFdoeSB0aGUgY29uZGl0aW9uYWwgb3BlcmF0b3I/
IGJvb2wgY29udmVydHMgZmluZSB0byBhbiBpbnRlZ2VyCj4gdmFsdWUgb2YgMCBvciAxLgoKSG0s
IEkgYWx3YXlzIGZvcmdldCBhYm91dCB0aGlzLiBXb3VsZCB5b3UgYmUgd2lsbGluZyB0byBmaXgg
dGhpcyBhdApjb21taXQgaWYgSnVlcmdlbiBnaXZlcyBpdCBoaXMgUkFCPwoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
