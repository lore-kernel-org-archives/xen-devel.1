From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 13/32] libxl_qmp: Connect to QMP socket
Date: Fri, 3 Aug 2018 16:03:54 +0200
Message-ID: <20180803140354.nsw6ofwb34lcaqvi@mac>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-14-anthony.perard@citrix.com>
 <20180802093010.xmeofkvaajd6dzpd@mac>
 <20180803135420.GE1327@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jouf=ks=citrix.com=prvs=7468cef67=roger.pau@srs-us1.protection.inumbo.net>)
 id 1flagn-0006XC-Eb
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 14:04:21 +0000
Content-Disposition: inline
In-Reply-To: <20180803135420.GE1327@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMDMsIDIwMTggYXQgMDI6NTQ6MjBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMTE6MzU6NTNBTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDI3LCAyMDE4IGF0IDAzOjA1OjU1UE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiArdHlwZWRlZiBlbnVtIHsKPiA+ID4g
KyAgICBxbXBfc3RhdGVfZGlzY29ubmVjdGVkID0gMSwKPiA+ID4gKyAgICBxbXBfc3RhdGVfY29u
bmVjdGluZywKPiA+ID4gKyAgICBxbXBfc3RhdGVfZ3JlZXRpbmcsCj4gPiA+ICsgICAgcW1wX3N0
YXRlX2NhcGFiaWxpdHlfbmVnb2NpYXRpb24sCj4gPiA+ICsgICAgcW1wX3N0YXRlX2Nvbm5lY3Rl
ZCwKPiA+ID4gK30gbGlieGxfX3FtcF9zdGF0ZTsKPiA+ID4gKwo+ID4gCj4gPiBJIHRoaW5rIHRo
aXMgc2hvdWxkIGJlIGRlY2xhcmVkIGluIGxpYnhsX3R5cGVzX2ludGVybmFsLmlkbD8KPiAKPiBJ
IGRvbid0IGtub3csIEkga2luZCBvZiB3YW50ZWQgdGhlIGVudW0gdG8gYmUgY29udGFpbmVkIGlu
IGxpYnhsX3FtcC5jLAo+IGJ1dCB0aGVuIEkgY291bGRuJ3QgdXNlIHRoZSBlbnVtIHR5cGUgaW4g
dGhlIHN0cnVjdCBoZXJlLgo+IAo+IEFsc28gdGhlIGlkbCBwcm92aWRlcyBtb3JlIHRoYW4gbmVl
ZGVkIChjb252ZXJzaW9uIHRvIHN0cmluZykgYW5kIG1ha2UKPiB0aGUgbmFtZXMgbW9yZSB2ZXJi
b3NlLCBieSBhZGRpbmcgbGlieGxfXyBwcmVmaXguCgpIbSwgeWVzLiBsaWJ4bF90eXBlc19pbnRl
cm5hbC5pZGwgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQgbXVjaC4gSSB3aWxsCmxlYXZlIHRoaXMg
dG8gdGhlIG1haW50YWluZXJzIGJlY2F1c2UgaXQncyBub3QgY2xlYXIgdG8gbWUgd2hlbiBhCmRl
Y2xhcmF0aW9uIHNob3VsZCBsaXZlIGluIHRoZSBJREwgb3IgdGhlIHByaXZhdGUgaGVhZGVyIGRp
cmVjdGx5LgoKPiA+IEFuZCAobWF5YmUpIGEgZGVzY3JpcHRpb24gb2YgZWFjaCBzdGF0ZSB3b3Vs
ZCBiZSBoZWxwZnVsIGZvciBmdXR1cmUKPiA+IHJlZmVyZW5jZT8KPiAKPiBZZXMsIGJ1dCBub3Qg
aW4gbGlieGxfaW50ZXJuYWwuaCwgdGhlIGRlc2NyaXB0aW9uIHNob3VsZCBiZSBpbgo+IGxpYnhs
X3FtcC5jIGFzIHRoaXMgcW1wX3N0YXRlIGlzIG5vdCBwYXJ0IG9mIHRoZSBBUEkuCgpJIHdvdWxk
IHBsYWNlIHRoZSBkZXNjcmlwdGlvbiB0b2dldGhlciB3aXRoIHRoZSBkZWNsYXJhdGlvbiBvZiB0
aGUKdHlwZSwgb3IgZWxzZSBpdCdzIHZlcnkgZWFzeSBmb3IgdGhpbmdzIHRvIGdldCBvdXQgb2Yg
c3luYy4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
