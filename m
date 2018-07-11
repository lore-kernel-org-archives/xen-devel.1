From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 7/8] x86/shim: fully ignore "nosmp" and
 "maxcpus="
Date: Wed, 11 Jul 2018 06:11:36 -0600
Message-ID: <5B45F3F802000078001D3171@prv1-mh.provo.novell.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdDy6-0006lE-V0
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 12:11:38 +0000
In-Reply-To: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gdGhlIHNoaW0gY2FzZSwgdGhlIG51bWJlciBvZiBDUFVzIHNob3VsZCBiZSBzb2xlbHkgY29u
dHJvbGxlZCBieSB0aGUKZ3Vlc3QgY29uZmlndXJhdGlvbiBmaWxlLiBNYWtlIHN1cmUgdGhlIGNv
bW1hbmQgbGluZSBvcHRpb25zIGFyZSBmdWxseQooYW5kIG5vdCBqdXN0IHBhcnRpYWxseSkgaWdu
b3JlZC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC0x
NDk4LDYgKzE0OTgsMTUgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWdu
ZQogICAgIGlmICggc21wX2ZvdW5kX2NvbmZpZyApCiAgICAgICAgIGdldF9zbXBfY29uZmlnKCk7
CiAKKyAgICAvKgorICAgICAqIEluIHRoZSBzaGltIGNhc2UsIHRoZSBudW1iZXIgb2YgQ1BVcyBz
aG91bGQgYmUgc29sZWx5IGNvbnRyb2xsZWQgYnkgdGhlCisgICAgICogZ3Vlc3QgY29uZmlndXJh
dGlvbiBmaWxlLgorICAgICAqLworICAgIGlmICggcHZfc2hpbSApCisgICAgeworICAgICAgICBv
cHRfbm9zbXAgPSBmYWxzZTsKKyAgICAgICAgbWF4X2NwdXMgPSAwOworICAgIH0KICAgICBpZiAo
IG9wdF9ub3NtcCApCiAgICAgewogICAgICAgICBtYXhfY3B1cyA9IDA7CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
