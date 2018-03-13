From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Tue, 13 Mar 2018 09:29:49 +0000
Message-ID: <3883b923-af37-5b74-1aa2-0be8e187c6ca@citrix.com>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
 <1518112198.5629.68.camel@suse.com>
 <20180208180348.moi3fujoq22fkkqg@citrix.com>
 <20180208182400.g4qlkiaetnvqhuo6@citrix.com>
 <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
 <20180212145519.ovy6zfusvhsd24s7@citrix.com>
 <alpine.LFD.2.21.1803092248590.3092@austen3.home>
 <ebb1373d-3996-ed88-bb50-30fea8186487@citrix.com>
 <alpine.LFD.2.21.1803121924410.30826@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fbfh=gd=citrix.com=prvs=603348594=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1evgFp-0001cD-UG
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 09:29:57 +0000
In-Reply-To: <alpine.LFD.2.21.1803121924410.30826@austen3.home>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, Dario Faggioli <dfaggioli@suse.com>, Marcello Seri <marcello.seri@citrix.com>, David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDMvMTggMTk6MzUsIE1pY2hhZWwgWW91bmcgd3JvdGU6Cgo+IEhlcmUgaXMgdmVyc2lv
biA0IG9mIHRoZSBwYXRjaCB3aGVyZSBJIGhhdmUgcmVwbGFjZWQgdGhlIHVzZXMgb2YgcyB3aXRo
IGIKPiB3aGVyZSB0aGUgcGF0Y2ggY2hhbmdlcyBpdCBmcm9tIHN0cmluZyB0byBieXRlcy4gSSBo
YXZlIGFsc28gcmVtb3ZlZCB0aGUKPiB0d28gdHJhaWxpbmcgc3BhY2VzIGFuZCBjaGFuZ2VkIHN0
bXAgYmFjayB0byBzLgo+ICDCoMKgwqDCoE1pY2hhZWwgWW91bmcKPiAwMDAxLW1ha2UteGVuLW9j
YW1sLXNhZmUtc3RyaW5ncy1jb21wbGlhbnQucGF0Y2gKPgo+ICBGcm9tIGRhMDg4ZTRlZWYyYmJl
YTRiZTI2MmUxMmRiNGMzNjk2MGZmNTE0NWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJv
bTogTWljaGFlbCBZb3VuZzxtLmEueW91bmdAZHVyaGFtLmFjLnVrPgo+IERhdGU6IE1vbiwgMTIg
TWFyIDIwMTggMTg6NDk6MjkgKzAwMDAKPiBTdWJqZWN0OiBbUEFUQ0ggdjRdIG1ha2UgeGVuIG9j
YW1sIHNhZmUtc3RyaW5ncyBjb21wbGlhbnQKPgo+IFhlbiBidWlsdCB3aXRoIG9jYW1sIDQuMDYg
Z2l2ZXMgZXJyb3JzIHN1Y2ggYXMKPiBFcnJvcjogVGhpcyBleHByZXNzaW9uIGhhcyB0eXBlIGJ5
dGVzIGJ1dCBhbiBleHByZXNzaW9uIHdhcwo+ICAgICAgICAgIGV4cGVjdGVkIG9mIHR5cGUgc3Ry
aW5nCj4gYXMgQnl0ZSBhbmQgc2FmZS1zdHJpbmdzIHdoaWNoIHdlcmUgaW50cm9kdWNlZCBpbiA0
LjAyIGFyZSB0aGUKPiBkZWZhdWx0IGluIDQuMDYuCj4gVGhpcyBwYXRjaCB3aGljaCBpcyBwYXJ0
bHkgYnkgUmljaGFyZCBXLk0uIEpvbmVzIG9mIFJlZCBIYXQKPiBmcm9taHR0cHM6Ly9idWd6aWxs
YS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNTI2NzAzCj4gZml4ZXMgdGhlc2UgaXNzdWVz
Lgo+Cj4gdjQ6IFdoZXJlIHN0cmluZyBzIGlzIG5vdyBieXRlcywgcmVuYW1lIGl0IHRvIGIuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFlvdW5nPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+Cj4g
LS0tCj4gICB0b29scy9vY2FtbC9saWJzL3hiL3hiLm1sICAgICAgICB8IDM0ICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgIHRvb2xzL29jYW1sL2xpYnMveGIveGIubWxpICAg
ICAgIHwgMTAgKysrKystLS0tLQo+ICAgdG9vbHMvb2NhbWwveGVuc3RvcmVkL2xvZ2dpbmcubWwg
fCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0tCj4gICB0b29scy9vY2FtbC94ZW5zdG9yZWQvc3Rk
ZXh0Lm1sICB8ICAyICstCj4gICB0b29scy9vY2FtbC94ZW5zdG9yZWQvdXRpbHMubWwgICB8IDIw
ICsrKysrKysrKystLS0tLS0tLS0tCj4gICA1IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMo
KyksIDQzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBMaW5kaWc8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPgoKVGhpcyBwYXRjaCBpcyBnb29kIHRvIGdvLiBPbmUgY2F2
ZWF0LCB0aG91Z2g6IHRoZSBjb252ZXJzaW9uIGJldHdlZW4gYnl0ZXMgYW5kIHN0cmluZ3MKaXMg
bm90IGp1c3QgYSBjYXN0IGJ1dCBpbnZvbHZlcyBjb3B5aW5nIGFuZCB0aHVzIGhhcyBhIHBlcmZv
cm1hbmNlIGNvc3Qgd2hpY2ggd2UKd2FudCB0byBrZWVwIGluIG1pbmQuIFRoZSBPQ2FtbCBsb3ct
bGV2ZWwgbGlicmFyaWVzIGxpa2UgVW5peC5yZWFkIHJldHVybiAobXV0YWJsZSkgYnl0ZXMsCmJ1
dCBtb3N0IGNvZGUgZXhwZWN0cyAoaW1tdXRhYmxlKSBzdHJpbmdzLiBJIGJlbGlldmUgdGhhdCBp
dCB3b3VsZCBiZSBkaWZmaWN1bHQgdG8gYXZvaWQKdGhpcyBpbiB0aGUgbG9uZyBydW4gYW5kIHRo
aXMgcGF0Y2ggaXMgdGhlIHJpZ2h0IHdheSB0byBnby4KCi0tIENocmlzdGlhbgogIAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
