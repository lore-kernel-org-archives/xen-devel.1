From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul/test: drop another instance of .byte
Date: Fri, 14 Dec 2018 01:50:39 -0700
Message-ID: <5C136EDF02000078002060C3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXjBC-0005vC-FQ
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 08:50:42 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHRoYXQgd2UgcmVxdWlyZSB1c2Ugb2YgdGhlIHtldmV4fSBwc2V1ZG8tcHJlZml4LCB3ZSBj
YW4gYWxzbyB1c2UKdGhlIHEtc3VmZml4ZWQgZW5jb2Rpbmcgb2YgVlBDTVBFU1RSSSwgd2hpY2gg
aXMgYXZhaWxhYmxlIGFzIG9mIDIuMjkKanVzdCBsaWtlIHtldmV4fSBpcy4KClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rvb2xzL3Rlc3RzL3g4
Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCisrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVs
YXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCkBAIC0zMzIyLDIyICszMzIyLDE1IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICB7CiAgICAgICAgIGRlY2xfaW5zbih2cGNtcGVz
dHJpKTsKIAotI2lmZGVmIF9feDg2XzY0X18KLSAgICAgICAgLyoKLSAgICAgICAgICogZ2FzIHVw
IHRvIGF0IGxlYXN0IDIuMjcgZG9lc24ndCBob25vciBleHBsaWN0ICJyZXgudyIgZm9yCi0gICAg
ICAgICAqIFZFWC9FVkVYIGVuY29kZWQgaW5zdHJ1Y3Rpb25zLCBhbmQgYWxzbyBkb2Vzbid0IHBy
b3ZpZGUgYW55Ci0gICAgICAgICAqIG90aGVyIG1lYW5zIHRvIGNvbnRyb2wgVkVYLlcuCi0gICAg
ICAgICAqLwogICAgICAgICBhc20gdm9sYXRpbGUgKCAibW92cSAlMCwgJSV4bW0yXG4iCisjaWZk
ZWYgX194ODZfNjRfXwogICAgICAgICAgICAgICAgICAgICAgICBwdXRfaW5zbih2cGNtcGVzdHJp
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLmJ5dGUgMHhDNCwgMHhFMywgMHhG
OSwgMHg2MSwgMHgxNiwgMHg3QSIpCi0gICAgICAgICAgICAgICAgICAgICAgIDo6ICJtIiAocmVz
WzBdKSApOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidnBjbXBlc3RyaXEgJDBi
MDExMTEwMTAsICglMSksICUleG1tMiIpCiAjZWxzZQotICAgICAgICBhc20gdm9sYXRpbGUgKCAi
bW92cSAlMCwgJSV4bW0yXG4iCiAgICAgICAgICAgICAgICAgICAgICAgIHB1dF9pbnNuKHZwY21w
ZXN0cmksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ2cGNtcGVzdHJpICQwYjAx
MTExMDEwLCAoJTEpLCAlJXhtbTIiKQotICAgICAgICAgICAgICAgICAgICAgICA6OiAibSIgKHJl
c1swXSksICJTIiAoTlVMTCkgKTsKICNlbmRpZgorICAgICAgICAgICAgICAgICAgICAgICA6OiAi
bSIgKHJlc1swXSksICJTIiAoTlVMTCkgKTsKIAogICAgICAgICBzZXRfaW5zbih2cGNtcGVzdHJp
KTsKICNpZmRlZiBfX3g4Nl82NF9fCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
