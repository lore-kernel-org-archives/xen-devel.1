From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 4/8] libxl: Provide better error message when
 qemu restrict user not found
Date: Mon, 11 Jun 2018 15:13:20 +0100
Message-ID: <1528726404-14924-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m2ge=i5=citrix.com=prvs=6937e3dae=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fSNZk-0000mK-E0
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 14:13:40 +0000
In-Reply-To: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIG1lbnRpb24gb2YgTElCWExfUUVNVV9VU0VSX1JBTkdFX0JBU0UsIGluIGNhc2UgdGhhdCBp
cyB3aGF0IHRoZQp1c2VyIHdhcyBpbnRlbmRpbmcuCgpDYzogQW50aG9ueSBQZXJhcmQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFj
a3NvbkBldS5jaXRyaXguY29tPgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDE4YWRhNjkuLjcyODk1MDkg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfZG0uYwpAQCAtMTY5OSw4ICsxNjk5LDkgQEAgc3RhdGljIGludCBsaWJ4bF9fYnVpbGRfZGV2
aWNlX21vZGVsX2FyZ3NfbmV3KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIH0KIAogICAgICAgICBM
T0dEKEVSUk9SLCBndWVzdF9kb21pZCwKLSAgICAgICAgICAgICAiQ291bGQgbm90IGZpbmQgdXNl
ciAlcyVkIG9yICVzLCBjYW5ub3QgcmVzdHJpY3QiLAotICAgICAgICAgICAgIExJQlhMX1FFTVVf
VVNFUl9CQVNFLCBndWVzdF9kb21pZCwgTElCWExfUUVNVV9VU0VSX1NIQVJFRCk7CisgIkNvdWxk
IG5vdCBmaW5kIHVzZXIgJXMlZCBvciAlcyBvciByYW5nZSBiYXNlIHBzZXVkby11c2VyICVzLCBj
YW5ub3QgcmVzdHJpY3QiLAorICAgICAgICAgICAgIExJQlhMX1FFTVVfVVNFUl9CQVNFLCBndWVz
dF9kb21pZCwgTElCWExfUUVNVV9VU0VSX1NIQVJFRCwKKyAgICAgICAgICAgICBMSUJYTF9RRU1V
X1VTRVJfUkFOR0VfQkFTRSk7CiAgICAgICAgIHJldHVybiBFUlJPUl9JTlZBTDsKIAogZW5kX3Nl
YXJjaDoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
