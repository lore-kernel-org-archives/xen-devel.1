From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 26/31] OvmfPkg/XenOvmf: Override PcdFSBClock
 to Xen vLAPIC timer frequency
Date: Mon, 8 Apr 2019 15:24:03 +0100
Message-ID: <20190408142408.30419-27-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVFW-00024w-Ge
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:27:50 +0000
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
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
