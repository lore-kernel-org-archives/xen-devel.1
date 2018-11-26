From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] xen/arch: Switch local_irq_restore() to
 being a static inline helper
Date: Mon, 26 Nov 2018 06:30:33 -0700
Message-ID: <5BFBF579020000780020000B@prv1-mh.provo.novell.com>
References: <1542991976-6190-1-git-send-email-andrew.cooper3@citrix.com>
 <1542991976-6190-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542991976-6190-5-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDE3OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUkZDLCBhcyBJIGV4cGVjdCB0aGlzIHBhdGNoIHRvIGdldCBzb21lIG9iamVjdGlvbiBm
b3IgcmVtb3ZpbmcgdGhlIElSUSBzYWZldHkKPiBjaGVjaywgYnV0IHRoZSBvbmx5IHJlYXNvbnMg
dGhhdCBjaGFuZ2Ugd2FzIG1hZGUgaW4gZTVmYzY0MzRkNyB3YXMgYmVjYXVzZSBJCj4gdGFsayB0
YWxrZWQgaW50byBkb2luZyBpdCB3aGlsZSB0cnlpbmcgdG8gY2xlYW4gdXAgc29tZSB1bm5lY2Vz
c2FyeSB1c2Ugb2YKPiBtYWdpYyBudW1iZXJzLgo+IAo+IE5vIHVzZXJzIGFyZSBjaGFuZ2luZyBh
bnkgZmxhZ3MgKHNlZWluZyBhcyBJJ3ZlIGF1ZGl0aW5nIHRoZW0gYWxsIGluIHRoaXMKPiBzZXJp
ZXMpLCBhbmQgdGhlIGltcHJvdmVtZW50IGluIGVtaXR0ZWQgY29kZSBuZXRzIHVzOgoKVXNlcnMg
bm90IGNoYW5naW5nIGFueSBmbGFncyBhcyBwZXIgeW91ciBhdWRpdCBpcyBvbmx5IG9uZSBoYWxm
IG9mIGl0OgpJIGFzc3VtZSB5b3UgbWVhbiB0aGUgdmFsdWUgcmV0dXJuZWQgZnJvbSBsb2NhbF9p
cnFfc2F2ZSgpIGdldHMKcGFzc2VkIGJhY2sgdW5tb2RpZmllZCBpbnRvIGxvY2FsX2lycV9yZXN0
b3JlKCkuIFRoZSBvdGhlciBxdWVzdGlvbgppcyB3aGV0aGVyIGludGVybWVkaWF0ZWx5IGFub3Ro
ZXIgY2hhbmdlIHRvIHRoZSBDUFUgcmVnaXN0ZXIgaGFzCm9jY3VycmVkLCB3aGljaCBpcyBtZWFu
dCB0byBwZXJzaXN0LiBXaXRoIEFybSBhbHNvIGNvbnRyb2xsaW5nIGUuZy4KZW5hYmxlZCBzdGF0
dXMgb2YgYWJvcnRzIHRoaXMgd2F5LCBpdCBtYXkgYmUgZXZlbiBtb3JlIG9mIGFuIGlzc3VlCnRo
ZXJlIHRoYW4gb24geDg2LgoKCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9pcnFfcmVzdG9y
ZSh1bnNpZ25lZCBsb25nIGZsYWdzKQo+ICt7Cj4gKyAgICBhc20gdm9sYXRpbGUgKCAicHVzaCAl
MDsgcG9wZjsiIDo6ICJnIiAoZmxhZ3MpIDogIm1lbW9yeSIgKTsKCkknbSBhZnJhaWQgdGhpcyBp
cyBub3QgZW50aXJlbHkgcmlnaHQgKGJ1dCBwZXJoYXBzIGJlbmlnbik6IE5vdAphbGwgY29uc3Rh
bnRzIGFyZSB2YWxpZCB0byBiZSBoYW5kZWQgdG8gUFVTSC4gSWYgeW91IHdhbnQgdG8KYWxsb3cg
aW1tZWRpYXRlcyBpbiB0aGUgZmlyc3QgcGxhY2UsIHRoaXMgd291bGQgbmVlZCB0byBiZSAicm1l
IiwKSSB0aGluay4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
