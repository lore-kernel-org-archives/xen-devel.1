From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 24/32] libxl_qmp: Disable beautify for QMP
 generated cmd
Date: Fri, 27 Jul 2018 15:06:06 +0100
Message-ID: <20180727140614.13256-25-anthony.perard@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnga=kl=citrix.com=prvs=739d1796c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fj3jZ-0008Kn-MZ
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 14:28:45 +0000
In-Reply-To: <20180727140614.13256-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbmVlZCBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIHwgNSArKysr
KwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggODNhZmNlMzE5
Mi4uZDdhZWRiNTZhOCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTU5NSw2ICs1OTUsMTEgQEAgc3RhdGljIGNoYXIg
KnFtcF9wcmVwYXJlX3FtcF9jbWQobGlieGxfX2djICpnYywKICAgICAgICAgcmV0dXJuIE5VTEw7
CiAgICAgfQogCisjaWYgSEFWRV9ZQUpMX1YyCisgICAgLyogRGlzYWJsZSBiZWF1dGlmeSBmb3Ig
ZGF0YSBzZW50IHRvIFFFTVUgKi8KKyAgICB5YWpsX2dlbl9jb25maWcoaGFuZCwgeWFqbF9nZW5f
YmVhdXRpZnksIDApOworI2VuZGlmCisKICAgICB5YWpsX2dlbl9tYXBfb3BlbihoYW5kKTsKICAg
ICBsaWJ4bF9feWFqbF9nZW5fYXNjaWl6KGhhbmQsICJleGVjdXRlIik7CiAgICAgbGlieGxfX3lh
amxfZ2VuX2FzY2lpeihoYW5kLCBjbWQpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
