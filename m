From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Tue, 16 Oct 2018 16:38:23 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pf7c=m4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gCKs7-0006g0-AG
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 08:38:35 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, vkuznets@redhat.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Nathan.Studer@dornerworks.com, Jeff.Kubascik@dornerworks.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

eGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbiBoYXMgbm93IG9ubHkgYW4gaW1wbGVtZW50YXRp
b24gaWYKQ09ORklHX1hFTl9QViBpcyBkZWZpbmVkLiBIb3dldmVyLCBvbiBBUk0gd2UgbmV2ZXIg
c2V0IENPTkZJR19YRU5fUFYgYnV0CndlIGRvIGhhdmUgYW4gaW1wbGVtZW50YXRpb24gb2YgeGVu
X2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbiB3aGljaCBpcwpyZXF1aXJlZCBmb3Igc3dpb3RsYi14
ZW4gdG8gd29yayBjb3JyZWN0bHkgKGFsdGhvdWdoIGl0IGp1c3Qgc2V0cwoqZG1hX2hhbmRsZSku
CgpUaGlzIGZpeGVzIGEgYnVnIGludHJvZHVjZWQgYnkgMTY2MjQzOTA4MTZjNGM0MGRmM2Q3Nzdi
MzQ2NjVkM2ZkMDFlNjkzZC4KCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW4tb3BzLmggYi9p
bmNsdWRlL3hlbi94ZW4tb3BzLmgKaW5kZXggZmQxOGM5Ny4uOTM5YTk2MiAxMDA2NDQKLS0tIGEv
aW5jbHVkZS94ZW4veGVuLW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAtNDEs
NyArNDEsNyBAQCBzdGF0aWMgaW5saW5lIHVpbnQzMl90IHhlbl92Y3B1X25yKGludCBjcHUpCiAK
IGV4dGVybiB1bnNpZ25lZCBsb25nICp4ZW5fY29udGlndW91c19iaXRtYXA7CiAKLSNpZmRlZiBD
T05GSUdfWEVOX1BWCisjaWZkZWYgQ09ORklHX1hFTl9QViB8fCBDT05GSUdfQVJNIHx8IENPTkZJ
R19BUk02NAogaW50IHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0
YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIsCiAJCQkJdW5zaWduZWQgaW50IGFkZHJlc3NfYml0cywK
IAkJCQlkbWFfYWRkcl90ICpkbWFfaGFuZGxlKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
