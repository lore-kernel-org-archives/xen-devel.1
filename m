From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 3/4] x86/e820: assume memmap provided when
 booted virtualized is correct
Date: Fri, 28 Dec 2018 13:04:03 +0100
Message-ID: <20181228120404.50346-4-roger.pau@citrix.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD/o=PF=citrix.com=prvs=893533f24=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcqsD-0005lr-CN
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 12:04:17 +0000
In-Reply-To: <20181228120404.50346-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@cirix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpbXBsaWVzIHRoZXJlJ3Mgbm8gbmVlZCB0byBmb3JjZWZ1bGx5IHJlc2VydmUgdGhlIFZH
QSBNTUlPCnJlZ2lvbiwgc2luY2UgdGhlIG1lbW9yeSBtYXAgcHJvdmlkZWQgd2lsbCBiZSBjb3Jy
ZWN0LgoKUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXJpeC5jb20+
Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBBc3N1bWUgdGhlIG1lbW9yeSBtYXAgaXMg
YWx3YXlzIGNvcnJlY3Qgd2hlbiBib290ZWQgYXMgYSBndWVzdAogICB1bmRlciBhbnkgaHlwZXJ2
aXNvciwgbm90IG9ubHkgWGVuLgotLS0KIHhlbi9hcmNoL3g4Ni9lODIwLmMgfCAxMSArKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwppbmRl
eCA1YjYzNjY3MDg3Li4yNDA3MzY3YzU3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKQEAgLTUzNywxMSArNTM3LDEyIEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBtYWNoaW5lX3NwZWNpZmljX21lbW9yeV9zZXR1cChzdHJ1Y3QgZTgyMG1hcCAq
cmF3KQogCiAgICAgcmVzZXJ2ZV9kbWlfcmVnaW9uKCk7CiAKLSAgICAvKgotICAgICAqIFNvbWUg
QklPU2VzIGNsYWltIFJBTSBpbiB0aGUgNjQwayAtIDFNIHJlZ2lvbi4KLSAgICAgKiBOb3Qgcmln
aHQuIEZpeCBpdCB1cC4KLSAgICAgKi8KLSAgICByZXNlcnZlX3ZnYV9yZWdpb24oKTsKKyAgICBp
ZiAoICFjcHVfaGFzX2h5cGVydmlzb3IgKQorICAgICAgICAvKgorICAgICAgICAgKiBTb21lIEJJ
T1NlcyBjbGFpbSBSQU0gaW4gdGhlIDY0MGsgLSAxTSByZWdpb24uCisgICAgICAgICAqIE5vdCBy
aWdodC4gRml4IGl0IHVwLgorICAgICAgICAgKi8KKyAgICAgICAgcmVzZXJ2ZV92Z2FfcmVnaW9u
KCk7CiAKICAgICB0b3Bfb2ZfcmFtID0gbXRycl90b3Bfb2ZfcmFtKCk7CiAgICAgaWYgKCB0b3Bf
b2ZfcmFtICkKLS0gCjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
