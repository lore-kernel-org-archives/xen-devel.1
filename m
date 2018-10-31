From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 23/25] xen/vpl011: buffer out chars when
 the backend is xen
Date: Wed, 31 Oct 2018 13:27:32 +0000
Message-ID: <c1c02433-c87a-d7c1-37ef-0616a2a0612a@arm.com>
References: <alpine.DEB.2.10.1810221859480.31582@sstabellini-ThinkPad-X260>
 <1540260184-11294-23-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540260184-11294-23-git-send-email-sstabellini@kernel.org>
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Achin.Gupta@arm.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, tim@xen.org, jbeulich@suse.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEwLzIzLzE4IDM6MDMgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS92cGwwMTEuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vdnBsMDExLmgKPiBpbmRleCA1ZWI2ZDI1Li5hYjZmZDc5IDEwMDY0NAo+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vdnBsMDExLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL3ZwbDAxMS5oCj4gQEAgLTMwLDkgKzMwLDEzIEBACj4gICAjZGVmaW5lIFZQTDAxMV9VTkxP
Q0soZCxmbGFncykgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmKGQpLT5hcmNoLnZwbDAxMS5sb2Nr
LCBmbGFncykKPiAgIAo+ICAgI2RlZmluZSBTQlNBX1VBUlRfRklGT19TSVpFIDMyCj4gKy8qIFNh
bWUgc2l6ZSBhcyBWVUFSVF9CVVRfU0laRSwgdXNlZCBpbiB2dWFydC5jICovCgpzL0JVVC9CVUYv
CgpJIHdpbGwgd2FpdCB0aGUgbmV4dCB2ZXJzaW9uIHRvIGFjayBpdCAoQUZBSUNUIE9sZWtzYW5k
ciByZXF1ZXN0ZWQgc29tZSAKY2hhbmdlcykuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
