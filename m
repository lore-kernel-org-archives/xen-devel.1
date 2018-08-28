From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] xenforeignmemory: fix fd leakage in error path
Date: Tue, 28 Aug 2018 15:19:55 +0100
Message-ID: <20180828141955.8611-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuer9-0004dq-DD
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:20:31 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

YjQ5ZWY1ZDMgKHhlbmZvcmVpZ25tZW1vcnk6IHdvcmsgYXJvdW5kIGJ1ZyBpbiBvbGRlciBwcml2
Y21kKSBhZGRlZCBhbgplcnJvciBwYXRoIGJ1dCBmb3Jnb3QgdG8gY2xvc2UgZmQgdGhlcmUuCgpS
ZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJzL2ZvcmVpZ25t
ZW1vcnkvbGludXguYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMgYi90b29scy9saWJzL2Zv
cmVpZ25tZW1vcnkvbGludXguYwppbmRleCAwMzY4YWEwOWY0Li4xMzI4NzVkZjhhIDEwMDY0NAot
LS0gYS90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkvbGludXguYworKysgYi90b29scy9saWJzL2Zv
cmVpZ25tZW1vcnkvbGludXguYwpAQCAtNjIsNiArNjIsNyBAQCBpbnQgb3NkZXBfeGVuZm9yZWln
bm1lbW9yeV9vcGVuKHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVtKQogICAgIHsKICAgICAg
ICAgeHRsX2xvZyhmbWVtLT5sb2dnZXIsIFhUTF9FUlJPUiwgLTEsICJ4ZW5mb3JlaWdubWVtb3J5
IiwKICAgICAgICAgICAgICAgICAicHJpdmNtZCBpb2N0bCBzaG91bGQgbm90IGJlIGltcGxlbWVu
dGVkIik7CisgICAgICAgIGNsb3NlKGZkKTsKICAgICAgICAgcmV0dXJuIC0xOwogICAgIH0KICAg
ICBlbHNlCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
