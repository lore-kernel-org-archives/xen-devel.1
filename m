From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Fri, 26 Jan 2018 11:47:24 +0000
Message-ID: <e51cb47d-ec06-f332-8235-5df619dde1ff@citrix.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
 <20180126114306.mpklwqjlworpuewf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=iudn=ev=citrix.com=prvs=557142d6a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ef2Th-0008Bv-3y
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 11:47:29 +0000
In-Reply-To: <20180126114306.mpklwqjlworpuewf@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Christian Lindig <christian.lindig@citrix.com>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, John Thomson <git@johnthomson.fastmail.com.au>, M A Young <m.a.young@durham.ac.uk>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDEvMTggMTE6NDMsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBKYW4gMjYsIDIwMTgg
YXQgMDk6Mjk6MjBBTSArMDAwMCwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToKPj4KPj4+IE9uIDI2
LiBKYW4gMjAxOCwgYXQgMDk6MDksIE0gQSBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4g
d3JvdGU6Cj4+Pgo+Pj4gT24gRnJpLCAyNiBKYW4gMjAxOCwgSm9obiBUaG9tc29uIHdyb3RlOgo+
Pj4KPj4+PiBVc2UgYXV0b2NvbmYgdG8gdGVzdCBpZiBvY2FtbCB2ZXJzaW9uID49IDQuMDIKPj4+
PiBJZiBzbywgdXNlIC11bnNhZmUtc3RyaW5nIGZvciBvY2FtbG9wdCBhbmQgb2NhbWxjCj4+Pj4K
Pj4+PiBCeXRlcyAmIHNhZmUtc3RyaW5nIHdlcmUgaW50cm9kdWNlZCBpbiBvY2FtbCA0LjAyICgy
MDE1LTA3LTI3KQo+Pj4+Cj4+Pj4gV2l0aCBvY2FtbCA0LjA2LCAtc2FmZS1zdHJpbmcgaXMgbm93
IGRlZmF1bHQKPj4+PiBUaGlzIHNlcGFyYXRlcyB0aGUgdHlwZXMgYnl0ZXMgKG11dGFibGUgc3Ry
aW5nKSBhbmQgc3RyaW5nCj4+PiBGb3IgRmVkb3JhIFJhd2hpZGUsIHdoaWNoIGhhcyBvY2FtbCA0
LjA2LCB3ZSBjYW1lIHVwIHdpdGggYSBwYXRjaCB0byBtYWtlIAo+Pj4geGVuIG9jYW1sIHNhZmUt
c3RyaW5ncyBjb21wbGlhbnQgKHdoaWNoIEkgaGF2ZW4ndCBnb3QgYXJvdW5kIHRvIHN1Ym1pdHRp
bmcgCj4+PiB0byB0aGlzIGxpc3QgeWV0KS4KPj4+Cj4+PiBUaGUgcGF0Y2ggaXMgYXQKPj4+IGh0
dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL3JwbXMveGVuL2Jsb2IvbWFzdGVyL2YveGVuLm9j
YW1sLnNhZmUtc3RyaW5ncy5wYXRjaAo+Pj4gd2l0aCB0aGUgcmVsYXRlZCBGZWRvcmEgYnVnIGF0
Cj4+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE1MjY3MDMK
Pj4+Cj4+PiAJTWljaGFlbCBZb3VuZwo+PiBUaGUgcGF0Y2ggbG9va3MgZ29vZCBhbmQgSSB3b3Vs
ZCBwcmVmZXIgdG8gdGFrZSBpdCB0aGFuIHRvIHVzZSAtdW5zYWZlLXN0cmluZyB3aGljaCBpc27i
gJl0IGEgc29sdXRpb24gaW4gdGhlIGxvbmcgcnVuLgo+Pgo+IEhpIENocmlzdGlhbgo+Cj4gSXMg
dGhhdCBhbiBhY2s/Cj4KPiBDb3VsZCB5b3UgcGxlYXNlIGluIGZ1dHVyZSBleHBsaWNpdGx5IGdp
dmUgYW4gQWNrZWQtYnkgb3IgUmV2aWV3ZWQtYnkKPiB0YWcgc28gdGhhdCBjb21taXR0ZXJzIGtu
b3cgdGhleSBjYW4gYXBwbHkgdGhlIHByb3Bvc2VkIHBhdGNoIGRpcmVjdGx5PwoKQWxzbywgaXMg
dGhpcyBwYXRjaCBjb21wYXRpYmxlIHdpdGggT2NhbWwgMy4wOS4zP8KgIElmIG5vdCwgZWl0aGVy
IHRoZQpmaXggb3IgdGhlIG1pbmltdW0gdmVyc2lvbiBvZiBPY2FtbCBuZWVkcyBzdWl0YWJseSBh
ZGp1c3RpbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
