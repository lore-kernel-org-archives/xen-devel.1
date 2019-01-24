From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Thu, 24 Jan 2019 20:28:52 +0000
Message-ID: <c8c07d33-150d-483f-9ed8-f090f4f2f330@arm.com>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <1548355642.9022.23.camel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QrD7=QA=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1gmldu-000873-UC
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 20:30:30 +0000
In-Reply-To: <1548355642.9022.23.camel@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>, "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAxODo0NywgTnVlcm5iZXJnZXIsIFN0ZWZhbiB3cm90ZToKPiBPbiBUaHUs
IDIwMTktMDEtMjQgYXQgMjA6MzMgKzAyMDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IEZyb206
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+IC0tLQo+PiDCoHhl
bi9hcmNoL2FybS9naWMtdmdpYy5jIHwgMiArLQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dp
Yy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+PiBpbmRleCA0ODkyMmY1Li42ODRm
MmQxIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+PiArKysgYi94ZW4v
YXJjaC9hcm0vZ2ljLXZnaWMuYwo+PiBAQCAtNDQzLDcgKzQ0Myw3IEBAIGludCB2Z2ljX2Nvbm5l
Y3RfaHdfaXJxKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdAo+PiB2Y3B1ICp2LCB1bnNpZ25lZCBp
bnQgdmlycSwKPj4gwqDCoMKgwqDCoGludCByZXQgPSAwOwo+PiDCoAo+PiDCoMKgwqDCoMKgLyog
ImRlc2MiIGlzIG9wdGlvbmFsIHdoZW4gd2UgZGlzY29ubmVjdCBhbiBJUlEuICovCj4+IC3CoMKg
wqDCoEFTU0VSVChjb25uZWN0ICYmIGRlc2MpOwo+PiArwqDCoMKgwqBBU1NFUlQoY29ubmVjdCB8
fCBkZXNjKTsKPiAKPiBJIGFzc3VtZSBpdCBzaG91bGQgYmXCoEFTU0VSVCghY29ubmVjdCB8fCBk
ZXNjKTsKCkRyYXdpbmcgdGhlIHRydXRoIHRhYmxlIGFuZCB0aHJvd2luZyBhbGwgbXkgQ1MgdGV4
dCBib29rIGJvb2xlYW4Ka25vd2xlZGdlIGF0IGl0IDotKSAgWWVzLCBTdGVmYW4ncyB2ZXJzaW9u
IG1hdGNoZXMgdGhlIGNvbW1lbnQuCgpQbHVzIHdoYXQgSnVsaWVuIHNhaWQgYWJvdXQgdGhlIGNv
bW1pdCBtZXNzYWdlLgoKQ2hlZXJzLApBbmRyZQoKPj4gwqAKPj4gwqDCoMKgwqDCoC8qIFdlIGFy
ZSB0YWtpbmcgdG8gcmFuayBsb2NrIHRvIHByZXZlbnQgcGFyYWxsZWwgY29ubmVjdGlvbnMuCj4+
ICovCj4+IMKgwqDCoMKgwqB2Z2ljX2xvY2tfcmFuayh2X3RhcmdldCwgcmFuaywgZmxhZ3MpOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
