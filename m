From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 2/2] firmware/shim: better filtering of
 intermediate files during Xen tree setup
Date: Wed, 28 Feb 2018 04:35:19 -0700
Message-ID: <5A96A20702000078001ACAB5@prv-mh.provo.novell.com>
References: <5A96A0DA02000078001ACA99@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er01A-0001pT-8R
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:35:28 +0000
In-Reply-To: <5A96A0DA02000078001ACA99@prv-mh.provo.novell.com>
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBoYXZlIG5vIGlkZWEgd2hhdCAqLjEgaXMgbWVhbnQgdG8gY292ZXIuIEluc3RlYWQgYWxzbyBl
eGNsdWRlCnByZXByb2Nlc3NlZCBhbmQgbm9uLXNvdXJjZSBhc3NlbWJseSBmaWxlcy4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQp2MjogUmUtYmFzZSBvdmVyIGNoYW5nZSB0
byBlYXJsaWVyIHBhdGNoLgoKLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQor
KysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCkBAIC0yNiw3ICsyNiw3IEBAIGxp
bmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykKIAkkKGZvcmVhY2ggZCwgJChM
SU5LX0RJUlMpLCBcCiAJCShjZCAkKFhFTl9ST09UKTsgXAogCQkgZmluZCAkKGQpICEgLXR5cGUg
bCAtdHlwZSBmIFwKLQkJICQoYWRkcHJlZml4ICEgLW5hbWUgLCAnKi5bb2ExXScgJy4qLmQnICcu
Ki5kMicpKSBcCisJCSAkKGFkZHByZWZpeCAhIC1uYW1lICwgJyouW2lzb2FdJyAnLiouZCcgJy4q
LmQyJykpIFwKIAkJID4+IGxpbmtmYXJtLnN0YW1wLnRtcCA7ICkgXAogCSQoZm9yZWFjaCBmLCAk
KExJTktfRklMRVMpLCBcCiAJCWVjaG8gJChmKSA+PiBsaW5rZmFybS5zdGFtcC50bXAgOykKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
