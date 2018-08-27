From: Joe Jin <joe.jin@oracle.com>
Subject: [PATCH] xen: export device state to sysfs
Date: Mon, 27 Aug 2018 11:44:41 -0700
Message-ID: <030d112d-991f-4591-7eeb-94432a277c71__13922.8293592625$1535395437$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4+u3=lk=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1fuMVR-0008IZ-1p
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 18:44:53 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Joe Jin <joe.jin@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

RXhwb3J0IGRldmljZSBzdGF0ZSB0byBzeXNmcyB0byBhbGxvdyBmb3IgZWFzaWVyIGdldCBkZXZp
Y2Ugc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBKb2UgSmluIDxqb2UuamluQG9yYWNsZS5jb20+CkJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Ckp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMg
fCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfcHJvYmUuYwppbmRleCA3NDg4OGNhY2QwYjAuLjUyZjk5YjgwYTFjMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCisrKyBiL2RyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmUuYwpAQCAtNDAyLDEwICs0MDIsMTkgQEAgc3RhdGljIHNzaXpl
X3QgbW9kYWxpYXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiB9CiBzdGF0aWMgREVWSUNFX0FU
VFJfUk8obW9kYWxpYXMpOwogCitzdGF0aWMgc3NpemVfdCBzdGF0ZV9zaG93KHN0cnVjdCBkZXZp
Y2UgKmRldiwKKwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVm
KQoreworCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVzXG4iLAorCQkJeGVuYnVzX3N0cnN0YXRlKHRv
X3hlbmJ1c19kZXZpY2UoZGV2KS0+c3RhdGUpKTsKK30KK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhz
dGF0ZSk7CisKIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICp4ZW5idXNfZGV2X2F0dHJzW10gPSB7
CiAJJmRldl9hdHRyX25vZGVuYW1lLmF0dHIsCiAJJmRldl9hdHRyX2RldnR5cGUuYXR0ciwKIAkm
ZGV2X2F0dHJfbW9kYWxpYXMuYXR0ciwKKwkmZGV2X2F0dHJfc3RhdGUuYXR0ciwKIAlOVUxMLAog
fTsKIAotLSAKMi4xNS4yIChBcHBsZSBHaXQtMTAxLjEpCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
