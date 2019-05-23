From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] Hypercall page docs and code cleanup
Date: Thu, 23 May 2019 11:20:14 +0100
Message-ID: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTkpn-0003yd-D0
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:20:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yIHRoZSByZW5kZXJlZCByZXN1bHQgKGFsb25nIHdpdGggc29tZSBvdGhlciBpbi1wcm9ncmVz
cyBkb2N1bWVudGF0aW9uKSwKc2VlOgoKaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9j
cy5pby9lbi9kb2NzLWRldmVsL2d1ZXN0LWd1aWRlL2h5cGVyY2FsbC1hYmkuaHRtbAoKQW5kcmV3
IENvb3BlciAoMik6CiAgeDg2OiBpbml0X2h5cGVyY2FsbF9wYWdlKCkgY2xlYW51cAogIGRvY3M6
IEludHJvZHVjZSBzb21lIGh5cGVyY2FsbCBwYWdlIGRvY3VtZW50YXRpb24KCiBkb2NzL2d1ZXN0
LWd1aWRlL2h5cGVyY2FsbC1hYmkucnN0IHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGRvY3MvZ3Vlc3QtZ3VpZGUvaW5kZXgucnN0ICAgICAgICAgfCAgMTAgKysr
CiBkb2NzL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgIHwgIDEzICsrKysKIHhlbi9hcmNo
L3g4Ni9kb21haW4uYyAgICAgICAgICAgICAgfCAgMTQgKysrKwogeGVuL2FyY2gveDg2L2RvbWN0
bC5jICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAg
ICAgICB8ICAgOCArLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jICAgICAgICAgfCAgMTgg
KysrLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgICAgIHwgIDE4ICsrKy0tLQog
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICAgICB8ICAgMyArLQogeGVuL2FyY2gveDg2
L3B2L2h5cGVyY2FsbC5jICAgICAgICB8ICA2MyArKysrKysrKystLS0tLS0tLS0KIHhlbi9hcmNo
L3g4Ni90cmFwcy5jICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQv
dHJhcHMuYyAgICAgICAgfCAgMTMgLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAg
ICAgICB8ICAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggICAgICB8ICAgNCAr
LQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9oeXBlcmNhbGwuaCAgICB8ICAgNCArLQogMTUgZmlsZXMg
Y2hhbmdlZCwgMjIzIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRvY3MvZ3Vlc3QtZ3VpZGUvaHlwZXJjYWxsLWFiaS5yc3QKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkb2NzL2d1ZXN0LWd1aWRlL2luZGV4LnJzdAoKLS0gCjIuMS40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
