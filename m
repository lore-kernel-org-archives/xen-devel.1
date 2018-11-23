From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] EFI: don't repeatedly replace symlinks
Date: Fri, 23 Nov 2018 04:37:04 -0700
Message-ID: <5BF7E66002000078001FF5D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wxfq=oc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ9lh-0005Mq-TP
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 11:37:05 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T25jZSBjcmVhdGVkIHRoZXJlJ3Mgbm8gcG9pbnQgcmUtY3JlYXRpbmcgdGhlbSBvbiBldmVyeSBp
bmNyZW1lbnRhbAptYWtlLiBUaGlzIGluIHBhcnRpY3VsYXIgcHJldmVudHMgdGhlbSBmcm9tIGJl
Y29taW5nIHJvb3Qtb3duZWQgZHVyaW5nCmUuZy4gInN1ZG8gbWFrZSBpbnN0YWxsLXhlbiIsIGJ1
dCBpdCBhbHNvIGFsbG93cyAoZHVyaW5nIGRldmVsb3BtZW50KQp0byByZXBsYWNlIHRoZW0gdGhl
cmUgKGluc3RlYWQgb2YgaW4gY29tbW9uL2VmaS8pIGJ5IGFjdHVhbCBmaWxlcyB3aXRoCnBlcmhh
cHMgc2xpZ2h0bHkgY2hhbmdlZCBjb250ZW50cy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCk5vdGUgdGhhdCB0aGUgcm9vdC1vd25lZCBpc3N1ZSBh
bHNvIGV4aXN0cyBmb3IgdGhlIHZhcmlvdXMgLiouZDIgZmlsZXMuCgotLS0gYS94ZW4vTWFrZWZp
bGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0xMzcsNyArMTM3LDkgQEAgJChUQVJHRVQpOiBkZWxl
dGUtdW5mcmVzaC1maWxlcwogCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayBpbmNsdWRl
L3hlbi9jb21waWxlLmgKIAlbIC1lIGluY2x1ZGUvYXNtIF0gfHwgbG4gLXNmIGFzbS0kKFRBUkdF
VF9BUkNIKSBpbmNsdWRlL2FzbQogCVsgLWUgYXJjaC8kKFRBUkdFVF9BUkNIKS9lZmkgXSAmJiBm
b3IgZiBpbiBib290LmMgcnVudGltZS5jIGNvbXBhdC5jIGVmaS5oO1wKLQkJZG8gbG4gLW5zZiAu
Li8uLi8uLi9jb21tb24vZWZpLyQkZiBhcmNoLyQoVEFSR0VUX0FSQ0gpL2VmaS87IGRvbmU7XAor
CQlkbyB0ZXN0IC1yIGFyY2gvJChUQVJHRVRfQVJDSCkvZWZpLyQkZiB8fCBcCisJCSAgIGxuIC1u
c2YgLi4vLi4vLi4vY29tbW9uL2VmaS8kJGYgYXJjaC8kKFRBUkdFVF9BUkNIKS9lZmkvOyBcCisJ
CWRvbmU7IFwKIAkJdHJ1ZQogCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyBpbmNs
dWRlCiAJJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DIGFyY2gvJChUQVJHRVRfQVJD
SCkgYXNtLW9mZnNldHMucwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
