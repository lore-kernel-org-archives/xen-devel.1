From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [SVM] Getting the length of the current instruction
 in svm_vmexit_handler()
Date: Wed, 14 Mar 2018 09:53:47 -0600
Message-ID: <5AA9539B02000078001B1A65@prv-mh.provo.novell.com>
References: <144d97a9-7616-bd21-17f6-6621fa5ad69e@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0lyu=ge=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ew8j0-0006QC-IS
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 15:53:58 +0000
In-Reply-To: <144d97a9-7616-bd21-17f6-6621fa5ad69e@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE1OjU2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gV2UnZCBsaWtlIHRvIHJldHJpZXZlIHRoZSBsZW5ndGggb2YgdGhlIGN1cnJlbnQgaW5z
dHJ1Y3Rpb24gaW4KPiBzdm1fdm1leGl0X2hhbmRsZXIoKSwgc3BlY2lmaWNhbGx5IGZvciB0aGUg
Vk1FWElUX0VYQ0VQVElPTl9EQiBhbmQKPiBWTUVYSVRfRVhDRVBUSU9OX0JQIGNhc2VzLgo+IAo+
IFdlJ3ZlIGNvbWJlZCB0aGUgdm1jYiB0byBubyBhdmFpbC4gRXZlcnl0aGluZyB3ZSd2ZSB0aG91
Z2h0IHRvIGNoZWNrCj4gKGV4aXRpbmZvMSwgZXhpdGluZm8yLCBleGl0aW50aW5mbykgdHVybnMg
b3V0IHRvIGJlIHplcm8gdGhlcmUgd2hpbGUKPiB0ZXN0aW5nLgo+IAo+IFRoZXJlJ3MgX19nZXRf
aW5zdHJ1Y3Rpb25fbGVuZ3RoKHZjcHUsIGluc3RyKSwgYnV0IGl0IGV4cGVjdHMgdG8gYmUgZmVk
Cj4gdGhlIGV4YWN0IGluc3RydWN0aW9uIHdlIHdhbnQgdGhlIGxlbmd0aCBmb3IsIHdoaWNoIG9i
dmlvdXNseSBkZWZlYXRzCj4gdGhlIHB1cnBvc2UgaGVyZS4KPiAKPiBJcyB0aGVyZSBhIGNsZWFu
IHdheSB0byBnZXQgdGhlIGN1cnJlbnQgaW5zdHJ1Y3Rpb24gbGVuZ3RoIGxpa2Ugd2UgZG8gaW4K
PiB0aGUgVk1YIGNhc2UgKF9fdm1yZWFkKFZNX0VYSVRfSU5TVFJVQ1RJT05fTEVOLCAmaW5zbl9s
ZW4pKSB0aGF0IHdlJ3JlCj4gb3Zlcmxvb2tpbmc/CgpKdXN0IGxpa2UgSW50ZWwncywgQU1EJ3Mg
aXMgYXZhaWxhYmxlIGluIGEgc3Vic2V0IG9mIGNhc2VzIG9ubHkKKGxvb2sgZm9yIHZtY2ItPmd1
ZXN0X2luc19sZW4pLCB3aGljaCBkb24ndCBpbmNsdWRlIHRoZQpleGNlcHRpb24gaW50ZXJjZXB0
cyB5b3UgdGFsayBhYm91dC4gRm9yICNEQiBJIHRoaW5rIHRoZXJlJ3MKbm8gZGlmZmVyZW5jZSBi
ZXR3ZWVuIGJvdGggYW55d2F5LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
