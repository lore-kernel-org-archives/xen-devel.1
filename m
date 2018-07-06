From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86: consolidate legacy FPU state loading
Date: Fri, 06 Jul 2018 00:36:52 -0600
Message-ID: <5B3F0E0402000078001D1BAC@prv1-mh.provo.novell.com>
References: <5B3E232302000078001D18BA@prv1-mh.provo.novell.com>
 <29561237-2d22-77e9-575a-ec5a7230da17@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w/jz=jw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fbKMS-0005wM-Iv
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 06:36:56 +0000
In-Reply-To: <29561237-2d22-77e9-575a-ec5a7230da17@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA3LjE4IGF0IDE5OjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDcvMTggMTQ6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvaTM4Ny5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pMzg3LmMKPj4gQEAgLTMzNyw2
ICszMzcsNDkgQEAgaW50IHZjcHVfaW5pdF9mcHUoc3RydWN0IHZjcHUgKnYpCj4+ICAgICAgcmV0
dXJuIHJjOwo+PiAgfQo+PiAgCj4+ICt2b2lkIHZjcHVfbG9hZF9mcHUoc3RydWN0IHZjcHUgKnYs
IHN0cnVjdCB4c2F2ZV9zdHJ1Y3QgKnhzYXZlX2FyZWEsCj4gCj4gSG93IGFib3V0IHZjcHVfc2V0
dXBfZnB1KCkgPyBUaGlzIGZ1bmN0aW9uIGVpdGhlciBpbml0aWFsaXNlcyB0aGUgRlBVCj4gc3Rh
dGUgdG8gc3VpdGFibGUgZGVmYXVsdHMsIG9yIGNvcGllcyBpbiBzdGF0ZSBwcm92aWRlZCBieSBh
IGh5cGVyY2FsbC4KPiAKPiBUaGUgbmFtZSAibG9hZCIgaXMgdG9vIGVhc2lseSBhc3NvY2lhdGVk
IHdpdGggc2F2ZS9yZXN0b3JlIElNTy4KCkkgZGlkbid0IHRoaW5rIGl0IHdvdWxkIGJlLCBidXQg
SSdtIG5vdCByZWFsbHkgYWdhaW5zdCB1c2luZyAic2V0dXAiIGluc3RlYWQuCgo+IE90aGVyd2lz
ZSwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpU
aGFua3MsIEphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
