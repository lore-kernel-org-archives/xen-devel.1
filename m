From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 14/16] x86: expose CONFIG_HVM
Date: Tue, 4 Sep 2018 17:15:31 +0100
Message-ID: <20180904161533.11575-15-wei.liu2@citrix.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6dpj=ls=citrix.com=prvs=77871bf46=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxECK-0005I8-9p
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 16:29:00 +0000
In-Reply-To: <20180904161533.11575-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnYzOiBsb25n
ZXIgdGV4dAp2MjogdXNlIHRhYiB0byBpbmRlbnQKCkhhdmVuJ3QgYWRkZWQgYSBkZXBlbmRlbmN5
IG9uIFBWX1NISU1fRVhDTFVTSVZFIGJlY2F1c2UgYWdyZWVtZW50IGlzCm5vdCB5ZXQgcmVhY2hl
ZC4KLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmln
IGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggYWUxYjcwN2MxOS4uYzE2MGZkNjVmNiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcK
QEAgLTYwLDYgKzYwLDE3IEBAIGNvbmZpZyBQVl9MSU5FQVJfUFQKIAogY29uZmlnIEhWTQogCWRl
Zl9ib29sIHkKKwlwcm9tcHQgIkhWTSBzdXBwb3J0IgorCS0tLWhlbHAtLS0KKwkgIEludGVyZmFj
ZXMgdG8gc3VwcG9ydCBIVk0gZ3Vlc3RzIHdoaWNoIHJlcXVpcmUgaGFyZHdhcmUKKwkgIHN1cHBv
cnQgbGlrZSBJbnRlbCdzIFZULXggb3IgQU1EJ3MgU1ZNLiBOb3RlIHRoZSBoeXBlcnZpc29yCisJ
ICBkb2Vzbid0IGRpc3Rpbmd1aXNoIEhWTSBvciBQVkggZ3Vlc3QgdHlwZXMuIFBWSCBndWVzdCB0
eXBlCisJICBpcyBvbmx5IGEgY29uY2VwdCBmb3IgZW5kIHVzZXJzLgorCisJICBUaGlzIG9wdGlv
biBpcyBuZWVkZWQgaWYgeW91IHdhbnQgdG8gcnVuIEhWTSBvciBQVkggZ3Vlc3RzLgorCisJICBJ
ZiB1bnN1cmUsIHNheSBZLgorCiAKIGNvbmZpZyBTSEFET1dfUEFHSU5HCiAgICAgICAgIGJvb2wg
IlNoYWRvdyBQYWdpbmciCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
