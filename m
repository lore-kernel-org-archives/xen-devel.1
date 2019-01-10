From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 11/15] xsm,
 argo: XSM control for argo register
Date: Wed, 9 Jan 2019 23:08:31 -0800
Message-ID: <CACMJ4GZNp=P=fTiZ7=vXjdq0BsVaki8Sp2pvCe+_kAUs-YExuw@mail.gmail.com>
References: <BA190A75E8413C49BB9E1D2B85D118118CBCC2F6@MSMR-GH1-UEA01.corp.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gkqY=PS=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghUSO-00009I-Cv
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 07:08:48 +0000
Received: by mail-lj1-x244.google.com with SMTP id c19-v6so8723035lja.5
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 23:08:46 -0800 (PST)
In-Reply-To: <BA190A75E8413C49BB9E1D2B85D118118CBCC2F6@MSMR-GH1-UEA01.corp.nsa.gov>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "DeGraaf, Daniel G" <dgdegra@nsa.gov>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gNywgMjAxOSBhdCAzOjA3IFBNIERlR3JhYWYsIERhbmllbCBHIDxkZ2RlZ3Jh
QG5zYS5nb3Y+IHdyb3RlOgo+Cj4gPiBGcm9tOiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3Bo
ZXIudy5jbGFya0BnbWFpbC5jb20+Cj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMTEvMTVdIHhzbSwg
YXJnbzogWFNNIGNvbnRyb2wgZm9yIGFyZ28gcmVnaXN0ZXIKPiA+Cj4gPiBYU00gY29udHJvbHMg
Zm9yIGFyZ28gcmluZyByZWdpc3RyYXRpb24gd2l0aCB0d28gZGlzdGluY3QgY2FzZXMsIHdoZXJl
Cj4gPiB0aGUgcmluZyBiZWluZyByZWdpc3RlcmVkIGlzOgo+ID4KPiA+IDEpIFNpbmdsZSBzb3Vy
Y2U6ICByZWdpc3RlcmluZyBhIHJpbmcgZm9yIGNvbW11bmljYXRpb24gdG8gcmVjZWl2ZSBtZXNz
YWdlcwo+ID4gICAgICAgICAgICAgICAgICAgIGZyb20gYSBzcGVjaWZpZWQgc2luZ2xlIG90aGVy
IGRvbWFpbi4KPiA+ICAgIERlZmF1bHQgcG9saWN5OiBhbGxvdy4KPiA+Cj4gPiAyKSBBbnkgc291
cmNlOiAgICAgcmVnaXN0ZXJpbmcgYSByaW5nIGZvciBjb21tdW5pY2F0aW9uIHRvIHJlY2VpdmUg
bWVzc2FnZXMKPiA+ICAgICAgICAgICAgICAgICAgICBmcm9tIGFueSwgb3IgYWxsLCBvdGhlciBk
b21haW5zIChpZS4gd2lsZGNhcmQpLgo+ID4gICAgRGVmYXVsdCBwb2xpY3k6IGRlbnksIHdpdGgg
cnVudGltZSBwb2xpY3kgY29uZmlndXJhdGlvbiB2aWEgYm9vdHBhcmFtLgo+ID4KPiA+IFRoZSBl
eGlzdGluZyBhcmdvLW1hYyBib290IHBhcmFtZXRlciBpbmRpY2F0ZXMgYWRtaW5pc3RyYXRvciBw
cmVmZXJlbmNlIGZvcgo+ID4gZWl0aGVyIHBlcm1pc3NpdmUgb3Igc3RyaWN0IGFjY2VzcyBjb250
cm9sLCB3aGljaCB3aWxsIGFsbG93IG9yIGRlbnkKPiA+IHJlZ2lzdHJhdGlvbiBvZiBhbnktc2Vu
ZGVyIHJpbmdzLgo+ID4KPiA+IFRoaXMgY29tbWl0IG1vZGlmaWVzIHRoZSBzaWduYXR1cmUgb2Yg
Y29yZSBYU00gaG9vayBmdW5jdGlvbnMgaW4gb3JkZXIgdG8KPiA+IGFwcGx5ICdjb25zdCcgdG8g
YXJndW1lbnRzLCBuZWVkZWQgaW4gb3JkZXIgZm9yICdjb25zdCcgdG8gYmUgYWNjZXB0ZWQgaW4K
PiA+IHNpZ25hdHVyZSBvZiBmdW5jdGlvbnMgdGhhdCBpbnZva2UgdGhlbS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3Rl
bXMuY29tPgo+Cj4gQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2Eu
Z292Pgo+Cj4gV2hpbGUgaXQgZG9lcyBub3QgbmVlZCB0byBiZSBhIHBhcnQgb2YgdGhpcyBwYXRj
aCwgc29tZXdoZXJlIGluIHRoZSBzZXJpZXMgeW91IHNob3VsZCBhZGQgYSBydWxlIGFsbG93aW5n
IHRoZXNlIGZlYXR1cmVzIHRvIGJlIHVzZWQgYnkgZ3Vlc3RzIGluIHRoZSBkZWZhdWx0IFhTTSBw
b2xpY3k7IHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL2d1ZXN0X2ZlYXR1cmVzLnRlIGlzIHdo
ZXJlIGZlYXR1cmVzIGxpa2UgdGhpcyBoYXZlIHByZXZpb3VzbHkgYmVlbiBoYW5kbGVkLiAgU2lu
Y2UgeW91J3JlIGFkZGluZyBwZXJtaXNzaW9ucyBvbmUgYXQgYSB0aW1lLCB5b3UgY291bGQgYWRk
IHRoZSBydWxlcyBhbGwgYXQgb25jZSBvciBhcyBhIHBhcnQgb2YgdGhlIHBhdGNoIGFkZGluZyB0
aGUgdmVjdG9yLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3cywgYWNrcyBhbmQgcG9pbnRlciB0byB0
aGUgcG9saWN5IGZpbGUuIEkgd2lsbAphZGQgdG8gdGhlIGRlZmF1bHQgWFNNIHBvbGljeSBpbiB0
aGUgbmV4dCByZXZpc2lvbiB0aGF0IEkgcG9zdC4KCnRoYW5rcywKCkNocmlzdG9waGVyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
