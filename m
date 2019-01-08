From: Liam Merwick <liam.merwick@oracle.com>
Subject: Re: [RFC v2 1/4] elf: Add optional function ptr to
 load_elf() to parse ELF notes
Date: Tue, 8 Jan 2019 14:47:43 +0000
Message-ID: <896d7d97-f79e-25e8-0bae-47bc5725fe35@oracle.com>
References: <1545422632-24444-1-git-send-email-liam.merwick@oracle.com>
 <1545422632-24444-2-git-send-email-liam.merwick@oracle.com>
 <20190102130650.GM24009@stefanha-x1.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NCgq=PQ=oracle.com=liam.merwick@srs-us1.protection.inumbo.net>)
 id 1ggsfW-0005gr-Qo
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 14:47:50 +0000
In-Reply-To: <20190102130650.GM24009@stefanha-x1.localdomain>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: ehabkost@redhat.com, mst@redhat.com, maran.wilson@oracle.com, qemu-devel@nongnu.org, george.kennedy@oracle.com, xen-devel@lists.xenproject.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net, sgarzare@redhat.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMS8yMDE5IDEzOjA2LCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6Cj4gT24gRnJpLCBE
ZWMgMjEsIDIwMTggYXQgMDg6MDM6NDlQTSArMDAwMCwgTGlhbSBNZXJ3aWNrIHdyb3RlOgo+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9lbGZfb3BzLmggYi9pbmNsdWRlL2h3L2VsZl9vcHMuaAo+
PiBpbmRleCA3NDY3OWZmOGRhM2EuLjM3ZDIwYTM4MDBjMSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS9ody9lbGZfb3BzLmgKPj4gKysrIGIvaW5jbHVkZS9ody9lbGZfb3BzLmgKPj4gQEAgLTI2Niw2
ICsyNjYsNyBAQCBmYWlsOgo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgaW50IGdsdWUobG9hZF9l
bGYsIFNaKShjb25zdCBjaGFyICpuYW1lLCBpbnQgZmQsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50NjRfdCAoKmVsZl9ub3RlX2ZuKSh2b2lkICosIHZvaWQgKiwgYm9vbCks
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKCp0cmFuc2xhdGVf
Zm4pKHZvaWQgKiwgdWludDY0X3QpLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKnRyYW5zbGF0ZV9vcGFxdWUsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IG11c3Rfc3dhYiwgdWludDY0X3QgKnBlbnRyeSwKPj4gQEAgLTQ5Niw4ICs0OTcsMzAg
QEAgc3RhdGljIGludCBnbHVlKGxvYWRfZWxmLCBTWikoY29uc3QgY2hhciAqbmFtZSwgaW50IGZk
LAo+PiAgICAgICAgICAgICAgICAgICBoaWdoID0gYWRkciArIG1lbV9zaXplOwo+PiAgIAo+PiAg
ICAgICAgICAgICAgIGRhdGEgPSBOVUxMOwo+PiArCj4+ICsgICAgICAgIH0gZWxzZSBpZiAocGgt
PnBfdHlwZSA9PSBQVF9OT1RFICYmIGVsZl9ub3RlX2ZuKSB7Cj4+ICsgICAgICAgICAgICBzdHJ1
Y3QgZWxmX25vdGUgKm5oZHIgPSBOVUxMOwo+PiArCj4+ICsgICAgICAgICAgICBmaWxlX3NpemUg
PSBwaC0+cF9maWxlc3o7IC8qIFNpemUgb2YgdGhlIHJhbmdlIG9mIEVMRiBub3RlcyAqLwo+PiAr
ICAgICAgICAgICAgZGF0YSA9IGdfbWFsbG9jMChmaWxlX3NpemUpOwo+PiArICAgICAgICAgICAg
aWYgKHBoLT5wX2ZpbGVzeiA+IDApIHsKPj4gKyAgICAgICAgICAgICAgICBpZiAobHNlZWsoZmQs
IHBoLT5wX29mZnNldCwgU0VFS19TRVQpIDwgMCkgewo+PiArICAgICAgICAgICAgICAgICAgICBn
b3RvIGZhaWw7Cj4+ICsgICAgICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAgICAgIGlmIChy
ZWFkKGZkLCBkYXRhLCBmaWxlX3NpemUpICE9IGZpbGVfc2l6ZSkgewo+PiArICAgICAgICAgICAg
ICAgICAgICBnb3RvIGZhaWw7Cj4+ICsgICAgICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAg
fQo+PiArCj4+ICsgICAgICAgICAgICBpZiAobmhkciAhPSBOVUxMKSB7Cj4+ICsgICAgICAgICAg
ICAgICAgYm9vbCBpczY0ID0KPj4gKyAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBl
bGZfbm90ZSkgPT0gc2l6ZW9mKHN0cnVjdCBlbGY2NF9ub3RlKTsKPj4gKyAgICAgICAgICAgICAg
ICBlbGZfbm90ZV9mbigodm9pZCAqKW5oZHIsICh2b2lkICopJnBoLT5wX2FsaWduLCBpczY0KTsK
PiAKPiBIb3cgZG9lcyBkYXRhIGdldCB1c2VkPwoKTW92ZWQgKGFzIHN1Z2dlc3RlZCBpbiBjb21t
ZW50cyBmb3IgbmV4dCBwYXRjaCkKCj4gCj4+ICsgICAgICAgICAgICB9Cj4+ICsgICAgICAgICAg
ICBnX2ZyZWUoZGF0YSk7Cj4gCj4gTWlzc2luZyBkYXRhID0gTlVMTCB0byBwcmV2ZW50IGRvdWJs
ZSBmcmVlIGxhdGVyPwo+IAoKQWRkZWQgZXhwbGljaXQgYXNzaWdubWVudC4KClJlZ2FyZHMsCkxp
YW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
