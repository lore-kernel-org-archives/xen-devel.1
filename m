From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v1 2/6] x86/vvmx: correct vmfail() usage for
 vmptrld and vmclear
Date: Fri, 12 Oct 2018 16:27:55 +0100
Message-ID: <20181012152800.7921-3-sergey.dyasli@citrix.com>
References: <20181012152800.7921-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181012152800.7921-1-sergey.dyasli@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Q2FsbGluZyB2bWZhaWxfdmFsaWQoKSBpcyBjb3JyZWN0IG9ubHkgaWYgdnZtY3ggaXMgdmFsaWQu
IE1vZGlmeQpmdW5jdGlvbnMgdG8gdXNlIHZtZmFpbCgpIGluc3RlYWQgd2hpY2ggcGVyZm9ybXMg
dGhlIG5lY2Vzc2FyeSBjaGVjay4KClNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdl
eS5keWFzbGlAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jCmluZGV4IDhlZWU2ZDBlYTguLjI2YjdkNzI2NjAgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMKQEAgLTE3NDQsNyArMTc0NCw3IEBAIGludCBudm14X2hhbmRsZV92bXB0cmxkKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQogICAgICAgICAgICAgICFtYXBfaW9fYml0bWFwX2FsbCh2KSB8
fAogICAgICAgICAgICAgICFfbWFwX21zcl9iaXRtYXAodikgKQogICAgICAgICB7Ci0gICAgICAg
ICAgICB2bWZhaWxfdmFsaWQocmVncywgVk1YX0lOU05fVk1QVFJMRF9JTlZBTElEX1BIWUFERFIp
OworICAgICAgICAgICAgdm1mYWlsKHJlZ3MsIFZNWF9JTlNOX1ZNUFRSTERfSU5WQUxJRF9QSFlB
RERSKTsKICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CiAgICAgfQpAQCAtMTgyOCw3
ICsxODI4LDcgQEAgaW50IG52bXhfaGFuZGxlX3ZtY2xlYXIoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MpCiAgICAgaWYgKCByYyA9PSBWTVNVQ0NFRUQgKQogICAgICAgICB2bXN1Y2NlZWQocmVn
cyk7CiAgICAgZWxzZSBpZiAoIHJjID09IFZNRkFJTF9WQUxJRCApCi0gICAgICAgIHZtZmFpbF92
YWxpZChyZWdzLCBWTVhfSU5TTl9WTUNMRUFSX0lOVkFMSURfUEhZQUREUik7CisgICAgICAgIHZt
ZmFpbChyZWdzLCBWTVhfSU5TTl9WTUNMRUFSX0lOVkFMSURfUEhZQUREUik7CiAgICAgZWxzZQog
ICAgICAgICB2bWZhaWxfaW52YWxpZChyZWdzKTsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
