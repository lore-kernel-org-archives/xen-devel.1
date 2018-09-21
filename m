From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Current staging crashes on boot on an AMD EPYC 7251
Date: Fri, 21 Sep 2018 04:41:16 -0600
Message-ID: <5BA4CACC02000078001EA7F2@prv1-mh.provo.novell.com>
References: <79af1936-5093-d101-d3a5-2abd444551e8@bitdefender.com>
 <20180921101545.th2ncxhjg4qk6rfu@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q3to=md=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g3IsD-0004Bm-Cc
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:41:21 +0000
In-Reply-To: <20180921101545.th2ncxhjg4qk6rfu@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, george.dunlap@citrix.com, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA5LjE4IGF0IDEyOjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgU2VwIDIxLCAyMDE4IGF0IDEyOjQ1OjE4UE0gKzAzMDAsIFJhenZhbiBDb2pvY2Fy
dSB3cm90ZToKPj4gV2hpbGUgZG9pbmcgbXkgYmVzdCB0byBtYWtlIHN1cmUgd2hhdCBJIHVuZGVy
c3RhbmQgdG8gYmUgR2VvcmdlJ3MKPj4gcHJvcG9zZWQgY2hhbmdlcyBmb3IgdGhlIGFsdHAybSBz
ZXJpZXMgSSd2ZSB0cmllZCB0byBib290IFhlbiBzdGFnaW5nIG9uCj4+IGFuIEFNRCBob3N0LCBi
dXQgaXQgY3Jhc2hlcyBpbiBhbiB1bnJlbGF0ZWQgcGxhY2UgKEkndmUgdGVzdGVkIHRoaXMgYnkK
Pj4gc3Rhc2hpbmcgbXkgY2hhbmdlcyBhbmQgYm9vdGluZyBhICJ2YW5pbGxhIiBzdGFnaW5nKToK
PiAKPiBDYW4geW91IGFwcGx5IHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0Y2ggYW5kIHBhc3RlIHRo
ZSBmdWxsIGJvb3QgbG9nPwoKV2VsbCwgbm90IGhhdmluZyBwcm92aWRlZCB0aGUgZnVsbCBib290
IGxvZyByaWdodCBhd2F5IGlzIGNsZWFybHkKdW5oZWxwZnVsLCBhcyBmcm9tIHRoYXQgYWxvbmUg
d2Ugc2hvdWxkIGJlIGFibGUgdG8gdGVsbCB3aGF0J3MKZ29pbmcgb24gaGVyZSAodW5sZXNzIHdl
IGUuZy4gc2NyZXcgdXAgdGhlIEU4MjAgbWFwIHNvbWV3aGVyZSkuCkhvd2V2ZXIsIGl0IGlzIGFs
cmVhZHkgY2xlYXIgdGhhdCAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94
ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC00NjUsNiArNDY1LDggQEAgdW5zaWduZWQgaW50IHBhZ2Vf
Z2V0X3JhbV90eXBlKG1mbl90IG1mbikKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gIAo+ICAgICAg
ICAgIGRlZmF1bHQ6Cj4gK3ByaW50aygiWyUjbHgsICUjbHgpIHR5cGU6ICV1XG4iLCBlODIwLm1h
cFtpXS5hZGRyLAo+ICsgICAgICAgZTgyMC5tYXBbaV0uYWRkciArIGU4MjAubWFwW2ldLnNpemUs
IGU4MjAubWFwW2ldLnR5cGUpOwo+ICAgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsK
Ci4uLiB0aGlzIGFzc2VydGlvbiBuZWVkcyB0byBnbyBhd2F5LCBhcyBpdCB3b3VsZCB0cmlnZ2Vy
IGZvciBib3RoCkU4MjBfVFlQRV9QTUVNIGFuZCBFODIwX1RZUEVfUFJBTSAodXNpbmcgdGhlIExp
bnV4Cm5hbWluZyksIG9yIHRoZSB1bm5hbWVkIHR5cGUgNiBtZW50aW9uZWQgaW4gdGhlaXIgaGVh
ZGVyLiBJdAp3b3VsZCBhbHNvIHRyaWdnZXIgZm9yIHR5cGVzIHdoaWNoIG1heSBnZXQgYWRkZWQg
ZG93biB0aGUgcm9hZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
