From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/18] xen/arm: Add rcu_barrier() before
 enabling non-boot CPUs on resume
Date: Tue, 13 Nov 2018 14:42:46 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811131441440.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-10-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542022244-22977-10-git-send-email-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org, dm@aggios.com, saeed.nowshadi@xilinx.com, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMiBOb3YgMjAxOCwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBUaGUgcmN1X2Jh
cnJpZXIoKSBoYXMgdG8gYmUgYWRkZWQgdG8gZW5zdXJlIHRoYXQgdGhlIHBlciBjcHUgYXJlYSBp
cwo+IGZyZWVkIGJlZm9yZSBhIG5vbi1ib290IENQVSB0cmllcyB0byBpbml0aWFsaXplIGl0IChf
ZnJlZV9wZXJjcHVfYXJlYSgpCj4gaGFzIHRvIGJlIGNhbGxlZCBiZWZvcmUgdGhlIGluaXRfcGVy
Y3B1X2FyZWEoKSkuIFRoaXMgc2NlbmFyaW8gb2NjdXJzCj4gd2hlbiBub24tYm9vdCBDUFVzIGFy
ZSBob3QtdW5wbHVnZ2VkIG9uIHN1c3BlbmQgYW5kIGhvdHBsdWdnZWQgb24gcmVzdW1lLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBTaW1vbm92aWMgPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9z
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYWVlZCBOb3dzaGFkaSA8c2FlZWQubm93c2hhZGlAeGls
aW54LmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vc3VzcGVuZC5jIHwgMSArCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
c3VzcGVuZC5jIGIveGVuL2FyY2gvYXJtL3N1c3BlbmQuYwo+IGluZGV4IGRhZTFiMWY3ZDYuLjhl
OGU1MzFkNjEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3N1c3BlbmQuYwo+ICsrKyBiL3hl
bi9hcmNoL2FybS9zdXNwZW5kLmMKPiBAQCAtMTMzLDYgKzEzMyw3IEBAIHN0YXRpYyBsb25nIHN5
c3RlbV9zdXNwZW5kKHZvaWQgKmRhdGEpCj4gICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVf
cmVzdW1lOwo+ICAKPiAgcmVzdW1lX25vbmJvb3RfY3B1czoKPiArICAgIHJjdV9iYXJyaWVyKCk7
Cj4gICAgICBlbmFibGVfbm9uYm9vdF9jcHVzKCk7Cj4gICAgICB0aGF3X2RvbWFpbnMoKTsKPiAg
ICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3RpdmU7Cj4gLS0gCj4gMi4xMy4wCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
