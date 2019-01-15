From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Tue, 15 Jan 2019 01:36:39 -0700
Message-ID: <5C3D9B97020000780020DA23@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <5C3C9A5B020000780020D4A6@prv1-mh.provo.novell.com>
 <CACMJ4GZccfvKhBYBd+iNtbuSpGvVQ5OEF6BU8+NNbhF7Z=ERFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjKFA-0007Sb-AK
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:38:44 +0000
In-Reply-To: <CACMJ4GZccfvKhBYBd+iNtbuSpGvVQ5OEF6BU8+NNbhF7Z=ERFQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE5IGF0IDA4OjU2LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IE9uIE1vbiwgSmFuIDE0LCAyMDE5IGF0IDY6MTkgQU0gSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4gPj4+IE9uIDA3LjAxLjE5IGF0IDA4OjQyLCA8Y2hy
aXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+PiA+ICsgICAgLyoKPj4gPiArICAg
ICAqIEEgcmluZyBtdXN0IGJlIGxhcmdlIGVub3VnaCB0byB0cmFuc21pdCBtZXNzYWdlcywgc28g
cmVxdWlyZXMgc3BhY2UgZm9yOgo+PiA+ICsgICAgICogKiAxIG1lc3NhZ2UgaGVhZGVyLCBwbHVz
Cj4+ID4gKyAgICAgKiAqIDEgcGF5bG9hZCBzbG90IChwYXlsb2FkIGlzIGFsd2F5cyByb3VuZGVk
IHRvIGEgbXVsdGlwbGUgb2YgMTYgYnl0ZXMpCj4+ID4gKyAgICAgKiAgIGZvciB0aGUgbWVzc2Fn
ZSBwYXlsb2FkIHRvIGJlIHdyaXR0ZW4gaW50bywgcGx1cwo+PiA+ICsgICAgICogKiAxIG1vcmUg
c2xvdCwgc28gdGhhdCB0aGUgcmluZyBjYW5ub3QgYmUgZmlsbGVkIHRvIGNhcGFjaXR5IHdpdGgg
YQo+PiA+ICsgICAgICogICBzaW5nbGUgbWVzc2FnZSAtLSBzZWUgdGhlIGxvZ2ljIGluIHJpbmdi
dWZfaW5zZXJ0IC0tIGFsbG93aW5nIGZvciB0aGlzCj4+ID4gKyAgICAgKiAgIGVuc3VyZXMgdGhh
dCB0aGVyZSBjYW4gYmUgc3BhY2UgcmVtYWluaW5nIHdoZW4gYSBtZXNzYWdlIGlzIHByZXNlbnQu
Cj4+ID4gKyAgICAgKiBUaGUgYWJvdmUgZGV0ZXJtaW5lcyB0aGUgbWluaW11bSBhY2NlcHRhYmxl
IHJpbmcgc2l6ZS4KPj4gPiArICAgICAqLwo+PiA+ICsgICAgaWYgKCAocmVnLmxlbiA8IChzaXpl
b2Yoc3RydWN0IHhlbl9hcmdvX3JpbmdfbWVzc2FnZV9oZWFkZXIpCj4+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICArIFJPVU5EVVBfTUVTU0FHRSgxKSArIFJPVU5EVVBfTUVTU0FHRSgxKSkpIHx8
Cj4+Cj4+IFRoZXNlIHR3byBzdW1tYW5kcyBkb24ndCBsb29rIHRvIGZ1bGZpbGwgdGhlICJjYW5u
b3QgYmUgZmlsbGVkIHRvCj4+IGNhcGFjaXR5IiBjb25zdHJhaW50IHRoZSBjb21tZW50IGRlc2Ny
aWJlcywgYXMgKGFpdWkpIG1lc3NhZ2VzCj4+IGNhbiBiZSBsYXJnZXIgdGhhbiAxNiBieXRlcy4g
V2hhdCdzIHRoZSBkZWFsPwo+IAo+IFRoaXMgaXMgaW50ZW5kZWQgdG8gYmUgYWJvdXQgYm91bmQg
Y2hlY2tpbmcgcmVnLmxlbiBhZ2FpbnN0IGEgbWluaW11bQo+IHNpemU6IHRoZSBzbWFsbGVzdCBy
aW5nIHRoYXQgeW91IGNhbiBmaXQgYSBtZXNzYWdlIG9udG8sIGFzIGRldGVybWluZWQKPiBieSB0
aGUgbG9naWMgaW4gcmluZ2J1Zl9pbnNlcnQuIFRoZSBzbWFsbGVzdCBtZXNzYWdlIHlvdSBjYW4g
c2VuZCBpczoKPiBzaXplb2Yoc3RydWN0IHhlbl9hcmdvX3JpbmdfbWVzc2FnZV9oZWFkZXIpICsg
Uk9VTkRVUF9NRVNTQUdFKDEpCj4gCj4gYW5kIHRoZW4gcmluZ2J1Zl9pbnNlcnQgd29uJ3QgYWNj
ZXB0IGEgbWVzc2FnZSB1bmxlc3MgdGhlcmUgaXMgKGF0Cj4gbGVhc3QpIFJPVU5EVVBfTUVTU0FH
RSgxKSBzcGFjZSByZW1haW5pbmcsIHNvIHRoYXQsIHBsdXMgdGhlIHNtYWxsZXN0Cj4gbWVzc2Fn
ZSBzaXplLCBpcyB0aGUgc21hbGxlc3QgdmlhYmxlIHJpbmcuIFRoZXJlJ3Mgbm8gcG9pbnQgYWNj
ZXB0aW5nCj4gcmVnaXN0cmF0aW9uIG9mIGEgcmluZyBzbWFsbGVyIHRoYW4gdGhhdC4KPiAKPiBZ
b3UncmUgcmlnaHQgdGhhdCBtZXNzYWdlcyBjYW4gYmUgbGFyZ2VyIHRoYW4gMTYgYnl0ZXMsIGJ1
dCB0aGV5IGNhbgo+IG9ubHkgYmUgc2VudCB0byByaW5ncyB0aGF0IGFyZSBsYXJnZXIgdGhhbiB0
aGF0IG1pbmltdW0gLSBvbiBhIG1pbmltdW0KPiBzaXplZCByaW5nLCB0aGV5J2xsIGJlIHJlamVj
dGVkIGJ5IHNlbmR2LgoKU28gcGVyaGFwcyB0aGUgY29tbWVudCB3YW50cyB0byBzYXkgIi4uLiBj
YW5ub3QgYmUgZmlsbGVkIHRvIGNhcGFjaXR5CndpdGggYSBzaW5nbGUsIG1pbmltdW0gc2l6ZSBt
ZXNzYWdlIj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
