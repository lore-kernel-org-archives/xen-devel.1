From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH UPSTREAM] xen-swiotlb: fix the check
 condition for xen_swiotlb_free_coherent
Date: Thu, 17 May 2018 21:10:03 +0200
Message-ID: <20180517191003.GD504__25482.9921680086$1526584177$gmane$org@kroah.com>
References: <25d8a709-9f2f-fe09-f66c-2a0704ddbbb0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cltl=ie=linuxfoundation.org=gregkh@kernel.org>)
 id 1fJOIB-0005cb-58
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 19:10:23 +0000
Content-Disposition: inline
In-Reply-To: <25d8a709-9f2f-fe09-f66c-2a0704ddbbb0@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, ASHISH_B_SRIVASTAVA <ashish.b.srivastava@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgMTE6NDU6NTdBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBXaGVuIHJ1biByYWlkY29uZmlnIGZyb20gRG9tMCB3ZSBmb3VuZCB0aGF0IHRoZSBYZW4gRE1B
IGhlYXAgaXMgcmVkdWNlZCwKPiBidXQgRG9tIEhlYXAgaXMgaW5jcmVhc2VkIGJ5IHRoZSBzYW1l
IHNpemUuIFRyYWNpbmcgcmFpZGNvbmZpZyB3ZSBmb3VuZAo+IHRoYXQgdGhlIHJlbGF0ZWQgaW9j
dGwoKSBpbiBtZWdhcmFpZF9zYXMgd2lsbCBjYWxsIGRtYV9hbGxvY19jb2hlcmVudCgpCj4gdG8g
YXBwbHkgbWVtb3J5LiBJZiB0aGUgbWVtb3J5IGFsbG9jYXRlZCBieSBEb20wIGlzIG5vdCBpbiB0
aGUgRE1BIGFyZWEsCj4gaXQgd2lsbCBleGNoYW5nZSBtZW1vcnkgd2l0aCBYZW4gdG8gbWVldCB0
aGUgcmVxdWltZW50LiBMYXRlciBkcml2ZXJzCj4gY2FsbCBkbWFfZnJlZV9jb2hlcmVudCgpIHRv
IGZyZWUgdGhlIG1lbW9yeSwgb24geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpCj4gdGhlIGNo
ZWNrIGNvbmRpdGlvbiAoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykgaXMgYWx3YXlz
IGZhbHNlLAo+IGl0IHByZXZlbnRzIGNhbGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdp
b24oKSB0byByZXR1cm4gdGhlIG1lbW9yeQo+IHRvIHRoZSBYZW4gRE1BIGhlYXAuCj4gCj4gVGhp
cyBpc3N1ZSBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCA2ODEwZGY4OGRjZmMyICJ4ZW4tc3dpb3RsYjog
V2hlbiBkb2luZwo+IGNvaGVyZW50IGFsbG9jL2RlYWxsb2MgY2hlY2sgYmVmb3JlIHN3aXp6bGlu
ZyB0aGUgTUZOcy4iLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZSBKaW4gPGpvZS5qaW5Ab3JhY2xl
LmNvbT4KPiBUZXN0ZWQtYnk6IEpvaG4gU29iZWNraSA8am9obi5zb2JlY2tpQG9yYWNsZS5jb20+
IAo+IFJldmlld2VkLWJ5OiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4K
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL3hlbi9zd2lvdGxi
LXhlbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCldoYXQgZG9lcyAiUEFUQ0ggVVBTVFJFQU0iIG1lYW4/Cgpjb25mdXNlZCwKCmdyZWcg
ay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
