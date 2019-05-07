From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] libxl: don't enable synthetic timer by default
Date: Tue, 7 May 2019 14:36:25 +0100
Message-ID: <20190507133625.11502-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5sH=TH=citrix.com=prvs=0233d00f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hO0Gr-00068v-6Q
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:36:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgYnJva2UgV2luZG93cyBpbnN0YWxsYXRpb24uIE1vcmUgaW52ZXN0aWdhdGlvbiBpcyBuZWVk
ZWQuIERvbid0CmVuYWJsZSBpdCBieSBkZWZhdWx0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkNj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxf
ZG9tLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfZG9tLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwppbmRleCA4
NzljODA2MTM5Li5jNTY4NWIwNjFjIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kb20u
YworKysgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwpAQCAtMjY5LDcgKzI2OSw2IEBAIHN0YXRp
YyBpbnQgaHZtX3NldF92aXJpZGlhbl9mZWF0dXJlcyhsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBk
b21pZCwKICAgICAgICAgbGlieGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJ
UklESUFOX0VOTElHSFRFTk1FTlRfVElNRV9SRUZfQ09VTlQpOwogICAgICAgICBsaWJ4bF9iaXRt
YXBfc2V0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9BUElD
X0FTU0lTVCk7CiAgICAgICAgIGxpYnhsX2JpdG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJY
TF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX0NSQVNIX0NUTCk7Ci0gICAgICAgIGxpYnhsX2JpdG1h
cF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX1NUSU1F
Uik7CiAgICAgfQogCiAgICAgbGlieGxfZm9yX2VhY2hfc2V0X2JpdCh2LCBpbmZvLT51Lmh2bS52
aXJpZGlhbl9lbmFibGUpIHsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
