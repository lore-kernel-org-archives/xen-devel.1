From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Mon, 25 Feb 2019 18:25:32 +0000
Message-ID: <c33f00d2-f75f-d193-7a66-b821e34bdfe2@arm.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
 <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
 <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
 <ffc9d12a-0579-bcfd-428b-401524949009@arm.com>
 <0839f3bf-384b-ceb6-4412-677575367387@gmail.com>
 <2ccd6cca-57c0-d9b0-2a82-7459b72ab555@gmail.com>
 <854eb0c4-c5e5-d19f-cc50-ba623d19a24f@arm.com>
 <52ea302e-20fa-f689-5eec-c40945ae6006@gmail.com>
 <226075fe-396e-15f7-221c-8beb17651c23@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Rhx=RA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gyKx4-0000Ja-6E
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 18:26:06 +0000
In-Reply-To: <226075fe-396e-15f7-221c-8beb17651c23@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMjAxOSAxNzozNCwgT2xla3NhbmRyIHdyb3RlOgo+IAo+IEhpLCBKdWxpZW4KCkhp
IE9sZWtzYW5kciwKCj4gCj4+PiBZb3VyIHNvbHV0aW9uIGJlbG93IHJlcXVpcmUgdG8gb3Zlcndy
aXRlIEVBUkxZX1BSSU5US19JTkMgYW5kIG5vdCB2ZXJ5IGVhc3kgCj4+PiB0byBleHRlbmQgb2Yg
b3RoZXIgdmVyc2lvbiAoZS5nIHNjaWZiKS4gQXMgSSBzdWdnZXN0ZWQgZWFybGllciwgd2UgY2Fu
IAo+Pj4gaW50cm9kdWNlIGFuIG9wdGlvbiB0aGUgc2FtZSB3YXkgUkVHX1NISUZUIGV4aXN0IGZv
ciA4MjUwLiBUaGUgZGVmaW5pdGlvbiBvZiAKPj4+IENPTkZJR19FQVJMWV9QUklOVEsgaXM6Cj4+
Pgo+Pj4gQ09ORklHX0VBUkxZX1BSSU5USz08SU5DPiw8QkFTRV9BRERSRVNTPiw8T1RIRVJfT1BU
SU9OUz4KPj4+Cj4+PiA8T1RIRVJfT1BUSU9OUz4gd291bGQgYmUgdGhlIHZlcnNpb24uIE5vdGhp
bmcgZm9yIFNDSUYgYW5kIEEgZm9yIFNDRklBLgo+Pj4KPj4+IFRoZW4gaW4gUnVsZXMubWssIHlv
dSB3b3VsZCBoYXZlIHNvbWV0aGluZyBsaWtlOgo+Pj4KPj4+IGlmbmVxICgkKHdvcmQgMywkKEVB
UkxZX1BSSU5US19DRkcpKSwpCj4+PiBDRkxBR1MteSArPSAtRENPTkZJR19FQVJMWV9QUklOVEtf
VkVSU0lPTl8kKHdvcmQgMywgJChFQVJMWV9QUklOVEtfQ0ZHKQo+Pj4gZWxzZQo+Pj4gQ0ZMQUdT
LXkgKz0gLURDT05GSUdfRUFSTFlfUFJJTlRLX1ZFUlNJT05fTk9ORQo+Pj4gZW5kaWYKPj4+Cj4+
PiBkZWJ1Zy1zY2lmLmluYyB3b3VsZCB0aGVuIGNvbnRhaW46Cj4+Pgo+Pj4gI2lmZGVmIENPTkZJ
R19FQVJMWV9QUklOVEtfVkVSU0lPTl9BCj4+PiAjZGVmaW5lIGZvbwo+Pj4gI2RlZmluZSBiYXIK
Pj4+ICNlbGlmZGVmIENPTkZJR19FQVJMWV9QUklOVEtfVkVSU0lPTl9OT05FCj4+PiAjZGVmaW5l
IGZvbwo+Pj4gI2RlZmluZSBiYXIKPj4+ICNlbmRpZgo+Pj4KPj4+IFRoZSBDT05GSUdfRUFSTFlf
UFJJTlRLX1ZFUlNJT05fTk9ORSBpcyBoZXJlIHRvIGhlbHAgY2F0Y2hpbmcgbmV3IGFkZGl0aW9u
LiAKPj4+IElmIHNvbWVvbmUgaWYgdXNpbmcgYSBkaWZmZXJlbnQgdmVyc2lvbiwgaXQgd291bGQg
bm90IGNvbXBpbGUuCj4+PiBBbHNvLCB0aGUgY29kZSBpbiBSdWxlcy5tayBpcyBnZW5lcmljIGVu
b3VnaCB0byBleHRlbmQgZm9yIG90aGVyIHZlcnNpb24gKGUuZyAKPj4+IHNjaWZiKS4KPj4+Cj4+
PiBEb2VzIGl0IG1ha2Ugc2Vuc2U/Cj4+Cj4+IEFic29sdXRlbHkuIFRoYW5rIHlvdQo+IAo+IAo+
IElkZWEgd29ya3MgYXMgZXhwZWN0ZWQuCj4gCj4gCj4gSnVzdCBhIHF1aWNrIHF1ZXN0aW9uLgo+
IAo+IFNoYWxsIEkgZG8gdGhpcyBieSBhIHNpbmdsZSBwYXRjaCBvciB0aGlzIHNob3VsZCBiZSBz
cGl0dGVkIGluIHR3byBwYXRjaGVzOiAKPiAicmV3b3JraW5nIGN1cnJlbnQgY29kZSIgZm9sbG93
ZWQgYnkgImFkZGluZyBTQ0lGQSI/CgpTZXBhcmF0ZSBwYXRjaCBpZiBwb3NzaWJsZS4gVGhhbmsg
eW91IQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
