From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 11/11] scripts/get_maintainer.pl: Print proper
	error message for missing $file
Date: Thu, 8 Mar 2018 17:39:17 +0000
Message-ID: <1520530757-4477-12-git-send-email-ian.jackson@eu.citrix.com>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=awgw=f6=citrix.com=prvs=5980b9d75=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1etzXL-0006UA-Mx
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 17:41:03 +0000
In-Reply-To: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SWYgeW91IHBhc3Mgc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCB0aGUgbmFtZSBvZiBhIEZJRk8g
b3Igb3RoZXIKZXhjaXRpbmcgb2JqZWN0ICgvZGV2L3N0ZGluLCBmb3IgZXhhbXBsZSksIGl0IHdv
dWxkIGZhbHNlbHkgcHJpbnQKImZpbGUgbm90IGZvdW5kIi4gIEluc3RlYWQ6IHN0YXQgdGhlIG9i
amVjdCByYXRoZXIgdGhhbiB1c2luZyAtZiBzbwp0aGF0IHdlIGRvIG5vdCBtaW5kIGlmIHRoZSBv
YmplY3QgaXMgbm90IGEgZmlsZTsgYW5kIHByaW50IHRoZSBlcnJubwp2YWx1ZSBpbiB0aGUgZXJy
b3IgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5j
aXRyaXguY29tPgpDQzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CkNDOiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQp2NjogTmV3IHBhdGNoIGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVz
Ci0tLQogc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2dl
dF9tYWludGFpbmVyLnBsIGIvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAppbmRleCAwNzM2OWFh
Li40M2ZiNWY1IDEwMDc1NQotLS0gYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCisrKyBiL3Nj
cmlwdHMvZ2V0X21haW50YWluZXIucGwKQEAgLTM4MSw4ICszODEsOCBAQCBmb3JlYWNoIG15ICRm
aWxlIChAQVJHVikgewogCSMjaWYgJGZpbGUgaXMgYSBkaXJlY3RvcnkgYW5kIGl0IGxhY2tzIGEg
dHJhaWxpbmcgc2xhc2gsIGFkZCBvbmUKIAlpZiAoKC1kICRmaWxlKSkgewogCSAgICAkZmlsZSA9
fiBzQChbXi9dKSRAJDEvQDsKLQl9IGVsc2lmICghKC1mICRmaWxlKSkgewotCSAgICBkaWUgIiRQ
OiBmaWxlICcke2ZpbGV9JyBub3QgZm91bmRcbiI7CisJfSBlbHNpZiAoIShzdGF0ICRmaWxlKSkg
eworCSAgICBkaWUgIiRQOiBmaWxlICcke2ZpbGV9JyBub3QgZm91bmQ6ICQhXG4iOwogCX0KICAg
ICB9CiAgICAgaWYgKCRmcm9tX2ZpbGVuYW1lKSB7Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
