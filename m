From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 07/10] xen/arm: optee: add support for
 arbitrary shared memory
Date: Thu, 21 Mar 2019 10:39:42 +0000
Message-ID: <64528380-27fe-01b2-b951-ef60724c00c7@arm.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-8-volodymyr_babchuk@epam.com>
 <6b3f372c-ee5a-c162-28a6-e60235b51a1e@arm.com> <87o9658pq5.fsf@epam.com>
 <059d02e9-1d21-096c-837c-61b9a696b218@arm.com> <87h8bx8hi4.fsf@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vhxZ=RY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6v6w-0000xo-Ms
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 10:39:46 +0000
In-Reply-To: <87h8bx8hi4.fsf@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <vlad.babchuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzLzIwLzE5IDc6MzcgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEp1
bGllbiBHcmFsbCB3cml0ZXM6Cj4+IEFueXdheSwgeW91IHNob3VsZCBleHBsYWluIGhvdyB5b3Ug
ZGVjaWRlIHRoZSBwbGFjZW1lbnQgb2YgZWFjaAo+PiBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygp
LiBGb3IgaW5zdGFuY2UsIGlmIHRoZSBsaXN0cyBhcmUgcXVpdGUgYmlnLAo+PiB0aGVuIHlvdSBt
YXkgd2FudCBhZGQgYSBwcmVlbXB0IGNoZWNrIGluIHRoZSBsb29wLgo+IEkgc2VlIHlvdXIgcG9p
bnQgdGhlcmUuIENoZWNrIGluIHRoZSBsb29wIHdvdWxkIHJlcXVpcmUgYWRkaXRpb25hbAo+IGxv
Z2ljLiBJcyB0aGVyZSBhbnkgYmVzdCBwcmFjdGljZXM/IEUuZy4gaG93IG9mdGVuIEkgc2hvdWxk
IGNoZWNrIGZvcgo+IHByZWVtcHRpb24/IEV2ZXJ5IE4gaXRlcmF0aW9ucyBvZiBsb29wLCB3aGVy
ZSBOIGlzLi4uCgpJdCBkZXBlbmRzIG9uIGhvdyBjb21wbGV4IGFyZSBlYWNoIGl0ZXJhdGlvbiBv
ZiB0aGUgbG9vcC4gRm9yIGluc3RhbmNlLCAKaW4gdGhlIHAybSBjb2RlLCB3ZSBjaGVjayBwcmVl
bXB0aW9uIGV2ZXJ5IDUxMiBtYXBwaW5ncyBmcmVlZCAoc2VlIApyZWxpbnF1aXNoX3AybV9tYXBw
aW5nKS4KCj4gCj4+IFRoZSBrZXkgcG9pbnQgaGVyZSBpcyB0byBkb2N1bWVudCB0aGUgY2hvaWNl
IGV2ZW4gaWYgeW91IHdyb3RlIGl0IGlzCj4+ICJyYW5kb20iLiBUaGlzIHdpbGwgaGVscCBpbiB0
aGUgZnV0dXJlIGlmIHdlIG5lZWQgdG8gcmV2aXNlIHByZWVtcHRpb24KPj4gY2hvaWNlLgo+IEkn
ZCBwcmVmZXIgdG8gZG8gcHJvcGVyIGZpeCwgaWYgaXQgZG9lcyBub3QgcmVxdWlyZSBhIGJpZyBh
bW91bnQgb2YKPiB3b3JrLiBPdGhlcndpc2UgSSdsbCBhZGQgZG9jdW1lbnQgdGhlIGN1cnJlbnQg
c3RhdGUuCgpwcm9wZXIgZml4IGFuZCBwcmVlbXB0aW9uIGNhbm5vdCBiZSBpbiB0aGUgc2FtZSBz
ZW50ZW5jZSA6KS4gVGhpcyBpcyBhIApqdWRnbWVudCBjYWxsIGJhc2VkIG9uIHRoZSBjb21wbGV4
aXR5IG9mIHRoZSBjb2RlLgoKSW4gdGhlIGV4YW1wbGUgSSBnYXZlIGFib3ZlLCB3ZSBkZWNpZGVk
IGFyYml0cmFyaWx5IHRvIHByZWVtcHQgZXZlcnkgNTEyIAppdGVyYXRpb25zLiBXZSBkaWRuJ3Qg
aGF2ZSBhbnkgbnVtYmVyIGJ1dCB0aG91Z2ggNTEyIGl0ZXJhdGlvbnMgd2FzIGEgCmdvb2QgbnVt
YmVyLgoKSSBkb24ndCBleHBlY3QgeW91IHRvIGZpbmQgdGhlIGJlc3QgcGxhY2UgcmlnaHQgbm93
LiBJIGFtIG9ubHkgYXNraW5nIHRvIApkb2N1bWVudCBqdXN0IHdlIGtub3cgdGhlIGNob2ljZSB3
YXMgImFyYml0cmFyeSIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
