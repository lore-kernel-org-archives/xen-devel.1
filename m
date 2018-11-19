From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/5] vpci: fix updating the command
 register
Date: Mon, 19 Nov 2018 12:09:49 +0100
Message-ID: <20181119110949.73qnubvdtle55jzr@mac>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-2-roger.pau@citrix.com>
 <5BEEB15D02000078001FCB9A@prv1-mh.provo.novell.com>
 <20181116143245.vpk3vgpbcqujvofb@mac>
 <5BF273A302000078001FD2BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un1M=N6=citrix.com=prvs=854777591=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gOhb7-0000Ol-4S
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 11:20:09 +0000
Content-Disposition: inline
In-Reply-To: <5BF273A302000078001FD2BD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDE6MjY6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjExLjE4IGF0IDE1OjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMDU6MDA6MjlBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gQEAgLTQxMyw3ICs0MTIsNyBAQCBzdGF0aWMgdm9pZCBy
b21fd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsCj4g
Pj4gPiAgICAgICAgICBoZWFkZXItPnJvbV9lbmFibGVkID0gbmV3X2VuYWJsZWQ7Cj4gPj4gPiAg
ICAgICAgICBwY2lfY29uZl93cml0ZTMyKHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90LCBmdW5j
LCByZWcsIHZhbCk7Cj4gPj4gPiAgICAgIH0KPiA+PiA+IC0gICAgZWxzZSBpZiAoIG1vZGlmeV9i
YXJzKHBkZXYsIG5ld19lbmFibGVkLCB0cnVlKSApCj4gPj4gPiArICAgIGVsc2UgaWYgKCBtb2Rp
ZnlfYmFycyhwZGV2LCBuZXdfZW5hYmxlZCA/IFBDSV9DT01NQU5EX01FTU9SWSA6IDAsIHRydWUp
ICkKPiA+PiAKPiA+PiBEbyB5b3UgcmVhbGx5IG1lYW4gdG8gY2xlYXIgYWxsIG90aGVyIGRlZmlu
ZWQgYml0cyBvZiB0aGUgY29tbWFuZAo+ID4+IHJlZ2lzdGVyIGhlcmU/Cj4gPiAKPiA+IFRoaXMg
aXMgYSBST00gQkFSIHdyaXRlLCBub3QgYSBjb21tYW5kIHJlZ2lzdGVyIHdyaXRlLiByb21fd3Jp
dGUKPiA+IHBhc3NlcyBQQ0lfQ09NTUFORF9NRU1PUlkgbWVyZWx5IHRvIHNpZ25hbCB0aGlzIGlz
IGEgbWFwcGluZwo+ID4gb3BlcmF0aW9uLCBidXQgdGhlIHZhbHVlIHdvdWxkIG5ldmVyIGJlIHdy
aXR0ZW4gdG8gdGhlIGNvbW1hbmQKPiA+IHJlZ2lzdGVyLCB0aGVyZSdzIGFuIEFTU0VSVCghcm9t
X29ubHkpIGp1c3QgYmVmb3JlIHRoZSBkZWZlcnJlZCB3cml0ZQo+ID4gb2YgdGhlIGNvbW1hbmQg
cmVnaXN0ZXIgaW4gbW9kaWZ5X2RlY29kaW5nLgo+IAo+IE9oLCBJIHNlZS4gVGhpcyBpcyBnZXR0
aW5nIG1vcmUgc3VidGxlIHRoYW4gaXQgYWxyZWFkeSB3YXMsIHNvIHBlcmhhcHMKPiB3b3J0aCBh
dHRhY2hpbmcgYSBicmllZiBjb21tZW50IGhlcmUsIHRoZSBtb3JlIHRoYXQgaWYgYW55dGhpbmcg
d2FzCj4gd3Jvbmcgd2l0aCB0aGUgbG9naWMgYmFkIGJlaGF2aW9yIHdvdWxkIHJlc3VsdCBpbiBy
ZWxlYXNlIGJ1aWxkcz8KCkl0IHdvdWxkLCBJIGNvdWxkIGNoYW5nZSB0aGUgQVNTRVJUIHRvIGEg
QlVHIGluIG1vZGlmeV9kZWNvZGluZyBpZgp0aGF0IHNlZW1zIG1vcmUgZm9vbHByb29mLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
