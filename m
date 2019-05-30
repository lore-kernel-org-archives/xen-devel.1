From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 0/9] Per vcpu vm_event channels
Date: Thu, 30 May 2019 08:27:15 -0700
Message-ID: <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXhs=T6=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hWMyC-0001Aj-L4
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 15:27:56 +0000
Received: by mail-lj1-f178.google.com with SMTP id r76so6450060lja.12
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 08:27:53 -0700 (PDT)
In-Reply-To: <cover.1559224640.git.ppircalabu@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgNzoxOCBBTSBQZXRyZSBQaXJjYWxhYnUKPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBhIG5ldyBt
ZWNoYW5pc20gb2Ygc2VuZGluZyBzeW5jaHJvbm91cyB2bV9ldmVudAo+IHJlcXVlc3RzIGFuZCBo
YW5kbGluZyB2bV9ldmVudCByZXNwb25zZXMgd2l0aG91dCB1c2luZyBhIHJpbmcuCj4gQXMgZWFj
aCBzeW5jaHJvbm91cyByZXF1ZXN0IHBhdXNlcyB0aGUgdmNwdSB1bnRpbCB0aGUgY29ycmVzcG9u
ZGluZwo+IHJlc3BvbnNlIGlzIGhhbmRsZWQsIGl0IGNhbiBiZSBzdG9yZWQgaW4gYSBzbG90dGVk
IG1lbW9yeSBidWZmZXIKPiAob25lIHBlciB2Y3B1KSBzaGFyZWQgYmV0d2VlbiB0aGUgaHlwZXJ2
aXNvciBhbmQgdGhlIGNvbnRyb2xsaW5nIGRvbWFpbi4KPgo+IFRoZSBtYWluIGFkdmFudGFnZXMg
b2YgdGhpcyBhcHByb2FjaCBhcmU6Cj4gLSB0aGUgYWJpbGl0eSB0byBkeW5hbWljYWx5IGFsbG9j
YXRlIHRoZSBuZWNlc3NhcnkgbWVtb3J5IHVzZWQgdG8gaG9sZAo+IHRoZSByZXF1ZXN0cy9yZXNw
b25zZXMgKHRoZSBzaXplIG9mIHZtX2V2ZW50X3JlcXVlc3RfdC92bV9ldmVudF9yZXNwb25zZV90
Cj4gY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25lIHBhZ2UgbGltaXRhdGlv
bikKPiAtIHRoZSByaW5nJ3Mgd2FpdHF1ZXVlIGxvZ2ljIGlzIHVubmVjZXNzYXJ5IGluIHRoaXMg
Y2FzZSBiZWNhdXNlIHRoZQo+IHZjcHUgc2VuZGluZyB0aGUgcmVxdWVzdCBpcyBibG9ja2VkIHVu
dGlsIGEgcmVzcG9uc2UgaXMgcmVjZWl2ZWQuCgpIaSBQZXRyZSwKY291bGQgeW91IHB1c2ggdGhp
cyBzZXJpZXMgYXMgYSBnaXQgYnJhbmNoIHNvbWV3aGVyZT8KClRoYW5rcywKVGFtYXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
