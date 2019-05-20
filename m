From: Julien Grall <julien.grall@arm.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Mon, 20 May 2019 10:48:57 +0100
Message-ID: <8f45b2af-dad9-d4ea-8809-577603a25667@arm.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSeuk-0004uZ-Su
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:49:02 +0000
In-Reply-To: <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgVmlrdG9yLAoKSXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiBJIGVuZGVkIHVwIHRvIGJl
IENDZWQgaW4gYSBtaWRkbGUgb2YgYW4geDg2IHRocmVhZD8KCkNoZWVycywKCk9uIDIwLzA1LzIw
MTkgMTA6MTcsIFZpa3RvciBNaXRpbiB3cm90ZToKPj4+IE1lYW4gdGhhdCByZXN1bHQgb2YgIihp
bnQ2NF90KXZhZGRyID4+IDYzIiBjYW4gYmUgMCBvciAxLgo+Pj4gU28gdGhlIG5leHQgY29kZSBt
YXkgbm90IHdvcmsgcHJvcGVybHkgaW4gY2FzZSBvZiBhbm90aGVyICdpbXBsZW1lbnRhdGlvbnMn
Lgo+Pj4gV2l0aCBhbm90aGVyIGNvbXBpbGVyIChpLmUuIGNsYW5nLCBldGMpIHRoaXMgY29kZSBt
YXkgaW50cm9kdWNlIGJ1Z3MKPj4+IHdoaWNoIGFyZSBoYXJkIHRvIGZpbmQuCj4+Pgo+Pj4gKChp
bnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0X3QpdmFkZHIgPj4gNjMpCj4+Pgo+Pj4gRm9y
IHRoaXMgcmVhc29uIGl0IGlzIGJldHRlciB0byBhdm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVk
IGNvZGUuCj4+Cj4+IFdlbGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBhd2F5IHdpdGhvdXQg
dXNpbmcgaW1wbGVtZW50YXRpb24KPj4gZGVmaW5lZCBiZWhhdmlvci4gQnV0IEknbSBhZnJhaWQg
d2UncmUgcXVpdGUgZmFyIGZyb20gdGhhdCwgYW5kCj4+IHdlJ2Qgbm90IGFsd2F5cyBiZSB3aWxs
aW5nIHRvIGFjY2VwdCB0aGUgd29yc2Ugc291cmNlIGFuZC9vcgo+PiBiaW5hcnkgY29kZSB0aGF0
IHdvdWxkIGJlIG5lZWRlZCB0byBhdm9pZCBpdC4KPiAKPiBIb3cgYWJvdXQgdXNpbmcgdGhlIG5l
eHQgb25lLWxpbmVyIHRvIGF2b2lkIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29kZSA6Cj4gCj4g
Ly9SZXR1cm5zIHRydWUgaW4gY2FzZSB3aGVuIHRoZSB0b3AgbGVmdCAxNyBiaXRzIGFyZSBhbGwg
emVybyBvciBhcmUgYWxsIG9uZQo+IHJldHVybiAoKCEodmFkZHIgPj4gNDcpKSB8fCAoKCh2YWRk
ciA+PiA0NykmMHgxRkZGRikgPT0gMHgxRkZGRikpCj4gCj4gQWdyZWU/Cj4gCj4gVGhhbmtzCj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
