From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] arm: gic: deactivate sgi
 immediately after eoi
Date: Wed, 30 Jan 2019 11:50:41 +0000
Message-ID: <a7a88941-49d6-cfe7-c7c1-33199525751e@arm.com>
References: <20190124125210.6038-1-peng.fan@nxp.com>
 <08d65477-1192-b074-37aa-484101503a23@arm.com>
 <AM0PR04MB448167F2CB1765924B956E2F88900@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cjPf=QG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gooOE-0001zD-DB
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 11:50:46 +0000
In-Reply-To: <AM0PR04MB448167F2CB1765924B956E2F88900@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzMC8wMS8yMDE5IDAxOjIxLCBQZW5nIEZhbiB3cm90ZToKPiBIaSBKdWxpZW4KCkhpIFBl
bmcsCgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
W21haWx0bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0KPj4gU2VudDogMjAxOeW5tDHmnIgyOeaXpSAy
Mzo1Nwo+PiBUbzogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+OyBzc3RhYmVsbGluaUBrZXJu
ZWwub3JnOyBqZ3Jvc3NAc3VzZS5jb20KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgQW5kcmUgUHJ6eXdhcmEKPj4gPGFuZHJlLnByenl3YXJhQGFybS5jb20+Cj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTJdIGFybTogZ2ljOiBkZWFjdGl2YXRlIHNnaSBpbW1lZGlh
dGVseSBhZnRlciBlb2kKPj4KPj4gKCsgQW5kcmUpCj4+Cj4+IEhpIFBlbmcsCj4+Cj4+IE9uIDI0
LzAxLzIwMTkgMTI6NDMsIFBlbmcgRmFuIHdyb3RlOgo+Pj4gT24gaS5NWDgsIHdlIGltcGxlbWVu
dGVkIHBhcnRpdGlvbiByZWJvb3Qgd2hpY2ggbWVhbnMgQ29ydGV4LUEgcmVib290Cj4+PiB3aWxs
IG5vdCBpbXBhY3QgTTQgY29yZXMgYW5kIFN5c3RlbSBjb250cm9sIFVuaXQgY29yZS4gSG93ZXZl
ciBHSUN2Mwo+Pj4gaXMgbm90IHJlc2V0IGJlY2F1c2Ugd2UgYWxzbyBuZWVkIHRvIHN1cHBvcnQg
QTcyIENsdXN0ZXIgcmVib290Cj4+PiB3aXRob3V0IGFmZmVjdGluZyBBNTMgQ2x1c3Rlci4KPj4K
Pj4gSG93IGFib3V0IHRoZSBvdGhlciBpbnRlcnJ1cHRzPyBGb3IgaW5zdGFuY2UsIGl0IHdvdWxk
IGJlIHRoZW9yZXRpY2FsbHkKPj4gcG9zc2libGUgdG8gaGF2ZSBhIFBQSS9TUEkgYWN0aXZlIGFu
ZCByZWNlaXZlIHRoZSBvcmRlciB0byB0dXJuIGl0IG9mZi4gSXMgdGhpcwo+PiBnb2luZyB0byBi
ZSBhbiBpc3N1ZT8KPiAKPiBDdXJyZW50bHkgd2Ugb25seSBtZXQgdGhpcyBpc3N1ZSB3aGVuIGRv
aW5nIFhlbiByZWJvb3QsIGJlY2F1c2UgaGFsdF90aGlzX2NwdSBuZXZlciByZXR1cm4uCj4gRm9y
IG90aGVyIGludGVycnVwdHMsIEkgdGhpbmsgdGhleSBhcmUgZGVhY3RpdmF0ZWQgcHJvcGVybHku
CgpJIGRvbid0IHRoaW5rIHNvLCBJUElzIGhhcyBhbiBoaWdoZXIgcHJpb3JpdHkgdGhhbiBhbGwg
dGhlIG90aGVyIGludGVycnVwdC4gU28gCnlvdSBtYXkgcmVjZWl2ZSB0aGUgSVBJIHdoaWxlIGhh
bmRsaW5nIGFub3RoZXIgaW50ZXJydXB0cy4gVGhpcyB3aWxsIGxlYXZlIHRoZSAKaW50ZXJydXB0
cyBhY3RpdmF0ZWQgd2hpbGUgdHVybmluZyBvZmYgdGhlIHByb2Nlc3Nvci4KCkkgc3Bva2Ugd2l0
aCBNYXJjIFouIChHSUMgZXhwZXJ0KSB0b2RheSByZWdhcmRpbmcgcmVib290aW5nL2tleGVjaW5n
IHdpdGggCmludGVycnVwdHMgYWN0aXZhdGVkLiBIZSBzYWlkIHRoaXMgaXMgYSB2YWxpZCBjYXNl
IGFuZCB0aGUgYm9vdCBjb2RlIHNob3VsZCB0YWtlIApjYXJlIG9mIGRlLWFjdGl2YXRpbmcgYWxs
IGludGVycnVwdHMuIFNvIHlvdXIgZmlyc3QgcGF0Y2ggbWlnaHQgYmUgbW9yZSBzdWl0YWJsZSAK
aGVyZS4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlLiBJIHdpbGwgY29tbWVudCBiYWNrIG9u
IHRoZSBmaXJzdCBvbmUgYWdhaW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
