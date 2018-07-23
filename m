From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] docs: use the make wildcard function instead of
 find
Date: Mon, 23 Jul 2018 18:00:32 +0200
Message-ID: <20180723160032.62597-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6gub=kh=citrix.com=prvs=735afa564=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fhdGJ-0002mS-Dd
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 16:00:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlZ2V4cCB1c2VkIHdpdGggZmluZCBpbiBvcmRlciB0byBsaXN0IHRoZSBtYW4gcGFnZXMg
ZG9lc24ndCB3b3JrCndpdGggRnJlZUJTRCBmaW5kLCBzbyB1c2UgYSB3aWxkY2FyZCBpbnN0ZWFk
LiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBkb2Nz
L01ha2VmaWxlIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL01ha2VmaWxlIGIvZG9jcy9NYWtlZmls
ZQppbmRleCBiMzAwYmI2YmUxLi5mYmE2NjczZGI2IDEwMDY0NAotLS0gYS9kb2NzL01ha2VmaWxl
CisrKyBiL2RvY3MvTWFrZWZpbGUKQEAgLTgsMTAgKzgsMTAgQEAgREFURQkJOj0gJChzaGVsbCBk
YXRlICslWS0lbS0lZCkKIERPQ19BUkNIRVMgICAgICA6PSBhcm0geDg2XzMyIHg4Nl82NAogCiAj
IERvY3VtZW50YXRpb24gc291cmNlcyB0byBidWlsZAotTUFOMVNSQy15IDo9ICQoc29ydCAkKHNo
ZWxsIGZpbmQgbWFuLyAtcmVnZXggJy4qXC5cKHBvZFx8bWFya2Rvd25cKVwuMScgLXByaW50KSkK
LU1BTjVTUkMteSA6PSAkKHNvcnQgJChzaGVsbCBmaW5kIG1hbi8gLXJlZ2V4ICcuKlwuXChwb2Rc
fG1hcmtkb3duXClcLjUnIC1wcmludCkpCi1NQU43U1JDLXkgOj0gJChzb3J0ICQoc2hlbGwgZmlu
ZCBtYW4vIC1yZWdleCAnLipcLlwocG9kXHxtYXJrZG93blwpXC43JyAtcHJpbnQpKQotTUFOOFNS
Qy15IDo9ICQoc29ydCAkKHNoZWxsIGZpbmQgbWFuLyAtcmVnZXggJy4qXC5cKHBvZFx8bWFya2Rv
d25cKVwuOCcgLXByaW50KSkKK01BTjFTUkMteSA6PSAkKHNvcnQgJCh3aWxkY2FyZCBtYW4vKi5w
b2QuMSBtYW4vKi5tYXJrZG93bi4xKSkKK01BTjVTUkMteSA6PSAkKHNvcnQgJCh3aWxkY2FyZCBt
YW4vKi5wb2QuNSBtYW4vKi5tYXJrZG93bi41KSkKK01BTjdTUkMteSA6PSAkKHNvcnQgJCh3aWxk
Y2FyZCBtYW4vKi5wb2QuNyBtYW4vKi5tYXJrZG93bi43KSkKK01BTjhTUkMteSA6PSAkKHNvcnQg
JCh3aWxkY2FyZCBtYW4vKi5wb2QuOCBtYW4vKi5tYXJrZG93bi44KSkKIAogTUFSS0RPV05TUkMt
eSA6PSAkKHNvcnQgJChzaGVsbCBmaW5kIG1pc2MgLW5hbWUgJyoubWFya2Rvd24nIC1wcmludCkp
CiAKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
