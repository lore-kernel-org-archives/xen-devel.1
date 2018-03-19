From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: Relax ARM_SMCCC_ARCH_WORKAROUND_1
	discovery
Date: Mon, 19 Mar 2018 09:35:13 +0000
Message-ID: <b5d822ef-b1b5-306a-941c-841326486ca3@arm.com>
References: <20180312131935.31545-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1803161324500.15548@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exjiF-00041a-35
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 01:35:47 +0000
In-Reply-To: <alpine.DEB.2.10.1803161324500.15548@sstabellini-ThinkPad-X260>
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDAzLzE2LzIwMTggMDg6MjcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBNb24sIDEyIE1hciAyMDE4LCBqdWxpZW4uZ3JhbGxAYXJtLmNvbSB3cm90ZToK
Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gQSByZWNl
bnQgdXBkYXRlIHRvIHRoZSBBUk0gU01DQ0NfQVJDSF9XT1JLQVJPVU5EXzEgc3BlY2lmaWNhdGlv
biAoc2VlIFsxXSkKPj4gYWxsb3dzIGZpcm13YXJlIHRvIHJldHVybiBhIG5vbiB6ZXJvLCBwb3Np
dGl2ZSB2YWx1ZSwgdG8gZGVzY3JpYmUgdGhhdAo+PiBhbHRob3VnaCB0aGUgbWl0aWdhdGlvbiBp
cyBpbXBsZW1lbnRlZCBhdCB0aGUgaGlnaGVyIGV4Y2VwdGlvbiBsZXZlbCwKPj4gdGhlIENQVSBv
biB3aGljaCB0aGUgY2FsbCBpcyBtYWRlIGlzIG5vdCBhZmZlY3RlZC4KPj4KPj4gUmVsYXggdGhl
IGNoZWNrIG9uIHRoZSByZXR1cm4gdmFsdWUgZnJvbSBBUk1fV09SS0FST1VORF8xIHNvIHRoYXQg
d2UKPj4gb25seSBlcnJvciBvdXQgaWYgdGhlIHJldHVybmVkIHZhbHVlIGlzIG5lZ2F0aXZlLgo+
Pgo+PiBbMV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9zdXBwb3J0L3NlY3VyaXR5LXVwZGF0
ZS9kb3dubG9hZHMKPj4gIkZpcm13YXJlIGludGVyZmFjZXMgZm9yIG1pdGlnYXRpbmcgQ1ZFLTIw
MTctNTcxNSBTeXN0ZW0gU29mdHdhcmUgb24gQXJtCj4+IFN5c3RlbXMiCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPj4gLS0t
Cj4+ICAgICAgVGhpcyBwYXRjaCBzaG91bGQgYmUgYmFja3BvcnRlZCBhcyBwYXJ0IG9mIFhTQS0y
NTQuCj4+Cj4+ICAgICAgVGhlcmUgYXJlIHBvdGVudGlhbCBtb3JlIG9wdGltaXphdGlvbiB0byBk
byBhcyBwYXJ0IG9mIHRoaXMKPj4gICAgICByZWxheGF0aW9uLiBGb3IgaW5zdGFuY2UsIHdlIGRy
b3BwaW5nIHRoZSBDUFUgSUQgcmVjb2duaXRpb24gYW5kCj4+ICAgICAgb25seSBsb29rIGFkIHRo
ZSBTTUNDQy4KPiAKPiBJbmRlZWQgdGhlcmUgYXJlLiBJIGFzc3VtZSBtb3JlIHBhdGNoZXMgd2ls
bCBiZSBjb21pbmc/CgpJdCBpcyBub3QgaW4gbXkgaW1tZWRpYXRlIHBsYW4uIEkgcG9pbnRlZCBv
dXQgaWYgc29tZW9uZSB3YW50cyB0byAKaW1wbGVtZW50IGFuZCBzZW5kIGEgcGF0Y2guCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
