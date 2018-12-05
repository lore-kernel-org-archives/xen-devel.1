From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v6 06/10] x86: patch ctxt_switch_masking()
 indirect call to direct one
Date: Wed, 05 Dec 2018 09:06:17 -0700
Message-ID: <5C07F779020000780020330B@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5C07F49D02000078002032BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=winm=oo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUZgs-0002mL-KP
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:06:22 +0000
In-Reply-To: <5C07F49D02000078002032BD@prv1-mh.provo.novell.com>
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

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQp2MjogRHJvcCBvcGVuLWNvZGVkIG51
bWJlciBmcm9tIG1hY3JvIGludm9jYXRpb24uCgotLS0gYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1v
bi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKQEAgLTE4NSw3ICsxODUsNyBAQCB2
b2lkIGN0eHRfc3dpdGNoX2xldmVsbGluZyhjb25zdCBzdHJ1Y3QKIAl9CiAKIAlpZiAoY3R4dF9z
d2l0Y2hfbWFza2luZykKLQkJY3R4dF9zd2l0Y2hfbWFza2luZyhuZXh0KTsKKwkJYWx0ZXJuYXRp
dmVfdmNhbGwoY3R4dF9zd2l0Y2hfbWFza2luZywgbmV4dCk7CiB9CiAKIGJvb2xfdCBvcHRfY3B1
X2luZm87CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
