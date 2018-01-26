From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Fri, 26 Jan 2018 09:29:20 +0000
Message-ID: <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zvi/=ev=citrix.com=prvs=557898145=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1ef0K8-00058j-Cy
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 09:29:28 +0000
In-Reply-To: <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
Content-Language: en-US
Content-ID: <13C8327CC2585245B7D8787C38041339@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: M A Young <m.a.young@durham.ac.uk>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, John Thomson <git@johnthomson.fastmail.com.au>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMjYuIEphbiAyMDE4LCBhdCAwOTowOSwgTSBBIFlvdW5nIDxtLmEueW91bmdAZHVy
aGFtLmFjLnVrPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgMjYgSmFuIDIwMTgsIEpvaG4gVGhvbXNv
biB3cm90ZToNCj4gDQo+PiBVc2UgYXV0b2NvbmYgdG8gdGVzdCBpZiBvY2FtbCB2ZXJzaW9uID49
IDQuMDINCj4+IElmIHNvLCB1c2UgLXVuc2FmZS1zdHJpbmcgZm9yIG9jYW1sb3B0IGFuZCBvY2Ft
bGMNCj4+IA0KPj4gQnl0ZXMgJiBzYWZlLXN0cmluZyB3ZXJlIGludHJvZHVjZWQgaW4gb2NhbWwg
NC4wMiAoMjAxNS0wNy0yNykNCj4+IA0KPj4gV2l0aCBvY2FtbCA0LjA2LCAtc2FmZS1zdHJpbmcg
aXMgbm93IGRlZmF1bHQNCj4+IFRoaXMgc2VwYXJhdGVzIHRoZSB0eXBlcyBieXRlcyAobXV0YWJs
ZSBzdHJpbmcpIGFuZCBzdHJpbmcNCj4gDQo+IEZvciBGZWRvcmEgUmF3aGlkZSwgd2hpY2ggaGFz
IG9jYW1sIDQuMDYsIHdlIGNhbWUgdXAgd2l0aCBhIHBhdGNoIHRvIG1ha2UgDQo+IHhlbiBvY2Ft
bCBzYWZlLXN0cmluZ3MgY29tcGxpYW50ICh3aGljaCBJIGhhdmVuJ3QgZ290IGFyb3VuZCB0byBz
dWJtaXR0aW5nIA0KPiB0byB0aGlzIGxpc3QgeWV0KS4NCj4gDQo+IFRoZSBwYXRjaCBpcyBhdA0K
PiBodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL3hlbi9ibG9iL21hc3Rlci9mL3hl
bi5vY2FtbC5zYWZlLXN0cmluZ3MucGF0Y2gNCj4gd2l0aCB0aGUgcmVsYXRlZCBGZWRvcmEgYnVn
IGF0DQo+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTUyNjcw
Mw0KPiANCj4gCU1pY2hhZWwgWW91bmcNCg0KVGhlIHBhdGNoIGxvb2tzIGdvb2QgYW5kIEkgd291
bGQgcHJlZmVyIHRvIHRha2UgaXQgdGhhbiB0byB1c2UgLXVuc2FmZS1zdHJpbmcgd2hpY2ggaXNu
4oCZdCBhIHNvbHV0aW9uIGluIHRoZSBsb25nIHJ1bi4NCg0K4oCUIENocmlzdGlhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
