From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 8/8] drivers/passthrough/arm: Refactor code
 for arm smmu drivers
Date: Mon, 15 Jan 2018 20:41:04 +0000
Message-ID: <8db2ef47-17fe-e0ca-056e-6245e9788fa4@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-9-sameer.goel@linaro.org>
 <4ddcd633-89e2-3518-810b-4111c9f75ced@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lndq=el=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ebPI3-0002id-4Y
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 11:20:27 +0000
Received: by mail-wm0-x242.google.com with SMTP id 141so7780217wme.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 03:20:26 -0800 (PST)
In-Reply-To: <4ddcd633-89e2-3518-810b-4111c9f75ced@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8wMy8yMDE4IDA1OjM0IEFNLCBNYW5pc2ggSmFnZ2kgd3JvdGU6Cj4gSGkgU2FtZWVy
LAoKSGkgTWFuaXNoLAoKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHR5cGU7Cj4+ICsKPj4gK8KgwqDCoCAvKiBEdW1teSBjb21wYXRpYmlsaXR5IGRlZmluZXMg
Ki8KPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIHBnc2l6ZV9iaXRtYXA7Cj4+ICvCoMKgwqAgc3Ry
dWN0IGlvbW11X2RvbWFpbl9nZW9tZXRyeSBnZW9tZXRyeTsKPj4gKwo+PiArwqDCoMKgIGF0b21p
Y190IHJlZjsKPj4gK8KgwqDCoCAvKiBVc2VkIHRvIGxpbmsgaW9tbXVfZG9tYWluIGNvbnRleHRz
IGZvciBhIHNhbWUgZG9tYWluLgo+PiArwqDCoMKgwqAgKiBUaGVyZSBpcyBhdCBsZWFzdCBvbmUg
cGVyLVNNTVUgdG8gdXNlZCBieSB0aGUgZG9tYWluLgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDC
oCBzdHJ1Y3QgbGlzdF9oZWFkwqDCoMKgwqDCoMKgwqAgbGlzdDsKPj4gK307Cj4+ICsKPj4gKy8q
IFhlbjogRGVzY3JpYmVzIGluZm9ybWF0aW9uIHJlcXVpcmVkIGZvciBhIFhlbiBkb21haW4gKi8K
Pj4gK3N0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWluIHsKPj4gK8KgwqDCoCBzcGlubG9ja190wqDC
oMKgwqDCoMKgwqDCoMKgIGxvY2s7Cj4+ICvCoMKgwqAgLyogTGlzdCBvZiBpb21tdSBkb21haW5z
IGFzc29jaWF0ZWQgdG8gdGhpcyBkb21haW4gKi8KPj4gK8KgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFk
wqDCoMKgwqDCoMKgwqAgY29udGV4dHM7Cj4gQ291bGQgd2UgdXNlIGEgbW9yZSB2ZXJib3NlIG5h
bWUsIEhvdyBhYm91dCAKPiAlcy9jb250ZXh0cy9pb21tdV9kb21haW5fY29udGV4dHMvZyA/CgpI
b3cgYWJvdXQgYSBtdWNoIG1vcmUgdmVyYm9zZSBuYW1lLi4uPyBUaGlzIG5hbWUgaXMgMjEgbGV0
dGVycyBhbmQgCnRoYXQncyBvbmx5IGZvciB0aGUgZmllbGQuIEp1c3QgaW1hZ2luZSB3aXRoIHRo
ZSB2YXJpYWJsZSBuYW1lIGJlZm9yZSAKYW5kIGEgY291cGxlIG9mIGluZGVudGF0aW9uLgoKVGhp
cyBpcyB3aGVyZSBjb21tZW50IGFyZSBoZWxwZnVsLCBhIGRldmVsb3BlciBjYW4gZWFzaWx5IGxv
b2sgZm9yIHRoZSAKc3RydWN0dXJlL2ZpZWxkIHRvIHNlZSBhIGRlc2NyaXB0aW9uIG9mIHRoZSBm
aWVsZC4gU28gbGV0J3Mgbm90IG1ha2UgdGhlIApjb2RlIG1vcmUgaG9ycmlibGUgYmVjYXVzZSB5
b3Ugd291bGQgaGF2ZSB0byBzcGxpdCB0aGUgbGluZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
