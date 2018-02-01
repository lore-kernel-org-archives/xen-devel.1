From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: fix frontend driver disconnected from
 xenbus on removal
Date: Thu, 1 Feb 2018 15:08:22 -0500
Message-ID: <3943477e-7768-ceb3-38a3-3a20cb0e3082__35472.3106873736$1517515610$gmane$org@oracle.com>
References: <1517475439-10541-1-git-send-email-andr2000@gmail.com>
 <1517475439-10541-2-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h7in=e3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ehL9F-0005qx-Os
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 20:07:53 +0000
In-Reply-To: <1517475439-10541-2-git-send-email-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, otubo@redhat.com, david.vrabel@citrix.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDEvMjAxOCAwMzo1NyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Cj4gQ3VycmVudCB4ZW5idXMgZnJvbnRlbmQgZHJpdmVyIHJlbW92YWwgZmxvdyBm
aXJzdCBkaXNjb25uZWN0cwo+IHRoZSBkcml2ZXIgZnJvbSB4ZW5idXMgYW5kIHRoZW4gY2FsbHMg
ZHJpdmVyJ3MgcmVtb3ZlIGNhbGxiYWNrLgo+IFRoaXMgbWFrZXMgaXQgaW1wb3NzaWJsZSBmb3Ig
dGhlIGRyaXZlciB0byBsaXN0ZW4gdG8gYmFja2VuZCdzCj4gc3RhdGUgY2hhbmdlcyBhbmQgc3lu
Y2hyb25pemUgdGhlIHJlbW92YWwgcHJvY2VkdXJlLgo+Cj4gRml4IHRoaXMgYnkgcmVtb3Zpbmcg
b3RoZXIgZW5kIFhlbkJ1cyB3YXRjaGVzIGFmdGVyIHRoZQo+IGRyaXZlcidzIHJlbW92ZSBjYWxs
YmFjayBpcyBjYWxsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+
IGluZGV4IDc0ODg4Y2FjZDBiMC4uOWM2M2NkM2Y0MTZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmUuYwo+IEBAIC0yNTgsMTEgKzI1OCwxMSBAQCBpbnQgeGVuYnVzX2Rldl9yZW1vdmUo
c3RydWN0IGRldmljZSAqX2RldikKPiAgCj4gIAlEUFJJTlRLKCIlcyIsIGRldi0+bm9kZW5hbWUp
Owo+ICAKPiAtCWZyZWVfb3RoZXJlbmRfd2F0Y2goZGV2KTsKPiAtCj4gIAlpZiAoZHJ2LT5yZW1v
dmUpCj4gIAkJZHJ2LT5yZW1vdmUoZGV2KTsKCgpJcyBpdCBwb3NzaWJsZSBmb3IgdGhlIHdhdGNo
IHRvIGZpcmUgaGVyZT8KCi1ib3JpcwoKPiAgCj4gKwlmcmVlX290aGVyZW5kX3dhdGNoKGRldik7
Cj4gKwo+ICAJZnJlZV9vdGhlcmVuZF9kZXRhaWxzKGRldik7Cj4gIAo+ICAJeGVuYnVzX3N3aXRj
aF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2VkKTsKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
