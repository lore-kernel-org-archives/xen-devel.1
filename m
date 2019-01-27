From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v4 07/11] nospec: enable
 lfence on Intel
Date: Sun, 27 Jan 2019 21:09:46 +0100
Message-ID: <7b2d38cb-d61a-026f-63ca-e52f55cfa27b@amazon.de>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244655-32180-7-git-send-email-nmanthey@amazon.de>
 <996754ba-3eab-6e96-5f75-e7cafeef6503@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6qU4=QD=amazon.de=prvs=923bc5b51=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gnqkm-0004Xh-Gz
 for xen-devel@lists.xenproject.org; Sun, 27 Jan 2019 20:10:04 +0000
In-Reply-To: <996754ba-3eab-6e96-5f75-e7cafeef6503@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Bjoern Doebel <doebel@amazon.de>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yNC8xOSAyMzoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMy8wMS8yMDE5IDEx
OjU3LCBOb3JiZXJ0IE1hbnRoZXkgd3JvdGU6Cj4+IFdoaWxlIHRoZSBsZmVuY2UgaW5zdHJ1Y3Rp
b24gd2FzIGFkZGVkIGZvciBhbGwgeDg2IHBsYXRmb3JtIGluIHRoZQo+PiBiZWdpbm5pbmcsIGl0
J3MgdXNlZnVsIHRvIG5vdCBibG9jayBwbGF0Zm9ybXMgdGhhdCBhcmUgbm90IGFmZmVjdGVkCj4+
IGJ5IHRoZSBMMVRGIHZ1bG5lcmFiaWxpdHkuIFRoZXJlZm9yZSwgdGhlIGxmZW5jZSBpbnN0cnVj
dGlvbiBzaG91bGQKPj4gb25seSBiZSBpbnRyb2R1Y2VkLCBpbiBjYXNlIHRoZSBjdXJyZW50IENQ
VSBpcyBhbiBJbnRlbCBDUFUgdGhhdCBpcwo+PiBjYXBhYmxlIG9mIGh5cGVyIHRocmVhZGluZy4g
VGhpcyBjb21iaW5hdGlvbiBvZiBmZWF0dXJlcyBpcyBhZGRlZAo+PiB0byB0aGUgZmVhdHVyZXMg
dGhhdCBhY3RpdmF0ZSB0aGUgYWx0ZXJuYXRpdmUuCj4+Cj4+IFRoaXMgY29tbWl0IGlzIHBhcnQg
b2YgdGhlIFNwZWN0cmVWMStMMVRGIG1pdGlnYXRpb24gcGF0Y2ggc2VyaWVzLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPj4KPj4gLS0t
Cj4+ICB4ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggfCA4ICsrKysrKy0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL25vc3BlYy5oIGIveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9z
cGVjLmgKPj4gQEAgLTcsNiArNyw3IEBACj4+ICAjaWZuZGVmIFhFTl9OT1NQRUNfSAo+PiAgI2Rl
ZmluZSBYRU5fTk9TUEVDX0gKPj4gIAo+PiArI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgo+
PiAgI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4KPj4gIAo+PiAgLyoqCj4+IEBAIC02OCw3ICs2OSwx
MCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFza19ub3NwZWMo
dW5zaWduZWQgbG9uZyBpbmRleCwKPj4gICAqIGFsbG93IHRvIGluc2VydCBhIHJlYWQgbWVtb3J5
IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMKPj4gICAqLwo+PiAgI2lmZGVmIENPTkZJR19YODYK
Pj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJtYigpOyByZXR1cm4g
dHJ1ZTsgfQo+PiArc3RhdGljIGlubGluZSBib29sIGxmZW5jZV90cnVlKHZvaWQpIHsKPj4gKyAg
ICBhbHRlcm5hdGl2ZSgiIiwgImxmZW5jZSIsIFg4Nl9WRU5ET1JfSU5URUwpOwo+IFRoaXMgZG9l
c24ndCBkbyB3aGF0IHlvdSBleHBlY3QuwqAgSXQgd2lsbCBjYXVzZSB0aGUgbGZlbmNlcyB0byBi
ZQo+IHBhdGNoZWQgaW50byBleGlzdGVuY2Ugb24gYW55IGhhcmR3YXJlIHdpdGggYW4gRlBVIChi
ZWZvcmUgYSByZWNlbnQKPiBwYXRjaCBvZiBtaW5lKSBvciB3aXRoIFZNRSAoYWZ0ZXIgYSByZWNl
bnQgcGF0Y2gpLgoKQWZ0ZXIgbG9va2luZyBtb3JlIGludG8gdGhpcywgSSB3b3VsZCBpbnRyb2R1
Y2UgYW5vdGhlciBzeW50aGVzaXplZCBDUFUKZmVhdHVyZSBmbGFnLCBzbyB0aGF0IGFsdGVybmF0
aXZlIHBhdGNoaW5nIGNhbiB1c2UgdGhpcyBmbGFnIHRvIHBhdGNoCnRoZSBsZmVuY2UgaW4sIGlu
IGNhc2UgdGhlIGRldGVjdGVkIHBsYXRmb3JtIGlzIHZ1bG5lcmFibGUgdG8gTDFURi4gSQp3b3Vs
ZCBzZXQgdGhpcyBmbGFnIGJhc2VkIG9uIHdoZXRoZXIgYW4gTDFURiB2dWxuZXJhYmxlIHBsYXRm
b3JtIGlzCmRldGVjdGVkLCBhbmQgYW4gaW50cm9kdWNlZCBjb21tYW5kIGxpbmUgb3B0aW9uIGRv
ZXMgbm90IHByZXZlbnQgdGhpcy4KSXMgdGhpcyB3aGF0IHlvdSBlbnZpc2lvbiwgb3IgZG8gSSBt
aXNzIHNvbWV0aGluZz8KCkJlc3QsCk5vcmJlcnQKCj4KPiB+QW5kcmV3CgoKCgpBbWF6b24gRGV2
ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4K
R2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0
LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVu
YnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
