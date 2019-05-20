From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Mon, 20 May 2019 12:17:28 +0300
Message-ID: <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSeQO-0001lf-QU
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:17:40 +0000
Received: by mail-it1-x129.google.com with SMTP id i10so1132035ite.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 02:17:39 -0700 (PDT)
In-Reply-To: <5CDECD540200007800230246@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IE1lYW4gdGhhdCByZXN1bHQgb2YgIihpbnQ2NF90KXZhZGRyID4+IDYzIiBjYW4gYmUgMCBv
ciAxLgo+ID4gU28gdGhlIG5leHQgY29kZSBtYXkgbm90IHdvcmsgcHJvcGVybHkgaW4gY2FzZSBv
ZiBhbm90aGVyICdpbXBsZW1lbnRhdGlvbnMnLgo+ID4gV2l0aCBhbm90aGVyIGNvbXBpbGVyIChp
LmUuIGNsYW5nLCBldGMpIHRoaXMgY29kZSBtYXkgaW50cm9kdWNlIGJ1Z3MKPiA+IHdoaWNoIGFy
ZSBoYXJkIHRvIGZpbmQuCj4gPgo+ID4gKChpbnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0
X3QpdmFkZHIgPj4gNjMpCj4gPgo+ID4gRm9yIHRoaXMgcmVhc29uIGl0IGlzIGJldHRlciB0byBh
dm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGNvZGUuCj4KPiBXZWxsLCBpZGVhbGx5IHdlJ2Qg
bGlrZSB0byBnZXQgYXdheSB3aXRob3V0IHVzaW5nIGltcGxlbWVudGF0aW9uCj4gZGVmaW5lZCBi
ZWhhdmlvci4gQnV0IEknbSBhZnJhaWQgd2UncmUgcXVpdGUgZmFyIGZyb20gdGhhdCwgYW5kCj4g
d2UnZCBub3QgYWx3YXlzIGJlIHdpbGxpbmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5k
L29yCj4gYmluYXJ5IGNvZGUgdGhhdCB3b3VsZCBiZSBuZWVkZWQgdG8gYXZvaWQgaXQuCgpIb3cg
YWJvdXQgdXNpbmcgdGhlIG5leHQgb25lLWxpbmVyIHRvIGF2b2lkIGltcGxlbWVudGF0aW9uLWRl
ZmluZWQgY29kZSA6CgovL1JldHVybnMgdHJ1ZSBpbiBjYXNlIHdoZW4gdGhlIHRvcCBsZWZ0IDE3
IGJpdHMgYXJlIGFsbCB6ZXJvIG9yIGFyZSBhbGwgb25lCnJldHVybiAoKCEodmFkZHIgPj4gNDcp
KSB8fCAoKCh2YWRkciA+PiA0NykmMHgxRkZGRikgPT0gMHgxRkZGRikpCgpBZ3JlZT8KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
