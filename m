From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: fix SMMU driver build
Date: Wed, 29 Aug 2018 18:48:32 +0100
Message-ID: <5a763a13-fe1b-fd2d-925b-c8ade748f97e@arm.com>
References: <1535500060-13958-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535500060-13958-1-git-send-email-sstabellini@kernel.org>
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA4LzI5LzIwMTggMTI6NDcgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBBZGQgbWlzc2luZyAiQ09ORklHXyIKCkkgd291bGQgYWRkIHRoZSBjb21taXQgaWQg
d2hlcmUgdGhlIGJ1ZyB3YXMgaW50cm9kdWNlZC4KCkkgd2lsbCBjb21taXQgYW5kIGFkZCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2U6CgpUaGlzIGJ1aWxkIGZhaWx1cmUgd2FzIGludHJvZHVjZWQgYnkg
Y29tbWl0IDI3N2FhMzUyM2QgImFybTogbWFrZSBpdCAKcG9zc2libGUgdG8gZGlzYWJsZSB0aGUg
U01NVSBkcml2ZXIiLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFub3NAeGlsaW54LmNvbT4KPiAtLS0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9N
YWtlZmlsZSB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFr
ZWZpbGUgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKPiBpbmRleCAwMTU2
NDMxLi5iM2VmY2ZkIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9N
YWtlZmlsZQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZQo+IEBA
IC0xLDIgKzEsMiBAQAo+ICAgb2JqLXkgKz0gaW9tbXUubwo+IC1vYmotJChBUk1fU01NVSkgKz0g
c21tdS5vCj4gK29iai0kKENPTkZJR19BUk1fU01NVSkgKz0gc21tdS5vCj4gCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
