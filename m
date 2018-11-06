From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 2/3] x86emul: raise #GP(0) in VME mode for
 POPF with TF set in new value
Date: Tue, 06 Nov 2018 06:45:10 -0700
Message-ID: <5BE19AE602000078001F8A0D@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hxzx=nr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gK1fQ-0006g9-4G
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 13:45:16 +0000
In-Reply-To: <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhIGNoZWNrIGV4cGxpY2l0bHkgbGlzdGVkIGJ5IHRoZSBpbnN0cnVjdGlvbiBwYWdl
IGluIHRoZSBTRE0uCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94
ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwpAQCAtNDA1MCw2ICs0MDUwLDcg
QEAgeDg2X2VtdWxhdGUoCiAgICAgICAgICAgICBpZiAoIChjcjQgJiBYODZfQ1I0X1ZNRSkgJiYK
ICAgICAgICAgICAgICAgICAgTUFTS19FWFRSKF9yZWdzLmVmbGFncywgWDg2X0VGTEFHU19JT1BM
KSAhPSAzICkKICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRp
b25faWYoZHN0LnZhbCAmIFg4Nl9FRkxBR1NfVEYsIEVYQ19HUCwgMCk7CiAgICAgICAgICAgICAg
ICAgaWYgKCBkc3QudmFsICYgWDg2X0VGTEFHU19JRiApCiAgICAgICAgICAgICAgICAgewogICAg
ICAgICAgICAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoX3JlZ3MuZWZsYWdzICYgWDg2
X0VGTEFHU19WSVAsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
