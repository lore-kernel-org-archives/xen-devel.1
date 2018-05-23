From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 19/23] Debian.pm: debian_overlays:
 Honour suite-specific overlays
Date: Wed, 23 May 2018 17:16:06 +0100
Message-ID: <1527092170-4111-20-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR7-0000QS-9R
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:25 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9EZWJpYW4ucG0gfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBtIGIvT3NzdGVzdC9EZWJpYW4ucG0K
aW5kZXggYjk4OTFiNi4uMTZiNDdjNSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysr
IGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTgzMCw4ICs4MzAsMTEgQEAgc3ViIGRlYmlhbl9vdmVy
bGF5cyAoJCQpIHsKIAkgICAgZGllICJkZWJpYW5fb3ZlcmxheXMgY2Fubm90IGNoZWNrICRsb2Nh
bF9kaXI6ICQhIjsKIAl9CiAgICAgfTsKKyAgICBteSAkc3VpdGUgPSAkaG8tPntTdWl0ZX07CiAg
ICAgJG1heWJlLT4oJ292ZXJsYXknKTsKKyAgICAkbWF5YmUtPigib3ZlcmxheS0kc3VpdGUiKTsK
ICAgICAkbWF5YmUtPigkY3tPdmVybGF5TG9jYWx9LCAnb3ZlcmxheS1sb2NhbC50YXInKTsKKyAg
ICAkbWF5YmUtPigiJGN7T3ZlcmxheUxvY2FsfS0kc3VpdGUiLCAnb3ZlcmxheS1sb2NhbC0kc3Vp
dGUudGFyJyk7CiB9CiAKIHN1YiBwcmVzZWVkX2Jhc2UgKCQkJDtAKSB7Ci0tIAoyLjEuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
