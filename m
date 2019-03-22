From: Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: Re: [PATCH v1 1/4] xen: add hypercall for getting
 parameters at runtime
Date: Fri, 22 Mar 2019 20:13:13 +0100
Message-ID: <41a6bf3a5fcd9e6692d91a8527ebb1c2cf22f1f9.camel@suse.com>
References: <20190306125832.93901vliaskovitis@suse.com>
 <20190306125832.93902vliaskovitis@suse.com>
 <5C89313F020000780021E497@suse.com>
 <cea582cc2d10bfff1f3932df582d7369a59609a4.camel@suse.com>
 <5C8FA508020000780021FE6B@suse.com>
 <bc2190c092ead3c29167b0ca3417e01afcfdec2f.camel@suse.com>
 <5C8FCEF1020000780021FFF5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zzNK=RZ=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1h7Pbn-00043A-Ci
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 19:13:39 +0000
In-Reply-To: <5C8FCEF1020000780021FFF5@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE5LTAzLTE4IGF0IDE4OjAxICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiBBbiBhbHRlcm5hdGl2ZSBwcm90b3R5cGUgY291bGQgYmU6Cj4gPiA+ID4gICAgICAgICAg
ICAgaW50ICgqZ2V0X2Z1bmMpKGNoYXIgKm91dHB1dCk7Cj4gPiA+ID4gaWYgd2Ugd2FudCB0aGUg
ZnVuY3Rpb24gdG8gd3JpdGUgdGhlIGN1cnJlbnQgcGFyYW1ldGVyIHZhbHVlCj4gPiA+ID4gaW50
byBhCj4gPiA+ID4gY2FsbGVyLXByb3ZpZGVkIGJ1ZmZlciwgYW5kIHBvc3NpYmx5IHJldHVybiBl
cnJvciBjb2Rlcy4KPiA+ID4gCj4gPiA+IEFuZCBob3cgd291bGQgdGhlIGNhbGxlZSBrbm93IGhv
dyBtdWNoIHNwYWNlIHRoZXJlIGlzPwo+ID4gCj4gPiB5ZXMsIGFuIGV4dHJhIHNpemUgYXJndW1l
bnQgd291bGQgYmUgbmVlZGVkIGZyb20gdGhlIGNhbGxlciBoZXJlLgo+ID4gCj4gPiBMZXQgbWUg
a25vdyBpZiBlaXRoZXIgb2YgdGhlc2Ugb3IgYSBkaWZmZXJlbnQgYXBwcm9hY2ggaXMKPiA+IHBy
ZWZlcnJlZC4KPiAKPiBPZiB0aGUgdHdvLCBJIGNsZWFybHkgcHJlZmVyIHRoZSBsYXR0ZXIuIFRo
ZW4gYWdhaW4gbWUgaGF2aW5nIHBvaW50ZWQKPiBvdXQgdGhlIHNob3J0Y29taW5nIGRvZXNuJ3Qg
bWVhbiB3ZSAoYW5kIGhlbmNlIHlvdSBmb3IgdGhpcyBwYXRjaCkKPiBhYnNvbHV0ZWx5IGhhdmUg
dG8gZGVhbCB3aXRoIGN1c3RvbSBwYXJhbWV0ZXJzLiAKClVubGVzcyB0aGVyZSBhcmUgb2JqZWN0
aW9ucywgSSB0aGluayAnbGwgc2VuZCBhIHYyIGFib3V0IGdldHRpbmcgbm9uLQpjdXN0b20gcGFy
YW1ldGVyIHR5cGVzIGZpcnN0LCBhbmQgZGVhbCB3aXRoIGN1c3RvbSBwYXJhbWV0ZXJzIGluIGEK
c2VwYXJhdGUgZnV0dXJlIHBhdGNoc2V0LgoKdGhhbmtzLAoKLSBWYXNpbGlzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
