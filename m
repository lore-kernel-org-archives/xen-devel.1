From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: fix boot of HVM domain with
 Xenstore-stubdom
Date: Tue,  4 Dec 2018 15:28:57 +0100
Message-ID: <20181204142857.29967-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q2jl=on=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gUBiB-0003Nu-BR
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 14:30:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbnN0b3JlIGRvbWlkIGlzbid0IHNldCBmb3IgSFZNIGRvbWFpbnMuIFRoaXMgd2lsbCBy
ZXN1bHQgaW4KZmFpbHVyZSB3aGVuIGJvb3RpbmcgYSBIVk0gZG9tYWluIG9uIGEgc3lzdGVtIHdp
dGggWGVuc3RvcmUgbm90IHJ1bm5pbmcKaW4gZG9tMC4KClNhbWUgYXBwbGllcyBmb3IgY29uc29s
ZSBkb21pZCwgc28gc2V0IGJvdGguCgpUaGlzIGlzIGJyb2tlbiBzaW5jZSBjb21taXQgYTJkOWE2
ZmExZmNkICgidG9vbHMvbGlieGVuY3RybDogdXNlIG5ldwp4ZW5mb3JlaWdubWVtb3J5IEFQSSB0
byBzZWVkIGdyYW50IHRhYmxlIikuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxf
ZG9tLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwppbmRleCA1OThhZjcxNTYyLi42MTYwOTkx
YWYzIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kb20uYworKysgYi90b29scy9saWJ4
bC9saWJ4bF9kb20uYwpAQCAtMTI4OSw2ICsxMjg5LDggQEAgaW50IGxpYnhsX19idWlsZF9odm0o
bGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCiAgICAgZG9tLT52Z2FfaG9sZV9zaXplID0g
ZGV2aWNlX21vZGVsID8gTElCWExfVkdBX0hPTEVfU0laRSA6IDA7CiAgICAgZG9tLT5kZXZpY2Vf
bW9kZWwgPSBkZXZpY2VfbW9kZWw7CiAgICAgZG9tLT5tYXhfdmNwdXMgPSBpbmZvLT5tYXhfdmNw
dXM7CisgICAgZG9tLT5jb25zb2xlX2RvbWlkID0gc3RhdGUtPmNvbnNvbGVfZG9taWQ7CisgICAg
ZG9tLT54ZW5zdG9yZV9kb21pZCA9IHN0YXRlLT5zdG9yZV9kb21pZDsKIAogICAgIHJjID0gbGli
eGxfX2RvbWFpbl9kZXZpY2VfY29uc3RydWN0X3JkbShnYywgZF9jb25maWcsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8tPnUuaHZtLnJkbV9tZW1fYm91
bmRhcnlfbWVta2IqMTAyNCwKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
