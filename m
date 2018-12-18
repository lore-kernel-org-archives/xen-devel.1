From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/mm-locks: add a bias to current domain
 lock levels
Date: Tue, 18 Dec 2018 17:05:39 +0100
Message-ID: <20181218160542.56173-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S5ZZ=O3=citrix.com=prvs=883416a23=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gZHt7-0004Rv-Cs
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 16:06:29 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhdHRlbXB0cyB0byBmaXggYSBtbSBsb2NrIGxl
dmVsIGlzc3VlIHRoYXQgcHJldmVudHMKdXNpbmcgcGFnaW5nX2xvZ19kaXJ0eV9vcCBmcm9tIHBh
Z2luZyBjYWxsZXJzIChsaWtlIGEgUFZIIERvbTApLiBUaGUKZGlzY3Vzc2lvbiB0aGF0IGxlYWQg
dG8gdGhpcyBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0OgoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTEyL21zZzAxMTk3Lmh0bWwKClRoYW5r
cywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDMpOgogIHg4Ni9tbS1sb2NrczogcmVtb3ZlIHRy
YWlsaW5nIHdoaXRlc3BhY2UKICB4ODYvbW0tbG9ja3M6IGNvbnZlcnQgc29tZSBtYWNyb3MgdG8g
aW5saW5lIGZ1bmN0aW9ucwogIHg4Ni9tbS1sb2NrczogYXBwbHkgYSBiaWFzIHRvIGxvY2sgbGV2
ZWxzIGZvciBjdXJyZW50IGRvbWFpbgoKIHhlbi9hcmNoL3g4Ni9tbS9tbS1sb2Nrcy5oIHwgMjE3
ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tbS9w
Mm0tcG9kLmMgIHwgICA1ICstCiAyIGZpbGVzIGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCspLCA5
MiBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
