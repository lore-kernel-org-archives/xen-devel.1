From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Thu, 10 Jan 2019 04:57:47 -0700
Message-ID: <5C37333B020000780020C2C6@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6g4qvrb2b309AdUBhxwxRVyy7D2sajJ=F1eYcc4Y6-6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghYy7-0006A7-Oi
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 11:57:51 +0000
In-Reply-To: <CAPLaKK6g4qvrb2b309AdUBhxwxRVyy7D2sajJ=F1eYcc4Y6-6Q@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <royger@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ID4+PiBPbiAxMC4wMS4xOSBhdCAxMjoyNCwgPHJveWdlckBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IE1vbiwgSmFuIDcsIDIwMTkgYXQgODo0NCBBTSBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3Bo
ZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+PiArc3RhdGljIGxvbmcKPj4gK3JlZ2lzdGVy
X3Jpbmcoc3RydWN0IGRvbWFpbiAqY3VycmQsCj4gCj4gSWYgdGhpcyBpcyBpbmRlZWQgdGhlIGN1
cnJlbnQgZG9tYWluIChhcyB0aGUgbmFtZSBzdWdnZXN0cyksIHdoeSBkbwo+IHlvdSBuZWVkIHRv
IHBhc3MgaXQgYXJvdW5kPyBPciBlbHNlIGp1c3QgbmFtZSB0aGUgcGFyYW1ldGVyIGQuCgpXaGVu
IGFsbCAob3IgYXQgbGVhc3QgbW9zdCkgY2FsbGVycyBhbHJlYWR5IGxhdGNoIHRoZSBwb2ludGVy
IGludG8gYQpsb2NhbCB2YXJpYWJsZSwgaGFuZGluZyBpdCB0aHJvdWdoIGlzIG9mdGVuIGNoZWFw
ZXIgdGhhbiByZS1vYnRhaW5pbmcKaXQgYXMgY3VycmVudC0+ZG9tYWluLiBBU1NFUlQoY3VycmQg
PT0gY3VycmVudC0+ZG9tYWluKSBtaWdodCBiZQp3b3J0aHdoaWxlIGluIHN1Y2ggY2FzZXMsIHRo
b3VnaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
