From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 17:45:00 +0100
Message-ID: <0b849a5c-9af8-2b47-ced3-376af22c6141@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com> <5C9BA336020000780022235B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9Bfn-0007iO-VQ
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:45:08 +0000
In-Reply-To: <5C9BA336020000780022235B@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTguMDMuMTkg
YXQgMTQ6MTEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtMTczOCw2ICsxNzMzLDkg
QEAgc3RhdGljIGludCBjcHVfc2NoZWR1bGVfY2FsbGJhY2soCj4+ICAgICAgICAgIHJjID0gY3B1
X3NjaGVkdWxlX3VwKGNwdSk7Cj4+ICAgICAgICAgIGJyZWFrOwo+PiAgICAgIGNhc2UgQ1BVX0RF
QUQ6Cj4+ICsgICAgICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKPj4gKyAg
ICAgICAgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKGNwdSk7Cj4+ICsgICAgICAgIHJjdV9yZWFkX3Vu
bG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwo+PiAgICAgICAgICBTQ0hFRF9PUChzY2hlZCwgZGVp
bml0X3BkYXRhLCBzZC0+c2NoZWRfcHJpdiwgY3B1KTsKPj4gICAgICAgICAgLyogRmFsbHRocm91
Z2ggKi8KPj4gICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoKPiAKPiBjcHVfZGlzYWJsZV9zY2hl
ZHVsZXIoKSBoYXMgYSByZXR1cm4gdmFsdWUgKGFuZCBoZW5jZSBtZWFucyB0bwo+IGZhaWwpIC0g
aXMgaWdub3JpbmcgdGhpcyBoZXJlIHJlYWxseSBhcHByb3ByaWF0ZT8KCllvdSBhcmUgcmlnaHQs
IEkgc2hvdWxkIGhhbmRsZSB0aG9zZSBjYXNlcyBpbiBjcHVfZGlzYWJsZV9zY2hlZHVsZXIoKS4K
V2l0aG91dCB0aGUgY29tcGxldGUgc2VyaWVzIGNvbW1pdHRlZCB0aGlzIHdpbGwgcmVzdWx0IGlu
IGEgY2FzZSBub3QKaGFuZGxlZCBjb3JyZWN0bHk6IGRvbTAgdHJ5aW5nIHRvIHBpbiBhIHZjcHUg
dG8gYSBwaHlzaWNhbCBjcHUgb3RoZXIKdGhhbiBjcHUgMCB2aWEgU0NIRURPUF9waW5fb3ZlcnJp
ZGUgYW5kIHN1c3BlbmRpbmcgaW4gdGhhdCBzdGF0ZS4gSSdtCm5vdCBhd2FyZSBvZiBhbnkgZG9t
MCB0cnlpbmcgdG8gZG8gdGhhdC4KCj4gQWxzbyB3aGlsZSBpbmRlZWQgKGFzIHRoZSBkZXNjcmlw
dGlvbiBzYXlzKSB0aGVyZSdzIG5vIG5lZWQgdG8KPiBydW4gdGhlIGZ1bmN0aW9uIG9uIHRoZSBD
UFUgaXRzZWxmLCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHRoYXQKPiBpdCdzIHNhZmUgdG8gcnVu
IGl0IG91dHNpZGUgb2Ygc3RvcF9tYWNoaW5lKCkgY29udGV4dC4gT3IgdG8gYmUKPiBtb3JlIHBy
ZWNpc2UsIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHRoYXQgbGVhdmluZyBzdG9wX21hY2hpbmUoKQo+
IGNvbnRleHQgd2l0aCB0aGUgYWRqdXN0bWVudHMgbm90IGRvbmUgeWV0IGlzIG5vdCBnb2luZyB0
bwo+IGxlYWQgdG8gcHJvYmxlbXMgKGR1ZSB0byB0aGUgZ2FwIGJldHdlZW4gbGVhdmluZyB0aGF0
IGNvbnRleHQKPiBhbmQgYWNxdWlyaW5nIHRoZSBSQ1UgbG9jaykuIENvdWxkIHlvdSBjbGFyaWZ5
IHRoaXMgaW4gdGhlCj4gZGVzY3JpcHRpb24sIHBsZWFzZSAoaWYgaXQgaW5kZWVkIGlzIGZpbmUg
dGhpcyB3YXkpPwoKSXQgaXMgZmluZSwgYXMgdGhlIGNoYW5jZXMgYXJlIHplcm8gdGhhdCBhbnkg
Y29kZSB3aWxsIHJ1biBvbiB0aGUgY3B1Cmp1c3QgdGFrZW4gZG93biBhbmQgdGhhdCBjcHUgaXMg
bm90IGhvbGRpbmcgYW55IGxvY2tzIHdlIG1pZ2h0IG5lZWQuCgpJJ2xsIGFkZCB0aGF0IHRvIHRo
ZSBjb21taXQgbWVzc2FnZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
