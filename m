From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/3] x86emul: raise #GP(0) in VME mode for POPF
 with TF set in new value
Date: Fri, 02 Nov 2018 10:45:36 -0600
Message-ID: <5BDC7F3002000078001F75CF@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIcZn-0002Mj-NG
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 16:45:39 +0000
In-Reply-To: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
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
ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwpAQCAtNDA0OSw2ICs0MDQ5LDcg
QEAgeDg2X2VtdWxhdGUoCiAgICAgICAgICAgICBkc3QudmFsID0gKHVpbnQxNl90KWRzdC52YWwg
fCAoX3JlZ3MuZWZsYWdzICYgMHhmZmZmMDAwMHUpOwogICAgICAgICAgICAgaWYgKCBjcjQgJiBY
ODZfQ1I0X1ZNRSApCiAgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgZ2VuZXJhdGVfZXhj
ZXB0aW9uX2lmKGRzdC52YWwgJiBYODZfRUZMQUdTX1RGLCBFWENfR1AsIDApOwogICAgICAgICAg
ICAgICAgIGlmICggZHN0LnZhbCAmIFg4Nl9FRkxBR1NfSUYgKQogICAgICAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKF9yZWdzLmVmbGFncyAm
IFg4Nl9FRkxBR1NfVklQLAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
