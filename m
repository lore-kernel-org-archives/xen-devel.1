From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/2] x86: more flexible alignment handling for
 xen binary
Date: Mon, 18 Mar 2019 14:57:17 +0000
Message-ID: <20190318145719.11396-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Lai=RV=citrix.com=prvs=973c34550=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h5thd-00080p-N5
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 14:57:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgeDg2OiBkZWNvdXBsZSB4ZW4gYWxpZ25tZW50IHNldHRpbmcgZnJvbSBF
Rkkvbm9uLUVGSSBidWlsZAogIHg4Ni9wdnNoaW06IHVzZSAyTSBhbGlnbm1lbnQKCiB4ZW4vYXJj
aC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysKIHhlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcgfCAgMSArCiB4ZW4v
YXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQog
MyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
