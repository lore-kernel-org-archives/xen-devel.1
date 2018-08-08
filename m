From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 3/4] dom0/pvh: change the order of the MMCFG
 initialization
Date: Wed, 8 Aug 2018 12:07:46 +0200
Message-ID: <20180808100747.19464-4-roger.pau@citrix.com>
References: <20180808100747.19464-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhyf=kx=citrix.com=prvs=751fb83b8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fnLO1-0001oA-8l
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:08:13 +0000
In-Reply-To: <20180808100747.19464-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U28gaXQncyBkb25lIGJlZm9yZSB0aGUgaW9tbXUgaXMgaW5pdGlhbGl6ZWQuIFRoaXMgaXMgcmVx
dWlyZWQgaW4Kb3JkZXIgdG8gYmUgYWJsZSB0byBmZXRjaCB0aGUgTU1DRkcgcmVnaW9ucyBmcm9t
IHRoZSBkb21haW4gc3RydWN0LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2lu
Y2UgdjE6CiAtIE5ldyBpbiB0aGlzIHZlcnNpb24uCi0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyB8IDkgKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1
aWxkLmMKaW5kZXggZjBjZDYzYjFlYy4uNTA2NTcyOTEwNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMK
QEAgLTExMDAsNiArMTEwMCwxMyBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0X3B2aChzdHJ1
Y3QgZG9tYWluICpkLCBjb25zdCBtb2R1bGVfdCAqaW1hZ2UsCiAgICAgICAgIHJldHVybiByYzsK
ICAgICB9CiAKKyAgICAvKgorICAgICAqIE5COiBNTUNGRyBpbml0aWFsaXphdGlvbiBuZWVkcyB0
byBiZSBwZXJmb3JtZWQgYmVmb3JlIGlvbW11CisgICAgICogaW5pdGlhbGl6YXRpb24gc28gdGhl
IGlvbW11IGNvZGUgY2FuIGZldGNoIHRoZSBNTUNGRyByZWdpb25zIHVzZWQgYnkgdGhlCisgICAg
ICogZG9tYWluLgorICAgICAqLworICAgIHB2aF9zZXR1cF9tbWNmZyhkKTsKKwogICAgIGlvbW11
X2h3ZG9tX2luaXQoZCk7CiAKICAgICByYyA9IHB2aF9sb2FkX2tlcm5lbChkLCBpbWFnZSwgaW1h
Z2VfaGVhZHJvb20sIGluaXRyZCwgYm9vdHN0cmFwX21hcChpbWFnZSksCkBAIC0xMTI0LDggKzEx
MzEsNiBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0X3B2aChzdHJ1Y3QgZG9tYWluICpkLCBj
b25zdCBtb2R1bGVfdCAqaW1hZ2UsCiAgICAgICAgIHJldHVybiByYzsKICAgICB9CiAKLSAgICBw
dmhfc2V0dXBfbW1jZmcoZCk7Ci0KICAgICBwcmludGsoIldBUk5JTkc6IFBWSCBpcyBhbiBleHBl
cmltZW50YWwgbW9kZSB3aXRoIGxpbWl0ZWQgZnVuY3Rpb25hbGl0eVxuIik7CiAgICAgcmV0dXJu
IDA7CiB9Ci0tIAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
