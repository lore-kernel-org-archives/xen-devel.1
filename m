From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] xen/input: do not advertise multi-touch
	pressure support
Date: Tue, 2 Jan 2018 09:39:53 -0800
Message-ID: <20180102173953.tje4tz2ng3fnfijw__37487.4195237227$1514914752$gmane$org@dtor-ws>
References: <1514880775-31185-1-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fzr4=d5=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1eWQXf-0004nt-FZ
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 17:39:59 +0000
Received: by mail-it0-x243.google.com with SMTP id d16so40147192itj.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2018 09:39:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1514880775-31185-1-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel@lists.xenproject.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, Andrii Chepurnyi <andrii_chepurnyi@epam.com>, linux-input@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDIsIDIwMTggYXQgMTA6MTI6NTVBTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+IFNvbWUgdXNlci1zcGFjZSBhcHBsaWNhdGlv
bnMgZXhwZWN0IG11bHRpLXRvdWNoIHByZXNzdXJlCj4gb24gY29udGFjdCB0byBiZSByZXBvcnRl
ZCBpZiBpdCBpcyBhZHZlcnRpc2VkIGluIGRldmljZQo+IHByb3BlcnRpZXMuIE90aGVyd2lzZSwg
c3VjaCBhcHBsaWNhdGlvbnMgbWF5IHRyZWF0IHJlcG9ydHMKPiBub3QgYXMgYWN0dWFsIHRvdWNo
ZXMsIGJ1dCBob3ZlcmluZy4gQ3VycmVudGx5IHRoaXMgaXMKPiBvbmx5IGFkdmVydGlzZWQsIGJ1
dCBub3QgcmVwb3J0ZWQuCj4gRml4IHRoaXMgYnkgbm90IGFkdmVydGlzaW5nIHRoYXQgQUJTX01U
X1BSRVNTVVJFIGlzIHN1cHBvcnRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmlpIENoZXB1cm55aSA8YW5kcmlpX2NoZXB1cm55aUBlcGFtLmNvbT4KCkFwcGxp
ZWQsIHRoYW5rIHlvdS4KCj4gLS0tCj4gIGRyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQu
YyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYyBiL2RyaXZlcnMvaW5wdXQvbWlz
Yy94ZW4ta2JkZnJvbnQuYwo+IGluZGV4IDZiZjU2YmI1ZjhkOS4uZDkxZjNiMWM1Mzc1IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+ICsrKyBiL2RyaXZl
cnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+IEBAIC0zMjYsOCArMzI2LDYgQEAgc3RhdGlj
IGludCB4ZW5rYmRfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPiAgCQkJCSAgICAg
MCwgd2lkdGgsIDAsIDApOwo+ICAJCWlucHV0X3NldF9hYnNfcGFyYW1zKG10b3VjaCwgQUJTX01U
X1BPU0lUSU9OX1ksCj4gIAkJCQkgICAgIDAsIGhlaWdodCwgMCwgMCk7Cj4gLQkJaW5wdXRfc2V0
X2Fic19wYXJhbXMobXRvdWNoLCBBQlNfTVRfUFJFU1NVUkUsCj4gLQkJCQkgICAgIDAsIDI1NSwg
MCwgMCk7Cj4gIAo+ICAJCXJldCA9IGlucHV0X210X2luaXRfc2xvdHMobXRvdWNoLCBudW1fY29u
dCwgSU5QVVRfTVRfRElSRUNUKTsKPiAgCQlpZiAocmV0KSB7Cj4gLS0gCj4gMi43LjQKPiAKCi0t
IApEbWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
