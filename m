From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Thu, 15 Mar 2018 04:23:02 -0600
Message-ID: <5AAA579602000078001B1FEC@prv-mh.provo.novell.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-2-roger.pau@citrix.com>
 <5AA9403702000078001B1994@prv-mh.provo.novell.com>
 <20180315095004.oy3ylmba7rotutea@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewQ2N-0006lM-ES
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 10:23:07 +0000
In-Reply-To: <20180315095004.oy3ylmba7rotutea@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, IanJackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEwOjUwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWFyIDE0LCAyMDE4IGF0IDA4OjMxOjAzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMDMuMTggYXQgMTU6MDMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvS2NvbmZpZwo+PiA+ICsrKyBiL3hlbi9kcml2
ZXJzL0tjb25maWcKPj4gPiBAQCAtMTIsNCArMTIsNiBAQCBzb3VyY2UgImRyaXZlcnMvcGNpL0tj
b25maWciCj4+ID4gIAo+PiA+ICBzb3VyY2UgImRyaXZlcnMvdmlkZW8vS2NvbmZpZyIKPj4gPiAg
Cj4+ID4gK3NvdXJjZSAiZHJpdmVycy92cGNpL0tjb25maWciCj4+IAo+PiBBcmUgdGhlcmUgbW9y
ZSB0aGluZ3MgdG8gYXBwZWFyIGluIHRoYXQgbmV3IGZpbGU/IElmIG5vdCwgd2hhdCB0aGUKPj4g
cG9pbnQgb2YgaW50cm9kdWNpbmcgaXQ/Cj4gCj4gSSd2ZSBhc3N1bWVkIHRoYXQgd2FzIHRoZSBj
b3JyZWN0IGhpZXJhcmNoeSB0byBwcmV2ZW50IHBvbGx1dGluZwo+IEtjb25maWcgZmlsZXMuIHBj
aS8gYW5kIGNwdWZyZXEvIGFsc28gY29udGFpbiBhIEtjb25maWcgZmlsZSB3aXRoIGEKPiBzaW5n
bGUgb3B0aW9uLgo+IAo+IEkgY2FuIG1vdmUgaXQgdG8gZHJpdmVycy9LY29uZmlnIGlmIHlvdSBw
cmVmZXIuCgpJIHdvdWxkIHByZWZlciB0aGF0LCB5ZXMgKGFuZCBJIHRoaW5rIGl0IHdhcyBhIG1p
c3Rha2UgZm9yIHRob3NlCm90aGVycyB5b3UgbWVudGlvbikuIFlvdSBtYXkgd2FudCB0byBjb25m
aXJtIHRoaXMgd2l0aCBvdGhlcnMsCmluIHBhcnRpY3VsYXIgRG91ZyBhcyB0aGUga2NvbmZpZyBt
YWludGFpbmVyLCB0aG91Z2guCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
