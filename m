From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 16/23] Debian.pm: debian_overlays: Do
 not make $func callback for nonexistent dirs
Date: Wed, 23 May 2018 17:16:03 +0100
Message-ID: <1527092170-4111-17-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR6-0000Pe-81
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:24 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtZWFucyB0aGF0IGl0IGlzIG5vdyBPSyBub3QgdG8gaGF2ZSBhbiBgb3ZlcmxheS1sb2Nh
bCcuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNv
bT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDE1ICsrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3Nz
dGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRleCAwMTg1NzYxLi4xMjVkNDk5
IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0RlYmlhbi5wbQorKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQpA
QCAtODE4LDggKzgxOCwxOSBAQCBFTkQKIAogc3ViIGRlYmlhbl9vdmVybGF5cyAoJCQpIHsKICAg
ICBteSAoJGhvLCAkZnVuYykgPSBAXzsKLSAgICAkZnVuYy0+KCRje092ZXJsYXlMb2NhbH0sICdv
dmVybGF5LWxvY2FsLnRhcicpOwotICAgICRmdW5jLT4oJ292ZXJsYXknLCAnb3ZlcmxheS50YXIn
KTsKKyAgICAjIGNhbGxzICRmdW5jLT4oJGxvY2FsX2RpciwgJHRhcmJhbGxfbGVhZm5hbWUpOwor
ICAgIG15ICRtYXliZSA9IHN1YiB7CisJbXkgKCRsb2NhbF9kaXIsICR0YXJiYWxsX2xlYWZuYW1l
KSA9IEBfOworCWlmIChzdGF0ICRsb2NhbF9kaXIpIHsKKwkgICAgJGZ1bmMtPigkbG9jYWxfZGly
LCAkdGFyYmFsbF9sZWFmbmFtZSk7CisJfSBlbHNpZiAoJCEgPT0gRU5PRU5UKSB7CisJICAgICMg
b2sKKwl9IGVsc2UgeworCSAgICBkaWUgImRlYmlhbl9vdmVybGF5cyBjYW5ub3QgY2hlY2sgJGxv
Y2FsX2RpcjogJCEiOworCX0KKyAgICB9OworICAgICRtYXliZS0+KCRje092ZXJsYXlMb2NhbH0s
ICdvdmVybGF5LWxvY2FsLnRhcicpOworICAgICRtYXliZS0+KCdvdmVybGF5JywgJ292ZXJsYXku
dGFyJyk7CiB9CiAKIHN1YiBwcmVzZWVkX2Jhc2UgKCQkJDtAKSB7Ci0tIAoyLjEuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
