From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/20] configs/alpha: Remove unused
 CONFIG_PARALLEL_ISA switch
Date: Fri, 26 Oct 2018 17:31:06 +0200
Message-ID: <20181026153125.24738-2-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45X-0000sN-Mk
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:31:51 +0000
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CgpXZSBkb24ndCB1c2UgQ09ORklH
X1BBUkFMTEVMX0lTQSBpbiBhbnkgb2Ygb3VyIE1ha2VmaWxlcywgc28gdGhpcwppcyBqdXN0IGEg
ZGVhZCBjb25maWcgb3B0aW9uIHdoaWNoIGNhbiBiZSByZW1vdmVkLgoKRml4ZXM6IGE0Y2I3NzM5
MjhlMDQ3YjEzN2M2OTk4MjA5Y2YyZWVjODU3ZmFjNmIKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEh1
dGggPHRodXRoQHJlZGhhdC5jb20+CkFja2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDE1NDAzNzYzMTQtNTcyNy0xLWdp
dC1zZW5kLWVtYWlsLXRodXRoQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgVml2
aWVyIDxsYXVyZW50QHZpdmllci5ldT4KLS0tCiBkZWZhdWx0LWNvbmZpZ3MvYWxwaGEtc29mdG1t
dS5tYWsgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZGVmYXVsdC1jb25maWdzL2FscGhhLXNvZnRtbXUubWFrIGIvZGVmYXVsdC1jb25maWdzL2FscGhh
LXNvZnRtbXUubWFrCmluZGV4IGViNThiNDAyNTQuLjRkNjU0ZWFhMGIgMTAwNjQ0Ci0tLSBhL2Rl
ZmF1bHQtY29uZmlncy9hbHBoYS1zb2Z0bW11Lm1haworKysgYi9kZWZhdWx0LWNvbmZpZ3MvYWxw
aGEtc29mdG1tdS5tYWsKQEAgLTgsNyArOCw2IEBAIENPTkZJR19JODIzNzQ9eQogQ09ORklHX0k4
MjU0PXkKIENPTkZJR19JODI1Nz15CiBDT05GSUdfUEFSQUxMRUw9eQotQ09ORklHX1BBUkFMTEVM
X0lTQT15CiBDT05GSUdfRkRDPXkKIENPTkZJR19QQ0tCRD15CiBDT05GSUdfVkdBX0NJUlJVUz15
Ci0tIAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
