From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 17/18] xenmon: Install as xenmon, not xenmon.py
Date: Fri,  5 Oct 2018 18:29:16 +0100
Message-ID: <20181005172917.11963-18-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8U3j-0006CO-VC
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:38:40 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkaW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBsYW5ndWFnZSBhcyBhIHN1ZmZpeCB0byBhIHByb2dy
YW0gbmFtZSBpcwpwb29yIHByYWN0aWNlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMveGVubW9uL01ha2VmaWxlIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbm1vbi9NYWtlZmlsZSBiL3Rvb2xzL3hlbm1vbi9NYWtlZmlsZQppbmRl
eCBlNDVjNWI4YzE0Li5lMTcxMjMwNGQwIDEwMDY0NAotLS0gYS90b29scy94ZW5tb24vTWFrZWZp
bGUKKysrIGIvdG9vbHMveGVubW9uL01ha2VmaWxlCkBAIC0zMiwxMyArMzIsMTMgQEAgaW5zdGFs
bDogYnVpbGQKIAkkKElOU1RBTExfRElSKSAkKERFU1RESVIpJChzYmluZGlyKQogCSQoSU5TVEFM
TF9QUk9HKSB4ZW5iYWtlZCAkKERFU1RESVIpJChzYmluZGlyKS94ZW5iYWtlZAogCSQoSU5TVEFM
TF9QUk9HKSB4ZW50cmFjZV9zZXRtYXNrICAkKERFU1RESVIpJChzYmluZGlyKS94ZW50cmFjZV9z
ZXRtYXNrCi0JJChJTlNUQUxMX1BST0cpIHhlbm1vbi5weSAgJChERVNURElSKSQoc2JpbmRpcikv
eGVubW9uLnB5CisJJChJTlNUQUxMX1BST0cpIHhlbm1vbi5weSAgJChERVNURElSKSQoc2JpbmRp
cikveGVubW9uCiAKIC5QSE9OWTogdW5pbnN0YWxsCiB1bmluc3RhbGw6CiAJcm0gLWYgJChERVNU
RElSKSQoc2JpbmRpcikveGVuYmFrZWQKIAlybSAtZiAkKERFU1RESVIpJChzYmluZGlyKS94ZW50
cmFjZV9zZXRtYXNrCi0Jcm0gLWYgJChERVNURElSKSQoc2JpbmRpcikveGVubW9uLnB5CisJcm0g
LWYgJChERVNURElSKSQoc2JpbmRpcikveGVubW9uCiAKIC5QSE9OWTogY2xlYW4KIGNsZWFuOgot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
