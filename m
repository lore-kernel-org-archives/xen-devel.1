From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 01/12] arm:Kconfig Rename menu text
Date: Tue, 13 Mar 2018 12:15:46 +0000
Message-ID: <d4550836-f63d-eea4-30d9-d2fd505e7c08@linaro.org>
References: <cover.1520857428.git.manish.jaggi@cavium.com>
 <8f00c7bf93c9d0d66fb6ed70cc2f5bf0dbb5e7ab.1520857428.git.manish.jaggi@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ocdw=gd=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eviqO-00013e-Hu
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 12:15:52 +0000
Received: by mail-wr0-x243.google.com with SMTP id o8so22024303wra.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 05:15:49 -0700 (PDT)
In-Reply-To: <8f00c7bf93c9d0d66fb6ed70cc2f5bf0dbb5e7ab.1520857428.git.manish.jaggi@cavium.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mjaggi@caviumnetworks.com, marc.zyngier@arm.com, sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi8wMy8xOCAxMjo0MiwgbWphZ2dpQGNhdml1bW5ldHdvcmtzLmNvbSB3cm90ZToK
PiBGcm9tOiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBjYXZpdW0uY29tPgo+IAo+IFJlbmFt
ZSB0aGUgbWVudSB0ZXh0IHRvIEVycmF0YSBXb3JrYXJvdW5kcy4gU3Vic2VxdWVudCBwYXRjaGVz
IHdpbGwKPiBhZGQgY29uZmlnIG9wdGlvbnMgZm9yIFNvQyBzcGVjaWZpYyBlcnJhdGFzLgoKV2Vs
bCwgeW91ciBTb0MgaXMgYW4gQXJtIFNvQywgcmlnaHQ/IFNvIHdoYXQgaXMgdGhlIGJlbmVmaXRz
IG9mIHRoaXMgbmV3IApuYW1lPyBNb3JlIHRoYXQgaXQgc3RpbGwgZGVwZW5kcyBvbiBIQVNfQUxU
RVJOQVRJVkUuCgpDaGVlcnMsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hbmlzaCBKYWdnaSA8bWFu
aXNoLmphZ2dpQGNhdml1bS5jb20+Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmln
Cj4gaW5kZXggZjU4MDE5ZDZlZC4uMTBhNmQxYTk1NiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZwo+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4gQEAgLTU5LDcgKzU5LDcg
QEAgY29uZmlnIFNCU0FfVlVBUlRfQ09OU09MRQo+ICAgCj4gICBlbmRtZW51Cj4gICAKPiAtbWVu
dSAiQVJNIGVycmF0YSB3b3JrYXJvdW5kIHZpYSB0aGUgYWx0ZXJuYXRpdmUgZnJhbWV3b3JrIgo+
ICttZW51ICJFcnJhdGEgd29ya2Fyb3VuZHMiCj4gICAJZGVwZW5kcyBvbiBIQVNfQUxURVJOQVRJ
VkUgPgo+ICAgY29uZmlnIEFSTTY0X0VSUkFUVU1fODI3MzE5Cj4gCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
