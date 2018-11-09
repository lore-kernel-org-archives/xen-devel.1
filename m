From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 07/26] xen/arm: don't add duplicate boot
 modules, introduce domU flag
Date: Fri, 9 Nov 2018 14:06:22 +0000
Message-ID: <84b8e613-49ae-a80d-ff22-baad439a51ab@arm.com>
References: <alpine.DEB.2.10.1811021527250.18518@sstabellini-ThinkPad-X260>
 <1541202318-9840-7-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541202318-9840-7-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDAyLzExLzIwMTggMjM6NDQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBEb24ndCBhZGQgZHVwbGljYXRlIGJvb3QgbW9kdWxlcyAoc2FtZSBraW5kIGFuZCBzYW1l
IHN0YXJ0IGFkZHJlc3MpLAo+IHRoZXkgYXJlIGZyZWVkIGxhdGVyLCB3ZSBkb24ndCB3YW50IHRv
IGludHJvZHVjZSBkb3VibGUtZnJlZSBlcnJvcnMuCj4gCj4gSW50cm9kdWNlIGEgZG9tVSBmbGFn
IGluIHN0cnVjdCBib290bW9kdWxlIGFuZCBzdHJ1Y3QgYm9vdGNtZGxpbmUuIFNldAo+IGl0IGZv
ciBrZXJuZWxzIGFuZCByYW1kaXNrcyBvZiAieGVuLGRvbWFpbiIgbm9kZXMgdG8gYXZvaWQgZ2V0
dGluZwo+IGNvbmZ1c2VkIGluIGtlcm5lbF9wcm9iZSwgd2hlcmUgd2UgdHJ5IHRvIGd1ZXNzIHdo
aWNoIGlzIHRoZSBkb20wIGtlcm5lbAo+IGFuZCBpbml0cmQgdG8gYmUgY29tcGF0aWJsZSB3aXRo
IGFsbCB2ZXJzaW9ucyBvZiB0aGUgbXVsdGlib290IHNwZWMuCj4gCj4gYm9vdF9tb2R1bGVfZmlu
ZF9ieV9raW5kIGFuZCBib290X2NtZGxpbmVfZmluZF9ieV9raW5kIGF1dG9tYXRpY2FsbHkKPiBj
aGVjayBmb3IgIWRvbVUgZW50cmllcyAodGhleSBhcmUgb25seSB1c2VkIGZvciBub24tZG9tVSBt
b2R1bGVzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9z
QHhpbGlueC5jb20+CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
