From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Mon, 25 Feb 2019 16:08:11 +0200
Message-ID: <1aeda04d-3420-fa50-ad33-a0b3e981f5e4__20991.0806197271$1551103765$gmane$org@gmail.com>
References: <5e256d9a-572c-e01e-7706-407f99245b00@arm.com>
 <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <f7e78bf6-6e65-6d6c-c1ad-dca7f1e66b17@gmail.com>
 <fe44917f-bbe9-3e0e-fdda-2eb4db9f25c2@arm.com>
 <13a9616c-2d9a-f90b-3358-f2dcadbbb64d@gmail.com>
 <dbfd87e9-48fc-f641-9e24-ddb6c4f61135@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyGvY-00023A-34
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 14:08:16 +0000
Received: by mail-lf1-x144.google.com with SMTP id n15so6967776lfe.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 06:08:15 -0800 (PST)
In-Reply-To: <dbfd87e9-48fc-f641-9e24-ddb6c4f61135@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave P Martin <Dave.Martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNS8xOSAzOjU1IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAo+
Cj4gT24gMjUvMDIvMjAxOSAxMzoyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+
IE9uIDIvMjIvMTkgMzozMyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4g
T24gMjIvMDIvMjAxOSAxMjozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+Pj4g
T24gMi8yMC8xOSAxMDo0NiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBEaXNjdXNzaW5n
IHdpdGggbXkgdGVhbSwgYSBzb2x1dGlvbiB0aGF0IGNhbWUgdXAgd291bGQgYmUgdG8gCj4+Pj4+
IGludHJvZHVjZSBvbmUgYXRvbWljIGZpZWxkIHBlciBldmVudCB0byByZWNvcmQgdGhlIG51bWJl
ciBvZiBldmVudCAKPj4+Pj4gcmVjZWl2ZWQuIEkgd2lsbCBleHBsb3JlIHRoYXQgc29sdXRpb24g
dG9tb3Jyb3cuCj4+Pj4gSG93IHdpbGwgdGhpcyBoZWxwIGlmIGV2ZW50cyBoYXZlIHNvbWUgcGF5
bG9hZD8KPj4+Cj4+PiBXaGF0IHBheWxvYWQ/IFRoZSBldmVudCBjaGFubmVsIGRvZXMgbm90IGNh
cnJ5IGFueSBwYXlsb2FkLiBJdCBvbmx5IAo+Pj4gbm90aWZ5IHlvdSB0aGF0IHNvbWV0aGluZyBo
YXBwZW4uIFRoZW4gdGhpcyBpcyB1cCB0byB0aGUgdXNlciB0byAKPj4+IGRlY2lkZSB3aGF0IHRv
IHlvdSB3aXRoIGl0Lgo+PiBTb3JyeSwgSSB3YXMgcHJvYmFibHkgbm90IHByZWNpc2UgZW5vdWdo
LiBJIG1lYW4gdGhhdCBhbiBldmVudCBtaWdodCAKPj4gaGF2ZQo+PiBhc3NvY2lhdGVkIHBheWxv
YWQgaW4gdGhlIHJpbmcgYnVmZmVyLCBmb3IgZXhhbXBsZSBbMV0uIFNvLCBjb3VudGluZyAKPj4g
ZXZlbnRzCj4+IG1heSBoZWxwIHNvbWVob3csIGJ1dCB0aGUgcmluZydzIGRhdGEgbWF5IHN0aWxs
IGJlIGxvc3QKPgo+IEZyb20gbXkgdW5kZXJzdGFuZGluZyBvZiBldmVudCBjaGFubmVscyBhcmUg
ZWRnZSBpbnRlcnJ1cHRzLiBCeSAKPiBkZWZpbml0aW9uLCB0aGV5IGNhbiBiZSBtZXJnZWQgc28g
eW91IGNhbiBnZXQgYSBzaWduYWwgbm90aWZpY2F0aW9uIHRvIAo+IHRoZSBndWVzdCBmb3IgbXVs
dGlwbGUgImV2ZW50cyIuIFNvIGlmIHlvdSByZWx5IG9uIHRoZSBldmVudCB0byBoYXZlIAo+IGFu
IGFzc29jaWF0ZWQgcGF5bG9hZCwgdGhlbiB5b3UgcHJvYmFibHkgaGF2ZSBkb25lIHNvbWV0aGlu
ZyB3cm9uZyBpbiAKPiB5b3VyIGRyaXZlci4KPgo+IEkgaGF2ZW4ndCBpbXBsZW1lbnRlZCBQViBk
cml2ZXJzIG15c2VsZiwgYnV0IEkgd291bGQgZXhwZWN0IGVpdGhlciAKPiBzaWRlIHRvIGJsb2Nr
IGlmIHRoZXJlIHdlcmUgbm8gc3BhY2UgaW4gdGhlIHJpbmcuCj4KPiBXaGF0IGRvIHlvdSBkbyBp
biB0aGUgZGlzcGxpZiBkcml2ZXIgd2hlbiB0aGUgcmluZyBpcyBmdWxsPwo+Ckl0IGlzIGhhbmRs
ZWQgYnkgdGhlIG9yaWdpbmF0b3IsIHRoZSBkaXNwbGF5IGJhY2tlbmQgaW4gb3VyIGNhc2U6IGl0
IApkb2Vzbid0IHNlbmQKZXZlbnRzIGlmIGl0IHNlZXMgdGhhdCB0aGUgcmluZyB3aWxsIG92ZXJm
bG93LiBCdXQgSSB3YXMgd29ycmllZCBhYm91dApzdWNoIGEgZ2VuZXJpYyBjaGFuZ2Ugd2l0aCBj
b3VudGluZyBudW1iZXIgb2YgZXZlbnRzIHJlY2VpdmVkIGFuZCBpZiB0aGlzCnJlYWxseSBoZWxw
cyB0byByZWNvdmVyIGluIGdlbmVyYWwgY2FzZQo+IENoZWVycywKPgo+PiBbMV0gCj4+IGh0dHBz
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9pbmNsdWRl
L3B1YmxpYy9pby9kaXNwbGlmLmg7aD1jYzVkZTljYjFmMzVkZWRjOTljODY2ZDczZDA4NmIxOWU0
OTY4NTJhO2hiPUhFQUQjbDc1NiAKPj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
