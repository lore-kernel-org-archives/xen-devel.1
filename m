From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/5] xen: Disallow variable length arrays
Date: Mon, 24 Sep 2018 14:00:03 +0100
Message-ID: <1537794003-30851-6-git-send-email-andrew.cooper3@citrix.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VmFyaWFibGUgbGVuZ3RoIGFycmF5cyByZXN1bHQgaW4gZXhjZXNzIHN0YWNrIHV0aWxpc2F0aW9u
LCB3aXRoIGEgcmlzawpvZiBzdGFjayBvdmVyZmxvdyBpZiB0aGUgbGVuZ3RoIGlzIHRvbyBsYXJn
ZS4gIEl0IGFsc28gcmVzdWx0cyBpbiBmYWlybHkKcG9vciBhc20gZ2VuZXJhdGlvbiwgYmVjYXVz
ZSBvZiByZXF1aXJpbmcgYSBkaXZpZGUgYXMgcGFydCBvZiB0aGUgc3BhY2UKY2FsY3VhdGlvbi4K
ClhlbiBubyBsb25nZXIgaGFzIGFueSB2YXJpYWJsZSBsZW5ndGggYXJyYXlzLCBzbyB0YWtlIHRo
ZSBvcHBvcnR1bml0eSB0bwpmb3JtYWxseSBkaXNhbGxvdyB0aGVtLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9S
dWxlcy5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1bGVzLm1rCmluZGV4IGFjMGE4ZWEuLmJkMTFlMjYgMTAw
NjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAgLTU4LDYgKzU4LDcg
QEAgQ0ZMQUdTICs9IC1XZXJyb3IgLVdyZWR1bmRhbnQtZGVjbHMgLVduby1wb2ludGVyLWFyaXRo
CiBDRkxBR1MgKz0gLXBpcGUgLURfX1hFTl9fIC1pbmNsdWRlICQoQkFTRURJUikvaW5jbHVkZS94
ZW4vY29uZmlnLmgKIENGTEFHUy0kKENPTkZJR19ERUJVR19JTkZPKSArPSAtZwogQ0ZMQUdTICs9
ICctRF9fT0JKRUNUX0ZJTEVfXz0iJEAiJworJChjYWxsIGNjLW9wdGlvbi1hZGQsQ0ZMQUdTLEND
LC1XdmxhKQogCiBpZm5lcSAoJChjbGFuZykseSkKICMgQ2xhbmcgZG9lc24ndCB1bmRlcnN0YW5k
IHRoaXMgY29tbWFuZCBsaW5lIGFyZ3VtZW50LCBhbmQgZG9lc24ndCBhcHBlYXIgdG8KLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
