From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools: correct tools/tests/depriv/Makefile
Date: Fri,  7 Sep 2018 11:16:54 +0200
Message-ID: <20180907091654.14700-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cynw=lv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fyCsu-0007yz-8p
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 09:17:00 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

dG9vbHMvdGVzdHMvZGVwcml2L01ha2VmaWxlIGRpcmVjdGx5IGJ1aWxkcyB0aGUgdGFyZ2V0IHBy
b2dyYW0gZnJvbQppdHMgQy1zb3VyY2UuIFRoaXMgaXMgcHJvYmxlbWF0aWMgd2hlbiBhbiBpbmNy
ZW1lbnRhbCBidWlsZCBpcyBuZWVkZWQKYWZ0ZXIgYSBoZWFkZXIgdGhlIHByb2dyYW0gaXMgZGVw
ZW5kaW5nIG9uIGhhcyBiZWVuIG1vZGlmaWVkOiBpbiB0aGlzCmNhc2UgYWxsIGhlYWRlcnMgYXJl
IGFkZGVkIGludG8gdGhlIGdjYyBjYWxsIGFuZCB0aGUgYnVpbGQgd2lsbCBmYWlsLgoKQ29ycmVj
dCB0aGF0IGJ5IGFkZGluZyBhIHJ1bGUgZm9yIGJ1aWxkaW5nIHRoZSBwcm9ncmFtIGZyb20gaXRz
IC5vCmZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Ci0tLQogdG9vbHMvdGVzdHMvZGVwcml2L01ha2VmaWxlIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0cy9kZXByaXYvTWFrZWZp
bGUgYi90b29scy90ZXN0cy9kZXByaXYvTWFrZWZpbGUKaW5kZXggMTFlMDdiN2MwMy4uM2NiYTI4
ZGEyNSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMvZGVwcml2L01ha2VmaWxlCisrKyBiL3Rvb2xz
L3Rlc3RzL2RlcHJpdi9NYWtlZmlsZQpAQCAtNDAsNiArNDAsOSBAQCBjbGVhbjoKIC5QSE9OWTog
ZGlzdGNsZWFuCiBkaXN0Y2xlYW46IGNsZWFuCiAKK2RlcHJpdi1mZC1jaGVja2VyOiBkZXByaXYt
ZmQtY2hlY2tlci5vCisJJChDQykgJChMREZMQUdTKSAtbyAkQCAkPCAkKExETElCUykgJChBUFBF
TkRfTERGTEFHUykKKwogaW5zdGFsbDogYWxsCiAJJChJTlNUQUxMX0RJUikgJChERVNURElSKSQo
TElCRVhFQ19CSU4pCiAJJChJTlNUQUxMX1BST0cpICQoSU5TVEFMTF9QUklWQklOKSAkKERFU1RE
SVIpJChMSUJFWEVDX0JJTikKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
