From: Chao Gao <chao.gao@intel.com>
Subject: [PATCH v6 10/12] microcode/intel: Writeback and
 invalidate caches before updating microcode
Date: Mon, 11 Mar 2019 15:57:34 +0800
Message-ID: <1552291056-20286-11-git-send-email-chao.gao@intel.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TXio=RO=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1h3Fky-0003vb-2i
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 07:53:56 +0000
In-Reply-To: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VXBkYXRpbmcgbWljcm9jb2RlIGlzIGxlc3MgZXJyb3IgcHJvbmUgd2hlbiBjYWNoZXMgaGF2ZSBi
ZWVuIGZsdXNoZWQgYW5kCmRlcGVuZGluZyBvbiB3aGF0IGV4YWN0bHkgdGhlIG1pY3JvY29kZSBp
cyB1cGRhdGluZy4gRm9yIGV4YW1wbGUsIHNvbWUKb2YgdGhlIGlzc3VlcyBhcm91bmQgY2VydGFp
biBCcm9hZHdlbGwgcGFydHMgY2FuIGJlIGFkZHJlc3NlZCBieSBkb2luZyBhCmZ1bGwgY2FjaGUg
Zmx1c2guCgpbbGludXggY29tbWl0OiA5MWRmOWZkZjUxNDkyYWVjOWZlZDZiNGNiZDMzMTYwODg2
NzQwZjQ3XQpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpDYzog
QXNob2sgUmFqIDxhc2hvay5yYWpAaW50ZWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2NjoKIC0gbmV3
Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9j
b2RlX2ludGVsLmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKaW5kZXggYzkyMWVh
OS4uZDVlZjE0NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwpAQCAtMzUxLDYgKzM1MSwxMiBAQCBz
dGF0aWMgaW50IGFwcGx5X21pY3JvY29kZSh2b2lkKQogICAgIC8qIHNlcmlhbGl6ZSBhY2Nlc3Mg
dG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5ICovCiAgICAgc3Bpbl9sb2NrX2lycXNh
dmUoJm1pY3JvY29kZV91cGRhdGVfbG9jaywgZmxhZ3MpOwogCisgICAgLyoKKyAgICAgKiBXcml0
ZWJhY2sgYW5kIGludmFsaWRhdGUgY2FjaGVzIGJlZm9yZSB1cGRhdGluZyBtaWNyb2NvZGUgdG8g
YXZvaWQKKyAgICAgKiBpbnRlcm5hbCBpc3N1ZXMgZGVwZW5kaW5nIG9uIHdoYXQgdGhlIG1pY3Jv
Y29kZSBpcyB1cGRhdGluZy4KKyAgICAgKi8KKyAgICB3YmludmQoKTsKKwogICAgIC8qIHdyaXRl
IG1pY3JvY29kZSB2aWEgTVNSIDB4NzkgKi8KICAgICB3cm1zcmwoTVNSX0lBMzJfVUNPREVfV1JJ
VEUsICh1bnNpZ25lZCBsb25nKW1jX2ludGVsLT5iaXRzKTsKICAgICB3cm1zcmwoTVNSX0lBMzJf
VUNPREVfUkVWLCAweDBVTEwpOwotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
