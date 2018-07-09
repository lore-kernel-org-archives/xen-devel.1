From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] x86/spec-ctrl: command line handling
 adjustments
Date: Mon, 09 Jul 2018 01:52:47 -0600
Message-ID: <5B43144F02000078001D22C0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x+xa=jz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fcQyb-0002l9-2J
 for xen-devel@lists.xenproject.org; Mon, 09 Jul 2018 07:52:53 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yIG9uZSwgIm5vLXhlbiIgc2hvdWxkIG5vdCBpbXBseSAibm8tZWFnZXItZnB1IiwgYXMgImVh
Z2VyIEZQVSIgbW9kZQppcyB0byBndWFyZCBndWVzdHMsIG5vdCBYZW4gaXRzZWxmLCB3aGljaCBp
cyBhbHNvIGV4cHJlc3NlZCBzbyBieQpwcmludF9kZXRhaWxzKCkuCgpBbmQgdGhlbiBvcHRfc3Ni
ZCwgZGVzcGl0ZSBiZWluZyBvZmYgYnkgZGVmYXVsdCwgc2hvdWxkIGFsc28gYmUgY2xlYXJlZApi
eSB0aGUgIm5vIiBhbmQgIm5vLXhlbiIgc3ViLW9wdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KdjI6IEFsc28gY2xlYXIgb3B0X3NzYmQgb24g
dGhlICJkaXNhYmxlX2NvbW1vbiIgcGF0aC4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwu
YworKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKQEAgLTEyNCw2ICsxMjQsOCBAQCBzdGF0
aWMgaW50IF9faW5pdCBwYXJzZV9zcGVjX2N0cmwoY29uc3QKICAgICAgICAgICAgIG9wdF9tc3Jf
c2NfcHYgPSBmYWxzZTsKICAgICAgICAgICAgIG9wdF9tc3Jfc2NfaHZtID0gZmFsc2U7CiAKKyAg
ICAgICAgICAgIG9wdF9lYWdlcl9mcHUgPSAwOworCiAgICAgICAgIGRpc2FibGVfY29tbW9uOgog
ICAgICAgICAgICAgb3B0X3JzYl9wdiA9IGZhbHNlOwogICAgICAgICAgICAgb3B0X3JzYl9odm0g
PSBmYWxzZTsKQEAgLTEzMSw3ICsxMzMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9zcGVj
X2N0cmwoY29uc3QKICAgICAgICAgICAgIG9wdF90aHVuayA9IFRIVU5LX0pNUDsKICAgICAgICAg
ICAgIG9wdF9pYnJzID0gMDsKICAgICAgICAgICAgIG9wdF9pYnBiID0gZmFsc2U7Ci0gICAgICAg
ICAgICBvcHRfZWFnZXJfZnB1ID0gMDsKKyAgICAgICAgICAgIG9wdF9zc2JkID0gZmFsc2U7CiAg
ICAgICAgIH0KICAgICAgICAgZWxzZSBpZiAoIHZhbCA+IDAgKQogICAgICAgICAgICAgcmMgPSAt
RUlOVkFMOwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
