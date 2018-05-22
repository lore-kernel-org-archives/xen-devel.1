From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PULL v2 06/15] checkpatch: generalize xen handle
 matching in the list of types
Date: Tue, 22 May 2018 11:46:33 -0700
Message-ID: <1527014802-11289-6-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1805221136110.24793@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jkpe=ij=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fLCJ4-0008RE-Uy
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 18:46:46 +0000
In-Reply-To: <alpine.DEB.2.10.1805221136110.24793@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: peter.maydell@linaro.org, stefanha@gmail.com
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, stefanha@redhat.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCkFsbCB0aGUgeGVu
IHN0YWJsZSBBUElzIGRlZmluZSBoYW5kbGUgdHlwZXMgb2YgdGhlIGZvcm06Cgp4ZW48c3ViamVj
dCBvZiBBUEk+X2hhbmRsZQoKYW5kIHNvbWUgZGVmaW5lIGFkZGl0aW9uYWwgaGFuZGxlIHR5cGVz
IG9mIHRoZSBmb3JtOgoKeGVuPHN1YmplY3Qgb2YgQVBJPl88cHVycG9zZSBvZiBoYW5kbGU+X2hh
bmRsZQoKRXhhbXBsZXMgb2YgdGhlc2UgYXJlIHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlIGFuZAp4
ZW5mb3JlaWdubWVtb3J5X3Jlc291cmNlX2hhbmRsZS4KCkJvdGggb2YgdGhlc2UgdHlwZXMgd2ls
bCBiZSBtaXNwYXJzZWQgYnkgY2hlY2twYXRjaCBpZiB0aGV5IGFwcGVhciBhcyB0aGUKZmlyc3Qg
dG9rZW4gaW4gYSBsaW5lIHNpbmNlLCBhcyB0eXBlcyBkZWZpbmVkIGJ5IGFuIGV4dGVybmFsIGxp
YnJhcnksIHRoZXkKZG8gbm90IGNvbmZvcm0gdG8gdGhlIFFFTVUgQ09ESU5HX1NUWUxFLCB3aGlj
aCBzdWdnZXN0cyBDYW1lbENhc2UuCgpBIHByZXZpb3VzIHBhdGNoICg1YWMwNjdhMjRhOCkgYWRk
ZWQgeGVuZGV2aWNlbW9kZWxfaGFuZGxlIHRvIHRoZSBsaXN0Cm9mIHR5cGVzLiBUaGlzIHBhdGNo
IGNoYW5nZXMgdGhhdCB0byB4ZW5cdytfaGFuZGxlIHN1Y2ggdGhhdCBpdCB3aWxsCm1hdGNoIGFs
bCBYZW4gc3RhYmxlIEFQSSBoYW5kbGVzIG9mIHRoZSBmb3JtcyBkZXRhaWxlZCBhYm92ZS4KClNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci0tLQogc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2NyaXB0cy9jaGVja3Bh
dGNoLnBsCmluZGV4IGNiMWI2NTIuLmUzZDhjMmMgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvY2hlY2tw
YXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKQEAgLTI3MSw3ICsyNzEsNyBAQCBv
dXIgQHR5cGVMaXN0ID0gKAogCXFye2h3YWRkcn0sCiAgICAgICAgICMgZXh0ZXJuYWwgbGlicmFy
aWVzCiAJcXJ7eG1sJHtJZGVudH19LAotCXFye3hlbmRldmljZW1vZGVsX2hhbmRsZX0sCisJcXJ7
eGVuXHcrX2hhbmRsZX0sCiAJIyBHbGliIGRlZmluaXRpb25zCiAJcXJ7Z2NoYXJ9LAogCXFye2dz
aG9ydH0sCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
