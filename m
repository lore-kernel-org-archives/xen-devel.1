From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] VT-d: suppress individual flushes during hwdom
 setup
Date: Thu, 02 May 2019 06:28:06 -0600
Message-ID: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAos-000684-El
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:28:10 +0000
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
Cc: Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBhbiBpbnZvY2F0aW9uIG9mIGlvbW11X2ZsdXNoX2FsbCgpIGltbWVkaWF0ZWx5IGFm
dGVyd2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtMTMxMCw4ICsxMzEwLDExIEBAIHN0YXRp
YyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2QKIAogICAgIHNldHVwX2h3ZG9tX3Bj
aV9kZXZpY2VzKGQsIHNldHVwX2h3ZG9tX2RldmljZSk7CiAgICAgc2V0dXBfaHdkb21fcm1ycihk
KTsKKwogICAgIC8qIE1ha2Ugc3VyZSB3b3JrYXJvdW5kcyBhcmUgYXBwbGllZCBiZWZvcmUgZW5h
YmxpbmcgdGhlIElPTU1VKHMpLiAqLworICAgIHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90
bGIpID0gdHJ1ZTsKICAgICBhcmNoX2lvbW11X2h3ZG9tX2luaXQoZCk7CisgICAgdGhpc19jcHUo
aW9tbXVfZG9udF9mbHVzaF9pb3RsYikgPSBmYWxzZTsKIAogICAgIGlmICggaW9tbXVfZmx1c2hf
YWxsKCkgKQogICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgVlREUFJFRklYCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
