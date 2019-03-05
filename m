From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/xenstore: Do not abort xenstore-ls if
 a node disappears while iterating
Date: Tue, 5 Mar 2019 17:02:10 +0000
Message-ID: <20190305170210.wvdjyzsfk7hdowwr@zion.uk.xensource.com>
References: <936c39728ca0c96d0666551046cf08ebc8774dd8.camel@infradead.org>
 <20190304141848.rohcxuemytrbsyl2@zion.uk.xensource.com>
 <905c9d11bfc33b03e81ef18dbf7a97448038e15f.camel@infradead.org>
 <0bd589fc-dda5-3a9f-4809-29848e9182a0@suse.com>
 <5e63926d91feee534c15b33dd164c46252f31664.camel@infradead.org>
 <20190304154617.gtytkql6e3d4dv33@zion.uk.xensource.com>
 <ffbb62562dbe403f233494da48994f44e6fb9016.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Y1m=RI=citrix.com=prvs=960e31256=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1DSP-0002Xr-B0
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 17:02:21 +0000
Content-Disposition: inline
In-Reply-To: <ffbb62562dbe403f233494da48994f44e6fb9016.camel@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDQsIDIwMTkgYXQgMDQ6NTk6NDJQTSArMDAwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IE9uIE1vbiwgMjAxOS0wMy0wNCBhdCAxNTo0NiArMDAwMCwgV2VpIExpdSB3cm90
ZToKWy4uLl0KPiA+IEFsc28geW91IG1lbnRpb25lZCAiYSBub2RlIGRpc2FwcGVhcnMiLCBJIHRo
b3VnaHQgdGhhdCB3YXMgdGhlIGNhc2UgeW91Cj4gPiBjYXJlZCBhYm91dCwgaGVuY2UgbXkgc3Vn
Z2VzdGlvbi4KPiAKPiBUaGF0J3MgbXkgcHJpbWFyeSB1c2UgY2FzZSwgeWVzLiBPYnZpb3VzbHkg
d2Ugc2hvdWxkIG1ha2UgaXQgZG8gdGhlCj4gcmlnaHQgdGhpbmcgaW4gdGhlIGdlbmVyYWwgY2Fz
ZSB3aGlsZSB3ZSdyZSB0aGlua2luZyBhYm91dCBpdC4gSSdtCj4gaW5jbGluZWQgdG8gZ28gd2l0
aCBKdWVyZ2VuJ3Mgc3VnZ2VzdGlvbiBvZiBpZ25vcmluZyBFTk9FTlQgYW5kIEVBQ0NFUwo+IChv
ciBzaG91bGQgdGhhdCBoYXZlIGJlZW4gRVBFUk0/KSwgeWV0IHN0aWxsIGFib3J0aW5nIGZvciBl
dmVyeXRoaW5nCj4gZWxzZS4KPiAKCkkgY2FuJ3Qgc2VlbSB0byBmaW5kIEVBQ0NFU1MgaW4geGVu
c3RvcmVkIGNvZGUsIGJ1dCBJIGRvIGZpbmQgRVBFUk0uCkFkZGluZyBFUEVSTSB3b3VsZCBiZSBm
aW5lIGJ5IG1lLgoKV2VpLgoKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
