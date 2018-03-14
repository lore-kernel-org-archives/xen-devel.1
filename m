From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/6] xen/arm: vgic: Override the group in lr
	everytime
Date: Wed, 14 Mar 2018 18:07:24 +0000
Message-ID: <1b308c7f-01d9-c2fb-0144-6e2369104395@arm.com>
References: <20180309163511.18808-1-julien.grall@arm.com>
 <20180309163511.18808-3-julien.grall@arm.com>
 <2719da50-267c-90fe-0cdd-e3fad7690ac5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ty01=ge=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ewAoH-0004VI-Ga
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 18:07:33 +0000
In-Reply-To: <2719da50-267c-90fe-0cdd-e3fad7690ac5@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xNC8yMDE4IDA2OjAyIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBPbiAwOS8wMy8xOCAxNzozNSwganVsaWVuLmdyYWxsQGFybS5jb20gd3JvdGU6Cj4+IEZyb206
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IEF0IHRoZSBtb21lbnQs
IHdyaXRlX2xyIGlzIGFzc3VtaW5nIHRoZSBjYWxsZXIgd2lsbCBzZXQgY29ycmVjdGx5IHRoZQo+
PiBncm91cC4gSG93ZXZlciB0aGUgZ3JvdXAgc2hvdWxkIGFsd2F5cyBiZSAwIHdoZW4gdGhlIGd1
ZXN0IGlzIHVzaW5nCj4+IHZHSUN2MiBhbmQgMSBmb3IgdkdJQ3YzLiBBcyB0aGUgY2FsbGVyIHNo
b3VsZCBub3QgY2FyZSBhYm91dCB0aGUgZ3JvdXAsCj4+IG92ZXJyaWRlIGl0IGRpcmVjdGx5Lgo+
IAo+IEkgdGhpbmsgdGhhdCBtYWtlcyBzZW5zZSwgbW9zdGx5IGJlY2F1c2UgdGhpcyBpcyB3aGF0
IEtWTSBkb2VzIGFzIHdlbGwuCj4gQW5kIGl0J3MgYSBnb29kIGlkZWEgdG8gZG8gdGhpcyBpbiB3
cml0ZV9scigpLgo+IAo+IEkgdW5kZXJzdGFuZCB0aGF0IHRoaXMgaXMgZWZmZWN0aXZlbHkgd2hh
dCBJIGRpZCBpbiB0aGUgbmV3IFZHSUMsIGJ1dCBpdAo+IHdvdWxkIGJlIGdvb2QgdG8gZG91Ymxl
IGNoZWNrIHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8KPiBmb3IgdGhlIG9sZCBW
R0lDIGFzIHdlbGwuIERpZCB5b3UgdGVzdCB0aGlzIG9uIHNvbWUgR0lDdjMgaC93IG9yIHRoZQo+
IG1vZGVsPyBPciBkbyB3ZSBhbHdheXMgY2FsbCB1cGRhdGVfbHIoKSBhbnl3YXk/CgpJIGhhZCBh
IHBhdGNoIHRvIHJlbW92ZSB1cGRhdGVfbHIgYW5kIHVzZSB3cml0ZV9sci4gSSBleGVyY2lzZWQg
dGhlIGNvZGUgCndpdGggaXQgYnV0IGRpZG4ndCBzZW5kIGl0IGJlY2F1c2Ugb2Ygc29tZSBuYXN0
eSBidWcgd2l0aCB0aGUgcHJpb3JpdHkgCmluIHdyaXRlX2xyIGFuZCB0aGUgb2xkIHZHSUMuCgpP
biB0aGUgb2xkIHZHSUMgd3JpdGVfbHIgaXMgb25seSB1c2VkIHdoZW4gaW4gZ2ljX3VwZGF0ZV9v
bmVfbHIoLi4uKSAKY29tYmluZSB3aXRoIHJlYWRfbHIgYmVmb3JlLiBJbiB0aGF0IGNvbnRleHQg
d2UgZG9uJ3QgY2FyZSBhYm91dCB0aGUgCmdyb3VwLCBzbyBvdmVyd3JpdGluZyBpdCBpcyBmaW5l
IGFuZCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
