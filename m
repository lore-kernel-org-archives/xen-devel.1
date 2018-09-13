From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v4 7/7] x86: expose CONFIG_HVM
Date: Thu, 13 Sep 2018 17:38:09 +0100
Message-ID: <180534f4d2c9349dc789a815d865db414d33e829.1536856592.git-series.wei.liu2@citrix.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p4g3=l3=citrix.com=prvs=78776abe6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g0UdD-0008CS-8j
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:38:15 +0000
In-Reply-To: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnY0OiByZW1v
dmUgYSBibGFuayBsaW5lCnYzOiBsb25nZXIgdGV4dAp2MjogdXNlIHRhYiB0byBpbmRlbnQKCkhh
dmVuJ3QgYWRkZWQgYSBkZXBlbmRlbmN5IG9uIFBWX1NISU1fRVhDTFVTSVZFIGJlY2F1c2UgYWdy
ZWVtZW50IGlzCm5vdCB5ZXQgcmVhY2hlZC4KCkNDIG1vcmUgcGVvcGxlIGZvciBvcGluaW9ucy4K
CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkkg
ZG9uJ3QgaGF2ZSBhbiBvcGluaW9uIGhlcmUsIHRoYXQncyB3aHkgSSBkaWRuJ3QgcmVwbHkgdG8g
cHJldmlvdXMKdGhyZWFkcy4KCk1heWJlCgogIGRlZl9ib29sIHkgaWYgIVBWX1NISU1fRVhDTFVT
SVZFCgppcyBhIGdvb2QgY29tcHJvbWlzZT8KLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyB8IDEw
ICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwppbmRleCBhZTFi
NzA3Li5kN2E1MTYzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZworKysgYi94ZW4v
YXJjaC94ODYvS2NvbmZpZwpAQCAtNjAsNiArNjAsMTYgQEAgY29uZmlnIFBWX0xJTkVBUl9QVAog
CiBjb25maWcgSFZNCiAJZGVmX2Jvb2wgeQorCXByb21wdCAiSFZNIHN1cHBvcnQiCisJLS0taGVs
cC0tLQorCSAgSW50ZXJmYWNlcyB0byBzdXBwb3J0IEhWTSBndWVzdHMgd2hpY2ggcmVxdWlyZSBo
YXJkd2FyZQorCSAgc3VwcG9ydCBsaWtlIEludGVsJ3MgVlQteCBvciBBTUQncyBTVk0uIE5vdGUg
dGhlIGh5cGVydmlzb3IKKwkgIGRvZXNuJ3QgZGlzdGluZ3Vpc2ggSFZNIG9yIFBWSCBndWVzdCB0
eXBlcy4gUFZIIGd1ZXN0IHR5cGUKKwkgIGlzIG9ubHkgYSBjb25jZXB0IGZvciBlbmQgdXNlcnMu
CisKKwkgIFRoaXMgb3B0aW9uIGlzIG5lZWRlZCBpZiB5b3Ugd2FudCB0byBydW4gSFZNIG9yIFBW
SCBndWVzdHMuCisKKwkgIElmIHVuc3VyZSwgc2F5IFkuCiAKIGNvbmZpZyBTSEFET1dfUEFHSU5H
CiAgICAgICAgIGJvb2wgIlNoYWRvdyBQYWdpbmciCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
