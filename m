From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] [v3] xen: remove pre-xen3 fallback handlers
Date: Wed, 14 Mar 2018 18:47:13 -0400
Message-ID: <7c25f7f5-1b54-695e-be5f-6d06d4e89bfa__35439.8087751635$1521067524$gmane$org@oracle.com>
References: <20180313210652.3484599-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9pbt=ge=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ewFA0-0008Rc-Fd
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 22:46:16 +0000
In-Reply-To: <20180313210652.3484599-1-arnd@arndb.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTMvMjAxOCAwNTowNiBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBUaGUgbGVnYWN5
IGh5cGVyY2FsbCBoYW5kbGVycyB3ZXJlIG9yaWdpbmFsbHkgYWRkZWQgd2l0aAo+IGEgY29tbWVu
dCBleHBsYWluaW5nIHRoYXQgImNvcHlpbmcgdGhlIGFyZ3VtZW50IHN0cnVjdHVyZXMgaW4KPiBI
WVBFUlZJU09SX2V2ZW50X2NoYW5uZWxfb3AoKSBhbmQgSFlQRVJWSVNPUl9waHlzZGV2X29wKCkg
aW50byB0aGUgbG9jYWwKPiB2YXJpYWJsZSBpcyBzdWZmaWNpZW50bHkgc2FmZSIgYW5kIG9ubHkg
bWFkZSBzdXJlIHRvIG5vdCB3cml0ZQo+IHBhc3QgdGhlIGVuZCBvZiB0aGUgYXJndW1lbnQgc3Ry
dWN0dXJlLCB0aGUgY2hlY2tzIGluIGxpbnV4L3N0cmluZy5oCj4gZGlzYWdyZWUgd2l0aCB0aGF0
LCB3aGVuIGxpbmstdGltZSBvcHRpbWl6YXRpb25zIGFyZSB1c2VkOgo+Cj4gSW4gZnVuY3Rpb24g
J21lbWNweScsCj4gICAgIGlubGluZWQgZnJvbSAncGlycV9xdWVyeV91bm1hc2snIGF0IGRyaXZl
cnMveGVuL2ZhbGxiYWNrLmM6NTM6MiwKPiAgICAgaW5saW5lZCBmcm9tICdfX3N0YXJ0dXBfcGly
cScgYXQgZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmM6NTI5OjIsCj4gICAgIGlubGlu
ZWQgZnJvbSAncmVzdG9yZV9waXJxcycgYXQgZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNl
LmM6MTQzOTozLAo+ICAgICBpbmxpbmVkIGZyb20gJ3hlbl9pcnFfcmVzdW1lJyBhdCBkcml2ZXJz
L3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYzoxNTgxOjI6Cj4gaW5jbHVkZS9saW51eC9zdHJpbmcu
aDozNTA6MzogZXJyb3I6IGNhbGwgdG8gJ19fcmVhZF9vdmVyZmxvdzInIGRlY2xhcmVkIHdpdGgg
YXR0cmlidXRlIGVycm9yOiBkZXRlY3RlZCByZWFkIGJleW9uZCBzaXplIG9mIG9iamVjdCBwYXNz
ZWQgYXMgMm5kIHBhcmFtZXRlcgo+ICAgIF9fcmVhZF9vdmVyZmxvdzIoKTsKPiAgICBeCj4KPiBG
dXJ0aGVyIHJlc2VhcmNoIHR1cm5lZCBvdXQgdGhhdCBvbmx5IFhlbiAzLjAuMiBvciBlYXJsaWVy
IHJlcXVpcmVkIHRoZQo+IGZhbGxiYWNrIGF0IGFsbCwgd2hpbGUgYWxsIHZlcnNpb25zIGluIHVz
ZSB0b2RheSBkb24ndCBuZWVkIGl0Lgo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCBpdCBpcyBub3Qg
ZXZlbiBwb3NzaWJsZSB0byBydW4gYSBtYWlubGluZSBrZXJuZWwKPiBvbiB0aG9zZSBvbGQgWGVu
IHJlbGVhc2VzLCBhdCB0aGUgdGltZSB3aGVuIHRoZXkgd2VyZSBpbiB1c2UsIG9ubHkKPiBhIHBh
dGNoZWQga2VybmVsIHdhcyBzdXBwb3J0ZWQgYW55d2F5Lgo+Cj4gRml4ZXM6IGNmNDdhODNmYjA2
ZSAoInhlbi9oeXBlcmNhbGw6IGZpeCBoeXBlcmNhbGwgZmFsbGJhY2sgY29kZSBmb3IgdmVyeSBv
bGQgaHlwZXJ2aXNvcnMiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gLS0tCj4gW3YyXSB1c2UgYSB0YWJsZSBsb29rdXAgaW5zdGVhZCBvZiBhIHN3aXRj
aC9jYXNlIHN0YXRlbWVudCwgYWZ0ZXIKPiBtdWx0aXBsZSBzdWdnZXN0aW9ucy4KPiBbdjNdIHJl
bW92ZSB0aGF0IGZpbGUgY29tcGxldGVseQoKKCtKYW4gd2hvIGFkZGVkIHRoaXMgZmlsZSBvcmln
aW5hbGx5KQoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
