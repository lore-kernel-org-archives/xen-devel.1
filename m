From: Brian Woods <brian.woods@amd.com>
Subject: [PATCH 0/2] x86/svm: add pause filtering threshold for
	SVM
Date: Tue, 20 Feb 2018 18:12:31 -0600
Message-ID: <20180221001233.62644-1-brian.woods@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGFuZCBlbmFibGVtZW50IG9mIHRoZSBwYXVz
ZSBmaWx0ZXJpbmcKdGhyZXNob2xkLiAgT25jZSB0aGVyZSdzIHBhdXNlIGZpbHRlcmluZyB0aHJl
c2hvbGQgYW1vdW50IG9mIGN5Y2xlcwpiZXR3ZWVuIHBhdXNlcywgdGhlIHBhdXNlIGZpbHRlcmlu
ZyBjb3VudGVyIHJlc2V0cyB0byB3aGF0IHdhcyBpbiB0aGUKVk1DQi4gIFRoaXMgYWxsb3dzIHRo
ZSBwYXVzZSBmaWx0ZXJpbmcgY291bnQgdG8gInJlc2V0IiBiZXR3ZWVuIHBhdXNlcwphbmQga2Vl
cHMgdGhlIGd1c2V0IGZyb20gZ2V0dGluZyBpbnRlcmNlcHRlZCBieSB0aGUgaHlwZXJ2aXNvci4g
IFNlZSBBTUQKQVBNIHZvbCAyIHNlY3Rpb24gMTUuMTQuNCBmb3IgbW9yZSBkZXRhaWxzLgoKSW4g
cmVwbHkgdG8gdGhpcyB3aWxsIGJlIGFuIGVtYWlsIHdpdGggZ3JhcGhzIHNob3dpbmcgc29tZSBi
ZW5jaG1hcmsKcmVzdWx0cyBvZiB3aHkgdGhlIHZhbHVlcyBvZiB0aGUgY291bnRlciBhbmQgdGhy
ZXNob2xkIHdlcmUgcGlja2VkLgoKQnJpYW4gV29vZHMgKDIpOgogIHg4Ni9zdm06IGFkZCBzdXBw
b3J0IGZvciBwYXVzZSBmaWx0ZXJpbmcgdGhyZXNob2xkCiAgeDg2L3N2bTogZW5hYmxlIHBhdXNl
IGZpbHRlcmluZyB0aHJlc2hvbGQKCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAg
IHwgMSArCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMgICAgICAgIHwgMyArKysKIHhlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL3N2bS9zdm0uaCAgfCA1ICsrKystCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9zdm0vdm1jYi5oIHwgMyArKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
