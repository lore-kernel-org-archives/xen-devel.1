From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH v2 13/21] arch: don't memset(0) memory returned
 by memblock_alloc()
Date: Mon, 21 Jan 2019 10:04:00 +0200
Message-ID: <1548057848-15136-14-git-send-email-rppt__9123.07344046912$1548057999$gmane$org@linux.ibm.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A+YT=P5=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1glUae-0000h9-MG
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 08:05:52 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0L84HCL080097
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 03:05:50 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q57sc5yr8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 03:05:50 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Mon, 21 Jan 2019 08:05:45 -0000
In-Reply-To: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xten
List-Id: xen-devel@lists.xenproject.org

bWVtYmxvY2tfYWxsb2MoKSBhbHJlYWR5IGNsZWFycyB0aGUgYWxsb2NhdGVkIG1lbW9yeSwgbm8g
cG9pbnQgaW4gZG9pbmcgaXQKdHdpY2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxy
cHB0QGxpbnV4LmlibS5jb20+CkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPiAjIG02OGsKLS0tCiBhcmNoL2M2eC9tbS9pbml0LmMgICAgICAgICAgfCAx
IC0KIGFyY2gvaDgzMDAvbW0vaW5pdC5jICAgICAgICB8IDEgLQogYXJjaC9pYTY0L2tlcm5lbC9t
Y2EuYyAgICAgIHwgMiAtLQogYXJjaC9tNjhrL21tL21jZm1tdS5jICAgICAgIHwgMSAtCiBhcmNo
L21pY3JvYmxhemUvbW0vaW5pdC5jICAgfCA2ICsrLS0tLQogYXJjaC9zcGFyYy9rZXJuZWwvcHJv
bV8zMi5jIHwgMiAtLQogNiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYzZ4L21tL2luaXQuYyBiL2FyY2gvYzZ4L21tL2lu
aXQuYwppbmRleCBhZjVhZGEwLi5lODNjMDQ2IDEwMDY0NAotLS0gYS9hcmNoL2M2eC9tbS9pbml0
LmMKKysrIGIvYXJjaC9jNngvbW0vaW5pdC5jCkBAIC00MCw3ICs0MCw2IEBAIHZvaWQgX19pbml0
IHBhZ2luZ19pbml0KHZvaWQpCiAKIAllbXB0eV96ZXJvX3BhZ2UgICAgICA9ICh1bnNpZ25lZCBs
b25nKSBtZW1ibG9ja19hbGxvYyhQQUdFX1NJWkUsCiAJCQkJCQkJICAgICAgUEFHRV9TSVpFKTsK
LQltZW1zZXQoKHZvaWQgKillbXB0eV96ZXJvX3BhZ2UsIDAsIFBBR0VfU0laRSk7CiAKIAkvKgog
CSAqIFNldCB1cCB1c2VyIGRhdGEgc3BhY2UKZGlmZiAtLWdpdCBhL2FyY2gvaDgzMDAvbW0vaW5p
dC5jIGIvYXJjaC9oODMwMC9tbS9pbml0LmMKaW5kZXggNjUxOTI1Mi4uYTE1Nzg5MCAxMDA2NDQK
LS0tIGEvYXJjaC9oODMwMC9tbS9pbml0LmMKKysrIGIvYXJjaC9oODMwMC9tbS9pbml0LmMKQEAg
LTY4LDcgKzY4LDYgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKIAkgKiB0byBhIGNv
dXBsZSBvZiBhbGxvY2F0ZWQgcGFnZXMuCiAJICovCiAJZW1wdHlfemVyb19wYWdlID0gKHVuc2ln
bmVkIGxvbmcpbWVtYmxvY2tfYWxsb2MoUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwotCW1lbXNldCgo
dm9pZCAqKWVtcHR5X3plcm9fcGFnZSwgMCwgUEFHRV9TSVpFKTsKIAogCS8qCiAJICogU2V0IHVw
IFNGQy9ERkMgcmVnaXN0ZXJzICh1c2VyIGRhdGEgc3BhY2UpLgpkaWZmIC0tZ2l0IGEvYXJjaC9p
YTY0L2tlcm5lbC9tY2EuYyBiL2FyY2gvaWE2NC9rZXJuZWwvbWNhLmMKaW5kZXggNzRkMTQ4Yi4u
MzcwYmMzNCAxMDA2NDQKLS0tIGEvYXJjaC9pYTY0L2tlcm5lbC9tY2EuYworKysgYi9hcmNoL2lh
NjQva2VybmVsL21jYS5jCkBAIC00MDAsOCArNDAwLDYgQEAgaWE2NF9sb2dfaW5pdChpbnQgc2Fs
X2luZm9fdHlwZSkKIAogCS8vIHNldCB1cCBPUyBkYXRhIHN0cnVjdHVyZXMgdG8gaG9sZCBlcnJv
ciBpbmZvCiAJSUE2NF9MT0dfQUxMT0NBVEUoc2FsX2luZm9fdHlwZSwgbWF4X3NpemUpOwotCW1l
bXNldChJQTY0X0xPR19DVVJSX0JVRkZFUihzYWxfaW5mb190eXBlKSwgMCwgbWF4X3NpemUpOwot
CW1lbXNldChJQTY0X0xPR19ORVhUX0JVRkZFUihzYWxfaW5mb190eXBlKSwgMCwgbWF4X3NpemUp
OwogfQogCiAvKgpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL21tL21jZm1tdS5jIGIvYXJjaC9tNjhr
L21tL21jZm1tdS5jCmluZGV4IDBkZTQ5OTkuLjQ5MmY5NTMgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4
ay9tbS9tY2ZtbXUuYworKysgYi9hcmNoL202OGsvbW0vbWNmbW11LmMKQEAgLTQ0LDcgKzQ0LDYg
QEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKIAlpbnQgaTsKIAogCWVtcHR5X3plcm9f
cGFnZSA9ICh2b2lkICopIG1lbWJsb2NrX2FsbG9jKFBBR0VfU0laRSwgUEFHRV9TSVpFKTsKLQlt
ZW1zZXQoKHZvaWQgKikgZW1wdHlfemVyb19wYWdlLCAwLCBQQUdFX1NJWkUpOwogCiAJcGdfZGly
ID0gc3dhcHBlcl9wZ19kaXI7CiAJbWVtc2V0KHN3YXBwZXJfcGdfZGlyLCAwLCBzaXplb2Yoc3dh
cHBlcl9wZ19kaXIpKTsKZGlmZiAtLWdpdCBhL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmMgYi9h
cmNoL21pY3JvYmxhemUvbW0vaW5pdC5jCmluZGV4IDQ0ZjRiODkuLmJkMWNkNGIgMTAwNjQ0Ci0t
LSBhL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmMKKysrIGIvYXJjaC9taWNyb2JsYXplL21tL2lu
aXQuYwpAQCAtMzc2LDEwICszNzYsOCBAQCB2b2lkICogX19yZWYgemFsbG9jX21heWJlX2Jvb3Rt
ZW0oc2l6ZV90IHNpemUsIGdmcF90IG1hc2spCiAKIAlpZiAobWVtX2luaXRfZG9uZSkKIAkJcCA9
IGt6YWxsb2Moc2l6ZSwgbWFzayk7Ci0JZWxzZSB7CisJZWxzZQogCQlwID0gbWVtYmxvY2tfYWxs
b2Moc2l6ZSwgU01QX0NBQ0hFX0JZVEVTKTsKLQkJaWYgKHApCi0JCQltZW1zZXQocCwgMCwgc2l6
ZSk7Ci0JfQorCiAJcmV0dXJuIHA7CiB9CmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL2tlcm5lbC9w
cm9tXzMyLmMgYi9hcmNoL3NwYXJjL2tlcm5lbC9wcm9tXzMyLmMKaW5kZXggMzg5NDBhZi4uZTcx
MjZjYSAxMDA2NDQKLS0tIGEvYXJjaC9zcGFyYy9rZXJuZWwvcHJvbV8zMi5jCisrKyBiL2FyY2gv
c3BhcmMva2VybmVsL3Byb21fMzIuYwpAQCAtMzMsOCArMzMsNiBAQCB2b2lkICogX19pbml0IHBy
b21fZWFybHlfYWxsb2ModW5zaWduZWQgbG9uZyBzaXplKQogCXZvaWQgKnJldDsKIAogCXJldCA9
IG1lbWJsb2NrX2FsbG9jKHNpemUsIFNNUF9DQUNIRV9CWVRFUyk7Ci0JaWYgKHJldCAhPSBOVUxM
KQotCQltZW1zZXQocmV0LCAwLCBzaXplKTsKIAogCXByb21fZWFybHlfYWxsb2NhdGVkICs9IHNp
emU7CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
