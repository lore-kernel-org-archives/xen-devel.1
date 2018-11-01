From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/2] mfi-common: Enable livepatch tests
 in 4.10 and 4.11 as intended (!)
Date: Thu, 1 Nov 2018 15:53:35 +0000
Message-ID: <20181101155335.20138-2-ian.jackson@eu.citrix.com>
References: <20181101155335.20138-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvhc=nm=citrix.com=prvs=836b135c8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIFIJ-000110-JF
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 15:54:03 +0000
In-Reply-To: <20181101155335.20138-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdHRlcm4geGVuLTQuMSogbWF0Y2hlcyB4ZW4tNC4xMC10ZXN0aW5nLCB4ZW4tNC4xMS10
ZXN0aW5nLCBldGMuClRoZSByaWdodCBhcHByb2FjaCBpcyB0byBzdGF0ZSB0aGUgZXhjbHVkZWQg
YnJhbmNoIG5hbWVzIGV4cGxpY2l0bHkKYXMgaXMgZG9uZSBlbHNld2hlcmUuCgpSZXN1bHRpbmcg
Y2hhbmdlcyAoc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzKToKICogbmV3
IGpvYnM6IHRlc3QtYW1kNjQte2FtZDY0LGkzODZ9LWxpdmVwYXRjaAogKiBydW52YXIgc2V0OiBl
bmFibGVfbGl2ZXBhdGNoPXRydWUgaW4gYnVpbGQtQVJDSCwgYnVpbGQtQVJDSC14c20KICogYWxs
IG9mIHRoZSBhYm92ZSBpbiBicmFuY2hlczogeGVuLTQuMTAtdGVzdGluZyB4ZW4tNC4xMS10ZXN0
aW5nCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogbWZpLWNvbW1v
biB8IDE2ICsrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWZpLWNvbW1vbiBiL21maS1jb21tb24KaW5k
ZXggN2FkODExNjIuLjgzZDNjNzEzIDEwMDY0NAotLS0gYS9tZmktY29tbW9uCisrKyBiL21maS1j
b21tb24KQEAgLTg1LDE0ICs4NSwxNCBAQCBicmFuY2hfd2FudHNfeHRmX3Rlc3RzICgpIHsKIGJy
YW5jaF93YW50c19saXZlcGF0Y2ggKCkgewogICBjYXNlICIkYnJhbmNoIiBpbgogICAgIHhlbi0z
LiopICAgIHJldHVybiAxOzsKLSAgICB4ZW4tNC4wKikgICByZXR1cm4gMTs7Ci0gICAgeGVuLTQu
MSopICAgcmV0dXJuIDE7OwotICAgIHhlbi00LjIqKSAgIHJldHVybiAxOzsKLSAgICB4ZW4tNC4z
KikgICByZXR1cm4gMTs7Ci0gICAgeGVuLTQuNCopICAgcmV0dXJuIDE7OwotICAgIHhlbi00LjUq
KSAgIHJldHVybiAxOzsKLSAgICB4ZW4tNC42KikgICByZXR1cm4gMTs7Ci0gICAgeGVuLTQuNyop
ICAgcmV0dXJuIDE7OworICAgIHhlbi00LjAtdGVzdGluZykgICByZXR1cm4gMTs7CisgICAgeGVu
LTQuMS10ZXN0aW5nKSAgIHJldHVybiAxOzsKKyAgICB4ZW4tNC4yLXRlc3RpbmcpICAgcmV0dXJu
IDE7OworICAgIHhlbi00LjMtdGVzdGluZykgICByZXR1cm4gMTs7CisgICAgeGVuLTQuNC10ZXN0
aW5nKSAgIHJldHVybiAxOzsKKyAgICB4ZW4tNC41LXRlc3RpbmcpICAgcmV0dXJuIDE7OworICAg
IHhlbi00LjYtdGVzdGluZykgICByZXR1cm4gMTs7CisgICAgeGVuLTQuNy10ZXN0aW5nKSAgIHJl
dHVybiAxOzsKICAgICB4ZW4tKikgICAgICByZXR1cm4gMDs7CiAgICAgb3NzdGVzdCopICAgcmV0
dXJuIDA7OwogICAgICopICAgICAgICAgIHJldHVybiAxOzsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
