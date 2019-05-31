From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen-netback: remove redundant assignment to
 err
Date: Fri, 31 May 2019 08:20:05 +0100
Message-ID: <20190531072005.GC25537@zion.uk.xensource.com>
References: <20190530190438.9571-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+xl=T7=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hWbpn-0008MJ-MF
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 07:20:15 +0000
Content-Disposition: inline
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Colin King <colin.king@canonical.com>
Cc: Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, "David S . Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDg6MDQ6MzhQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZSB2YXJpYWJsZSBlcnIgaXMgYXNzaWduZWQgd2l0aCB0aGUgdmFsdWUgLUVOT01FTSB0aGF0
IGlzIG5ldmVyCj4gcmVhZCBhbmQgaXQgaXMgcmUtYXNzaWduZWQgYSBuZXcgdmFsdWUgbGF0ZXIg
b24uICBUaGUgYXNzaWdubWVudCBpcwo+IHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4g
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4gU2lnbmVkLW9mZi1ieTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFja2VkLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKCj4gLS0tCj4gIGRyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL2ludGVyZmFjZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+IGluZGV4
IDc4MzE5ODg0NGRkNy4uMjQwZjc2MmIzNzQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL2ludGVyZmFjZS5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50
ZXJmYWNlLmMKPiBAQCAtNjMzLDcgKzYzMyw3IEBAIGludCB4ZW52aWZfY29ubmVjdF9kYXRhKHN0
cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAo+ICAJCQl1bnNpZ25lZCBpbnQgcnhfZXZ0Y2huKQo+
ICB7Cj4gIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7Cj4gLQlpbnQgZXJyID0gLUVOT01FTTsK
PiArCWludCBlcnI7Cj4gIAo+ICAJQlVHX09OKHF1ZXVlLT50eF9pcnEpOwo+ICAJQlVHX09OKHF1
ZXVlLT50YXNrKTsKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
