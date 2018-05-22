From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/CPUID: don't override tool stack decision
 to hide STIBP
Date: Tue, 22 May 2018 04:33:22 -0600
Message-ID: <5B03F1F202000078001C4942@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL4bh-0004Kg-5f
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 10:33:29 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3RoZXIgdGhhbiBpbiB0aGUgZmVhdHVyZSBzZXRzLCB3aGVyZSB3ZSBpbmRlZWQgd2FudCB0byBv
ZmZlciB0aGUKZmVhdHVyZSBldmVuIGlmIG5vdCBlbnVtZXJhdGVkIG9uIGhhcmR3YXJlLCB3ZSBz
aG91bGRuJ3QgZGljdGF0ZSB0aGUKZmVhdHVyZSBiZWluZyBhdmFpbGFibGUgaWYgdG9vbCBzdGFj
ayBvciBob3N0IGFkbWluIGhhdmUgZGVjaWRlZCBub3QKdG8gZXhwb3NlIGl0IChmb3Igd2hhdGV2
ZXIgW3F1ZXN0aW9uYWJsZT9dIHJlYXNvbikuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Ci0tLQpUaGlzIGlzIGVmZmVjdGl2ZWx5IGFjY29tcGFueWluZyB0
aGUgZGlzY3Vzc2lvbiByb290ZWQgYXQgdGhlIDQuOC80LjcKcGF0Y2ggYXQKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA1L21zZzAxMDI4
Lmh0bWwgCmRlYWxpbmcgd2l0aCBhIGZlYXR1cmUgbGV2ZWxpbmcgaXNzdWUuCgotLS0gYS94ZW4v
YXJjaC94ODYvY3B1aWQuYworKysgYi94ZW4vYXJjaC94ODYvY3B1aWQuYwpAQCAtNjQyLDE0ICs2
NDIsNiBAQCB2b2lkIHJlY2FsY3VsYXRlX2NwdWlkX3BvbGljeShzdHJ1Y3QgZG9tCiAgICAgcmVj
YWxjdWxhdGVfeHN0YXRlKHApOwogICAgIHJlY2FsY3VsYXRlX21pc2MocCk7CiAKLSAgICAvKgot
ICAgICAqIE92ZXJyaWRlIFNUSUJQIHRvIG1hdGNoIElCUlMuICBHdWVzdHMgY2FuIHNhZmVseSB1
c2UgU1RJQlAKLSAgICAgKiBmdW5jdGlvbmFsaXR5IG9uIG5vbi1IVCBoYXJkd2FyZSwgYnV0IGNh
bid0IG5lY2Vzc2VyaWx5IHByb3RlY3QKLSAgICAgKiB0aGVtc2VsdmVzIGZyb20gU1AyL1NwZWN0
cmUvQnJhbmNoIFRhcmdldCBJbmplY3Rpb24gaWYgU1RJQlAgaXMgaGlkZGVuCi0gICAgICogb24g
SFQtY2FwYWJsZSBoYXJkd2FyZS4KLSAgICAgKi8KLSAgICBwLT5mZWF0LnN0aWJwID0gcC0+ZmVh
dC5pYnJzYjsKLQogICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShwLT5jYWNoZS5yYXcp
OyArK2kgKQogICAgIHsKICAgICAgICAgaWYgKCBwLT5jYWNoZS5zdWJsZWFmW2ldLnR5cGUgPj0g
MSAmJgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
