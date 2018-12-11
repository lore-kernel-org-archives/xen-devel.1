From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 07/18] xen: add event channel interface
 for XenDevice-s
Date: Tue, 11 Dec 2018 15:43:52 +0000
Message-ID: <7a3465bbcbd441638ebe1eec7623599c@AMSPEX02CL03.citrite.net>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-8-git-send-email-paul.durrant@citrix.com>
 <20181211152455.GT18875@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWkCv-0004Gq-Id
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:44:25 +0000
In-Reply-To: <20181211152455.GT18875@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxMSBEZWNlbWJlciAyMDE4IDE1
OjI1Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA3LzE4XSB4ZW46
IGFkZCBldmVudCBjaGFubmVsIGludGVyZmFjZSBmb3IKPiBYZW5EZXZpY2Utcwo+IAo+IE9uIFR1
ZSwgRGVjIDExLCAyMDE4IGF0IDEwOjQ3OjA3QU0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToK
PiA+IFRoZSBsZWdhY3kgUFYgYmFja2VuZCBpbmZyYXN0cnVjdHVyZSBwcm92aWRlcyBmdW5jdGlv
bnMgdG8gYmluZCwgdW5iaW5kCj4gPiBhbmQgc2VuZCBub3RpZmljYXRpb25zIHRvIGV2ZW50IGNo
YW5ubmVscy4gU2ltaWxhciBmdW5jdGlvbmFsaXR5IHdpbGwgYmUKPiA+IHJlcXVpcmVkIGJ5IFhl
bkRldmljZSBpbXBsZW1lbnRhdGlvbnMgc28gdGhpcyBwYXRjaCBhZGRzIHRoZSBuZWNlc3NhcnkK
PiA+IHN1cHBvcnQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gCj4gV2hlbiBhbmQgd2hlcmUgZGlkIHRoaXMgcmV2aWV3
IGhhcHBlbmQ/IEkgY2FuIG9ubHkgZmluZCBteSByZXZpZXctYnkgdGFnCj4gb24gdjIsIHdoaWNo
IGlzIG1pc3NpbmcgaGVyZS4KPiAKCk9oLCB0aGF0IG11c3QgaGF2ZSBiZWVuIG15IG1pc3Rha2Uu
Li4gSSBjdXQnbidwYXN0ZWQgdGhlIHdyb25nIGxpbmUuIEFwb2xvZ2llcyB0byBTdGVmYW5vIGFu
ZCB5b3Vyc2VsZi4uLiBJJ2xsIGZpeCBpdCBpbiB2NC4KCiAgUGF1bAoKPiAtLQo+IEFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
