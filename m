From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 34/34] RFC x86: introduce directio virt cap
Date: Tue, 21 Aug 2018 11:25:58 +0100
Message-ID: <20180821102558.htkmokaqznjni6xv@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <84f9dde9a5f6253653fc267fd8f874d21e4f4a58.1534518694.git-series.wei.liu2@citrix.com>
 <20180821083218.ibkdoyouclvfthh3@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs3rN-00088I-Ra
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:26:01 +0000
Content-Disposition: inline
In-Reply-To: <20180821083218.ibkdoyouclvfthh3@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTA6MzI6MThBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEF1ZyAxNywgMjAxOCBhdCAwNDoxMjo1MlBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gaHZtX2RpcmVjdGlvIGlzIHNldCB3aGVuIGlvbW11IGlzIGVuYWJsZWQs
IGJ1dCBpbiBmYWN0IGlvbW11IGlzIG5vdAo+ID4gdGllZCB0byBIVk0uIEluIG9yZGVyIHRvIG5v
dCBicmVhayBleGlzdGluZyB0b29scywgZXhwb3NlIGEgbmV3IGZsYWcKPiA+IGRpcmVjdGlvIGZv
ciAoaW9tbXVfZW5hYmxlZCAmJiAhaHZtX2VuYWJsZWQpLgo+ID4gCj4gPiBSRkMgVGhpcyBkb2Vz
bid0IGJ1aWxkIGF0IHRoZSBtb21lbnQuIERvIHdlIGNhcmUgYWJvdXQgdGhhdCBmbGFnIGJlaW5n
Cj4gPiBpbmFjY3VyYXRlPwo+IAo+IEkgdGhpbmsgdGhlcmUgaXMgbm8gaGFyZHdhcmUgb3V0IHRo
ZXJlIHdpdGggYW4gSU9NTVUgdGhhdCBkb24ndCBoYXZlCj4gdmlydHVhbGl6YXRpb24gZXh0ZW5z
aW9ucyAoaWU6IGhhdmluZyBWVGQgYnV0IG5vdCBWVHggZm9yIGV4YW1wbGUpLAo+IGJ1dCBtYXli
ZSBJJ20gd3JvbmcuCgpUaGUgcXVlc3Rpb24gaXMgd2hldGhlciBpdCBtYWtlcyBzZW5zZSB0byBl
eHBvc2UgdGhlIG5hbWUgImh2bV9kaXJlY3RpbyIKYXQgYWxsIHdoZW4geW91IGNhbid0IHJ1biBh
biBIVk0gZ3Vlc3QgaW4gdGhlIGZpcnN0IHBsYWNlLgoKQWxzbyBpb21tdSBpc24ndCBhbiBIVk0g
b25seSBmZWF0dXJlLCBQViBndWVzdHMgY2FuIGFsc28gbWFrZSB1c2Ugb2YgaXQKaWYgSSB1bmRl
cnN0YW5kIGNvcnJlY3RseSwgaGVuY2UgdGhlIHN1Z2dlc3Rpb24gb2YgImRpcmVjdGlvIi4KCldl
aS4KCj4gCj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
