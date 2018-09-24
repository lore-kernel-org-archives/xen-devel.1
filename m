From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/5] Xen: Remove the of variable length arrays
Date: Mon, 24 Sep 2018 13:59:58 +0100
Message-ID: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VmFyaWFibGUgbGVuZ3RoIGFycmF5cywgd2hpbGUgY29udmVuaWVudCBpbiBzb21lIGNhc2VzLCBh
cmUgcHJvYmxlbWF0aWMgd2l0aApzbWFsbCBzdGFja3MsIGFuZCBjYW4gdHVybiBsb2dpY2FsIGJ1
Z3MgaW50byBzdGFjayBvdmVyZmxvd3MuICBGdXJ0aGVybW9yZSwKdGhlIGNvZGUgZ2VuZXJhdGlv
biBiZWhpbmQgdGhlbSBpcyB2ZXJ5IHBvb3IuCgpYZW4gaGFzIHR3byB1c2VzIG9mIFZMQXMgd2hp
Y2ggY2FuIGJlIGZpeGVkIGVhc2lseSwgYW5kIG9uZSBjYXNlIHdoZXJlIHRoZSBWTEEKbG9naWMg
dHJpZ2dlcnMgb24gYSB0eXBlLCB3aGljaCBjYW4gYmUgd29ya2VkIGFyb3VuZC4KCkFuZHJldyBD
b29wZXIgKDUpOgogIHg4Ni9Qb0Q6IFNpbXBsaWZ5IGhhbmRsaW5nIG9mIHRoZSBxdWljayBjaGVj
awogIHg4Ni9Qb0Q6IEF2b2lkIHVzaW5nIHZhcmlhYmxlIGxlbmd0aCBhcnJheXMgaW4gcDJtX3Bv
ZF96ZXJvX2NoZWNrKCkKICB4ODYvaHZtOiBBZGp1c3QgaHZtZW11bF9yZXBfc3RvcygpIHRvIGNv
bXBpbGUgd2l0aCAtV3ZsYQogIEFSTS9kb20wOiBBdm9pZCB1c2luZyBhIHZhcmlhYmxlIGxlbmd0
aCBhcnJheSBpbiBtYWtlX21lbW9yeV9ub2RlKCkKICB4ZW46IERpc2FsbG93IHZhcmlhYmxlIGxl
bmd0aCBhcnJheXMKCiB4ZW4vUnVsZXMubWsgICAgICAgICAgICAgICAgfCAgMSArCiB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCAgNCArKystCiB4ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUu
YyAgfCAgNiArKystLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMgICB8IDI2ICsrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
