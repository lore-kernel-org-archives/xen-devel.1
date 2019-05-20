From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Mon, 20 May 2019 12:53:59 +0300
Message-ID: <CAOcoXZZbmCic3aPu3f+OgXWx8mktKqUJBK-76nwzgvmrg=W6SA@mail.gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
 <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
 <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
 <4a0bb401-4c22-61ff-2ccd-69c5881e73a6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSezk-0005kd-Bm
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:54:12 +0000
Received: by mail-io1-xd2d.google.com with SMTP id s20so10522390ioj.7
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 02:54:11 -0700 (PDT)
In-Reply-To: <4a0bb401-4c22-61ff-2ccd-69c5881e73a6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiA+Pj4+PiBGb3IgdGhpcyByZWFzb24gaXQgaXMgYmV0dGVyIHRvIGF2b2lkIGltcGxlbWVudGF0
aW9uLWRlZmluZWQgY29kZS4KPiA+Pj4+IFdlbGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBh
d2F5IHdpdGhvdXQgdXNpbmcgaW1wbGVtZW50YXRpb24KPiA+Pj4+IGRlZmluZWQgYmVoYXZpb3Iu
IEJ1dCBJJ20gYWZyYWlkIHdlJ3JlIHF1aXRlIGZhciBmcm9tIHRoYXQsIGFuZAo+ID4+Pj4gd2Un
ZCBub3QgYWx3YXlzIGJlIHdpbGxpbmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5kL29y
Cj4gPj4+PiBiaW5hcnkgY29kZSB0aGF0IHdvdWxkIGJlIG5lZWRlZCB0byBhdm9pZCBpdC4KPiA+
Pj4gSG93IGFib3V0IHVzaW5nIHRoZSBuZXh0IG9uZS1saW5lciB0byBhdm9pZCBpbXBsZW1lbnRh
dGlvbi1kZWZpbmVkIGNvZGUgOgo+ID4+Pgo+ID4+PiAvL1JldHVybnMgdHJ1ZSBpbiBjYXNlIHdo
ZW4gdGhlIHRvcCBsZWZ0IDE3IGJpdHMgYXJlIGFsbCB6ZXJvIG9yIGFyZSBhbGwgb25lCj4gPj4+
IHJldHVybiAoKCEodmFkZHIgPj4gNDcpKSB8fCAoKCh2YWRkciA+PiA0NykmMHgxRkZGRikgPT0g
MHgxRkZGRikpCj4gPj4gSGF2ZSB5b3UgdHJpZWQgY29tcGlsaW5nIHRoZXNlIHR3byBleGFtcGxl
cyBhbmQgc2VlaW5nIGhvdyB0aGV5IGRpZmZlcj8KPiA+Pgo+ID4gWWVzLCBJJ3ZlIHRyaWVkIGl0
IHdpdGggdGhlIG5leHQgZHJhZnQgdGVzdCBjb2RlLgo+ID4gVGhlIHJlc3VsdCBsb29rcyBvaywg
aG93ZXZlciBpdCB0YWtlcyB0aW1lIHRvIGNoZWNrIGFsbCA2NGJpdHMgdmFsdWVzCj4gPiBvbmUg
Ynkgb25lLi4uCj4gPiBEbyB5b3Ugc2VlIGFueSBpc3N1ZXMgd2l0aCBuZXcgb25lLWxpbmVyPwo+
Cj4gSmFuIGFscmVhZHkgaWRlbnRpZmllZCB0aGUgaXNzdWUgaW4gdGhlIG90aGVyIHRocmVhZCwg
YW5kIG15IHN1Z2dlc3Rpb24KPiBoZXJlIHdhcyB0byBpbnNwZWN0IHRoZSBnZW5lcmF0ZWQgYXNz
ZW1ibHksIHdoaWNoIHlvdSdsbCBvYnNlcnZlIGlzCj4gc3Vic3RhbnRpYWxseSBtb3JlIGNvbXBs
aWNhdGVkLgo+Cj4gSG93ZXZlciwgdGhpcyB0aHJlYWQgaXNuJ3QgYmVpbmcgcHJvZHVjdGl2ZS4g
IFlvdSdyZSBjbGVhcmx5IHdhbnRpbmcgdG8KPiBjaGFuZ2UgdGhpcyBleHByZXNzaW9uLCBhbmQg
dGhlIG1haW50YWluZXJzIHNlZSBubyByZWFzb24gdG8uCgpXaGF0IGl0IHRoZSByZWFzb24gdG8g
b3B0aW1pemUgcGVyZm9ybWFuY2UgKGlmIGFueSkKaW4gYSBjb3N0IG9mICdpbXBsZW1lbnRhdGlv
bi1kZWZpbmVkIGNvZGUnIHVzYWdlPwpJdCBzZWVtcyAnY29ycmVjdG5lc3MnIChpbmNsdWRpbmcg
bm90IHVzaW5nIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29kZSkKb2YgdGhlIGNvZGUgaXMgaGln
aGVyIHByaW9yaXR5IHRoYW4gY29kZSBwZXJmb3JtYW5jZS4gTm8/CklzIHRoaXMgZnVuY3Rpb24g
aGFkIGJlZW4gbm90aWNlZCB0byBiZSBwZXJmb3JtYW5jZSBib3R0bGVuZWNrPwoKPiBTbywgd2hh
dCBwcm9ibGVtIGFyZSB5b3UgYWN0dWFsbHkgdHJ5aW5nIHRvIHNvbHZlPwoKV2VsbCwgaXQgbG9v
a3MgbGlrZSB0aGlzIGNvZGUgbWF5IG5vdCB3b3JrIGluIGNhc2Ugb2YgYW5vdGhlciBjb21waWxl
ciB1c2FnZS4KSG93ZXZlciwgaWYgbWFpbnRhaW5lcnMgc2VlIG5vIHJlYXNvbiB0byBjaGFuZ2Ug
aXQsIGl0IGlzIG9rLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
