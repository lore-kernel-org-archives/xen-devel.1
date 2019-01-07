From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/dom0: add verbose mode and print
 memory allocation stats
Date: Mon, 7 Jan 2019 16:35:56 +0100
Message-ID: <20190107153556.jeeir4dbsdiruwnv@mac>
References: <20181228111857.49444-1-roger.pau@citrix.com>
 <20181228111857.49444-3-roger.pau@citrix.com>
 <5C332392020000780020ABC9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D5so=PP=citrix.com=prvs=9034de270=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ggWwm-0007eA-2T
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 15:36:12 +0000
Content-Disposition: inline
In-Reply-To: <5C332392020000780020ABC9@prv1-mh.provo.novell.com>
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

T24gTW9uLCBKYW4gMDcsIDIwMTkgYXQgMDM6MDE6NTRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjEyLjE4IGF0IDEyOjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gPiBAQCAtNjAsNiArNjAsMTggQEAgc3RhdGlj
IHN0cnVjdCBhY3BpX21hZHRfaW50ZXJydXB0X292ZXJyaWRlIF9faW5pdGRhdGEgKmludHNyY292
cjsKPiA+ICBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgYWNwaV9ubWlfc291cmNlczsK
PiA+ICBzdGF0aWMgc3RydWN0IGFjcGlfbWFkdF9ubWlfc291cmNlIF9faW5pdGRhdGEgKm5taXNy
YzsKPiA+ICAKPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgb3JkZXJfc3RhdHNb
TUFYX09SREVSICsgMV0gPSB7IH07Cj4gCj4gUG9pbnRsZXNzIGluaXRpYWxpemVyLgo+IAo+ID4g
K3N0YXRpYyB2b2lkIF9faW5pdCBwcmludF9vcmRlcl9zdGF0cyh2b2lkKQo+ID4gK3sKPiA+ICsg
ICAgdW5zaWduZWQgaW50IGk7Cj4gPiArCj4gPiArICAgIHByaW50aygiTWVtb3J5IGFsbG9jYXRp
b24gc3RhdHM6XG4iKTsKPiAKPiBJIHRoaW5rIHRoaXMgd2FudHMgcHJlZml4aW5nIHdpdGggIkRv
bTAiLgoKSSB3aWxsIHVzZSBEb20ldSBhbmQgZC0+ZG9tYWluX2lkLgoKPiA+ICsgICAgZm9yICgg
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKG9yZGVyX3N0YXRzKTsgaSsrICkKPiA+ICsgICAgICAgIGlm
ICggb3JkZXJfc3RhdHNbaV0gKQo+ID4gKyAgICAgICAgICAgIHByaW50aygib3JkZXI6ICUydSBh
bGxvY2F0aW9uczogJXVcbiIsIGksIG9yZGVyX3N0YXRzW2ldKTsKPiAKPiBXaHkgdGhlIGZpcnN0
IG9mIHRoZSB0d28gY29sb25zPwoKQmVjYXVzZSBpdCdzIHByaW50aW5nIHRoZSBvcmRlciwgSSB3
aWxsIHJlbW92ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
