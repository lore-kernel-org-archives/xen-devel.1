From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 3/9] x86/hvm: block
 speculative out-of-bound accesses
Date: Tue, 12 Feb 2019 15:05:48 +0100
Message-ID: <64fdf4b6-69be-d262-b4e4-1dd0d424a777@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-4-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CE6AAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62C9600200007800215EA7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Davx=QT=amazon.de=prvs=939bf3a90=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gtYhU-0004ES-Bu
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 14:06:16 +0000
In-Reply-To: <5C62C9600200007800215EA7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxNDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBAQCAtMzQ1Myw3ICszNDU2LDgg
QEAgaW50IGh2bV9tc3JfcmVhZF9pbnRlcmNlcHQodW5zaWduZWQgaW50IG1zciwgdWludDY0X3Qg
Km1zcl9jb250ZW50KQo+PiAgICAgICAgICBpZiAoIChpbmRleCAvIDIpID49Cj4+ICAgICAgICAg
ICAgICAgTUFTS19FWFRSKHYtPmFyY2guaHZtLm10cnIubXRycl9jYXAsIE1UUlJjYXBfVkNOVCkg
KQo+PiAgICAgICAgICAgICAgZ290byBncF9mYXVsdDsKPj4gLSAgICAgICAgKm1zcl9jb250ZW50
ID0gdmFyX3JhbmdlX2Jhc2VbaW5kZXhdOwo+PiArICAgICAgICAqbXNyX2NvbnRlbnQgPSB2YXJf
cmFuZ2VfYmFzZVthcnJheV9pbmRleF9ub3NwZWMoaW5kZXgsCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAyKk1BU0tfRVhUUih2LT5hcmNoLmh2bS5tdHJyLm10cnJfY2FwLCBNVFJSY2FwX1ZD
TlQpKV07Cj4gTWlzc2luZyBibGFua3MgYXJvdW5kICouIFRoaXMgYWxvbmUgd291bGQgYmUgZWFz
eSB0byBhZGp1c3Qgd2hpbGUKPiBjb21taXR0aW5nLCBidXQgdGhlcmUncyBzdGlsbCB0aGUgb25s
eSBwYXJ0aWFsbHkgZGlzY3Vzc2VkIHF1ZXN0aW9uCj4gcmVnYXJkaW5nIC4uLgo+Cj4+IEBAIC00
MTA0LDYgKzQxMDgsMTIgQEAgc3RhdGljIGludCBodm1vcF9zZXRfcGFyYW0oCj4+ICAgICAgaWYg
KCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
Pj4gIAo+PiArICAgIC8qCj4+ICsgICAgICogTWFrZSBzdXJlIHRoZSBndWVzdCBjb250cm9sbGVk
IHZhbHVlIGEuaW5kZXggaXMgYm91bmRlZCBldmVuIGR1cmluZwo+PiArICAgICAqIHNwZWN1bGF0
aXZlIGV4ZWN1dGlvbi4KPj4gKyAgICAgKi8KPj4gKyAgICBhLmluZGV4ID0gYXJyYXlfaW5kZXhf
bm9zcGVjKGEuaW5kZXgsIEhWTV9OUl9QQVJBTVMpOwo+PiArCj4+ICAgICAgZCA9IHJjdV9sb2Nr
X2RvbWFpbl9ieV9hbnlfaWQoYS5kb21pZCk7Cj4+ICAgICAgaWYgKCBkID09IE5VTEwgKQo+PiAg
ICAgICAgICByZXR1cm4gLUVTUkNIOwo+PiBAQCAtNDM3MCw2ICs0MzgwLDEyIEBAIHN0YXRpYyBp
bnQgaHZtb3BfZ2V0X3BhcmFtKAo+PiAgICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1T
ICkKPj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICAKPj4gKyAgICAvKgo+PiArICAgICAq
IE1ha2Ugc3VyZSB0aGUgZ3Vlc3QgY29udHJvbGxlZCB2YWx1ZSBhLmluZGV4IGlzIGJvdW5kZWQg
ZXZlbiBkdXJpbmcKPj4gKyAgICAgKiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCj4+ICsgICAgICov
Cj4+ICsgICAgYS5pbmRleCA9IGFycmF5X2luZGV4X25vc3BlYyhhLmluZGV4LCBIVk1fTlJfUEFS
QU1TKTsKPiAuLi4gdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlc2UgdHdvLiBUbyBtYWtlIGZvcndhcmQg
cHJvZ3Jlc3MgaXQgbWF5Cj4gYmUgd29ydGh3aGlsZSB0byBzcGxpdCBvZmYgdGhlc2UgdHdvIGNo
YW5nZXMgaW50byBhIHNlcGFyYXRlIHBhdGNoLgo+IElmIHlvdSdyZSBmaW5lIHdpdGggdGhpcywg
SSBjb3VsZCBzdHJpcCB0aGVzZSB0d28gYmVmb3JlIGNvbW1pdHRpbmcsCj4gaW4gd2hpY2ggY2Fz
ZSB0aGUgcmVtYWluaW5nIGNoYW5nZSBpcwo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpUYWtpbmcgYXBhcnQgdGhlIGNvbW1pdCBpcyBmaW5lIHdpdGggbWUu
IEkgd2lsbCBzdWJtaXQgYSBmb2xsb3cgdXAKY2hhbmdlIHRoYXQgZG9lcyBub3QgdXBkYXRlIHRo
ZSB2YWx1ZXMgYnV0IGZpeGVzIHRoZSByZWFkcy4KCkJlc3QsCk5vcmJlcnQKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
