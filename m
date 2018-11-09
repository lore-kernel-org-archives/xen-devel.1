From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 09/24] hw: i386: Move PCI host
 definitions to pci_host.h
Date: Fri, 9 Nov 2018 15:30:48 +0100
Message-ID: <20181109153048.34fa61f2@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-10-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=irss=nu=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gL7ob-0004Fq-Ek
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 14:31:17 +0000
In-Reply-To: <20181105014047.26447-10-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAgNSBOb3YgMjAxOCAwMjo0MDozMiArMDEwMApTYW11ZWwgT3J0aXogPHNhbWVvQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IFRoZSBQQ0kgaG9sZSBwcm9wZXJ0aWVzIGFyZSBub3Qg
cGMgb3IgaTM4NiBzcGVjaWZpYy4gVGhleSBiZWxvbmcgdG8gdGhlCj4gUENJIGhvc3QgaGVhZGVy
IGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIE9ydGl6IDxzYW1lb0BsaW51eC5p
bnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcvaTM4Ni9wYy5oICAgICAgfCA1IC0tLS0tCj4g
IGluY2x1ZGUvaHcvcGNpL3BjaV9ob3N0LmggfCA2ICsrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3L2kzODYvcGMuaAo+IGluZGV4IGZlZDEzNmZjZGQu
LmJiYmRiMzNlYTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody9pMzg2L3BjLmgKPiArKysgYi9p
bmNsdWRlL2h3L2kzODYvcGMuaAo+IEBAIC0xODIsMTEgKzE4Miw2IEBAIHZvaWQgcGNfYWNwaV9p
bml0KGNvbnN0IGNoYXIgKmRlZmF1bHRfZHNkdCk7Cj4gIAo+ICB2b2lkIHBjX2d1ZXN0X2luZm9f
aW5pdChQQ01hY2hpbmVTdGF0ZSAqcGNtcyk7Cj4gIAo+IC0jZGVmaW5lIFBDSV9IT1NUX1BST1Bf
UENJX0hPTEVfU1RBUlQgICAicGNpLWhvbGUtc3RhcnQiCj4gLSNkZWZpbmUgUENJX0hPU1RfUFJP
UF9QQ0lfSE9MRV9FTkQgICAgICJwY2ktaG9sZS1lbmQiCj4gLSNkZWZpbmUgUENJX0hPU1RfUFJP
UF9QQ0lfSE9MRTY0X1NUQVJUICJwY2ktaG9sZTY0LXN0YXJ0Igo+IC0jZGVmaW5lIFBDSV9IT1NU
X1BST1BfUENJX0hPTEU2NF9FTkQgICAicGNpLWhvbGU2NC1lbmQiCj4gLSNkZWZpbmUgUENJX0hP
U1RfUFJPUF9QQ0lfSE9MRTY0X1NJWkUgICJwY2ktaG9sZTY0LXNpemUiCj4gICNkZWZpbmUgUENJ
X0hPU1RfQkVMT1dfNEdfTUVNX1NJWkUgICAgICJiZWxvdy00Zy1tZW0tc2l6ZSIKPiAgI2RlZmlu
ZSBQQ0lfSE9TVF9BQk9WRV80R19NRU1fU0laRSAgICAgImFib3ZlLTRnLW1lbS1zaXplIgo+ICAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9wY2kvcGNpX2hvc3QuaCBiL2luY2x1ZGUvaHcvcGNp
L3BjaV9ob3N0LmgKPiBpbmRleCBiYTMxNTk1ZmM3Li5lMzQzZjRkOWNhIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvaHcvcGNpL3BjaV9ob3N0LmgKPiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2lfaG9z
dC5oCj4gQEAgLTM4LDYgKzM4LDEyIEBACj4gICNkZWZpbmUgUENJX0hPU1RfQlJJREdFX0dFVF9D
TEFTUyhvYmopIFwKPiAgICAgICBPQkpFQ1RfR0VUX0NMQVNTKFBDSUhvc3RCcmlkZ2VDbGFzcywg
KG9iaiksIFRZUEVfUENJX0hPU1RfQlJJREdFKQo+ICAKPiArI2RlZmluZSBQQ0lfSE9TVF9QUk9Q
X1BDSV9IT0xFX1NUQVJUICAgInBjaS1ob2xlLXN0YXJ0Igo+ICsjZGVmaW5lIFBDSV9IT1NUX1BS
T1BfUENJX0hPTEVfRU5EICAgICAicGNpLWhvbGUtZW5kIgo+ICsjZGVmaW5lIFBDSV9IT1NUX1BS
T1BfUENJX0hPTEU2NF9TVEFSVCAicGNpLWhvbGU2NC1zdGFydCIKPiArI2RlZmluZSBQQ0lfSE9T
VF9QUk9QX1BDSV9IT0xFNjRfRU5EICAgInBjaS1ob2xlNjQtZW5kIgo+ICsjZGVmaW5lIFBDSV9I
T1NUX1BST1BfUENJX0hPTEU2NF9TSVpFICAicGNpLWhvbGU2NC1zaXplIgp0aGVzZSBhcmUgcGMv
cTUzIG1hY2hpbmUgc3BlY2lmaWMgcHJvcGVydGllcyBhbmQgZG8gbm90IGJlbG9uZyBoZXJlCgoK
PiArCj4gIHN0cnVjdCBQQ0lIb3N0U3RhdGUgewo+ICAgICAgU3lzQnVzRGV2aWNlIGJ1c2RldjsK
PiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
