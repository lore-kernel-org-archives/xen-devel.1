From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] vm_event: Fix XEN_VM_EVENT_RESUME domctl
Date: Fri, 5 Apr 2019 12:56:52 +0300
Message-ID: <546ef55d-3257-3c66-4dcb-5371c97912eb@bitdefender.com>
References: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wBck=SH=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hCLaq-0000um-V5
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 09:57:04 +0000
In-Reply-To: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC81LzE5IDEyOjMzIFBNLCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6Cj4gTWFrZSBYRU5fVk1f
RVZFTlRfUkVTVU1FIHJldHVybiAwIGluIGNhc2Ugb2Ygc3VjY2VzcywgaW5zdGVhZCBvZgo+IC1F
SU5WQUwuCj4gUmVtb3ZlIHZtX2V2ZW50X3Jlc3VtZSBmb3JtIHZtX2V2ZW50LmggaGVhZGVyIGFu
ZCBzZXQgdGhlIGZ1bmN0aW9uJ3MKPiB2aXNpYmlsaXR5IHRvIHN0YXRpYyBhcyBpcyB1c2VkIG9u
bHkgaW4gdm1fZXZlbnQuYy4KPiBNb3ZlIHRoZSB2bV9ldmVudF9jaGVja19yaW5nIHRlc3QgaW5z
aWRlIHZtX2V2ZW50X3Jlc3VtZSBpbiBvcmRlciB0bwo+IHNpbXBsaWZ5IHRoZSBjb2RlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
