From: Lars Kurth <lars.kurth@citrix.com>
Subject: [PATCH v1 0/2] Add new add_maintainers.pl script to
 optimise the workflow when using git format-patch with get_maintainer.pl
Date: Fri, 27 Apr 2018 10:30:49 +0100
Message-ID: <cover.1524821286.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ezub=hq=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fBzir-0005zS-S6
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 09:31:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xenproject.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYXZvaWQgaXNzdWVzIHdpdGggZHVwbGljYXRlIGUtbWFpbCBzZW5kaW5nLCBJIGFsc28gY2xl
YW5lZCB1cCBNQUlOVEFJTkVSUwoKTGFycyBLdXJ0aCAoMik6CiAgQWRkIG5ldyBhZGRfbWFpbnRh
aW5lcnMucGwgc2NyaXB0IHRvIG9wdGltaXNlIHRoZSB3b3JrZmxvdyB3aGVuIHVzaW5nCiAgICBn
aXQgZm9ybWF0LXBhdGNoIHdpdGggZ2V0X21haW50YWluZXIucGwKICBSZXBsYWNlIG9jY3VyYW5j
ZXMgb2YgeGVuLm9yZyB3aXRoIHhlbnByb2plY3Qub3JnCgogTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgfCAgMzAgKysrLS0tCiBzY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCB8IDI1MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMjY3IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNzU1
IHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsCgotLSAKMi4xMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
