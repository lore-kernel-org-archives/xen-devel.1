From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] hvmloader: set entry point in linker script
Date: Tue, 4 Sep 2018 10:28:43 +0200
Message-ID: <20180904082843.21972-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iawo=ls=citrix.com=prvs=778d05dba=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fx6i4-00057J-G0
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 08:29:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSBpdCBkZWZhdWx0cyB0byB1c2luZyAweDEwMDAwMCBhcyB0aGUgZW50cnkgcG9pbnQs
IHdoaWNoIG1pZ2h0Cm9yIG1pZ2h0IG5vdCBwb2ludCB0byBfc3RhcnQuIFRoaXMgaXMgYSBmaXgg
Zm9yIDA5YjM5MDdmOTMuCgpSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmxkcyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9maXJt
d2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmxkcyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9o
dm1sb2FkZXIubGRzCmluZGV4IDQ0NzFkN2FmMjcuLmVkYjFhMTJkYzMgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIubGRzCisrKyBiL3Rvb2xzL2Zpcm13YXJl
L2h2bWxvYWRlci9odm1sb2FkZXIubGRzCkBAIC0xLDMgKzEsNSBAQAorRU5UUlkoX3N0YXJ0KQor
CiBTRUNUSU9OUwogewogICAuID0gMHgxMDAwMDA7Ci0tIAoyLjE4LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
