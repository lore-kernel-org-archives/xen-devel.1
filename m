From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
Date: Wed, 17 Apr 2019 22:00:06 +0100
Message-ID: <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGrf9-0003wE-Ln
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:00:11 +0000
In-Reply-To: <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzE3LzE5IDk6NDUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBX
ZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIHVuZGVyc3RhbmRz
IHRoZSBHQ0Npc20gaW4gdXNlIGhlcmUsIGJ1dCBzdGlsbCBjb21wbGFpbnMgdGhhdCBzcCBpcwo+
PiB1bml0aWFsaXNlZC4gSW4gc3VjaCBjYXNlcywgcmVzb3J0IHRvIHRoZSBvbGRlciB2ZXJzaW9u
cyBvZiB0aGlzIGNvZGUsCj4+IHdoaWNoIGRpcmVjdGx5IHJlYWQgc3AgaW50byB0aGUgdGVtcG9y
YXJ5IHZhcmlhYmxlLgo+Pgo+PiBOb3RlIHRoYXQgd2Ugc3RpbGwga2VlcCB0aGUgR0NDaXNtIGlu
IHRoZSBkZWZhdWx0IGNhc2UsIGFzIGl0IGNhdXNlcyBHQ0MKPj4gdG8gY3JlYXRlIHJhdGhlciBi
ZXR0ZXIgYXNzZW1ibHkuCj4+Cj4+IFRoaXMgaXMgYmFzZWQgb24gdGhlIHg4NiBjb3VudGVycGFy
dC4KPiAKPiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBiYXNlZCBvbiBhbiBleGlzdGluZyBhcHByb2Fj
aCBidXQgd2hhdCBhYm91dCBvdGhlcgo+IGNvbXBpbGVycz8gSSBoYXZlIGEgc3VnZ2VzdGlvbiBi
ZWxvdy4KCldoYXQgaWYgdGhlIGNvbXBpbGVyIGFjdHVhbGx5IHN1cHBvcnQgbmFtZWQgcmVnaXN0
ZXJzPyBXaHkgd291bGQgd2UgbWFrZSAKdGhlIGNvZGUgbGVzcyBlZmZpY2llbnQ/CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
