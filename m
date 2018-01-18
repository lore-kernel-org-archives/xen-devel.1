From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 8/9] xen/consoled: discard NUL from guest
Date: Thu, 18 Jan 2018 18:16:51 +0000
Message-ID: <20180118181652.26397-9-wei.liu2@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecEkE-0004Vg-PD
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 18:16:58 +0000
In-Reply-To: <20180118181652.26397-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>
List-Id: xen-devel@lists.xenproject.org

QWNjb3JkaW5nIHRvIFswXSwgc29tZSBwcm9ncmFtIHNlbmRzIE5VTCBmb3IgcGFkZGluZyBwdXJw
b3NlLiBXZSBjYW4KZGlzY2FyZCB0aGVtLgoKaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS90
ZXJtdXRpbHMvbWFudWFsL3Rlcm1jYXAtMS4zL2h0bWxfbW9uby90ZXJtY2FwLmh0bWwjU0VDNwoK
UmVwb3J0ZWQtYnk6IFNhcmFoIE5ld21hbiA8c3JuQHByZ21yLmNvbT4KU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBTYXJhaCBOZXdtYW4gPHNybkBw
cmdtci5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CgpBIGJpdCBSRkMuIEF3YWl0aW5nIHRlc3QgcmVzdWx0cy4K
LS0tCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGVkLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9jaGFyL2NvbnNvbGVkLmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGVkLmMKaW5kZXggNTUy
YWJmNTc2Ni4uNmZjYjJhYTExNSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
ZC5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZWQuYwpAQCAtNzIsNyArNzIsOSBAQCBz
aXplX3QgY29uc29sZWRfZ3Vlc3Rfcngodm9pZCkKICAgICB7CiAgICAgICAgIGNoYXIgYyA9IGNv
bnNfcmluZy0+b3V0W01BU0tfWEVOQ09OU19JRFgoY29ucysrLCBjb25zX3JpbmctPm91dCldOwog
Ci0gICAgICAgIGJ1ZltpZHgrK10gPSBjOworICAgICAgICAvKiBEaXNjYXJkIE5VTC4gU2VlIHRo
ZSAiUGFkZGluZyIgc2VjdGlvbiBvZiB0ZXJtY2FwIG1hbnVhbC4gKi8KKyAgICAgICAgaWYgKCBj
ICE9ICdcMCcgKQorICAgICAgICAgICAgYnVmW2lkeCsrXSA9IGM7CiAgICAgICAgIHJlY3YrKzsK
IAogICAgICAgICBpZiAoIGlkeCA+PSBCVUZfU1ogKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
