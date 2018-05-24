From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/5] Share CPUID stuff between hypervisor and
 toolstack
Date: Thu, 24 May 2018 17:05:17 +0100
Message-ID: <20180524160522.757-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yzin=il=citrix.com=prvs=675a57d20=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fLsk3-0000Jb-IB
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:05:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhlIGh5cGVydmlzb3IgaGFzIHNvbWUgbmljZSBvYmplY3RzIGFuZCBkZWZpbml0aW9ucyB0aGF0
IHRvb2xzdGFjayBjYW4gdXNlLAp0b28uIE1ha2UgdGhhdCBoYXBwZW4uCgpUaGUgYW50aWNpcGF0
aW9uIGlzIGluIHRoZSBmdXR1cmUgTVNSIG9iamVjdHMgYW5kIGRlZmluaXRpb25zIHNob3VsZCBi
ZSBzaGFyZWQsCnRvby4KCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpXZWkgTGl1ICg1KToKICB4ODY6IG1vdmUgZGVm
aW5pdGlvbiBvZiBzdHJ1Y3QgY3B1aWRfbGVhZiB0byBjcHVpZC5oCiAgeDg2OiBzcGxpdCBvdXQg
Y3B1aWQgb2JqZWN0cyBhbmQgaGVscGVycwogIHRvb2xzOiBsaW5rIGFyY2gtc2hhcmVkIGRpcmVj
dG9yeQogIGxpYnhjOiBpbnRyb2R1Y2UgeGNfY3B1aWRfeDg2LmgKICBYWFggRE8gTk9UIEFQUExZ
OiBjb21waWxhdGlvbiB0ZXN0CgogLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIHRvb2xzL2luY2x1ZGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAg
NSArLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAgICAgICAgICAgIHwgIDIzICsrKy0K
IHRvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5oICAgICAgICAgICAgICB8ICAxNiArKysKIHRvb2xz
L3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5oICB8ICAgNiArCiB4ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuaCAgfCAgIDYgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
YXJjaC1zaGFyZWQvY3B1aWQuaCB8IDIxMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZC5oICAgICAgICAgICAgIHwgMjA2ICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCAyNjEgaW5zZXJ0aW9ucygr
KSwgMjE1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnhjL3hjX2Nw
dWlkX3g4Ni5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9hcmNoLXNo
YXJlZC9jcHVpZC5oCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
