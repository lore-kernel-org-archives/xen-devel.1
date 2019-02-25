From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Mon, 25 Feb 2019 15:24:24 +0200
Message-ID: <13a9616c-2d9a-f90b-3358-f2dcadbbb64d__18187.4305287906$1551101128$gmane$org@gmail.com>
References: <5e256d9a-572c-e01e-7706-407f99245b00@arm.com>
 <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <f7e78bf6-6e65-6d6c-c1ad-dca7f1e66b17@gmail.com>
 <fe44917f-bbe9-3e0e-fdda-2eb4db9f25c2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyGFA-0005SG-IB
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 13:24:28 +0000
Received: by mail-lf1-x142.google.com with SMTP id u21so6883786lfu.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 05:24:27 -0800 (PST)
In-Reply-To: <fe44917f-bbe9-3e0e-fdda-2eb4db9f25c2@arm.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave P Martin <dave.martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMi8xOSAzOjMzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4KPiBPbiAyMi8w
Mi8yMDE5IDEyOjM4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4gT24gMi8yMC8x
OSAxMDo0NiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gRGlzY3Vzc2luZyB3aXRoIG15IHRl
YW0sIGEgc29sdXRpb24gdGhhdCBjYW1lIHVwIHdvdWxkIGJlIHRvIAo+Pj4gaW50cm9kdWNlIG9u
ZSBhdG9taWMgZmllbGQgcGVyIGV2ZW50IHRvIHJlY29yZCB0aGUgbnVtYmVyIG9mIGV2ZW50IAo+
Pj4gcmVjZWl2ZWQuIEkgd2lsbCBleHBsb3JlIHRoYXQgc29sdXRpb24gdG9tb3Jyb3cuCj4+IEhv
dyB3aWxsIHRoaXMgaGVscCBpZiBldmVudHMgaGF2ZSBzb21lIHBheWxvYWQ/Cj4KPiBXaGF0IHBh
eWxvYWQ/IFRoZSBldmVudCBjaGFubmVsIGRvZXMgbm90IGNhcnJ5IGFueSBwYXlsb2FkLiBJdCBv
bmx5IAo+IG5vdGlmeSB5b3UgdGhhdCBzb21ldGhpbmcgaGFwcGVuLiBUaGVuIHRoaXMgaXMgdXAg
dG8gdGhlIHVzZXIgdG8gCj4gZGVjaWRlIHdoYXQgdG8geW91IHdpdGggaXQuClNvcnJ5LCBJIHdh
cyBwcm9iYWJseSBub3QgcHJlY2lzZSBlbm91Z2guIEkgbWVhbiB0aGF0IGFuIGV2ZW50IG1pZ2h0
IGhhdmUKYXNzb2NpYXRlZCBwYXlsb2FkIGluIHRoZSByaW5nIGJ1ZmZlciwgZm9yIGV4YW1wbGUg
WzFdLiBTbywgY291bnRpbmcgZXZlbnRzCm1heSBoZWxwIHNvbWVob3csIGJ1dCB0aGUgcmluZydz
IGRhdGEgbWF5IHN0aWxsIGJlIGxvc3QKPgo+IENoZWVycywKPgpbMV0gCmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9pbmNsdWRlL3B1YmxpYy9p
by9kaXNwbGlmLmg7aD1jYzVkZTljYjFmMzVkZWRjOTljODY2ZDczZDA4NmIxOWU0OTY4NTJhO2hi
PUhFQUQjbDc1NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
