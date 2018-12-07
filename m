From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2 11/17] xen/arm: p2m: Extend
 p2m_get_entry to return the value of bit[0] (valid bit)
Date: Fri, 7 Dec 2018 10:17:30 +0000
Message-ID: <26ae67ae-450d-021c-2b36-2a49ca3c5934@arm.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-12-julien.grall@arm.com>
 <2616ff32-a45e-9ff2-b7f4-5d36f5174637@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IgRO=OQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gVDCP-0005We-A2
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 10:17:33 +0000
In-Reply-To: <2616ff32-a45e-9ff2-b7f4-5d36f5174637@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUmF2emFuLAoKT24gMDQvMTIvMjAxOCAyMDozNSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+
IE9uIDEyLzQvMTggMTA6MjYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gV2l0aCB0aGUgcmVj
ZW50IGNoYW5nZXMsIGEgUDJNIGVudHJ5IG1heSBiZSBwb3B1bGF0ZWQgYnV0IG1heSBhcyBub3QK
Pj4gdmFsaWQuIEluIHNvbWUgc2l0dWF0aW9uLCBpdCB3b3VsZCBiZSB1c2VmdWwgdG8ga25vdyB3
aGV0aGVyIHRoZSBlbnRyeQo+IAo+IEkgdGhpbmsgeW91IG1lYW4gdG8gc2F5ICJtYXkgbm90IGJl
IHZhbGlkIj8KCkNvcnJlY3QuIEkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4g
Cj4+IGhhcyBiZWVuIG1hcmtlZCBhdmFpbGFibGUgdG8gZ3Vlc3QgaW4gb3JkZXIgdG8gcGVyZm9y
bSBhIHNwZWNpZmljCj4+IGFjdGlvbi4gU28gZXh0ZW5kIHAybV9nZXRfZW50cnkgdG8gcmV0dXJu
IHRoZSB2YWx1ZSBvZiBiaXRbMF0gKHZhbGlkIGJpdCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gT3RoZXIgdGhhbiB0aGF0LAo+
IAo+IEFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
CgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXchCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
