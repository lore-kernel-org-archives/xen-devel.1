From: Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
Subject: [PATCH] xen/arm: p2m: configure pa_range_info table to
 support 42 bit PA systems.
Date: Fri, 15 Mar 2019 08:34:57 +0000
Message-ID: <20190315083439.23068-1-vishnu@os.amperecomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RY1k=RS=os.amperecomputing.com=vishnu@srs-us1.protection.inumbo.net>)
 id 1h4iIw-0000SQ-7A
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 08:35:02 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Open Source Submission <patches@amperecomputing.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>, Feng Kan OS <fengkan@os.amperecomputing.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudCBwYV9yYW5nZV9pbmZvIHRhYmxlJ3MgY29uZmlndXJhdGlvbiBwcmV2ZW50cyA0MiBi
aXQgUEEgc3lzdGVtcwpmcm9tIGJvb3RpbmcgRE9NMC4gVGhpcyBwYXRjaCBtb2RpZmllcyB0MHN6
PTIyIGFuZCByb290X29yZGVyPTMKdG8gZXhwb3NlIDQyLWJpdCBJUEEgKEludGVybWVkaWF0ZSBQ
aHlzaWNhbCBBZGRyZXNzKS4KCkl0IGlzIHJlcXVpcmVkIGZvciBoYXJkd2FyZSB3aGljaCBpcyBo
YXZpbmcgcGVyaXBoZXJhbHMgYWJvdmUgNDAgYml0cy4KClNpZ25lZC1vZmYtYnk6IFZpc2hudSA8
dmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+ClNpZ25lZC1vZmYtYnk6IEZlbmcgS2FuIDxm
ZW5na2FuQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3AybS5jIHwg
NSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwppbmRl
eCBjMzhiZDdlMTZlLi5jOGU3NTk4ZDgxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMK
KysrIGIveGVuL2FyY2gvYXJtL3AybS5jCkBAIC0xOTkyLDEwICsxOTkyLDEzIEBAIHZvaWQgX19p
bml0IHNldHVwX3ZpcnRfcGFnaW5nKHZvaWQpCiAgICAgfSBwYV9yYW5nZV9pbmZvW10gPSB7CiAg
ICAgICAgIC8qIFQwU1ogbWluaW11bSBhbmQgU0wwIG1heGltdW0gZnJvbSBBUk0gRERJIDA0ODdB
LmIgVGFibGUgRDQtNSAqLwogICAgICAgICAvKiAgICAgIFBBIHNpemUsIHQwc3oobWluKSwgcm9v
dC1vcmRlciwgc2wwKG1heCkgKi8KKwkvKiBUT0RPOiA0MiBiaXQgUEEgc3lzdGVtcyBhbGxvY2F0
ZSA4IHBhZ2VzIGJ5IGRlZmF1bHQKKwkgKiBmb3IgYm90aCBET00wIGFuZCBndWVzdHMuCisJICov
CiAgICAgICAgIFswXSA9IHsgMzIsICAgICAgMzIvKjMyKi8sICAwLCAgICAgICAgICAxIH0sCiAg
ICAgICAgIFsxXSA9IHsgMzYsICAgICAgMjgvKjI4Ki8sICAwLCAgICAgICAgICAxIH0sCiAgICAg
ICAgIFsyXSA9IHsgNDAsICAgICAgMjQvKjI0Ki8sICAxLCAgICAgICAgICAxIH0sCi0gICAgICAg
IFszXSA9IHsgNDIsICAgICAgMjQvKjIyKi8sICAxLCAgICAgICAgICAxIH0sCisgICAgICAgIFsz
XSA9IHsgNDIsICAgICAgMjIvKjIyKi8sICAzLCAgICAgICAgICAxIH0sCiAgICAgICAgIFs0XSA9
IHsgNDQsICAgICAgMjAvKjIwKi8sICAwLCAgICAgICAgICAyIH0sCiAgICAgICAgIFs1XSA9IHsg
NDgsICAgICAgMTYvKjE2Ki8sICAwLCAgICAgICAgICAyIH0sCiAgICAgICAgIFs2XSA9IHsgMCB9
LCAvKiBJbnZhbGlkICovCi0tCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
