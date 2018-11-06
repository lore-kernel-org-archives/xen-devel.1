From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/3] x86emul: VME/PVI mode fixes
Date: Tue, 06 Nov 2018 06:33:09 -0700
Message-ID: <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hxzx=nr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gK1Tm-0005hP-Mv
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 13:33:14 +0000
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

MTogc2tpcCBWSUYgcHJvY2Vzc2luZyBpbiBWTUUgbW9kZSBmb3IgMTYtYml0IFBPUEYgYXQgSU9Q
TCAzCjI6IHJhaXNlICNHUCgwKSBpbiBWTUUgbW9kZSBmb3IgUE9QRiB3aXRoIFRGIHNldCBpbiBu
ZXcgdmFsdWUKMzogY29uc29saWRhdGUgQ1I0IGhhbmRsaW5nCgpKYW4KCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
