From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Mon, 20 May 2019 10:21:55 +0100
Message-ID: <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSeUd-0002h2-PS
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:22:03 +0000
In-Reply-To: <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDUvMjAxOSAxMDoxNywgVmlrdG9yIE1pdGluIHdyb3RlOgo+Pj4gTWVhbiB0aGF0IHJl
c3VsdCBvZiAiKGludDY0X3QpdmFkZHIgPj4gNjMiIGNhbiBiZSAwIG9yIDEuCj4+PiBTbyB0aGUg
bmV4dCBjb2RlIG1heSBub3Qgd29yayBwcm9wZXJseSBpbiBjYXNlIG9mIGFub3RoZXIgJ2ltcGxl
bWVudGF0aW9ucycuCj4+PiBXaXRoIGFub3RoZXIgY29tcGlsZXIgKGkuZS4gY2xhbmcsIGV0Yykg
dGhpcyBjb2RlIG1heSBpbnRyb2R1Y2UgYnVncwo+Pj4gd2hpY2ggYXJlIGhhcmQgdG8gZmluZC4K
Pj4+Cj4+PiAoKGludDY0X3QpdmFkZHIgPj4gNDcpID09ICgoaW50NjRfdCl2YWRkciA+PiA2MykK
Pj4+Cj4+PiBGb3IgdGhpcyByZWFzb24gaXQgaXMgYmV0dGVyIHRvIGF2b2lkIGltcGxlbWVudGF0
aW9uLWRlZmluZWQgY29kZS4KPj4gV2VsbCwgaWRlYWxseSB3ZSdkIGxpa2UgdG8gZ2V0IGF3YXkg
d2l0aG91dCB1c2luZyBpbXBsZW1lbnRhdGlvbgo+PiBkZWZpbmVkIGJlaGF2aW9yLiBCdXQgSSdt
IGFmcmFpZCB3ZSdyZSBxdWl0ZSBmYXIgZnJvbSB0aGF0LCBhbmQKPj4gd2UnZCBub3QgYWx3YXlz
IGJlIHdpbGxpbmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5kL29yCj4+IGJpbmFyeSBj
b2RlIHRoYXQgd291bGQgYmUgbmVlZGVkIHRvIGF2b2lkIGl0Lgo+IEhvdyBhYm91dCB1c2luZyB0
aGUgbmV4dCBvbmUtbGluZXIgdG8gYXZvaWQgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBjb2RlIDoK
Pgo+IC8vUmV0dXJucyB0cnVlIGluIGNhc2Ugd2hlbiB0aGUgdG9wIGxlZnQgMTcgYml0cyBhcmUg
YWxsIHplcm8gb3IgYXJlIGFsbCBvbmUKPiByZXR1cm4gKCghKHZhZGRyID4+IDQ3KSkgfHwgKCgo
dmFkZHIgPj4gNDcpJjB4MUZGRkYpID09IDB4MUZGRkYpKQoKSGF2ZSB5b3UgdHJpZWQgY29tcGls
aW5nIHRoZXNlIHR3byBleGFtcGxlcyBhbmQgc2VlaW5nIGhvdyB0aGV5IGRpZmZlcj8KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
