From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] osstest: configure git proxy for FreeBSD
Date: Mon, 20 Aug 2018 16:34:31 +0200
Message-ID: <20180820143431.cyfoqsverger2wit@mac>
References: <20180820105113.28840-1-roger.pau@citrix.com>
 <20180820105113.28840-2-roger.pau@citrix.com>
 <23418.40349.15959.260209@mariner.uk.xensource.com>
 <20180820110714.qx3pohtjvgaypoa4@mac>
 <23418.51829.610118.310209@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bhjx=ld=citrix.com=prvs=76356e8f4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1frlJJ-0001uE-Au
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 14:37:37 +0000
Content-Disposition: inline
In-Reply-To: <23418.51829.610118.310209@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDM6MDQ6MzdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIIDIvMl0gb3NzdGVzdDog
Y29uZmlndXJlIGdpdCBwcm94eSBmb3IgRnJlZUJTRCIpOgo+ID4gT24gTW9uLCBBdWcgMjAsIDIw
MTggYXQgMTE6NTM6MTdBTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiA+IFJvZ2VyIFBh
dSBNb25uZSB3cml0ZXMgKCJbUEFUQ0ggMi8yXSBvc3N0ZXN0OiBjb25maWd1cmUgZ2l0IHByb3h5
IGZvciBGcmVlQlNEIik6Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IAo+ID4gPiBBY2tlZC1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiA+IAo+ID4gPiBUaGFua3MuCj4gPiA+IAo+
ID4gPiBEbyB5b3Ugd2FudCBtZSB0byBwdXNoIHRoZXNlIHRvIHByZXRlc3Qgc29vbiA/Cj4gPiAK
PiA+IElmIHlvdSBjb3VsZCwgeWVzIHBsZWFzZS4gSSdtIGhvcGluZyB0aGlzIHdpbGwgdW5ibG9j
ayB0aGUgRnJlZUJTRAo+ID4gYnVpbGQsIG9yIGF0IGxlYXN0IGdldCBpdCBjbG9zZXIgdG8gdW5i
bG9ja2luZyA6KQo+IAo+IG1hcmluZXI6dGVzdGluZy5naXQ+IC4vbWctYWxsb2NhdGUgLWwKPiBH
bG9iYWwgc3ltYm9sICIkaG8iIHJlcXVpcmVzIGV4cGxpY2l0IHBhY2thZ2UgbmFtZSBhdCBPc3N0
ZXN0L1Rlc3RTdXBwb3J0LnBtIGxpbmUgMjkyMi4KPiBDb21waWxhdGlvbiBmYWlsZWQgaW4gcmVx
dWlyZSBhdCAuL21nLWFsbG9jYXRlIGxpbmUgODYuCj4gQkVHSU4gZmFpbGVkLS1jb21waWxhdGlv
biBhYm9ydGVkIGF0IC4vbWctYWxsb2NhdGUgbGluZSA4Ni4KPiBtYXJpbmVyOnRlc3RpbmcuZ2l0
Pgo+IAo+IEFuZCBzaW1pbGFyIHRoaW5ncyBmcm9tIGNyb24uICBJIGhhdmUgcmV3b3VuZCBwcmV0
ZXN0IGFuZCB3aWxsIGF3YWl0Cj4gdXBkYXRlZCBwYXRjaGVzLi4uCgpTb3JyeSwgaGVyZSBpcyBh
IHdvcmtpbmcgYnJhbmNoOgoKZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIvb3Nz
dGVzdC5naXQgZ2l0LXByb3h5CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
