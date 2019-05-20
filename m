From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Mon, 20 May 2019 12:55:28 +0300
Message-ID: <CAOcoXZaY4Ru8=y5MbWjASMBrUw0NSC+8zdLkVKzk02EwFzvvpw@mail.gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
 <8f45b2af-dad9-d4ea-8809-577603a25667@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSf1B-0005pQ-3y
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:55:41 +0000
Received: by mail-it1-x12c.google.com with SMTP id e184so22139018ite.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 02:55:39 -0700 (PDT)
In-Reply-To: <8f45b2af-dad9-d4ea-8809-577603a25667@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKQWRkZWQgYnkgbWlzdGFrZSwgc29ycnkgYWJvdXQgdGhhdC4KClRoYW5rcwoK
T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTI6NDkgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSBWaWt0b3IsCj4KPiBJcyB0aGVyZSBhbnkgc3BlY2lm
aWMgcmVhc29uIEkgZW5kZWQgdXAgdG8gYmUgQ0NlZCBpbiBhIG1pZGRsZSBvZiBhbiB4ODYgdGhy
ZWFkPwo+Cj4gQ2hlZXJzLAo+Cj4gT24gMjAvMDUvMjAxOSAxMDoxNywgVmlrdG9yIE1pdGluIHdy
b3RlOgo+ID4+PiBNZWFuIHRoYXQgcmVzdWx0IG9mICIoaW50NjRfdCl2YWRkciA+PiA2MyIgY2Fu
IGJlIDAgb3IgMS4KPiA+Pj4gU28gdGhlIG5leHQgY29kZSBtYXkgbm90IHdvcmsgcHJvcGVybHkg
aW4gY2FzZSBvZiBhbm90aGVyICdpbXBsZW1lbnRhdGlvbnMnLgo+ID4+PiBXaXRoIGFub3RoZXIg
Y29tcGlsZXIgKGkuZS4gY2xhbmcsIGV0YykgdGhpcyBjb2RlIG1heSBpbnRyb2R1Y2UgYnVncwo+
ID4+PiB3aGljaCBhcmUgaGFyZCB0byBmaW5kLgo+ID4+Pgo+ID4+PiAoKGludDY0X3QpdmFkZHIg
Pj4gNDcpID09ICgoaW50NjRfdCl2YWRkciA+PiA2MykKPiA+Pj4KPiA+Pj4gRm9yIHRoaXMgcmVh
c29uIGl0IGlzIGJldHRlciB0byBhdm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGNvZGUuCj4g
Pj4KPiA+PiBXZWxsLCBpZGVhbGx5IHdlJ2QgbGlrZSB0byBnZXQgYXdheSB3aXRob3V0IHVzaW5n
IGltcGxlbWVudGF0aW9uCj4gPj4gZGVmaW5lZCBiZWhhdmlvci4gQnV0IEknbSBhZnJhaWQgd2Un
cmUgcXVpdGUgZmFyIGZyb20gdGhhdCwgYW5kCj4gPj4gd2UnZCBub3QgYWx3YXlzIGJlIHdpbGxp
bmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5kL29yCj4gPj4gYmluYXJ5IGNvZGUgdGhh
dCB3b3VsZCBiZSBuZWVkZWQgdG8gYXZvaWQgaXQuCj4gPgo+ID4gSG93IGFib3V0IHVzaW5nIHRo
ZSBuZXh0IG9uZS1saW5lciB0byBhdm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGNvZGUgOgo+
ID4KPiA+IC8vUmV0dXJucyB0cnVlIGluIGNhc2Ugd2hlbiB0aGUgdG9wIGxlZnQgMTcgYml0cyBh
cmUgYWxsIHplcm8gb3IgYXJlIGFsbCBvbmUKPiA+IHJldHVybiAoKCEodmFkZHIgPj4gNDcpKSB8
fCAoKCh2YWRkciA+PiA0NykmMHgxRkZGRikgPT0gMHgxRkZGRikpCj4gPgo+ID4gQWdyZWU/Cj4g
Pgo+ID4gVGhhbmtzCj4gPgo+Cj4gLS0KPiBKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
