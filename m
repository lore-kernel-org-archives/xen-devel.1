From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/NMI: invert condition in
 nmi_show_execution_state()
Date: Tue, 06 Feb 2018 03:41:43 -0700
Message-ID: <5A79947702000078001A596F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=eevg=fa=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ej0hF-0001mc-4w
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 10:41:53 +0000
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

V2Ugd2FudCB0byBkZWNvZGUgdGhlIHN5bWJvbCB3aGVuIF9ub3RfIGluIGd1ZXN0IG1vZGUuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4v
YXJjaC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwpAQCAtNjMyLDcgKzYz
Miw3IEBAIHN0YXRpYyBpbnQgbm1pX3Nob3dfZXhlY3V0aW9uX3N0YXRlKGNvbnMKICAgICAgICAg
c2hvd19leGVjdXRpb25fc3RhdGUocmVncyk7CiAgICAgZWxzZQogICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiAiQ1BVJWQgQCAlMDR4OiUwOGx4ICglcFMpXG4iLCBjcHUsIHJlZ3MtPmNzLAotICAg
ICAgICAgICAgICAgcmVncy0+cmlwLCBndWVzdF9tb2RlKHJlZ3MpID8gX3AocmVncy0+cmlwKSA6
IE5VTEwpOworICAgICAgICAgICAgICAgcmVncy0+cmlwLCBndWVzdF9tb2RlKHJlZ3MpID8gTlVM
TCA6IF9wKHJlZ3MtPnJpcCkpOwogICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJnNob3dfc3Rh
dGVfbWFzayk7CiAKICAgICByZXR1cm4gMTsKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
