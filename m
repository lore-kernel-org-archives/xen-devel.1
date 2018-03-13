From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Tue, 13 Mar 2018 14:49:31 +0000
Message-ID: <20180313144931.dbuq2vazzewja363@citrix.com>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
 <1518112198.5629.68.camel@suse.com>
 <20180208180348.moi3fujoq22fkkqg@citrix.com>
 <20180208182400.g4qlkiaetnvqhuo6@citrix.com>
 <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
 <20180212145519.ovy6zfusvhsd24s7@citrix.com>
 <alpine.LFD.2.21.1803092248590.3092@austen3.home>
 <ebb1373d-3996-ed88-bb50-30fea8186487@citrix.com>
 <alpine.LFD.2.21.1803121924410.30826@austen3.home>
 <3883b923-af37-5b74-1aa2-0be8e187c6ca@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tsbs=gd=citrix.com=prvs=6030d9854=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1evlY3-0004RL-MY
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:09:07 +0000
Content-Disposition: inline
In-Reply-To: <3883b923-af37-5b74-1aa2-0be8e187c6ca@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, David Scott <dave@recoil.org>, John Thomson <git@johnthomson.fastmail.com.au>, Dario Faggioli <dfaggioli@suse.com>, Marcello Seri <marcello.seri@citrix.com>, Michael Young <m.a.young@durham.ac.uk>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDk6Mjk6NDlBTSArMDAwMCwgQ2hyaXN0aWFuIExpbmRp
ZyB3cm90ZToKPiBPbiAxMi8wMy8xOCAxOTozNSwgTWljaGFlbCBZb3VuZyB3cm90ZToKPiAKPiA+
IEhlcmUgaXMgdmVyc2lvbiA0IG9mIHRoZSBwYXRjaCB3aGVyZSBJIGhhdmUgcmVwbGFjZWQgdGhl
IHVzZXMgb2YgcyB3aXRoIGIKPiA+IHdoZXJlIHRoZSBwYXRjaCBjaGFuZ2VzIGl0IGZyb20gc3Ry
aW5nIHRvIGJ5dGVzLiBJIGhhdmUgYWxzbyByZW1vdmVkIHRoZQo+ID4gdHdvIHRyYWlsaW5nIHNw
YWNlcyBhbmQgY2hhbmdlZCBzdG1wIGJhY2sgdG8gcy4KPiA+ICDCoMKgwqDCoE1pY2hhZWwgWW91
bmcKPiA+IDAwMDEtbWFrZS14ZW4tb2NhbWwtc2FmZS1zdHJpbmdzLWNvbXBsaWFudC5wYXRjaAo+
ID4gCj4gPiAgRnJvbSBkYTA4OGU0ZWVmMmJiZWE0YmUyNjJlMTJkYjRjMzY5NjBmZjUxNDVhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gRnJvbTogTWljaGFlbCBZb3VuZzxtLmEueW91bmdA
ZHVyaGFtLmFjLnVrPgo+ID4gRGF0ZTogTW9uLCAxMiBNYXIgMjAxOCAxODo0OToyOSArMDAwMAo+
ID4gU3ViamVjdDogW1BBVENIIHY0XSBtYWtlIHhlbiBvY2FtbCBzYWZlLXN0cmluZ3MgY29tcGxp
YW50Cj4gPiAKPiA+IFhlbiBidWlsdCB3aXRoIG9jYW1sIDQuMDYgZ2l2ZXMgZXJyb3JzIHN1Y2gg
YXMKPiA+IEVycm9yOiBUaGlzIGV4cHJlc3Npb24gaGFzIHR5cGUgYnl0ZXMgYnV0IGFuIGV4cHJl
c3Npb24gd2FzCj4gPiAgICAgICAgICBleHBlY3RlZCBvZiB0eXBlIHN0cmluZwo+ID4gYXMgQnl0
ZSBhbmQgc2FmZS1zdHJpbmdzIHdoaWNoIHdlcmUgaW50cm9kdWNlZCBpbiA0LjAyIGFyZSB0aGUK
PiA+IGRlZmF1bHQgaW4gNC4wNi4KPiA+IFRoaXMgcGF0Y2ggd2hpY2ggaXMgcGFydGx5IGJ5IFJp
Y2hhcmQgVy5NLiBKb25lcyBvZiBSZWQgSGF0Cj4gPiBmcm9taHR0cHM6Ly9idWd6aWxsYS5yZWRo
YXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNTI2NzAzCj4gPiBmaXhlcyB0aGVzZSBpc3N1ZXMuCj4g
PiAKPiA+IHY0OiBXaGVyZSBzdHJpbmcgcyBpcyBub3cgYnl0ZXMsIHJlbmFtZSBpdCB0byBiLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFlvdW5nPG0uYS55b3VuZ0BkdXJoYW0uYWMu
dWs+Cj4gPiAtLS0KPiA+ICAgdG9vbHMvb2NhbWwvbGlicy94Yi94Yi5tbCAgICAgICAgfCAzNCAr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gPiAgIHRvb2xzL29jYW1sL2xpYnMv
eGIveGIubWxpICAgICAgIHwgMTAgKysrKystLS0tLQo+ID4gICB0b29scy9vY2FtbC94ZW5zdG9y
ZWQvbG9nZ2luZy5tbCB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiA+ICAgdG9vbHMvb2Nh
bWwveGVuc3RvcmVkL3N0ZGV4dC5tbCAgfCAgMiArLQo+ID4gICB0b29scy9vY2FtbC94ZW5zdG9y
ZWQvdXRpbHMubWwgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0tCj4gPiAgIDUgZmlsZXMgY2hh
bmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCj4gCj4gUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBMaW5kaWc8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgoKVGhhbmtzLiBJ
IHdpbGwgYXBwbHkgdGhpcyBwYXRjaCBzb29uLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
