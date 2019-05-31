From: Baodong Chen <chenbaodong@mxnavi.com>
Subject: [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
Date: Fri, 31 May 2019 11:18:22 +0800
Message-ID: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=USVC=T7=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWY3s-0005aH-Bf
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 03:18:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Baodong Chen <chenbaodong@mxnavi.com>
List-Id: xen-devel@lists.xenproject.org

VGh1cywgc2l6ZW9mKHN0cnVjdCBjcHVwb29sKSB3aWxsIHNhdmUgOCBieXRlcyBmb3IgNjQtYml0
IHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZp
LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggOTJi
YzdhMC4uZjBjZjIxMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTIxMyw5ICsyMTMsOSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgc2NoZWRfZnJlZV9kb21kYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMs
CiBzdHJ1Y3QgY3B1cG9vbAogewogICAgIGludCAgICAgICAgICAgICAgY3B1cG9vbF9pZDsKKyAg
ICB1bnNpZ25lZCBpbnQgICAgIG5fZG9tOwogICAgIGNwdW1hc2tfdmFyX3QgICAgY3B1X3ZhbGlk
OyAgICAgIC8qIGFsbCBjcHVzIGFzc2lnbmVkIHRvIHBvb2wgKi8KICAgICBzdHJ1Y3QgY3B1cG9v
bCAgICpuZXh0OwotICAgIHVuc2lnbmVkIGludCAgICAgbl9kb207CiAgICAgc3RydWN0IHNjaGVk
dWxlciAqc2NoZWQ7CiAgICAgYXRvbWljX3QgICAgICAgICByZWZjbnQ7CiB9OwotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
