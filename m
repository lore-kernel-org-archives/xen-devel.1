From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 1/6] vpt: fix create_periodic_time to use the
 irq parameter
Date: Fri, 8 Jun 2018 17:07:52 +0200
Message-ID: <20180608150758.25307-2-roger.pau@citrix.com>
References: <20180608150758.25307-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k0yj=i2=citrix.com=prvs=690ca12ba=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fRIzp-00010V-Os
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 15:08:09 +0000
In-Reply-To: <20180608150758.25307-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCBvZiB0aGUgc3RhbGUgdmFsdWUgaW5zaWRlIHRoZSBwZXJpb2RpY190aW1lIHN0cnVj
dC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92cHQu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZwdC5jIGIveGVuL2FyY2gveDg2L2h2
bS92cHQuYwppbmRleCBkNTM2M2NhZWM3Li5hMGNjNjFmZDI4IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZwdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdnB0LmMKQEAgLTQ0NSw4ICs0
NDUsOCBAQCB2b2lkIGNyZWF0ZV9wZXJpb2RpY190aW1lKAogICAgIHVpbnQ2NF90IHBlcmlvZCwg
dWludDhfdCBpcnEsIHRpbWVfY2IgKmNiLCB2b2lkICpkYXRhKQogewogICAgIGlmICggIXB0LT5z
b3VyY2UgfHwKLSAgICAgICAgIChwdC0+aXJxID49IE5SX0lTQUlSUVMgJiYgcHQtPnNvdXJjZSA9
PSBQVFNSQ19pc2EpIHx8Ci0gICAgICAgICAocHQtPmlycSA+PSBodm1fZG9tYWluX2lycSh2LT5k
b21haW4pLT5ucl9nc2lzICYmCisgICAgICAgICAoaXJxID49IE5SX0lTQUlSUVMgJiYgcHQtPnNv
dXJjZSA9PSBQVFNSQ19pc2EpIHx8CisgICAgICAgICAoaXJxID49IGh2bV9kb21haW5faXJxKHYt
PmRvbWFpbiktPm5yX2dzaXMgJiYKICAgICAgICAgICBwdC0+c291cmNlID09IFBUU1JDX2lvYXBp
YykgKQogICAgIHsKICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
