From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 01/11] mg-execute-flight: Save an mro in
 tmp/
Date: Fri, 3 May 2019 17:59:47 +0100
Message-ID: <20190503165957.5960-2-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXk-00086n-4c
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:16 +0000
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtYXkgYmUgdXNlZnVsIGZvciBzb21lIHRoaW5ncy4gIEZvciBleGFtcGxlLCBpdCB3aWxs
IGJlIHVzZWQgaW4KanVzdCBhIG1vbWVudC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1nLWV4ZWN1dGUtZmxpZ2h0IHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9tZy1leGVjdXRlLWZs
aWdodCBiL21nLWV4ZWN1dGUtZmxpZ2h0CmluZGV4IGIzY2RmNDMxLi4zOTFmNDgxMCAxMDA3NTUK
LS0tIGEvbWctZXhlY3V0ZS1mbGlnaHQKKysrIGIvbWctZXhlY3V0ZS1mbGlnaHQKQEAgLTgxLDYg
KzgxLDcgQEAgZWNobyA+JjUgImZsaWdodCAkZmxpZ2h0IHJlcG9ydGluZyIKIAogLi9zZy1yZXBv
cnQtZmxpZ2h0ICRiYXNpc2ZsaWdodG9wdCBcCiAJLS1odG1sLWRpcj0kT1NTVEVTVF9IVE1MUFVC
X0RJUi8kZmxpZ2h0LyBcCisJLS1tYWNoaW5lLXJlYWRhYmxlLW91dHB1dD10bXAvJGZsaWdodC5t
cm8gXAogCSRmbGlnaHQgPnRtcC8kZmxpZ2h0LnJlcG9ydAogCiBzdWJqZWN0PWBzZWQgLW4gMXAg
PHRtcC8kZmxpZ2h0LnJlcG9ydGAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
