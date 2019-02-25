From: Julien Grall <julien.grall@arm.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Mon, 25 Feb 2019 13:55:42 +0000
Message-ID: <dbfd87e9-48fc-f641-9e24-ddb6c4f61135__35505.9334704251$1551103035$gmane$org@arm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Rhx=RA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gyGjx-00016o-7h
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 13:56:17 +0000
In-Reply-To: <13a9616c-2d9a-f90b-3358-f2dcadbbb64d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave P Martin <Dave.Martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMjUvMDIvMjAxOSAxMzoyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6Cj4gT24gMi8yMi8xOSAzOjMzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBPbiAyMi8wMi8yMDE5IDEyOjM4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPj4+IE9uIDIvMjAvMTkgMTA6NDYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBEaXNj
dXNzaW5nIHdpdGggbXkgdGVhbSwgYSBzb2x1dGlvbiB0aGF0IGNhbWUgdXAgd291bGQgYmUgdG8g
aW50cm9kdWNlIG9uZSAKPj4+PiBhdG9taWMgZmllbGQgcGVyIGV2ZW50IHRvIHJlY29yZCB0aGUg
bnVtYmVyIG9mIGV2ZW50IHJlY2VpdmVkLiBJIHdpbGwgCj4+Pj4gZXhwbG9yZSB0aGF0IHNvbHV0
aW9uIHRvbW9ycm93Lgo+Pj4gSG93IHdpbGwgdGhpcyBoZWxwIGlmIGV2ZW50cyBoYXZlIHNvbWUg
cGF5bG9hZD8KPj4KPj4gV2hhdCBwYXlsb2FkPyBUaGUgZXZlbnQgY2hhbm5lbCBkb2VzIG5vdCBj
YXJyeSBhbnkgcGF5bG9hZC4gSXQgb25seSBub3RpZnkgeW91IAo+PiB0aGF0IHNvbWV0aGluZyBo
YXBwZW4uIFRoZW4gdGhpcyBpcyB1cCB0byB0aGUgdXNlciB0byBkZWNpZGUgd2hhdCB0byB5b3Ug
d2l0aCBpdC4KPiBTb3JyeSwgSSB3YXMgcHJvYmFibHkgbm90IHByZWNpc2UgZW5vdWdoLiBJIG1l
YW4gdGhhdCBhbiBldmVudCBtaWdodCBoYXZlCj4gYXNzb2NpYXRlZCBwYXlsb2FkIGluIHRoZSBy
aW5nIGJ1ZmZlciwgZm9yIGV4YW1wbGUgWzFdLiBTbywgY291bnRpbmcgZXZlbnRzCj4gbWF5IGhl
bHAgc29tZWhvdywgYnV0IHRoZSByaW5nJ3MgZGF0YSBtYXkgc3RpbGwgYmUgbG9zdAoKIEZyb20g
bXkgdW5kZXJzdGFuZGluZyBvZiBldmVudCBjaGFubmVscyBhcmUgZWRnZSBpbnRlcnJ1cHRzLiBC
eSBkZWZpbml0aW9uLCAKdGhleSBjYW4gYmUgbWVyZ2VkIHNvIHlvdSBjYW4gZ2V0IGEgc2lnbmFs
IG5vdGlmaWNhdGlvbiB0byB0aGUgZ3Vlc3QgZm9yIAptdWx0aXBsZSAiZXZlbnRzIi4gU28gaWYg
eW91IHJlbHkgb24gdGhlIGV2ZW50IHRvIGhhdmUgYW4gYXNzb2NpYXRlZCBwYXlsb2FkLCAKdGhl
biB5b3UgcHJvYmFibHkgaGF2ZSBkb25lIHNvbWV0aGluZyB3cm9uZyBpbiB5b3VyIGRyaXZlci4K
CkkgaGF2ZW4ndCBpbXBsZW1lbnRlZCBQViBkcml2ZXJzIG15c2VsZiwgYnV0IEkgd291bGQgZXhw
ZWN0IGVpdGhlciBzaWRlIHRvIGJsb2NrIAppZiB0aGVyZSB3ZXJlIG5vIHNwYWNlIGluIHRoZSBy
aW5nLgoKV2hhdCBkbyB5b3UgZG8gaW4gdGhlIGRpc3BsaWYgZHJpdmVyIHdoZW4gdGhlIHJpbmcg
aXMgZnVsbD8KCkNoZWVycywKCj4gWzFdIAo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9pbmNsdWRlL3B1YmxpYy9pby9kaXNwbGlmLmg7aD1j
YzVkZTljYjFmMzVkZWRjOTljODY2ZDczZDA4NmIxOWU0OTY4NTJhO2hiPUhFQUQjbDc1NiAKPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
