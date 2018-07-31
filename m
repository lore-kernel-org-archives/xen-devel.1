From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/4] x86/iommu: reorder conditions used in
 the inclusive iommu mappings
Date: Tue, 31 Jul 2018 10:26:12 +0200
Message-ID: <20180731082612.4k7wlbys7cyxi7z4@mac.bytemobile.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-4-roger.pau@citrix.com>
 <3054fb6d40b94040804ee44d7dbc77dc@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjk/=kp=citrix.com=prvs=743ddc6a1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fkPzO-0002vQ-AV
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 08:26:42 +0000
Content-Disposition: inline
In-Reply-To: <3054fb6d40b94040804ee44d7dbc77dc@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDg6Mjk6MjBBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCBb
bWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYK
PiA+IEBAIC0xNzksNiArMTY5LDEzIEBAIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfaHdk
b21faW5pdChzdHJ1Y3QKPiA+IGRvbWFpbiAqZCkKPiA+ICAgICAgICAgICAqLwo+ID4gICAgICAg
ICAgaWYgKCBpb21tdV9kb20wX3N0cmljdCAmJgo+ID4gICAgICAgICAgICAgICBwYWdlX2lzX3Jh
bV90eXBlKHBmbiwgUkFNX1RZUEVfQ09OVkVOVElPTkFMKSApCj4gPiArICAgICAgICAgICAgbWFw
ID0gZmFsc2U7Cj4gPiArICAgICAgICBlbHNlIGlmICggaW9tbXVfaW5jbHVzaXZlICYmIHBmbiA8
PSBtYXhfcGZuICkKPiA+ICsgICAgICAgICAgICBtYXAgPSAhcGFnZV9pc19yYW1fdHlwZShwZm4s
IFJBTV9UWVBFX1VOVVNBQkxFKTsKPiA+ICsgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICBt
YXAgPSBwYWdlX2lzX3JhbV90eXBlKHBmbiwgUkFNX1RZUEVfQ09OVkVOVElPTkFMKTsKPiA+ICsK
PiAKPiBNYXliZSBiZXR0ZXIgYXMuLi4KPiAKPiBJZiAoIHBhZ2VfaXNfcmFtX3R5cGUocGZuLCBS
QU1fVFlQRV9DT05WRU5USU9OQUwpICkKPiAgIG1hcCA9ICFpb21tdV9kb20wX3N0cmljdDsKPiBl
bHNlIGlmICggIXBhZ2VfaXNfcmFtX3R5cGUocGZuLCBSQU1fVFlQRV9VTlVTQUJMRSkgKQo+ICAg
bWFwID0gKGlvbW11X2luY2x1c2l2ZSAmJiBwZm4gPD0gbWF4X3Bmbik7Cj4gZWxzZQo+ICAgbWFw
ID0gZmFsc2U7IAo+IAo+IChJIHRoaW5rIHRoYXQgbG9naWMgaXMgY29ycmVjdCkuCgpZZXMgSSB0
aGluayBpdCdzIGNvcnJlY3QuIFNob3VsZCBoYXZlIGxvb2tlZCBtb3JlIGNsb3NlbHkgd2hlbiBt
b3ZpbmcKdGhpcyBjb2RlIGFyb3VuZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
