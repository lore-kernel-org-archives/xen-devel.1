From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Thu, 10 Jan 2019 22:30:55 -0800
Message-ID: <CACMJ4GaU1gidUO=X+H7eDznv-Gu9t4Q0ePrLi2DGvZkTvgi-NA@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6g4qvrb2b309AdUBhxwxRVyy7D2sajJ=F1eYcc4Y6-6Q@mail.gmail.com>
 <5C37333B020000780020C2C6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qd1d=PT=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghqLV-0005Fq-LW
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 06:31:09 +0000
Received: by mail-lf1-x141.google.com with SMTP id u18so9998137lff.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 22:31:08 -0800 (PST)
In-Reply-To: <5C37333B020000780020C2C6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, eric chanudet <eric.chanudet@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgMzo1NyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gID4+PiBPbiAxMC4wMS4xOSBhdCAxMjoyNCwgPHJveWdlckBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gNywgMjAxOSBhdCA4OjQ0IEFNIENocmlzdG9w
aGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4gK3N0
YXRpYyBsb25nCj4gPj4gK3JlZ2lzdGVyX3Jpbmcoc3RydWN0IGRvbWFpbiAqY3VycmQsCj4gPgo+
ID4gSWYgdGhpcyBpcyBpbmRlZWQgdGhlIGN1cnJlbnQgZG9tYWluIChhcyB0aGUgbmFtZSBzdWdn
ZXN0cyksIHdoeSBkbwo+ID4geW91IG5lZWQgdG8gcGFzcyBpdCBhcm91bmQ/IE9yIGVsc2UganVz
dCBuYW1lIHRoZSBwYXJhbWV0ZXIgZC4KPgo+IFdoZW4gYWxsIChvciBhdCBsZWFzdCBtb3N0KSBj
YWxsZXJzIGFscmVhZHkgbGF0Y2ggdGhlIHBvaW50ZXIgaW50byBhCj4gbG9jYWwgdmFyaWFibGUs
IGhhbmRpbmcgaXQgdGhyb3VnaCBpcyBvZnRlbiBjaGVhcGVyIHRoYW4gcmUtb2J0YWluaW5nCj4g
aXQgYXMgY3VycmVudC0+ZG9tYWluLiBBU1NFUlQoY3VycmQgPT0gY3VycmVudC0+ZG9tYWluKSBt
aWdodCBiZQo+IHdvcnRod2hpbGUgaW4gc3VjaCBjYXNlcywgdGhvdWdoLgoKYXJndW1lbnQgcmV0
YWluZWQgYW5kIEFTU0VSVHMgYWRkZWQsIHRoYW5rcy4KCkNocmlzdG9waGVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
