From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 01/20] xen/const: Introduce _BITUL and _BITULL
Date: Mon, 22 Apr 2019 17:49:18 +0100
Message-ID: <20190422164937.21350-2-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8f-0004Qe-N1
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:49:53 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Andrii_Anisov@epam.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdHRlcm4gX0FDKDEsIFVMeyxMfSkgPDwgWCBpcyBjb21tb25seSB1c2VkIGluIHRoZSBo
ZWFkZXJzIHRvIG1ha2UKZGVmaW5lIHVzdWFibGUgaW4gYm90aCBhc3NlbWJseSBhbmQgQy4KClNv
IGludHJvZHVjZSBfQklUVUwgYW5kIF9CSVRVTEwgdG8gbWFrZSB0aGUgY29kZSBzbGlnaHRseSBt
b3JlIHJlYWRhYmxlLgoKVGhlIGlkZWEgaGFzIGJlZW4gdGFrZW4gZnJvbSBMaW51eCAoc2VlIGlu
Y2x1ZGUvdWFwaS9saW51eC5oKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2luY2x1ZGUveGVuL2NvbnN0LmggfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi9jb25zdC5oIGIveGVuL2luY2x1ZGUveGVuL2NvbnN0LmgKaW5kZXggMGQ1YjJjNjRmNS4uYjRi
MDY3YmZmYSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbnN0LmgKKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2NvbnN0LmgKQEAgLTIxLDQgKzIxLDcgQEAKICNkZWZpbmUgX0FUKFQsWCkJKChU
KShYKSkKICNlbmRpZgogCisjZGVmaW5lIF9CSVRVTCh4KQkoX0FDKDEsIFVMKSA8PCAoeCkpCisj
ZGVmaW5lIF9CSVRVTEwoeCkJKF9BQygxLCBVTEwpIDw8ICh4KSkKKwogI2VuZGlmIC8qIF9fWEVO
X0NPTlNUX0hfXyAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
