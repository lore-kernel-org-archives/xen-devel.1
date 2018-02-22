From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xenstore: increase default thread stack
 size to 32k
Date: Thu, 22 Feb 2018 13:27:18 +0100
Message-ID: <cab897af-a51f-6bf4-ce1e-6a8be750c088@suse.com>
References: <20180221221341.17452-1-jfehlig@suse.com>
 <799a00a6-ae10-1fa3-afbb-d94eb0b69dea@suse.com>
 <23182.43687.778648.644108@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=d841=fq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eopyB-0005rr-Un
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 12:27:27 +0000
In-Reply-To: <23182.43687.778648.644108@mariner.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTI6MzMsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mgd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0geGVuc3RvcmU6IGluY3JlYXNlIGRlZmF1bHQg
dGhyZWFkIHN0YWNrIHNpemUgdG8gMzJrIik6Cj4+IFRoZSBtYWluIHByb2JsZW0gaXMgdGhhdCBh
bnkgdGhyZWFkIGxvY2FsIHN0b3JhZ2UgaXMgdGFrZW4gZnJvbSB0aGUKPj4gc3RhY2sgd2l0aG91
dCBhbnkgaW50ZXJmYWNlIGJlaW5nIGF2YWlsYWJsZSBmb3IgYWRqdXN0aW5nIHRoZSBfcmVhbF8K
Pj4gc3RhY2sgc2l6ZSBpbnN0ZWFkIG9mIHRoZSBtZW9yeSBmb3IgdGhyZWFkIGxvY2FsIHN0b3Jh
Z2UgKyBzdGFjay4KPj4KPj4gU28gd2UgY2FuIGluY3JlYXNlIHRoZSBzdGFjayBzaXplIG9mIHRo
ZSB4ZW5zdG9yZSB0aHJlYWQgYW5kIHdhaXQgZm9yCj4+IHRoZSBuZXh0IGJyZWFrYWdlLCBvciB3
ZSBoYXZlIHRvIHRoaW5rIGFib3V0IGEgcHJvcGVyIHNvbHV0aW9uLgo+Pgo+PiBSaWdodCBub3cg
SSBoYXZlIG5vIHNlbnNpYmxlIGlkZWEgaG93IHRvIGFkZHJlc3MgdGhlIHByb2JsZW0sIGFzIHRo
ZQo+PiBvbGQgdGhyZWFkIHN1Z2dlc3RzIHRoZSB1bmRlcmx5aW5nIGdsaWJjIHByb2JsZW0gaXNu
J3QgZml4ZWQgeWV0ICh3b3c6Cj4+IHRoZSBwcm9ibGVtIGlzIGtub3duIGZvciBtb3JlIHRoYW4g
NyB5ZWFycyBub3cpOgo+Pgo+PiBodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3df
YnVnLmNnaT9pZD0xMTc4Nwo+IAo+IE9oIQo+IAo+IFRoYW5rIHlvdSwgSnVlcmdlbiwgZm9yIHBy
b3ZpZGluZyBmYWN0cyEKPiAKPiBJIHdpdGhkcmF3IG15IGFjayBvbiB0aGlzIHBhdGNoLgo+IAo+
IEkgYWdyZWUgd2l0aCBhbGwgdGhlIGNvbXBsYWludHMgaW4gdGhlIGxpYmMgYnVnemlsbGEgYW5k
IGRpc2VncmVlIHdpdGgKPiBnbGliYyB1cHN0cmVhbS4gIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUg
Zml4ZWQgaW4gdGhlIGxpYmMuICBTYWRseSB0aGUKPiBsaWJjIGJ1Z3ppbGxhIGRvZXNuJ3QgaGF2
ZSBhIGxpYmMgcGF0Y2guCj4gCj4gSSB3b3VsZCBhY2NlcHQgYSB3b3JrYXJvdW5kIGluIGxpYnhl
bnN0b3JlIHRoYXQgZG9lcyBzb21ldGhpbmcgc2ltaWxhcgo+IHRvIHdoYXQgdGhleSBkbyBpbiBS
dXN0Li4uCgpZZWFoLCB0aGUgUnVzdCBzb2x1dGlvbiBzZWVtcyB0byBiZSBzZW5zaWJsZS4KClRo
ZSBzb3VyY2UgcGF0Y2ggaXMgZWFzeS4gSG93IHRvIGFkZCB0aGUgbGlua2VyIGZsYWcgKCItbGRs
Iik/IEp1c3QgZG8KaXQgaW4gdGhlIE1ha2VmaWxlIG9mIHhlbnN0b3JlLCBvciB2aWEgY29uZmln
dXJlPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
