From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 26/31] OvmfPkg/XenOvmf: Override PcdFSBClock
 to Xen vLAPIC timer frequency
Date: Tue, 9 Apr 2019 12:08:39 +0100
Message-ID: <20190409110844.14746-27-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDovJ-0000rK-RT
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:17 +0000
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhhdCB2YWx1ZSBpcyB1c2VkIGJ5IFNlY1BlaUR4ZVRpbWVyTGliQ3B1LCB0aGUgVGltZXJMaWIg
aW1wbGVtZW50YXRpb24uCkl0IHdpbGwgYWxzbyBiZSB1c2VkIGJ5IFhlblRpbWVyRHhlLgoKQ29u
dHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0t
CgpOb3RlczoKICAgIG5ldyBwYXRjaCBpbiB2Mi4KCiBPdm1mUGtnL1hlbk92bWYuZHNjIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlbk92bWYuZHNjIGIvT3ZtZlBrZy9YZW5Pdm1mLmRzYwppbmRleCA5NTI5YjQ4MzRmLi41NDYw
MWM2OTdmIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlbk92bWYuZHNjCisrKyBiL092bWZQa2cvWGVu
T3ZtZi5kc2MKQEAgLTQ1Miw2ICs0NTIsOSBAQCBbUGNkc0ZpeGVkQXRCdWlsZF0KICAgIyBQb2lu
dCB0byB0aGUgTWRlTW9kdWxlUGtnL0FwcGxpY2F0aW9uL1VpQXBwL1VpQXBwLmluZgogICBnRWZp
TWRlTW9kdWxlUGtnVG9rZW5TcGFjZUd1aWQuUGNkQm9vdE1hbmFnZXJNZW51RmlsZXx7IDB4MjEs
IDB4YWEsIDB4MmMsIDB4NDYsIDB4MTQsIDB4NzYsIDB4MDMsIDB4NDUsIDB4ODMsIDB4NmUsIDB4
OGEsIDB4YjYsIDB4ZjQsIDB4NjYsIDB4MjMsIDB4MzEgfQogCisgICMjIFhlbiB2bGFwaWMncyBm
cmVxdWVuY2UgaXMgMTAwIE1IegorICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1aWQuUGNkRlNCQ2xv
Y2t8MTAwMDAwMDAwCisKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAjCiAjIFBjZCBEeW5hbWlj
IFNlY3Rpb24gLSBsaXN0IG9mIGFsbCBFREsgSUkgUENEIEVudHJpZXMgZGVmaW5lZCBieSB0aGlz
IFBsYXRmb3JtCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
