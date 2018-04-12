From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] tools/kdd: silence gcc 8 warning a different way
Date: Thu, 12 Apr 2018 06:04:49 -0600
Message-ID: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9+ld=hb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6ayD-0004ey-5h
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 12:04:53 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T2xkZXIgZ2NjIGRvZXNuJ3QgbGlrZSAiI3ByYWdtYSBHQ0MgZGlhZ25vc3RpYyIgaW5zaWRlIGZ1
bmN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Ci0tLSBhL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYworKysgYi90b29scy9kZWJ1Z2dlci9rZGQv
a2RkLmMKQEAgLTY5NSwxMCArNjk1LDEwIEBAIHN0YXRpYyB2b2lkIGtkZF9oYW5kbGVfcmVhZF9j
dHJsKGtkZF9zdGEKICAgICAgICAgICAgIEtERF9MT0cocywgIlJlcXVlc3Qgb3V0c2lkZSBvZiBr
bm93biBjb250cm9sIHNwYWNlXG4iKTsKICAgICAgICAgICAgIGxlbiA9IDA7CiAgICAgICAgIH0g
ZWxzZSB7Ci0jcHJhZ21hIEdDQyBkaWFnbm9zdGljIHB1c2gKLSNwcmFnbWEgR0NDIGRpYWdub3N0
aWMgaWdub3JlZCAiLVdhcnJheS1ib3VuZHMiCi0gICAgICAgICAgICBtZW1jcHkoYnVmLCAoKHVp
bnQ4X3QgKikmY3RybC5jMzIpICsgb2Zmc2V0LCBsZW4pOwotI3ByYWdtYSBHQ0MgZGlhZ25vc3Rp
YyBwb3AKKyAgICAgICAgICAgIC8qIFN1cHByZXNzIGJvZ3VzIGdjYyA4ICJvdXQgb2YgYm91bmRz
IiB3YXJuaW5nLiAqLworICAgICAgICAgICAgY29uc3QgdWludDhfdCAqc3JjOworICAgICAgICAg
ICAgYXNtICgiIiA6ICI9ZyIgKHNyYykgOiAiMCIgKCh1aW50OF90ICopJmN0cmwuYzMyICsgb2Zm
c2V0KSk7CisgICAgICAgICAgICBtZW1jcHkoYnVmLCBzcmMsIGxlbik7CiAgICAgICAgIH0KICAg
ICB9CiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
