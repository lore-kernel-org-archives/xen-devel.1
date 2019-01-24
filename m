From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 19/26] ts-logs-capture: power: try ILOM
 first
Date: Thu, 24 Jan 2019 18:46:06 +0000
Message-ID: <20190124184613.2720-20-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1C-0003ft-AG
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:26 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
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

SWYgSUxPTSBpcyBwcm92aWRlZCwgYW5kIHRoZSBob3N0IGlzIG5vdCByZXNwb25kaW5nIHdoZW4g
d2UgdHJ5IGxvZ3MKY2FwdHVyZSwgdHJ5IHRoZSBJTE9NIGJlZm9yZSBoYXJkIHBvd2VyIGN5Y2xp
bmcgdGhlIGhvc3QuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgNSArKystLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9P
c3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA0ZTEx
OTJkNC4uODg2ZTk1ZDQgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIv
T3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMTQ0MCw4ICsxNDQwLDkgQEAgc3ViIHRhcmdldF9y
ZWJvb3QgKCQpIHsKIAogc3ViIHRhcmdldF9yZWJvb3RfZm9yY2UgKCQpIHsKICAgICBteSAoJGhv
KSA9IEBfOwotICAgIHBvd2VyX2N5Y2xlKCRobyk7Ci0gICAgYXdhaXRfdGNwKGdldF90aW1lb3V0
KCRobywncmVib290JywkdGltZW91dHtIYXJkUmVib290VXB9KSwgNSwgJGhvKTsKKyAgICBwb3dl
cl9yZWJvb3RfYXR0ZW1wdHMoJGhvLCBzdWIgeyB9LCBzdWIgeworICAgICAgICBhd2FpdF90Y3Ao
Z2V0X3RpbWVvdXQoJGhvLCdyZWJvb3QnLCR0aW1lb3V0e0hhcmRSZWJvb3RVcH0pLCA1LCAkaG8p
OworICAgIH0sIHFyeyg/IS4qU1NIKX0pOwogfQogCiBzdWIgdGNwY29ubmVjdCAoJCQpIHsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
