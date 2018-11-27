From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 18/18] xen/arm: Suspend/resume console on
 Xen suspend/resume
Date: Tue, 27 Nov 2018 18:46:26 +0000
Message-ID: <d6b214c4-80f1-94e7-7c06-07d7edf2092b@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-19-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=By1U=OG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gRiNT-0008ER-M4
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 18:46:31 +0000
In-Reply-To: <1542022244-22977-19-git-send-email-mirela.simonovic@aggios.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: stefano.stabellini@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com
List-Id: xen-devel@lists.xenproject.org

SGkgTWlyZWxhLAoKT24gMTEvMTIvMTggMTE6MzAgQU0sIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6
Cj4gVGhpcyBpcyBkb25lIHVzaW5nIGdlbmVyaWMgY29uc29sZV9zdXNwZW5kL3Jlc3VtZSBmdW5j
dGlvbnMgdGhhdCBjYXVzZQo+IHVhcnQgZHJpdmVyIHNwZWNpZmljIHN1c3BlbmQvcmVzdW1lIGhh
bmRsZXJzIHRvIGJlIGNhbGxlZCBmb3IgZWFjaAo+IGluaXRpYWxpemVkIHBvcnQgKGlmIHRoZSBw
b3J0IGhhcyBzdXNwZW5kL3Jlc3VtZSBkcml2ZXIgaGFuZGxlcnMKPiBpbXBsZW1lbnRlZCkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFNpbW9ub3ZpYyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dp
b3MuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNhZWVkIE5vd3NoYWRpIDxzYWVlZC5ub3dzaGFkaUB4
aWxpbnguY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3N1c3BlbmQuYyB8IDE0ICsrKysrKysr
KysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vc3VzcGVuZC5jIGIveGVuL2FyY2gvYXJtL3N1c3BlbmQuYwo+IGlu
ZGV4IGEwNWFlYTljMjUuLjZkN2Q2OTUzOWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3N1
c3BlbmQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zdXNwZW5kLmMKPiBAQCAtMSw1ICsxLDYgQEAK
PiAgICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiAgICNpbmNsdWRlIDx4ZW4vY3B1Lmg+Cj4gKyNp
bmNsdWRlIDx4ZW4vY29uc29sZS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4g
ICAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+Cj4gICAjaW5jbHVkZSA8YXNtL3BzY2kuaD4KPiBAQCAt
MTQ5LDYgKzE1MCwxNSBAQCBzdGF0aWMgbG9uZyBzeXN0ZW1fc3VzcGVuZCh2b2lkICpkYXRhKQo+
ICAgICAgICAgICBnb3RvIHJlc3VtZV9pcnFzOwo+ICAgICAgIH0KPiAgIAo+ICsgICAgZHByaW50
ayhYRU5MT0dfREVCVUcsICJTdXNwZW5kXG4iKTsKClRoaXMgbWVzc2FnZSBtYXkgbm90IGFwcGVh
ciBvbiB0aGUgY29uc29sZSB1bmxlc3MgaXQgaXMgc3luY2hyb25pemVkIAooc2VlIGNvbnNvbGVf
c3RhcnRfc3luYykuIEFsc28sIGl0IG1pZ2h0IGJlIGEgdXNlZnVsIG1lc3NhZ2UgaW4gCm5vbi1k
ZWJ1ZyBidWlsZC4KCklkZWFsbHkgdGhlIHN1c3BlbmQvcmVzdW1lIGxvZ2ljIHNob3VsZCBub3Qg
YmUgbXVjaCBkaWZmZXJlbnQgdGhhbiB4ODYgCihzZWUgYXJjaC94ODYvYWNwaS9wb3dlci5jKS4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
