From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] KVM: Start populating /sys/hypervisor with
 KVM entries
Date: Tue, 9 Oct 2018 12:21:46 -0400
Message-ID: <61740f41-c7e3-edaf-68ac-2e4c4a99523b__13191.1400975243$1539102049$gmane$org@oracle.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <c81b65ba-c562-1869-483b-aee5229501e0@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k0fw=mv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g9ull-0007T0-6d
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 16:22:01 +0000
In-Reply-To: <c81b65ba-c562-1869-483b-aee5229501e0@de.ibm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Filippo Sironi <sironi@amazon.de>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
Cc: vasu.srinivasan@oracle.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvOS8xOCA2OjQxIEFNLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4gCj4gCj4g
T24gMTAvMDkvMjAxOCAxMTo1NCBBTSwgRmlsaXBwbyBTaXJvbmkgd3JvdGU6Cj4+IFN0YXJ0IHBv
cHVsYXRpbmcgL3N5cy9oeXBlcnZpc29yIHdpdGggS1ZNIGVudHJpZXMgd2hlbiB3ZSdyZSBydW5u
aW5nIG9uCj4+IEtWTS4gVGhpcyBpcyB0byByZXBsaWNhdGUgZnVuY3Rpb25hbGl0eSB0aGF0J3Mg
YXZhaWxhYmxlIHdoZW4gd2UncmUKPj4gcnVubmluZyBvbiBYZW4uCj4+Cj4+IExldCdzIHN0YXJ0
IHdpdGggL3N5cy9oeXBlcnZpc29yL3V1aWQsIHdoaWNoIHVzZXJzIHByZWZlciBvdmVyCj4+IC9z
eXMvZGV2aWNlcy92aXJ0dWFsL2RtaS9pZC9wcm9kdWN0X3V1aWQgYXMgYSB3YXkgdG8gcmVjb2du
aXplIGEgdmlydHVhbAo+PiBtYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28gYXZhaWxhYmxlIHdoZW4g
cnVubmluZyBvbiBYZW4gSFZNIGFuZCBvbiBYZW4gUFYKPj4gYW5kLCBvbiB0b3Agb2YgdGhhdCBk
b2Vzbid0IHJlcXVpcmUgcm9vdCBwcml2aWxlZ2VzIGJ5IGRlZmF1bHQuCj4gCj4gQ2FuIHlvdSBt
YWtlIHRoaXMgYW4gYXJjaCBob29rPyBPbiBzMzkwIGl0IGlzIHBvc3NpYmxlIHRvIGdldCB0aGUg
dXVpZCB3aXRoCj4gdGhlIHN0c2kgaW5zdHJ1Y3Rpb24uIAo+IFNlZQo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS92aXJ0L2t2bS9rdm0uZ2l0L3RyZWUvYXJjaC9zMzkwL2tlcm5lbC9z
eXNpbmZvLmMjbjI0OAo+IAo+IAo+IFdlIGRvIHVzZSB1dWlkX3QsIGJ1dCB3ZSBjYW4gY2VydGFp
bmx5IHJldHVybiBhIGNoYXIqLgoKCkkgd291bGQgc3VnZ2VzdCBoYXZpbmcgYSB0b3AtbGV2ZWwg
c3lzLWh5cGVydmlzb3IuYyB0aGF0IHdpbGwgY3JlYXRlCmNvbW1vbiBmaWxlcyB0aGF0IGFsbCBo
eXBlcnZpc29ycyBzaG91bGQgaGF2ZSAodXVpZCwgdHlwZSwgdmVyc2lvbiwgZXRjKQphbmQgdGhl
biBoYXZlIGh5cGVydmlzb3ItIGFuZC9vciBhcmNoLXNwZWNpZmljIGhvb2tzLgoKCi1ib3JpcwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
