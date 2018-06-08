From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen: share start flags between PV and PVH
Date: Fri, 8 Jun 2018 18:17:19 +0200
Message-ID: <20180608161719.3zyns6dnr7w2nez4__19605.0863866278$1528474576$gmane$org@mac>
References: <20180608084038.19344-1-roger.pau@citrix.com>
 <alpine.DEB.2.10.1806080909320.14699@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k0yj=i2=citrix.com=prvs=690ca12ba=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fRK4y-0000DI-C6
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 16:17:32 +0000
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1806080909320.14699@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdW4gMDgsIDIwMTggYXQgMDk6MTI6MjVBTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIEZyaSwgOCBKdW4gMjAxOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
ID4gVXNlIGEgZ2xvYmFsIHZhcmlhYmxlIHRvIHN0b3JlIHRoZSBzdGFydCBmbGFncyBmb3IgYm90
aCBQViBhbmQgUFZILgo+ID4gVGhpcyBhbGxvd3MgdGhlIHhlbl9pbml0aWFsX2RvbWFpbiBtYWNy
byB0byB3b3JrIHByb3Blcmx5IG9uIFBWSC4KPiA+IAo+ID4gTm90ZSB0aGF0IEFSTSBpcyBhbHNv
IHN3aXRjaGVkIHRvIHVzZSB0aGUgbmV3IHZhcmlhYmxlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gQXMg
SSBhbHJlYWR5IG1lbnRpb25lZCwgdGhlIEFSTSBwYXJ0IGlzIE9LLiBIb3dldmVyLCBpcyB0aGUg
aXNzdWUgdGhhdAo+IHhlbl9zdGFydF9pbmZvIGlzIG5vdCBhdmFpbGFibGUgb24gUFZIPyBXZSBo
YWQgdGhlIHNhbWUgcHJvYmxlbSBvbiBBUk0KPiBhbmQgc29sdmVkIGl0IGJ5IGZha2luZyBhIHhl
bl9zdGFydF9pbmZvIHBhZ2UsIHNlZSB0aGUgdG9wIG9mCj4gYXJjaC9hcm0veGVuL2VubGlnaHRl
bi5jLgo+IAo+IEkgd291bGQgbG92ZSB0byBnZXQgcmlkIG9mIHRoYXQsIGJ1dCB0byBkbyB0aGF0
LCB3ZSBhbHNvIG5lZWQgdG8gcmVtb3ZlCj4gdGhlIHhlbl9zdGFydF9pbmZvIHJlZmVyZWNlIGF0
IGRyaXZlcnMvdHR5L2h2Yy9odmNfeGVuLmM6MjU1Ogo+IAo+ICAgaWYgKCF4ZW5fc3RhcnRfaW5m
by0+Y29uc29sZS5kb21VLmV2dGNobikKPiAJCXJldHVybiAtRU5PREVWOwoKV2UgY291bGQgbGlr
ZWx5IGd1YXJkIHhlbl9wdl9jb25zb2xlX2luaXQgKGFuZCBvdGhlciBQViByZWxhdGVkCmNvbnNv
bGUgZnVuY3Rpb25zKSB3aXRoIENPTkZJR19QVi4gSFZNL1BWSCB1c2UgeGVuX2h2bV9jb25zb2xl
X2luaXQuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
