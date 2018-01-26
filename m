From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Fri, 26 Jan 2018 11:43:06 +0000
Message-ID: <20180126114306.mpklwqjlworpuewf@citrix.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9use=ev=citrix.com=prvs=5571302b7=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ef2PW-0007tr-5V
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 11:43:10 +0000
Content-Disposition: inline
In-Reply-To: <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, M A Young <m.a.young@durham.ac.uk>, John Thomson <git@johnthomson.fastmail.com.au>, Marcello Seri <marcello.seri@citrix.com>, David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDk6Mjk6MjBBTSArMDAwMCwgQ2hyaXN0aWFuIExpbmRp
ZyB3cm90ZToKPiAKPiAKPiA+IE9uIDI2LiBKYW4gMjAxOCwgYXQgMDk6MDksIE0gQSBZb3VuZyA8
bS5hLnlvdW5nQGR1cmhhbS5hYy51az4gd3JvdGU6Cj4gPiAKPiA+IE9uIEZyaSwgMjYgSmFuIDIw
MTgsIEpvaG4gVGhvbXNvbiB3cm90ZToKPiA+IAo+ID4+IFVzZSBhdXRvY29uZiB0byB0ZXN0IGlm
IG9jYW1sIHZlcnNpb24gPj0gNC4wMgo+ID4+IElmIHNvLCB1c2UgLXVuc2FmZS1zdHJpbmcgZm9y
IG9jYW1sb3B0IGFuZCBvY2FtbGMKPiA+PiAKPiA+PiBCeXRlcyAmIHNhZmUtc3RyaW5nIHdlcmUg
aW50cm9kdWNlZCBpbiBvY2FtbCA0LjAyICgyMDE1LTA3LTI3KQo+ID4+IAo+ID4+IFdpdGggb2Nh
bWwgNC4wNiwgLXNhZmUtc3RyaW5nIGlzIG5vdyBkZWZhdWx0Cj4gPj4gVGhpcyBzZXBhcmF0ZXMg
dGhlIHR5cGVzIGJ5dGVzIChtdXRhYmxlIHN0cmluZykgYW5kIHN0cmluZwo+ID4gCj4gPiBGb3Ig
RmVkb3JhIFJhd2hpZGUsIHdoaWNoIGhhcyBvY2FtbCA0LjA2LCB3ZSBjYW1lIHVwIHdpdGggYSBw
YXRjaCB0byBtYWtlIAo+ID4geGVuIG9jYW1sIHNhZmUtc3RyaW5ncyBjb21wbGlhbnQgKHdoaWNo
IEkgaGF2ZW4ndCBnb3QgYXJvdW5kIHRvIHN1Ym1pdHRpbmcgCj4gPiB0byB0aGlzIGxpc3QgeWV0
KS4KPiA+IAo+ID4gVGhlIHBhdGNoIGlzIGF0Cj4gPiBodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0
Lm9yZy9ycG1zL3hlbi9ibG9iL21hc3Rlci9mL3hlbi5vY2FtbC5zYWZlLXN0cmluZ3MucGF0Y2gK
PiA+IHdpdGggdGhlIHJlbGF0ZWQgRmVkb3JhIGJ1ZyBhdAo+ID4gaHR0cHM6Ly9idWd6aWxsYS5y
ZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNTI2NzAzCj4gPiAKPiA+IAlNaWNoYWVsIFlvdW5n
Cj4gCj4gVGhlIHBhdGNoIGxvb2tzIGdvb2QgYW5kIEkgd291bGQgcHJlZmVyIHRvIHRha2UgaXQg
dGhhbiB0byB1c2UgLXVuc2FmZS1zdHJpbmcgd2hpY2ggaXNu4oCZdCBhIHNvbHV0aW9uIGluIHRo
ZSBsb25nIHJ1bi4KPiAKCkhpIENocmlzdGlhbgoKSXMgdGhhdCBhbiBhY2s/CgpDb3VsZCB5b3Ug
cGxlYXNlIGluIGZ1dHVyZSBleHBsaWNpdGx5IGdpdmUgYW4gQWNrZWQtYnkgb3IgUmV2aWV3ZWQt
YnkKdGFnIHNvIHRoYXQgY29tbWl0dGVycyBrbm93IHRoZXkgY2FuIGFwcGx5IHRoZSBwcm9wb3Nl
ZCBwYXRjaCBkaXJlY3RseT8KCldlaS4KCj4g4oCUIENocmlzdGlhbgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlz
dAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
