From: Glenn Enright <glenn@rimuhosting.com>
Subject: Re: [livepatch-build-tools part2 4/6] livepatch-build:
 detect special section group sizes
Date: Tue, 30 Apr 2019 09:53:34 +1200
Message-ID: <b67c1a12-ea7d-544f-f6ca-9bef7696a62f@rimuhosting.com>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-4-wipawel@amazon.de>
 <20190425045339.GE11831@char.us.oracle.com>
 <2a5512e7-7f82-340d-75cf-cd14be0018b9@citrix.com>
Reply-To: glenn@rimuhosting.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2a5512e7-7f82-340d-75cf-cd14be0018b9@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz <wipawel@amazon.de>
Cc: mpohlack@amazon.de, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDQvMTkgMjoxNCBBTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gT24gNC8yNS8xOSA1
OjUzIEFNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6Cj4+IE9uIFR1ZSwgQXByIDE2LCAy
MDE5IGF0IDEyOjA3OjE0UE0gKzAwMDAsIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+Pj4g
SGFyZC1jb2RpbmcgdGhlIHNwZWNpYWwgc2VjdGlvbiBncm91cCBzaXplcyBpcyB1bnJlbGlhYmxl
LiBJbnN0ZWFkLAo+Pj4gZGV0ZXJtaW5lIHRoZW0gZHluYW1pY2FsbHkgYnkgZmluZGluZyB0aGUg
cmVsYXRlZCBzdHJ1Y3QgZGVmaW5pdGlvbnMKPj4+IGluIHRoZSBEV0FSRiBtZXRhZGF0YS4KPj4+
Cj4+PiBUaGlzIGlzIGEgbGl2ZXBhdGNoIGJhY2twb3J0IG9mIGtwYXRjaCB1cHN0cmVhbSBjb21t
aXQgWzFdOgo+Pj4ga3BhdGNoLWJ1aWxkOiBkZXRlY3Qgc3BlY2lhbCBzZWN0aW9uIGdyb3VwIHNp
emVzIDE3MDQ0OTg0NzEzNmE0OGIxOWZjCj4+Pgo+Pj4gWGVuIG9ubHkgZGVhbHMgd2l0aCBhbHRf
aW5zdHIsIGJ1Z19mcmFtZSBhbmQgZXhjZXB0aW9uX3RhYmxlX2VudHJ5Cj4+PiBzdHJ1Y3R1cmVz
LCBzbyBzaXplcyBvZiB0aGVzZSBzdHJ1Y3RlcnMgYXJlIG9idGFpbmVkIGZyb20geGVuLXN5bXMu
Cj4+Pgo+Pj4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIHNpbmNlIHdpdGggcmVjZW50IFhlbiB0aGUg
YWx0X2luc3RyIHN0cnVjdHVyZQo+Pj4gaGFzIGNoYW5nZWQgc2l6ZSBmcm9tIDEyIHRvIDE0IGJ5
dGVzLgo+Pgo+PiBPaCB0aGlzIGlzIHNvIG11Y2ggYmV0dGVyIHRoYW4gdGhlICJzb2x1dGlvbiIg
d2UgY29kZWQuCj4+Cj4+IFRoYW5rIHlvdSEKPj4KPj4gUm9zcywgd2lsbCBjb21taXQgdG8gcmVw
byB1bmxlc3MgeW91IGhhdmUgY29uY2VybnMuLgo+IEkgaGF2ZSByZXZpZXdlZCBpdCB3aXRoIGEg
ZmV3IGNvbW1lbnRzLiBOb3RlIHRoYXQgdGhpcyBpcyBiYXNpY2FsbHkgdGhlCj4gc2FtZSBhcyBH
bGVubiBFbnJpZ2h0J3MgcmVjZW50IHBhdGNoICgibGl2ZXBhdGNoLWJ1aWxkLXRvb2xzOiBEZXRl
Y3QKPiBzcGVjaWFsIHNlY3Rpb24gZ3JvdXAgc2l6ZXMiKSBidXQgc2xpZ2h0bHkgbW9yZSBjb21w
bGV0ZSBhcyBpdCBkZXRlY3RzCj4gc2l6ZXMgZm9yIHRoZSBidWcgZnJhbWVzIHRvbyBzbyBpdCBz
aG91bGQgcHJvYmFibHkgYmUgdXNlZCBpbnN0ZWFkLgo+IAo+IFRoYW5rcywKCgpUaGlzIGlzIGEg
Z29vZG5lc3MuIEdsYWQgdG8gc2VlIGFuIGFwcHJvcHJpYXRlIHBhdGNoIGdldCBpbiByZWdhcmRs
ZXNzCm9mIHdoaWNoIHBhdGNoIGlzIHVzZWQuCgpCZXN0LCBHbGVubgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
