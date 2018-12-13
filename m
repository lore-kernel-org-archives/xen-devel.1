From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Thu, 13 Dec 2018 16:13:11 +0200
Message-ID: <adf4af85-e232-b958-6b12-20e1d30721bb@gmail.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
 <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
 <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
 <6bc804b4-df7a-08fd-9bf0-7384015a2b74@arm.com>
 <5f581369-55ad-345f-7837-48265fcd805a@gmail.com>
 <ee45a5c4-5097-a0e6-8099-f0a998cc3c88@arm.com>
 <52353b63-5434-4b33-5ee7-e3a559563c6a@gmail.com>
 <69b378ad-3710-afe9-25a0-8825caf848a7@arm.com>
 <973a7ae9-2c78-690d-cf70-913a99767720@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D7xZ=OW=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gXRjn-0002TS-RU
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:13:15 +0000
Received: by mail-lf1-x141.google.com with SMTP id u18so1656692lff.10
 for <xen-devel@lists.xenproject.org>; Thu, 13 Dec 2018 06:13:15 -0800 (PST)
In-Reply-To: <973a7ae9-2c78-690d-cf70-913a99767720@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gQWxsLAoKT0ssIEkndmUgZGlzY292ZXJlZCBhIG1lY2hhbmlzbSBvZiB0aGUgaXNzdWUu
Ckl0IGlzICBiZWNhdXNlIG9mIGBkLT5tYXhfcGFnZXMgPSB+MFU7YCBpbiBhIGBjb25zdHJ1Y3Rf
ZG9tMCgpYC4KV2hlbiBJIGRvIHZjcHUtcGluLCBsaWJ4bCB1cGRhdGVzIG1lbW9yeSBub2RlcyBp
biB4ZW5zdG9yZSBmb3IgRG9tMC4gVGhlbiBrZXJuZWwgd2F0Y2ggc2VlcyB0aG9zZSBjaGFuZ2Vz
IGFuZCB0cnlpbmcgdG8gc2V0IG5ldyB0YXJnZXQgZm9yIGJhbGxvbiwgYnV0IHRoZSB0YXJnZXQg
YmVjb21lcyBleHRyZW1lbHkgaGlnaCwgYW5kIGJhbG9vbiBzdWNrcyBhbGwgdGhlIHBhZ2VzLgoK
SW4gbXkga2VybmVsICg0LjE0KSBpbiBgd2F0Y2hfdGFyZ2V0KClgIGZ1bmN0aW9uIHRoZXJlIGlz
IGEgY29kZToKCiAgICAgICAgIHRhcmdldF9kaWZmID0geGVuX3B2X2RvbWFpbigpID8gMAogICAg
ICAgICAgICAgICAgIDogc3RhdGljX21heCAtIGJhbGxvb25fc3RhdHMudGFyZ2V0X3BhZ2VzOwoK
SGVyZSB3ZSBoYXZlIGB4ZW5fcHZfZG9tYWluKClgIGVxdWFsIHRvIHplcm8sIHNvIGB0YXJnZXRf
ZGlmZmAgYmlnLiBUaGVuLCBmZXcgbGluZXMgYmVsb3c6CgoJYmFsbG9vbl9zZXRfbmV3X3Rhcmdl
dChuZXdfdGFyZ2V0IC0gdGFyZ2V0X2RpZmYpOwoKYGJhbGxvb25fc2V0X25ld190YXJnZXQoKWAg
cmVjZWl2ZXMgYSB2YWx1ZSB3cmFwcGVkIG92ZXIgNjRiaXQgd2hhdCBraWxscyB0aGUgc3lzdGVt
LgoKTm93IEknbSBsb29raW5nIGZvciBhbiBhcHByb3ByaWF0ZSBrZXJuZWwgcGF0Y2ggZm9yIHRo
ZSBrZXJuZWwsIHRvIGZpeCB0aGF0LiBBbnkgc3VnZ2VzdGlvbnM/CgotLSAKU2luY2VyZWx5LApB
bmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
