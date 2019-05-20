From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Mon, 20 May 2019 10:43:18 +0100
Message-ID: <4a0bb401-4c22-61ff-2ccd-69c5881e73a6@citrix.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
 <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
 <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSepJ-0004i8-S7
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:43:25 +0000
In-Reply-To: <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDUvMjAxOSAxMDozNywgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDIw
LCAyMDE5IGF0IDEyOjIyIFBNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+IE9uIDIwLzA1LzIwMTkgMTA6MTcsIFZpa3RvciBNaXRpbiB3cm90ZToK
Pj4+Pj4gTWVhbiB0aGF0IHJlc3VsdCBvZiAiKGludDY0X3QpdmFkZHIgPj4gNjMiIGNhbiBiZSAw
IG9yIDEuCj4+Pj4+IFNvIHRoZSBuZXh0IGNvZGUgbWF5IG5vdCB3b3JrIHByb3Blcmx5IGluIGNh
c2Ugb2YgYW5vdGhlciAnaW1wbGVtZW50YXRpb25zJy4KPj4+Pj4gV2l0aCBhbm90aGVyIGNvbXBp
bGVyIChpLmUuIGNsYW5nLCBldGMpIHRoaXMgY29kZSBtYXkgaW50cm9kdWNlIGJ1Z3MKPj4+Pj4g
d2hpY2ggYXJlIGhhcmQgdG8gZmluZC4KPj4+Pj4KPj4+Pj4gKChpbnQ2NF90KXZhZGRyID4+IDQ3
KSA9PSAoKGludDY0X3QpdmFkZHIgPj4gNjMpCj4+Pj4+Cj4+Pj4+IEZvciB0aGlzIHJlYXNvbiBp
dCBpcyBiZXR0ZXIgdG8gYXZvaWQgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBjb2RlLgo+Pj4+IFdl
bGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBhd2F5IHdpdGhvdXQgdXNpbmcgaW1wbGVtZW50
YXRpb24KPj4+PiBkZWZpbmVkIGJlaGF2aW9yLiBCdXQgSSdtIGFmcmFpZCB3ZSdyZSBxdWl0ZSBm
YXIgZnJvbSB0aGF0LCBhbmQKPj4+PiB3ZSdkIG5vdCBhbHdheXMgYmUgd2lsbGluZyB0byBhY2Nl
cHQgdGhlIHdvcnNlIHNvdXJjZSBhbmQvb3IKPj4+PiBiaW5hcnkgY29kZSB0aGF0IHdvdWxkIGJl
IG5lZWRlZCB0byBhdm9pZCBpdC4KPj4+IEhvdyBhYm91dCB1c2luZyB0aGUgbmV4dCBvbmUtbGlu
ZXIgdG8gYXZvaWQgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBjb2RlIDoKPj4+Cj4+PiAvL1JldHVy
bnMgdHJ1ZSBpbiBjYXNlIHdoZW4gdGhlIHRvcCBsZWZ0IDE3IGJpdHMgYXJlIGFsbCB6ZXJvIG9y
IGFyZSBhbGwgb25lCj4+PiByZXR1cm4gKCghKHZhZGRyID4+IDQ3KSkgfHwgKCgodmFkZHIgPj4g
NDcpJjB4MUZGRkYpID09IDB4MUZGRkYpKQo+PiBIYXZlIHlvdSB0cmllZCBjb21waWxpbmcgdGhl
c2UgdHdvIGV4YW1wbGVzIGFuZCBzZWVpbmcgaG93IHRoZXkgZGlmZmVyPwo+Pgo+IFllcywgSSd2
ZSB0cmllZCBpdCB3aXRoIHRoZSBuZXh0IGRyYWZ0IHRlc3QgY29kZS4KPiBUaGUgcmVzdWx0IGxv
b2tzIG9rLCBob3dldmVyIGl0IHRha2VzIHRpbWUgdG8gY2hlY2sgYWxsIDY0Yml0cyB2YWx1ZXMK
PiBvbmUgYnkgb25lLi4uCj4gRG8geW91IHNlZSBhbnkgaXNzdWVzIHdpdGggbmV3IG9uZS1saW5l
cj8KCkphbiBhbHJlYWR5IGlkZW50aWZpZWQgdGhlIGlzc3VlIGluIHRoZSBvdGhlciB0aHJlYWQs
IGFuZCBteSBzdWdnZXN0aW9uCmhlcmUgd2FzIHRvIGluc3BlY3QgdGhlIGdlbmVyYXRlZCBhc3Nl
bWJseSwgd2hpY2ggeW91J2xsIG9ic2VydmUgaXMKc3Vic3RhbnRpYWxseSBtb3JlIGNvbXBsaWNh
dGVkLgoKSG93ZXZlciwgdGhpcyB0aHJlYWQgaXNuJ3QgYmVpbmcgcHJvZHVjdGl2ZS7CoCBZb3Un
cmUgY2xlYXJseSB3YW50aW5nIHRvCmNoYW5nZSB0aGlzIGV4cHJlc3Npb24sIGFuZCB0aGUgbWFp
bnRhaW5lcnMgc2VlIG5vIHJlYXNvbiB0by4KClNvLCB3aGF0IHByb2JsZW0gYXJlIHlvdSBhY3R1
YWxseSB0cnlpbmcgdG8gc29sdmU/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
