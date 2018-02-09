From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Fri, 9 Feb 2018 15:21:55 +0100
Message-ID: <CAK8P3a0EVW-shM0JNz0fsMWx19Z+BT3kvB6McwotSLGtThhAdA@mail.gmail.com>
References: <20180205150340.328921-1-arnd@arndb.de>
 <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
 <CAK8P3a36O-NbrKkt-DEEZE2A2JQ5Gu9GZ98j0BjoFET4kgTaWw@mail.gmail.com>
 <42258ad55dac4191813d258e43a44e0e@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jy2v=fd=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1ek9Ys-0006mf-CA
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:21:58 +0000
Received: by mail-ot0-x241.google.com with SMTP id f18so7855298otf.6
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:21:56 -0800 (PST)
In-Reply-To: <42258ad55dac4191813d258e43a44e0e@AcuMS.aculab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Laight <David.Laight@aculab.com>
Cc: Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgOSwgMjAxOCBhdCAzOjEzIFBNLCBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdo
dEBhY3VsYWIuY29tPiB3cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uCj4+IFNlbnQ6IDA5IEZl
YnJ1YXJ5IDIwMTggMTI6NTgKPiAuLi4KPj4gSG93ZXZlciwgYXNpZGUgZnJvbSB0aGlzIGRyaXZl
ciwgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGJlIHdvcnJpZWQgYWJvdXQKPj4gU3BlY3RyZSB0eXBl
IDEgYXR0YWNrcyBvbiBzaW1pbGFyIGNvZGUsIHdoZW4gZ2NjLTggdHVybnMgYSBzd2l0Y2gvY2Fz
ZQo+PiBzdGF0ZW1lbnQgaW50byBhbiBhcnJheSBsb29rdXAgYmVoaW5kIG91ciBiYWNrLCBlLmcu
IGluIGFuIGlvY3RsIGhhbmRsZXIuCj4+IEhhcyBhbnlib2R5IGdvdCB0aGlzIG9uIHRoZWlyIHJh
ZGFyPwo+Cj4gVGhlIGNhbm9uaWNhbCBjb2RlIGZvciBhIHN3aXRjaCBzdGF0ZW1lbnQgaXMgdG8g
anVtcCBpbmRpcmVjdCBvbiBhbiBhcnJheQo+IG9mIGNvZGUgcG9pbnRlcnMuCj4gaW9jdGwgaGFu
ZGxlcnMgcHJvYmFibHkgdXNlIGEgc2VyaWVzIG9mIGNvbXBhcmVzIGJlY2F1c2UgdGhlIHZhbHVl
cyBhcmUKPiBzcGFyc2UuCgpUaGUgbWFqb3JpdHkgb2YgaW9jdGwgaGFuZGxlcnMgaXMgc3BhcnNl
IGVub3VnaCB0aGF0IGEgdGFibGUgbG9va3VwIHdvdWxkbid0CndvcmssIGJ1dCB0aGVyZSBhcmUg
c3RpbGwgc3Vic3lzdGVtcyB0aGF0IG5ldmVyIGZ1bGx5IGFkb3B0ZWQgdGhlIF9JT0MoKQptYWNy
b3MsIGUuZy4gdHR5IG9yIHNvY2tldCBpb2N0bHMgYXJlIGp1c3QgY29uc2VjdXRpdmUgbnVtYmVy
cy4KCj4gQWxzbyByZW1lbWJlciB0aGF0IGdjYy04IHdpbGwgY29udmVydCBkZW5zZSBzd2l0Y2gg
c3RhdGVtZW50cyB0aGF0IGp1c3QKPiBsb2FkIGEgdmFsdWUgaW50byBhIGRhdGEgYXJyYXkgbG9v
a3VwLgoKUmlnaHQsIHRoYXQncyB0aGUgY2FzZSBJJ20gaW50ZXJlc3RlZCBpbiBoZXJlLiBJIGRv
bid0IGtub3cgaG93IG1hbnkgb2YKdGhvc2UgZXhpc3QgaW4gdGhlIGtlcm5lbCwgYXMgdGhpcyB3
b3VsZCBhZ2FpbiBiZSBhIHNtYWxsIHN1YnNldCBvZiB0aGUKc3dpdGNoKCkvY2FzZSBzdGF0ZW1l
bnRzIHRoYXQgdXNlIGNvbnNlY3V0aXZlIG51bWJlcnMuCgo+IEkgZ3Vlc3MgYm90aCB0aG9zZSBq
dW1wIHRhYmxlcyBhcmUgcG90ZW50aWFsIGF0dGFjayB2ZWN0b3JzLgo+IE5vdCBxdWl0ZSBzdXJl
IGhvdyB0aGV5IG1pZ2h0IGJlIHVzZWQgdG8gbGVhayBpbmZvIHRob3VnaC4KCldoZW4gSSB0ZXN0
ZWQgdGhlIHhlbiBmYWxsYmFjayBjb2RlIHdpdGggZ2NjLTcuMywgSSBub3RpY2VkIGEgcmV0cG9s
aW5lCmdldHRpbmcgZ2VuZXJhdGVkIGZvciBwb2ludGVyIGFycmF5LCBzbyB0aGF0IHNob3VsZCBi
ZSBzYWZlLgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
