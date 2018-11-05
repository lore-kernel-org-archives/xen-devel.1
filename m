From: Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v5 09/24] hw: i386: Move PCI host definitions to
 pci_host.h
Date: Mon,  5 Nov 2018 02:40:32 +0100
Message-ID: <20181105014047.26447-10-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j2jf=nq=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gJTuM-0003kM-5O
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 01:42:26 +0000
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

VGhlIFBDSSBob2xlIHByb3BlcnRpZXMgYXJlIG5vdCBwYyBvciBpMzg2IHNwZWNpZmljLiBUaGV5
IGJlbG9uZyB0byB0aGUKUENJIGhvc3QgaGVhZGVyIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBT
YW11ZWwgT3J0aXogPHNhbWVvQGxpbnV4LmludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2h3L2kzODYv
cGMuaCAgICAgIHwgNSAtLS0tLQogaW5jbHVkZS9ody9wY2kvcGNpX2hvc3QuaCB8IDYgKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCmluZGV4
IGZlZDEzNmZjZGQuLmJiYmRiMzNlYTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5o
CisrKyBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCkBAIC0xODIsMTEgKzE4Miw2IEBAIHZvaWQgcGNf
YWNwaV9pbml0KGNvbnN0IGNoYXIgKmRlZmF1bHRfZHNkdCk7CiAKIHZvaWQgcGNfZ3Vlc3RfaW5m
b19pbml0KFBDTWFjaGluZVN0YXRlICpwY21zKTsKIAotI2RlZmluZSBQQ0lfSE9TVF9QUk9QX1BD
SV9IT0xFX1NUQVJUICAgInBjaS1ob2xlLXN0YXJ0IgotI2RlZmluZSBQQ0lfSE9TVF9QUk9QX1BD
SV9IT0xFX0VORCAgICAgInBjaS1ob2xlLWVuZCIKLSNkZWZpbmUgUENJX0hPU1RfUFJPUF9QQ0lf
SE9MRTY0X1NUQVJUICJwY2ktaG9sZTY0LXN0YXJ0IgotI2RlZmluZSBQQ0lfSE9TVF9QUk9QX1BD
SV9IT0xFNjRfRU5EICAgInBjaS1ob2xlNjQtZW5kIgotI2RlZmluZSBQQ0lfSE9TVF9QUk9QX1BD
SV9IT0xFNjRfU0laRSAgInBjaS1ob2xlNjQtc2l6ZSIKICNkZWZpbmUgUENJX0hPU1RfQkVMT1df
NEdfTUVNX1NJWkUgICAgICJiZWxvdy00Zy1tZW0tc2l6ZSIKICNkZWZpbmUgUENJX0hPU1RfQUJP
VkVfNEdfTUVNX1NJWkUgICAgICJhYm92ZS00Zy1tZW0tc2l6ZSIKIApkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9ody9wY2kvcGNpX2hvc3QuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaV9ob3N0LmgKaW5kZXgg
YmEzMTU5NWZjNy4uZTM0M2Y0ZDljYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9wY2kvcGNpX2hv
c3QuaAorKysgYi9pbmNsdWRlL2h3L3BjaS9wY2lfaG9zdC5oCkBAIC0zOCw2ICszOCwxMiBAQAog
I2RlZmluZSBQQ0lfSE9TVF9CUklER0VfR0VUX0NMQVNTKG9iaikgXAogICAgICBPQkpFQ1RfR0VU
X0NMQVNTKFBDSUhvc3RCcmlkZ2VDbGFzcywgKG9iaiksIFRZUEVfUENJX0hPU1RfQlJJREdFKQog
CisjZGVmaW5lIFBDSV9IT1NUX1BST1BfUENJX0hPTEVfU1RBUlQgICAicGNpLWhvbGUtc3RhcnQi
CisjZGVmaW5lIFBDSV9IT1NUX1BST1BfUENJX0hPTEVfRU5EICAgICAicGNpLWhvbGUtZW5kIgor
I2RlZmluZSBQQ0lfSE9TVF9QUk9QX1BDSV9IT0xFNjRfU1RBUlQgInBjaS1ob2xlNjQtc3RhcnQi
CisjZGVmaW5lIFBDSV9IT1NUX1BST1BfUENJX0hPTEU2NF9FTkQgICAicGNpLWhvbGU2NC1lbmQi
CisjZGVmaW5lIFBDSV9IT1NUX1BST1BfUENJX0hPTEU2NF9TSVpFICAicGNpLWhvbGU2NC1zaXpl
IgorCiBzdHJ1Y3QgUENJSG9zdFN0YXRlIHsKICAgICBTeXNCdXNEZXZpY2UgYnVzZGV2OwogCi0t
IAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
