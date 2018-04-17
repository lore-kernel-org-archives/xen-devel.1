From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 1/7] docs/parse-support-md: internals: Introduce
 docref_a
Date: Tue, 17 Apr 2018 15:46:56 +0100
Message-ID: <1523976422-19799-2-git-send-email-ian.jackson@eu.citrix.com>
References: <fa4e69bb-8278-4aec-960b-c0db32ef5503@cardoe.com>
 <1523976422-19799-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uw82=hg=citrix.com=prvs=638ae18cd=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f8Rt5-0004JF-Av
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:47:15 +0000
In-Reply-To: <1523976422-19799-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AZXUuY2l0cml4LmNvbT4KUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KIGRvY3MvcGFyc2Utc3VwcG9ydC1tZCB8IDEwICsrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZG9jcy9wYXJzZS1zdXBwb3J0LW1kIGIvZG9jcy9wYXJzZS1zdXBwb3J0LW1kCmluZGV4
IGRlY2RhMzMuLjViZjg0MDUgMTAwNzU1Ci0tLSBhL2RvY3MvcGFyc2Utc3VwcG9ydC1tZAorKysg
Yi9kb2NzL3BhcnNlLXN1cHBvcnQtbWQKQEAgLTMxOCw2ICszMTgsMTIgQEAgc3ViIG8geyBwcmlu
dCBAXyBvciBkaWUgJCE7IH0KIAogb3VyIEBwZW5kaW5nX2hlYWRpbmdzOwogCitzdWIgZG9jcmVm
X2EgKCQkKSB7CisgICAgbXkgKCRpLCAkcmVhbHNlY3QpID0gQF87CisgICAgcmV0dXJuIHNwcmlu
dGYgJzxhIGhyZWY9IiVzIyVzIj4nLAorICAgICAgICAkdmVyc2lvbl91cmxzWyRpXSwgJHJlYWxz
ZWN0LT57QW5jaG9yfTsKK30KKwogc3ViIHdyaXRlX291dHB1dF9yb3cgKCQpIHsKICAgICBteSAo
JHNlY3Rub2RlKSA9IEBfOwogIyAgICBwcmludCBTVERFUlIgJ1dPUiAnLCBEdW1wZXIoJGQsICRz
ZWN0bm9kZSk7CkBAIC0zNjQsOCArMzcwLDggQEAgc3ViIHdyaXRlX291dHB1dF9yb3cgKCQpIHsK
ICAgICAgICAgICAgICAgICAmJiAkc2VjdG5vZGUtPntSZWFsU2VjdH17QW5jaG9yfSkgewogICAg
ICAgICAgICAgICAgIG15ICRyb3dzID0gJHNlY3Rub2RlLT57UmVhbFNlY3R9e1Jvd3N9OwogICAg
ICAgICAgICAgICAgICRuZXh0Y2VsbCA9IHNwcmludGYgJzx0ZCByb3dzcGFuPSVkPicsICRyb3dz
OwotICAgICAgICAgICAgICAgICRuZXh0Y2VsbCAuPSBzcHJpbnRmICc8YSBocmVmPSIlcyMlcyI+
WypdPC9hPicsCi0gICAgICAgICAgICAgICAgICAgICR2ZXJzaW9uX3VybHNbJGldLCAkc2VjdG5v
ZGUtPntSZWFsU2VjdH17QW5jaG9yfTsKKyAgICAgICAgICAgICAgICAkbmV4dGNlbGwgLj0gZG9j
cmVmX2EgJGksICRzZWN0bm9kZS0+e1JlYWxTZWN0fTsKKyAgICAgICAgICAgICAgICAkbmV4dGNl
bGwgLj0gJ1sqXTwvYT4nOwogICAgICAgICAgICAgICAgICRuZXh0Y2VsbCAuPSAnPC90ZD4nOwog
ICAgICAgICAgICAgICAgICRjb2xzcGFuID0gJyc7CiAgICAgICAgICAgICB9Ci0tIAoyLjEuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
