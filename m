From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [livepatch-build-tools part2 4/6] livepatch-build:
 detect special section group sizes
Date: Mon, 29 Apr 2019 15:14:55 +0100
Message-ID: <2a5512e7-7f82-340d-75cf-cd14be0018b9@citrix.com>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-4-wipawel@amazon.de>
 <20190425045339.GE11831@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190425045339.GE11831@char.us.oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz <wipawel@amazon.de>
Cc: mpohlack@amazon.de, Glenn Enright <glenn@rimuhosting.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gNC8yNS8xOSA1OjUzIEFNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6Cj4gT24gVHVl
LCBBcHIgMTYsIDIwMTkgYXQgMTI6MDc6MTRQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtpZXdpY3og
d3JvdGU6Cj4+IEhhcmQtY29kaW5nIHRoZSBzcGVjaWFsIHNlY3Rpb24gZ3JvdXAgc2l6ZXMgaXMg
dW5yZWxpYWJsZS4gSW5zdGVhZCwKPj4gZGV0ZXJtaW5lIHRoZW0gZHluYW1pY2FsbHkgYnkgZmlu
ZGluZyB0aGUgcmVsYXRlZCBzdHJ1Y3QgZGVmaW5pdGlvbnMKPj4gaW4gdGhlIERXQVJGIG1ldGFk
YXRhLgo+Pgo+PiBUaGlzIGlzIGEgbGl2ZXBhdGNoIGJhY2twb3J0IG9mIGtwYXRjaCB1cHN0cmVh
bSBjb21taXQgWzFdOgo+PiBrcGF0Y2gtYnVpbGQ6IGRldGVjdCBzcGVjaWFsIHNlY3Rpb24gZ3Jv
dXAgc2l6ZXMgMTcwNDQ5ODQ3MTM2YTQ4YjE5ZmMKPj4KPj4gWGVuIG9ubHkgZGVhbHMgd2l0aCBh
bHRfaW5zdHIsIGJ1Z19mcmFtZSBhbmQgZXhjZXB0aW9uX3RhYmxlX2VudHJ5Cj4+IHN0cnVjdHVy
ZXMsIHNvIHNpemVzIG9mIHRoZXNlIHN0cnVjdGVycyBhcmUgb2J0YWluZWQgZnJvbSB4ZW4tc3lt
cy4KPj4KPj4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIHNpbmNlIHdpdGggcmVjZW50IFhlbiB0aGUg
YWx0X2luc3RyIHN0cnVjdHVyZQo+PiBoYXMgY2hhbmdlZCBzaXplIGZyb20gMTIgdG8gMTQgYnl0
ZXMuCj4gCj4gT2ggdGhpcyBpcyBzbyBtdWNoIGJldHRlciB0aGFuIHRoZSAic29sdXRpb24iIHdl
IGNvZGVkLgo+IAo+IFRoYW5rIHlvdSEKPiAKPiBSb3NzLCB3aWxsIGNvbW1pdCB0byByZXBvIHVu
bGVzcyB5b3UgaGF2ZSBjb25jZXJucy4uCkkgaGF2ZSByZXZpZXdlZCBpdCB3aXRoIGEgZmV3IGNv
bW1lbnRzLiBOb3RlIHRoYXQgdGhpcyBpcyBiYXNpY2FsbHkgdGhlIApzYW1lIGFzIEdsZW5uIEVu
cmlnaHQncyByZWNlbnQgcGF0Y2ggKCJsaXZlcGF0Y2gtYnVpbGQtdG9vbHM6IERldGVjdCAKc3Bl
Y2lhbCBzZWN0aW9uIGdyb3VwIHNpemVzIikgYnV0IHNsaWdodGx5IG1vcmUgY29tcGxldGUgYXMg
aXQgZGV0ZWN0cyAKc2l6ZXMgZm9yIHRoZSBidWcgZnJhbWVzIHRvbyBzbyBpdCBzaG91bGQgcHJv
YmFibHkgYmUgdXNlZCBpbnN0ZWFkLgoKVGhhbmtzLAotLSAKUm9zcyBMYWdlcndhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
