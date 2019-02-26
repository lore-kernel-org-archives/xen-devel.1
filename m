From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 10:27:13 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902261020580.20689@sstabellini-ThinkPad-X260>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
 <eeec5cb2-5242-5331-21cb-e84317b85351@arm.com>
 <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
 <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
 <5C7520E6020000780021A46F@prv1-mh.provo.novell.com>
 <237094ca-6ec0-cb4d-9fab-c163909af0e2@gmail.com>
 <5C752758020000780021A4CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyhRq-0002lo-7z
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 18:27:22 +0000
In-Reply-To: <5C752758020000780021A4CB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, lars.kurth.xen@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNiBGZWIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBTbywgd2UnbGwgZW5k
IHVwIGhhdmluZyBsb3RzIG9mIG1hY3JvcyB0aGVuIHdoaWNoIGlzIG9idmlvdXNseQo+ID4gbm90
IGdvb2QuIFRoYXQgc2FpZCwgSSBob3BlIHdlIGNhbiB3b3JrIG91dCBzb21lIGNvbW1vbiBhcHBy
b2FjaAo+ID4gbm90IG9ubHkgdG8gdGhpcyBpc3N1ZSwgYnV0IGhvdyB3ZSBkZWFsIHdpdGggc3Vj
aCBpbiBnZW5lcmFsLgo+IAo+IEkgZ3Vlc3MgdGhlbiBJIGhhdmUgdG8gYXNrIGZvciBnaXZpbmcg
YSBjb21wbGV0ZSBwaWN0dXJlIG9mIHdoYXQKPiBvdGhlciBjb2RlIHVnbGlmaWNhdGlvbnMgYXJl
IGdvaW5nIHRvIGJlIHByb3Bvc2VkLiBJZiwgdG8gYmUgTUlTUkEtCj4gY29tcGxpYW50LCB3ZSBo
YXZlIHRvIHR1cm4gYWxsIG9mIG91ciBjb2RlIGludG8gYW4gdW5yZWFkYWJsZQo+IG1lc3MsIHRo
YW4gSSdtIGFmcmFpZCBJIGhhdmUgdG8gcXVlc3Rpb24gd2hldGhlciB3ZSByZWFsbHkgd2FudAo+
IHRvIGdvIHRoYXQgcm91dGUuIFdlIHRoZW4gbWF5IGJlIGJldHRlciBvZmYgc3RvcHBpbmcgdGhl
IHdob2xlCj4gZXhlcmNpc2Ugbm93LCByYXRoZXIgdGhhbiBhZnRlciBoYXZpbmcgZG9uZSBzZXZl
cmFsIGluaXRpYWwgc3RlcHMKPiBhbHJlYWR5LgoKSGkgSmFuLAoKSSBkb24ndCB0aGluayB0aGVy
ZSBpcyBhIHNpbXBsZSBhbnN3ZXIgdG8geW91ciBwb2ludC4gQnV0IHRoZSBiZXN0IHdheQp0byBn
ZXQgYW4gaWRlYSBpcyB0byBnaXZlIGEgbG9vayBhdCBNSVNSQS1DIFsxXS4gSXQncyBsZXNzIHRo
YW4gNTBHQlAsIEkKYW0gaG9waW5nIExhcnMgd2lsbCBiZSBhYmxlIHRvIHNvcnQgaXQgb3V0IGZv
ciB5b3UuIFRoZSBwdXJwb3NlIG9mIHRoaXMKd29yayBpcyBhbHNvIHRvIHByb3ZpZGUgdGhlIGNv
bnRleHQgZm9yIHRoZSB1cGNvbWluZyBmMmYgZGlzY3Vzc2lvbnMuCgpXaGF0IEkgYW0gYWJvdXQg
dG8gd3JpdGUgbmVlZHMgdG8gYmUgdmVyaWZpZWQgKGhvcGVmdWxseSB3ZSdsbCBmaW5kIHRoZQph
bnN3ZXIgZHVyaW5nIHRoZSB3b3Jrc2hvcCkgYnV0IG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBl
dmVuIGp1c3QgYSBmZXcKc3RlcHMgdG93YXJkIGNvbXBsaWFuY2UgYXJlIGJldHRlciB0aGFuIG5v
dGhpbmcuCgpDaGVlcnMsCgpTdGVmYW5vCgoKWzFdIGh0dHBzOi8vd3d3Lm1pc3JhLm9yZy51ay9z
aG9wL2J1eV9ub3cucGhwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
