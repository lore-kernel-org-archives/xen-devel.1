From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Mon, 29 Jan 2018 12:53:14 +0000
Message-ID: <20180129125314.f2mgrrlceemsbhso@MacBook-Pro-de-Roger.local>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
 <20180129124310.whaq7z37t7kvlsxg@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zcj1=ey=citrix.com=prvs=56023d68c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eg8wO-0005GR-AZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 12:53:40 +0000
Content-Disposition: inline
In-Reply-To: <20180129124310.whaq7z37t7kvlsxg@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjksIDIwMTggYXQgMTI6NDM6MTBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyOSwgMjAxOCBhdCAxMjoyNjo0M1BNICswMDAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBDbGFuZyBhc3NlbWJsZXIgZG9lc24ndCBzdXBwb3J0IHVzaW5nIC5za2lw
IHdpdGggbm9uLWFic29sdXRlCj4gPiBleHByZXNzaW9uczoKPiA+IAo+IAo+IEJ1dCBzbyBpcyBH
TlUgYXMuIEZyb20gaXRzIG1hbnVhbCBmb3IgLnNraXA6Cj4gCj4gIlRoaXMgZGlyZWN0aXZlIGVt
aXRzIHNpemUgYnl0ZXMsIGVhY2ggb2YgdmFsdWUgZmlsbC4gQm90aCBzaXplIGFuZCBmaWxsCj4g
YXJlIGFic29sdXRlIGV4cHJlc3Npb25zLiIKCkkgZ3Vlc3MgY2xhbmcgYW5kIGFzIGhhdmUgZGlm
ZmVyZW50IGludGVycHJldGF0aW9ucyBvZiB3aGF0J3MgYW4KYWJzb2x1dGUgZXhwcmVzc2lvbi4g
U2FkbHkgSSBkb24ndCBzZWVtIHRvIGJlIGFibGUgdG8gZmluZCBuZWl0aGVyCmRlZmluaXRpb25z
LgoKSSd2ZSBhbHJlYWR5IHJlcG9ydGVkIHRoaXMgdG8gdXBzdHJlYW0gY2xhbmcgbG9uZyB0aW1l
IGFnbywgYnV0Cml0IGRvZXNuJ3Qgc2VlbSB0byBtYWtlIGFueSBwcm9ncmVzczoKCmh0dHBzOi8v
YnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjczNjkKCkFuZCBJIGRvbid0IHRoaW5rIEkg
Y2FuIGhhY2sgdGhpcyBteXNlbGYuCgo+ID4gZW50cnkuUzoxMDk6MTU6IGVycm9yOiBleHBlY3Rl
ZCBhYnNvbHV0ZSBleHByZXNzaW9uCj4gPiAgICAgICAgIC5za2lwIC5MY3I0X2FsdF9lbmQgLSAu
TGNyNF9hbHQsIDB4OTAKPiA+ICAgICAgICAgICAgICAgXgo+ID4gCj4gCj4gT09JIHdoYXQgbWFr
ZXMgLkxjcjRfYWx0X2VuZCAtIC5MY3I0X2FsdCBub24tYWJzb2x1dGU/CgpDbGFuZyBkb2Vzbid0
IGNvbnNpZGVyIHN5bWJvbHMgYXMgYWJzb2x1dGUgZXhwcmVzc2lvbnMsIGF0IGxlYXN0IGluIHRo
ZQpjb250ZXh0IG9mIC5za2lwLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
