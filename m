From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Wed, 9 Jan 2019 19:03:48 +0200
Message-ID: <feee974a-e0d7-70b0-7940-02675c69776c@bitdefender.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
 <20181212164721.hag6gc3akcm2gvhd@mac>
 <CACMJ4GZRAck4oYtXJpV3c_tGer0n+EUuWjXCtcjLbySOs0W78w@mail.gmail.com>
 <20181220125218.75t3cr3ehc6e4u6n@mac.citrite.net>
 <CACMJ4GaG8kZBkcFiEWMi_ENdJ4uX=c2YxFpgu_sKjUab7618dA@mail.gmail.com>
 <20190104085704.ga7wsqonhbzpv5as@mac.bytemobile.com>
 <5C2F5E0B020000780020A37A@prv1-mh.provo.novell.com>
 <20190104153555.cfjx5mofw6mjbudh@mac.bytemobile.com>
 <5C2F7FF8020000780020A495@prv1-mh.provo.novell.com>
 <20190107085912.gd5bp6y35drjg5gr@mac>
 <CABfawhmfhYkHreJ3A4xnmhJjW3581Zt0L5-Vsswz93ZZTMrFQw@mail.gmail.com>
 <CAPLaKK4nijCrfATvUXNf8MR8cfFHCA0Zk9mYmp0kYj96c4V9Qg@mail.gmail.com>
 <d71b17a9-0ff9-5c48-db96-33bef501d3e0@bitdefender.com>
 <CABfawhnA1-7DjCQTY_7Ddy32nB4wDQZV35oSm567kt+tmnDkCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mb6b=PR=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ghHGi-0003Lw-0x
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 17:03:52 +0000
In-Reply-To: <CABfawhnA1-7DjCQTY_7Ddy32nB4wDQZV35oSm567kt+tmnDkCQ@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@freebsd.org>, Tim Deegan <tim@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, eric chanudet <eric.chanudet@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS85LzE5IDY6NTAgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBPbiBXZWQsIEphbiA5
LCAyMDE5IGF0IDk6NDggQU0gUmF6dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiaXRkZWZlbmRl
ci5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxLzkvMTkgNjozNCBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPj4+Pj4+PiBNYXliZSB0aGlzIGlzIHVzZS1jYXNlIGlzIGRpZmZlcmVudCwgYnV0IGhv
dyBkb2VzIGludHJvc3BlY3Rpb24gaGFuZGxlCj4+Pj4+Pj4gYWNjZXNzZXMgdG8gdGhlIHNoYXJl
ZCBpbmZvIHBhZ2Ugb3IgdGhlIHJ1bnN0YXRlIGluZm8gZm9yIGV4YW1wbGU/Cj4+Pj4+Pj4KPj4+
Pj4+PiBJIHdvdWxkIGNvbnNpZGVyIGFyZ28gdG8gYmUgdGhlIHNhbWUgaW4gdGhpcyByZWdhcmQu
Cj4+Pj4+Pgo+Pj4+Pj4gTm90IGV4YWN0bHk6IFRoZSBzaGFyZWQgaW5mbyBwYWdlIGlzIHNwZWNp
YWwgaW4gYW55IGV2ZW50LiBGb3IKPj4+Pj4+IHJ1bnN0YXRlIGluZm8gKGFuZCBhbGlrZSAtIHRo
ZXJlJ3MgYWxzbyBzdHJ1Y3QgdmNwdV90aW1lX2luZm8pCj4+Pj4+PiBJJ2QgcXVlc3Rpb24gY29y
cmVjdG5lc3Mgb2YgdGhlIGN1cnJlbnQgaGFuZGxpbmcuIElmIHRoYXQncwo+Pj4+Pj4gd3Jvbmcg
YWxyZWFkeSwgSSdkIHByZWZlciBpZiB0aGUgaXNzdWUgd2Fzbid0IHNwcmVhZC4KPj4+Pj4KPj4+
Pj4gVGhlcmUgYXJlIGFsc28gZ3JhbnRzLCB3aGljaCB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0aCBh
bm90aGVyIGd1ZXN0IG9uCj4+Pj4+IHRoZSBzYW1lIGhvc3QgY291bGQgYWxsb3cgdG8gYnlwYXNz
IGludHJvc3BlY3Rpb24gQUZBSUNUPyAodW5sZXNzCj4+Pj4+IHRoZXJlJ3Mgc29tZSBwb2xpY3kg
YXBwbGllZCB0aGF0IGxpbWl0IGdyYW50IHNoYXJpbmcgdG8gdHJ1c3RlZAo+Pj4+PiBkb21haW5z
KQo+Pj4+Pgo+Pj4+PiBUQkggSSdtIG5vdCBzdXJlIGhvdyB0byBoYW5kbGUgaHlwb2Vydmlzb3Ig
YWNjZXNzZXMgd2l0aAo+Pj4+PiBpbnRyb3NwZWN0aW9uLiAgTXkga25vd2xlZGdlIG9mIGludHJv
c3BlY3Rpb24gaXMgZmFpcmx5IGxpbWl0ZWQsIGJ1dAo+Pj4+PiBpdCBwYXVzZXMgdGhlIGd1ZXN0
IGFuZCBzZW5kcyBhIG5vdGlmaWNhdGlvbiB0byBhbiBpbiBndWVzdCBhZ2VudC4gSSdtCj4+Pj4+
IG5vdCBzdXJlIHRoaXMgaXMgYXBwbGljYWJsZSB0byBoeXBlcnZpc29yIHdyaXRlcywgc2luY2Ug
aXQncyBub3QKPj4+Pj4gcG9zc2libGUgdG8gcGF1c2UgaHlwZXJ2aXNvciBleGVjdXRpb24gYW5k
IHdhaXQgZm9yIGEgcmVzcG9uc2UgZnJvbSBhCj4+Pj4+IGd1ZXN0IGFnZW50Lgo+Pj4+Pgo+Pj4+
Cj4+Pj4gSW50cm9zcGVjdGlvbiBhcHBsaWNhdGlvbnMgb25seSBjYXJlIGFib3V0IG1lbW9yeSBh
Y2Nlc3NlcyBwZXJmb3JtZWQKPj4+PiBieSB0aGUgZ3Vlc3QuIEh5cGVydmlzb3IgYWNjZXNzZXMg
dG8gbW9uaXRvcmVkIHBhZ2VzIGFyZSBub3QgaW5jbHVkZWQKPj4+PiB3aGVuIG1vbml0b3Jpbmcg
LSBpdCBpcyBhY3R1YWxseSBhIGZlYXR1cmUgd2hlbiB1c2luZyB0aGUgZW11bGF0b3IgaW4KPj4+
PiBYZW4gdG8gY29udGludWUgZ3Vlc3QgZXhlY3V0aW9uIGJlY2F1c2UgdGhlIGh5cGVydmlzb3Ig
aWdub3JlcyBFUFQKPj4+PiBtZW1vcnkgcGVybWlzc2lvbnMgdGhhdCB0cmlwIHRoZSBndWVzdCBm
b3IgaW50cm9zcGVjdGlvbi4gU28gaGF2aW5nCj4+Pj4gdGhlIGh5cGVydmlzb3IgYWNjZXNzIG1l
bW9yeSBvciBhIGdyYW50LXNoYXJlZCBwYWdlIGJlaW5nIGFjY2Vzc2VkIGluCj4+Pj4gYW5vdGhl
ciBkb21haW4gYXJlIG5vdCBhIHByb2JsZW0gZm9yIGludHJvc3BlY3Rpb24uCj4+Pgo+Pj4gQ2Fu
J3QgdGhlbiB0d28gZ3Vlc3RzIHJ1bm5pbmcgb24gdGhlIHNhbWUgaG9zdCBiZSBhYmxlIHRvIGNv
bXBsZXRlbHkKPj4+IGJ5cGFzcyBpbnRyb3NwZWN0aW9uPyBJIGd1ZXNzIHlvdSBwcmV2ZW50IHRo
aXMgYnkgbGltaXRpbmcgdG8gd2hpY2gKPj4+IGd1ZXN0cyBwYWdlcyBjYW4gYmUgc2hhcmVkPwo+
Pgo+PiBXb3VsZCB0aGVzZSB0d28gZ3Vlc3RzIGJlIEhWTSBndWVzdHM/IEludHJvc3BlY3Rpb24g
b25seSB3b3JrcyBmb3IgSFZNCj4+IGd1ZXN0cy4gSSdtIG5vdCBzdXJlIEkgZm9sbG93IHlvdXIg
c2NlbmFyaW8gdGhvdWdoLiBIb3cgd291bGQgdGhlc2UKPj4gZ3Vlc3RzIGNvbGxhYm9yYXRlIHRv
IGVzY2FwZSBpbnRyb3NwZWN0aW9uIHZpYSBncmFudHM/Cj4gCj4gSWYgdGhlcmUgYXJlIHR3byBk
b21haW5zIGFjdGluZyBtYWxpY2lvdXNseSBpbiBjb25jZXJ0IHRvIGJ5cGFzcwo+IG1vbml0b3Jp
bmcgb2YgbWVtb3J5IHdyaXRlcyB0aGV5IGNvdWxkIGFjaGlldmUgdGhhdCB3aXRoIGdyYW50cywg
eWVzLgo+IFNheSBhIHdyaXRlLW1vbml0b3JlZCBwYWdlIGlzIGdyYW50LXNoYXJlZCB0byBhbm90
aGVyIGRvbWFpbiwgd2hpY2gKPiB0aGVuIGRvZXMgdGhlIHdyaXRlIG9uIGJlaGFsZiBvZiB0aGUg
Zmlyc3QuIEkgd291bGRuJ3Qgc2F5IHRoYXQncwo+ICJjb21wbGV0ZWx5IGJ5cGFzc2luZyBpbnRy
b3NwZWN0aW9uIiB0aG91Z2gsIHRoZXJlIGFyZSBtYW55IHR5cGVzIG9mCj4gZXZlbnRzIHRoYXQg
Y2FuIGJlIG1vbml0b3JlZCwgd3JpdGUtYWNjZXNzZXMgYXJlIG9ubHkgb25lLiBJJ20gbm90Cj4g
YXdhcmUgb2YgYW55IG1lY2hhbmlzbSB0aGF0IGNhbiBiZSB1c2VkIHRvIGxpbWl0IHdoaWNoIHBh
Z2VzIGNhbiBiZQo+IHNoYXJlZCBidXQgeW91IGNhbiB1c2UgWFNNIHRvIHJlc3RyaWN0IHdoaWNo
IGRvbWFpbnMgY2FuIHNoYXJlIHBhZ2VzCj4gdG8gYmVnaW4gd2l0aC4gVGhhdCdzIG5vcm1hbGx5
IGVub3VnaC4KClJpZ2h0LCBJIGFncmVlLiBXZSdyZSBub3QgY3VycmVudGx5IGRlYWxpbmcgd2l0
aCB0aGF0IGNhc2UgYW5kIGFzc3VtZSAKdGhhdCBYU00gKG9yIGEgc2ltaWxhciBtZWNoYW5pc20p
IHdpbGwgYmUgdXNlZCBpbiBzY2VuYXJpb3Mgd2hlcmUgdGhpcyAKbGV2ZWwgb2YgYWNjZXNzIGlz
IHBvc3NpYmxlLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
