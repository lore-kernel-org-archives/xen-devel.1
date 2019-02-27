From: Christian Lindig <christian.lindig@citrix.com>
Subject: [PATCH 1/1] tools/ocaml: Dup2 /dev/null to stdin in
 daemonize()
Date: Wed, 27 Feb 2019 10:33:42 +0000
Message-ID: <20190227103342.26354-1-christian.lindig@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aFuA=RC=citrix.com=prvs=9541893fc=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1gywXc-0004Vg-Ha
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 10:34:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@citrix.com, wei.liu2@citrix.com, Christian Lindig <christian.lindig@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RG9uJ3QgY2xvc2Ugc3RkaW4gaW4gZGFlbW9uaXplKCkgYnV0IGR1cDIgL2Rldi9udWxsIGluc3Rl
YWQuIFRoaXMgYXZvaWRzCmZkIDAgYmVpbmcgcmV1c2VkIGFuZCBwb3RlbnRpYWxseSB3cml0dGVu
IHRvLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0Bj
aXRyaXguY29tPgotLS0KIHRvb2xzL29jYW1sL3hlbnN0b3JlZC9zdGRleHQubWwgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0ZGV4dC5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0
b3JlZC9zdGRleHQubWwKaW5kZXggODc5NTY1YzUxNS4uZmZiNTE2YTBkNCAxMDA2NDQKLS0tIGEv
dG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0ZGV4dC5tbAorKysgYi90b29scy9vY2FtbC94ZW5zdG9y
ZWQvc3RkZXh0Lm1sCkBAIC0xMDAsOSArMTAwLDkgQEAgbGV0IGRhZW1vbml6ZSAoKSA9CiAKIAkJ
YmVnaW4gbWF0Y2ggVW5peC5mb3JrICgpIHdpdGgKIAkJfCAwIC0+Ci0JCQlsZXQgbnVsbGZkID0g
VW5peC5vcGVuZmlsZSAiL2Rldi9udWxsIiBbIFVuaXguT19XUk9OTFkgXSAwIGluCisJCQlsZXQg
bnVsbGZkID0gVW5peC5vcGVuZmlsZSAiL2Rldi9udWxsIiBbIFVuaXguT19SRFdSXSAwIGluCiAJ
CQliZWdpbiB0cnkKLQkJCQlVbml4LmNsb3NlIFVuaXguc3RkaW47CisJCQkJVW5peC5kdXAyIG51
bGxmZCBVbml4LnN0ZGluOwogCQkJCVVuaXguZHVwMiBudWxsZmQgVW5peC5zdGRvdXQ7CiAJCQkJ
VW5peC5kdXAyIG51bGxmZCBVbml4LnN0ZGVycjsKIAkJCXdpdGggZXhuIC0+IFVuaXguY2xvc2Ug
bnVsbGZkOyByYWlzZSBleG4KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
