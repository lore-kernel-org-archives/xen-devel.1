From: Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-devel] [QEMU PATCH] block: Remove
 blk_attach_dev_legacy() / legacy_dev code
Date: Tue, 22 Jan 2019 15:57:12 +0100
Message-ID: <0afc242e-65d9-5abb-2a95-e4952f0ee164@redhat.com>
References: <1545149484-4929-1-git-send-email-thuth@redhat.com>
 <25d1e73d-ca73-9cb4-d959-8353f49f36b7@redhat.com>
 <20190122144617.GA5220@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6ID+=P6=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1glxUM-0007O7-KP
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 14:57:18 +0000
In-Reply-To: <20190122144617.GA5220@localhost.localdomain>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, paul.durrant@citrix.com, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS0wMS0yMiAxNTo0NiwgS2V2aW4gV29sZiB3cm90ZToKPiBBbSAyMi4wMS4yMDE5IHVt
IDE1OjE5IGhhdCBUaG9tYXMgSHV0aCBnZXNjaHJpZWJlbjoKPj4gT24gMjAxOC0xMi0xOCAxNzox
MSwgVGhvbWFzIEh1dGggd3JvdGU6Cj4+PiBUaGUgbGFzdCB1c2VyIG9mIGJsa19hdHRhY2hfZGV2
X2xlZ2FjeSgpIGlzIHRoZSBjb2RlIGluIHhlbl9kaXNrLmMuCj4+PiBJdCBwYXNzZXMgYSBwb2lu
dGVyIHRvIGEgWGVuQmxrRGV2IGFzIHNlY29uZCBwYXJhbWV0ZXIuIFhlbkJsa0Rldgo+Pj4gaXMg
ZGVyaXZlZCBmcm9tIFhlbkRldmljZSB3aGljaCBpbiB0dXJuIGlzIGRlcml2ZWQgZnJvbSBEZXZp
Y2VTdGF0ZQo+Pj4gc2luY2UgY29tbWl0IDNhNmM5MTcyYWM1OTUxZSAoInhlbjogY3JlYXRlIHFk
ZXYgZm9yIGVhY2ggYmFja2VuZCBkZXZpY2UiKS4KPj4+IFRodXMgdGhlIGNvZGUgY2FuIGFsc28g
c2ltcGx5IHVzZSBibGtfYXR0YWNoX2RldigpIHdpdGggYSBwb2ludGVyCj4+PiB0byB0aGUgRGV2
aWNlU3RhdGUgaW5zdGVhZC4KPj4+IFNvIHdlIGNhbiBmaW5hbGx5IHJlbW92ZSBhbGwgY29kZSBy
ZWxhdGVkIHRvIHRoZSAibGVnYWN5X2RldiIgZmxhZywgdG9vLAo+Pj4gYW5kIHR1cm4gdGhlIHJl
bGF0ZWQgInZvaWQgKiIgaW4gYmxvY2stYmFja2VuZC5jIGludG8gIkRldmljZVN0YXRlICoiCj4+
PiB0byBmaXggc29tZSBvZiB0aGUgcmVtYWluaW5nIFRPRE9zIHRoZXJlLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiAgTm90
ZTogSSBoYXZlbid0IHRlc3RlZCB0aGUgWGVuIGNvZGUgc2luY2UgSSBkb24ndCBoYXZlIGEgd29y
a2luZyBYZW4KPj4+ICBpbnN0YWxsYXRpb24gYXQgaGFuZC4gSSdkIGFwcHJlY2lhdGUgaWYgc29t
ZW9uZSBjb3VsZCBjaGVjayBpdC4uLgo+Pgo+PiBQaW5nPwo+IAo+IFRoaXMgbmVlZHMgYSByZWJh
c2UuIHhlbl9kaXNrLmMgZG9lc24ndCBldmVuIGV4aXN0IGFueSBtb3JlIGFuZAo+IGJsa19hdHRh
Y2hfZGV2X2xlZ2FjeSgpIGlzIHJlYWxseSBkZWFkIGNvZGUgbm93LgoKQWgsIGdyZWF0LCB0aGF0
IG1ha2VzIGl0IGV2ZW4gZWFzaWVyISBJJ2xsIHNlbmQgYSB2MiB0byByZW1vdmUgdGhlCnJlbWFp
bmRlcnMuLi4KCiBUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
