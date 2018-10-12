From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 18/18] tools/debugger/kdd: Install as
 `xen-kdd', not just `kdd'
Date: Fri, 12 Oct 2018 16:00:43 +0100
Message-ID: <23488.46875.995643.704966@mariner.uk.xensource.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
 <20181005172917.11963-19-ian.jackson@citrix.com>
 <20181007163717.GA61815@deinos.phlegethon.org>
 <23483.25418.402268.947179@mariner.uk.xensource.com>
 <8b1bb9f9-7e22-0a1c-736e-e389a914f856@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pszq=my=citrix.com=prvs=81651eb4b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAyvp-0000Ad-35
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:00:49 +0000
In-Reply-To: <8b1bb9f9-7e22-0a1c-736e-e389a914f856@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDE4LzE4XSB0b29s
cy9kZWJ1Z2dlci9rZGQ6IEluc3RhbGwgYXMgYHhlbi1rZGQnLCBub3QganVzdCBga2RkJyIpOgo+
IE9uIDA4LzEwLzIwMTggMTY6MDEsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gVGltIERlZWdhbiB3
cml0ZXMgKCJSZTogW1BBVENIIDE4LzE4XSB0b29scy9kZWJ1Z2dlci9rZGQ6IEluc3RhbGwgYXMg
YHhlbi1rZGQnLCBub3QganVzdCBga2RkJyIpOgo+ID4+IEF0IDE4OjI5ICswMTAwIG9uIDA1IE9j
dCAoMTUzODc2NDE1NyksIElhbiBKYWNrc29uIHdyb3RlOgo+ID4+PiBga2RkJyBpcyBhbiB1bmZv
cnR1bmF0ZSBuYW1lc3BhY2UgbGFuZGdyYWIuCj4gPj4KPiA+PiBCYWgsIGh1bWJ1ZywgZXRjLiA6
KSAgQ2FuIHdlIGhhdmUgYSBub3RlIGluIHRoZSBjaGFuZ2Vsb2cgZm9yIHRoZSBuZXh0Cj4gPj4g
cmVsZWFzZSB0byB3YXJuIHRoZSBmZXcga2RkIHVzZXJzIHRoYXQgd2UndmUgZG9uZSB0aGlzPwo+
ID4gCj4gPiBNbW0sIHNvcnJ5LiAgRXJyLCB3aGVyZSBhcmUgc3VjaCByZWxlYXNlIG5vdGVzIGNv
bGxlY3RlZCA/Cj4gCj4gSSBiZWxpZXZlIHRoaXMgaXMgYSBtYW51YWwgcHJvY2VzcyB0cmlnZ2Vy
ZWQgYnkgdGhlIENvbW11bml0eSBNYW5hZ2VyLgo+IAo+IEknbSBmaW5lIHdpdGggY29sbGVjdGlu
ZyBSTiBzbmlwcGxldHMgZm9yIHRoZSB1cGNvbWluZyByZWxlYXNlLCBvZgo+IGNvdXJzZS4KClRo
YW5rcy4gIENhbiB5b3UgYWRkIGtkZCAtPiB4ZW4ta2RkIHRvIHRoYXQgbGlzdCB0aGVuIHBsZWFz
ZSA/Cgo+IElhbiwgYW5vdGhlciBxdWVzdGlvbjogY291bGQgd2UgYWRkIGEgbGluayB0byB0aGUg
cmVsZWFzZSBub3RlIG9mIHRoZQo+IHJlbGF0ZWQgdmVyc2lvbiBvbjoKPiAKPiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL3N1cHBvcnQtbWF0cml4Lmh0bWwKClllcywgSSB0
aGluayBzby4gIFRoYXQgcGFnZSBpcyBnZW5lcmF0ZWQgYnkKICBkb2NzL3N1cHBvcnQtbWF0cml4
LWdlbmVyYXRlCiAgZG9jcy9wYXJzZS1zdXBwb3J0LW1kCndoaWNoIGNvbnN1bWVzCiAgU1VQUE9S
VC5tZApmcm9tIGVhY2ggdHJlZS4KCkkgdGhpbmsgaWYgd2UgY2hhbmdlIFNVUFBPUlQubWQgdG8g
aGF2ZSBhIHByb3BlciBoeXBlcmxpbmsgdG8gdGhlCnJlbGVhc2Ugbm90ZXMsIGluIGVhY2ggdHJl
ZSwgaW4gdGhlIFJlbGVhc2UgU3VwcG9ydCBpbmRlbnRlZCBzdGFuemEsCml0IHdpbGwgYXBwZWFy
IG9uIHRoZSBzdXBwb3J0IG1hdHJpeCBwYWdlLgoKVGhhdCBpcyBiZXR0ZXIgdGhhbiBoYXZpbmcg
dGhlIHVybCBiZSBtYWdpY2FsbHkgaW5zZXJ0ZWQgYnkgdGhlIG1hdHJpeApnZW5lcmF0aW9uIG1h
Y2hpbmVyeSBiZWNhdXNlIGl0IHdpbGwgYXBwZWFyIGluIHBsYWNlcyBsaWtlIHRoaXMgdG9vCiAg
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy80LjExLXRlc3RpbmcvU1VQUE9SVC5odG1sCgpX
b3VsZCB5b3UgcHJlcGFyZSBhIHBhdGNoIGZvciA0LjExIHRvIGFkZCB0aGUgUk4gVVJMID8gIFlv
dSBjYW4KcGVyaGFwcyB0ZXN0IHRoZSBzdXBwb3J0IG1hdHJpeCBvdXRwdXQgYnkgcnVubmluZyBh
IHZhcmlhbnQgb2YgdGhlCnJ1bmUgYXQgdGhlIHRvcCBvZgogIGRvY3Mvc3VwcG9ydC1tYXRyaXgt
Z2VuZXJhdGUKYW5kIEkgd2lsbCBmaXggdGhlIG1hdHJpeCBjb2RlIGl0IGlmIGl0IGRvZXNuJ3Qg
c2VlbSB0byB3b3JrIDotKS4KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
