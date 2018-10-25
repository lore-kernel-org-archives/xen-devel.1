From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 20/23] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Thu, 25 Oct 2018 03:37:52 -0600
Message-ID: <5BD18EF002000078001F48B3@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-20-git-send-email-sstabellini@kernel.org>
 <5BBB288102000078001EF757@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1810191556310.31582@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1810191556310.31582@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEwLjE4IGF0IDAxOjEwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gTW9uLCA4IE9jdCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDA1LjEw
LjE4IGF0IDIwOjQ3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gQEAgLTM5
MSwzMSArMzk0LDczIEBAIHN0YXRpYyB2b2lkIGR1bXBfY29uc29sZV9yaW5nX2tleSh1bnNpZ25l
ZCBjaGFyIGtleSkKPj4gPiAgICAgIGZyZWVfeGVuaGVhcF9wYWdlcyhidWYsIG9yZGVyKTsKPj4g
PiAgfQo+PiA+ICAKPj4gPiAtLyogQ1RSTC08c3dpdGNoX2NoYXI+IHN3aXRjaGVzIGlucHV0IGRp
cmVjdGlvbiBiZXR3ZWVuIFhlbiBhbmQgRE9NMC4gKi8KPj4gPiArLyoKPj4gPiArICogQ1RSTC08
c3dpdGNoX2NoYXI+IHN3aXRjaGVzIGlucHV0IGRpcmVjdGlvbiBiZXR3ZWVuIFhlbiwgRG9tMCBh
bmQKPj4gPiArICogRG9tVXMuCj4+ID4gKyAqLwo+PiAKPj4gSnVzdCBsaWtlIHRoZSB0aXRsZSwg
dGhpcyBjb21tZW50IG1ha2VzIGl0IHNvdW5kIGFzIGlmIGFueSBEb21VIGNvdWxkCj4+IHBhcnRp
Y2lwYXRlIGluIHRoaXMgc3dpdGNoaW5nLgo+IAo+IElzIHRoZSBmb2xsb3dpbmcgYW55IGJldHRl
cj8KPiAKPiAgIENUUkwtPHN3aXRjaF9jaGFyPiBjaGFuZ2VzIGlucHV0IGRpcmVjdGlvbiwgcm90
YXRpbmcgYW1vbmcgWGVuLCBEb20wLCBhbmQgCj4gRG9tVXMuCj4gCj4gT3RoZXJ3aXNlIHBsZWFz
ZSBzdWdnZXN0IHlvdXIgZmF2b3JpdGUgd29yZGluZyBhbmQgSSdsbCB1c2UgaXQuCgoiLi4uLCBh
bmQgdGhlIDx3aGF0ZXZlci10ZXJtLXlvdS1tZWFuLXRvLXVzLWZvci1ib290LXRpbWUtCmNyZWF0
ZWQtb25lcz4gRG9tVXMiCgo+PiA+ICsgICAgewo+PiA+ICsgICAgICAgIC8qIERlbGl2ZXIgaW5w
dXQgdG8gaGFyZHdhcmUgZG9tYWluLCB1bmxlc3MgaXQgaXMgYWxyZWFkeSBmdWxsLiAqLwo+PiAK
Pj4gTG9va3MgbGlrZSB5b3UndmUgbWlzLWVkaXRlZCB0aGUgb3JpZ2luYWwgY29tbWVudC4KPiAK
PiBJIHRha2UgdGhhdCB5b3UgbWVhbiB0aGF0IHRoZSB3b3JkICJidWZmZXIiIGlzIG1pc3Npbmcs
IHJpZ2h0PyBJdCBzaG91bGQKPiBiZToKPiAKPiAgIERlbGl2ZXIgaW5wdXQgdG8gdGhlIGhhcmR3
YXJlIGRvbWFpbiBidWZmZXIsIHVubGVzcyBpdCBpcyBhbHJlYWR5IGZ1bGwuCgpZZXMsIHRoYW5r
cy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
