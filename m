From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v5 6/9] is_control_domain:
 block speculation
Date: Thu, 7 Feb 2019 11:02:10 +0100
Message-ID: <cd7d6107-ffc9-787e-1ea6-509f7a7b8740@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-7-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <010527AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C5AF7240200007800214562@prv1-mh.provo.novell.com>
 <ac9b91bb-d91d-928c-3178-4000065c8bc2@amazon.de>
 <5C5B04D8020000780021461D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1APC=QO=amazon.de=prvs=93423d84c=nmanthey@srs-us1.protection.inumbo.net>)
 id 1grgVt-0001lK-2J
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 10:02:33 +0000
In-Reply-To: <5C5B04D8020000780021461D@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi82LzE5IDE3OjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNi4wMi4xOSBhdCAx
NjozNiwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IE9uIDIvNi8xOSAxNjowMywgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyOS4wMS4xOSBhdCAxNTo0MywgPG5tYW50aGV5QGFt
YXpvbi5kZT4gd3JvdGU6Cj4+Pj4gQEAgLTkwOCwxMCArOTA5LDEwIEBAIHZvaWQgd2F0Y2hkb2df
ZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7Cj4+Pj4gICAqICAgICh0aGF0IGlzLCB0
aGlzIHdvdWxkIG5vdCBiZSBzdWl0YWJsZSBmb3IgYSBkcml2ZXIgZG9tYWluKQo+Pj4+ICAgKiAg
LSBUaGVyZSBpcyBuZXZlciBhIHJlYXNvbiB0byBkZW55IHRoZSBoYXJkd2FyZSBkb21haW4gYWNj
ZXNzIHRvIHRoaXMKPj4+PiAgICovCj4+Pj4gLSNkZWZpbmUgaXNfaGFyZHdhcmVfZG9tYWluKF9k
KSAoKF9kKSA9PSBoYXJkd2FyZV9kb21haW4pCj4+Pj4gKyNkZWZpbmUgaXNfaGFyZHdhcmVfZG9t
YWluKF9kKSBldmFsdWF0ZV9ub3NwZWMoKF9kKSA9PSBoYXJkd2FyZV9kb21haW4pCj4+Pj4gIAo+
Pj4+ICAvKiBUaGlzIGNoZWNrIGlzIGZvciBmdW5jdGlvbmFsaXR5IHNwZWNpZmljIHRvIGEgY29u
dHJvbCBkb21haW4gKi8KPj4+PiAtI2RlZmluZSBpc19jb250cm9sX2RvbWFpbihfZCkgKChfZCkt
PmlzX3ByaXZpbGVnZWQpCj4+Pj4gKyNkZWZpbmUgaXNfY29udHJvbF9kb21haW4oX2QpIGV2YWx1
YXRlX25vc3BlYygoX2QpLT5pc19wcml2aWxlZ2VkKQo+Pj4gc25pcAo+PiBJIHZhbGlkYXRlZCB0
aGlzIHByb3BlcnR5IGZvciB0aGUgYWJvdmUgY29kZSBzbmlwcGV0IGluIHRoZSBnZW5lcmF0ZWQK
Pj4gYXNzZW1ibHkuIEhvd2V2ZXIsIEkganVzdCBub3RpY2VkIGFub3RoZXIgcHJvYmxlbTogd2hp
bGUgbXkgaW5pdGlhbAo+PiB2ZXJzaW9uIGp1c3QgcGxhY2VkIHRoZSBsZmVuY2UgaW5zdHJ1Y3Rp
b24gcmlnaHQgaW50byB0aGUgY29kZSwgbm90IHRoZQo+PiBhcmNoX2JhcnJpZXJfbm9zcGVjX3Ry
dWUgbWV0aG9kIGlzIGNhbGxlZCB2aWEgY2FsbHEuIEkgd291bGQgbGlrZSB0byBnZXQKPj4gdGhl
IGluc3RydWN0aW9ucyB0byBiZSBlbWJlZGRlZCBpbnRvIHRoZSBjb2RlIGRpcmVjdGx5LCB3aXRo
b3V0IHRoZSBjYWxsCj4+IGRldG91ci4gSW4gY2FzZSBJIGNhbm5vdCBmb3JjZSB0aGUgY29tcGls
ZXIgdG8gZG8gdGhhdCwgSSB3b3VsZCBnbyBiYWNrCj4+IHRvIHVzaW5nIGEgZml4ZWQgbGZlbmNl
IHN0YXRlbWVudCBvbiBhbGwgeDg2IHBsYXRmb3Jtcy4KPiBJIHRoaW5rIHdlIGhhZCBtYWRlIHBy
ZXR0eSBjbGVhciB0aGF0IGluY3VycmluZyB0aGUgb3ZlcmhlYWQgZXZlbgo+IG9udG8gdW5hZmZl
Y3RlZCBwbGF0Zm9ybXMgaXMgbm90IGFuIG9wdGlvbi4gRGlkIHlvdSB0cnkgd2hldGhlcgo+IGFk
ZGluZyBhbHdheXNfaW5saW5lIGhlbHBzPyAoSSB0YWtlIGl0IHRoYXQgdGhpcyBpcyBhbm90aGVy
IGNhc2Ugb2YKPiB0aGUgc2l6ZS1vZi1hc20gaXNzdWUgdGhhdCdzIGJlaW5nIHdvcmtlZCBvbiBp
biBMaW51eCBhcyB3ZWxsIGlpcmMuKQoKSSBmdWxseSB1bmRlcnN0YW5kIHRoYXQganVzdCB1c2lu
ZyBsZmVuY2UgZXZlcnl3aGVyZSBpcyBub3QgYW4gb3B0aW9uLgoKSSBqdXN0IHRlc3RlZCB0aGUg
YWx3YXlzX2lubGluZSBvcHRpb24sIGFuZCB0aGF0IHdvcmtzIGZvciBteSBiaW5hcnkuIEkKd2ls
bCBhZGFwdMKgIHRoZSBmdW5jdGlvbiBkZWZpbml0aW9uIGFjY29yZGluZ2x5LgoKQmVzdCwKTm9y
YmVydAoKPgo+IEphbgo+Cj4KCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBH
bWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0
aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdl
dHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
