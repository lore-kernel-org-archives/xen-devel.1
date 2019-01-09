From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Wed, 9 Jan 2019 09:50:12 -0700
Message-ID: <CABfawhnA1-7DjCQTY_7Ddy32nB4wDQZV35oSm567kt+tmnDkCQ@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W+9z=PR=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ghH48-0002BM-RK
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 16:50:52 +0000
Received: by mail-ed1-f46.google.com with SMTP id h15so7878143edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 08:50:51 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id 49sm1288036edz.59.2019.01.09.08.50.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jan 2019 08:50:49 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id g67so8995410wmd.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 08:50:49 -0800 (PST)
In-Reply-To: <d71b17a9-0ff9-5c48-db96-33bef501d3e0@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>, Tim Deegan <tim@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, eric chanudet <eric.chanudet@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gOSwgMjAxOSBhdCA5OjQ4IEFNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiAxLzkvMTkgNjozNCBQTSwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToKPiA+Pj4+PiBNYXliZSB0aGlzIGlzIHVzZS1jYXNlIGlzIGRpZmZlcmVu
dCwgYnV0IGhvdyBkb2VzIGludHJvc3BlY3Rpb24gaGFuZGxlCj4gPj4+Pj4gYWNjZXNzZXMgdG8g
dGhlIHNoYXJlZCBpbmZvIHBhZ2Ugb3IgdGhlIHJ1bnN0YXRlIGluZm8gZm9yIGV4YW1wbGU/Cj4g
Pj4+Pj4KPiA+Pj4+PiBJIHdvdWxkIGNvbnNpZGVyIGFyZ28gdG8gYmUgdGhlIHNhbWUgaW4gdGhp
cyByZWdhcmQuCj4gPj4+Pgo+ID4+Pj4gTm90IGV4YWN0bHk6IFRoZSBzaGFyZWQgaW5mbyBwYWdl
IGlzIHNwZWNpYWwgaW4gYW55IGV2ZW50LiBGb3IKPiA+Pj4+IHJ1bnN0YXRlIGluZm8gKGFuZCBh
bGlrZSAtIHRoZXJlJ3MgYWxzbyBzdHJ1Y3QgdmNwdV90aW1lX2luZm8pCj4gPj4+PiBJJ2QgcXVl
c3Rpb24gY29ycmVjdG5lc3Mgb2YgdGhlIGN1cnJlbnQgaGFuZGxpbmcuIElmIHRoYXQncwo+ID4+
Pj4gd3JvbmcgYWxyZWFkeSwgSSdkIHByZWZlciBpZiB0aGUgaXNzdWUgd2Fzbid0IHNwcmVhZC4K
PiA+Pj4KPiA+Pj4gVGhlcmUgYXJlIGFsc28gZ3JhbnRzLCB3aGljaCB3aGVuIHVzZWQgdG9nZXRo
ZXIgd2l0aCBhbm90aGVyIGd1ZXN0IG9uCj4gPj4+IHRoZSBzYW1lIGhvc3QgY291bGQgYWxsb3cg
dG8gYnlwYXNzIGludHJvc3BlY3Rpb24gQUZBSUNUPyAodW5sZXNzCj4gPj4+IHRoZXJlJ3Mgc29t
ZSBwb2xpY3kgYXBwbGllZCB0aGF0IGxpbWl0IGdyYW50IHNoYXJpbmcgdG8gdHJ1c3RlZAo+ID4+
PiBkb21haW5zKQo+ID4+Pgo+ID4+PiBUQkggSSdtIG5vdCBzdXJlIGhvdyB0byBoYW5kbGUgaHlw
b2Vydmlzb3IgYWNjZXNzZXMgd2l0aAo+ID4+PiBpbnRyb3NwZWN0aW9uLiAgTXkga25vd2xlZGdl
IG9mIGludHJvc3BlY3Rpb24gaXMgZmFpcmx5IGxpbWl0ZWQsIGJ1dAo+ID4+PiBpdCBwYXVzZXMg
dGhlIGd1ZXN0IGFuZCBzZW5kcyBhIG5vdGlmaWNhdGlvbiB0byBhbiBpbiBndWVzdCBhZ2VudC4g
SSdtCj4gPj4+IG5vdCBzdXJlIHRoaXMgaXMgYXBwbGljYWJsZSB0byBoeXBlcnZpc29yIHdyaXRl
cywgc2luY2UgaXQncyBub3QKPiA+Pj4gcG9zc2libGUgdG8gcGF1c2UgaHlwZXJ2aXNvciBleGVj
dXRpb24gYW5kIHdhaXQgZm9yIGEgcmVzcG9uc2UgZnJvbSBhCj4gPj4+IGd1ZXN0IGFnZW50Lgo+
ID4+Pgo+ID4+Cj4gPj4gSW50cm9zcGVjdGlvbiBhcHBsaWNhdGlvbnMgb25seSBjYXJlIGFib3V0
IG1lbW9yeSBhY2Nlc3NlcyBwZXJmb3JtZWQKPiA+PiBieSB0aGUgZ3Vlc3QuIEh5cGVydmlzb3Ig
YWNjZXNzZXMgdG8gbW9uaXRvcmVkIHBhZ2VzIGFyZSBub3QgaW5jbHVkZWQKPiA+PiB3aGVuIG1v
bml0b3JpbmcgLSBpdCBpcyBhY3R1YWxseSBhIGZlYXR1cmUgd2hlbiB1c2luZyB0aGUgZW11bGF0
b3IgaW4KPiA+PiBYZW4gdG8gY29udGludWUgZ3Vlc3QgZXhlY3V0aW9uIGJlY2F1c2UgdGhlIGh5
cGVydmlzb3IgaWdub3JlcyBFUFQKPiA+PiBtZW1vcnkgcGVybWlzc2lvbnMgdGhhdCB0cmlwIHRo
ZSBndWVzdCBmb3IgaW50cm9zcGVjdGlvbi4gU28gaGF2aW5nCj4gPj4gdGhlIGh5cGVydmlzb3Ig
YWNjZXNzIG1lbW9yeSBvciBhIGdyYW50LXNoYXJlZCBwYWdlIGJlaW5nIGFjY2Vzc2VkIGluCj4g
Pj4gYW5vdGhlciBkb21haW4gYXJlIG5vdCBhIHByb2JsZW0gZm9yIGludHJvc3BlY3Rpb24uCj4g
Pgo+ID4gQ2FuJ3QgdGhlbiB0d28gZ3Vlc3RzIHJ1bm5pbmcgb24gdGhlIHNhbWUgaG9zdCBiZSBh
YmxlIHRvIGNvbXBsZXRlbHkKPiA+IGJ5cGFzcyBpbnRyb3NwZWN0aW9uPyBJIGd1ZXNzIHlvdSBw
cmV2ZW50IHRoaXMgYnkgbGltaXRpbmcgdG8gd2hpY2gKPiA+IGd1ZXN0cyBwYWdlcyBjYW4gYmUg
c2hhcmVkPwo+Cj4gV291bGQgdGhlc2UgdHdvIGd1ZXN0cyBiZSBIVk0gZ3Vlc3RzPyBJbnRyb3Nw
ZWN0aW9uIG9ubHkgd29ya3MgZm9yIEhWTQo+IGd1ZXN0cy4gSSdtIG5vdCBzdXJlIEkgZm9sbG93
IHlvdXIgc2NlbmFyaW8gdGhvdWdoLiBIb3cgd291bGQgdGhlc2UKPiBndWVzdHMgY29sbGFib3Jh
dGUgdG8gZXNjYXBlIGludHJvc3BlY3Rpb24gdmlhIGdyYW50cz8KCklmIHRoZXJlIGFyZSB0d28g
ZG9tYWlucyBhY3RpbmcgbWFsaWNpb3VzbHkgaW4gY29uY2VydCB0byBieXBhc3MKbW9uaXRvcmlu
ZyBvZiBtZW1vcnkgd3JpdGVzIHRoZXkgY291bGQgYWNoaWV2ZSB0aGF0IHdpdGggZ3JhbnRzLCB5
ZXMuClNheSBhIHdyaXRlLW1vbml0b3JlZCBwYWdlIGlzIGdyYW50LXNoYXJlZCB0byBhbm90aGVy
IGRvbWFpbiwgd2hpY2gKdGhlbiBkb2VzIHRoZSB3cml0ZSBvbiBiZWhhbGYgb2YgdGhlIGZpcnN0
LiBJIHdvdWxkbid0IHNheSB0aGF0J3MKImNvbXBsZXRlbHkgYnlwYXNzaW5nIGludHJvc3BlY3Rp
b24iIHRob3VnaCwgdGhlcmUgYXJlIG1hbnkgdHlwZXMgb2YKZXZlbnRzIHRoYXQgY2FuIGJlIG1v
bml0b3JlZCwgd3JpdGUtYWNjZXNzZXMgYXJlIG9ubHkgb25lLiBJJ20gbm90CmF3YXJlIG9mIGFu
eSBtZWNoYW5pc20gdGhhdCBjYW4gYmUgdXNlZCB0byBsaW1pdCB3aGljaCBwYWdlcyBjYW4gYmUK
c2hhcmVkIGJ1dCB5b3UgY2FuIHVzZSBYU00gdG8gcmVzdHJpY3Qgd2hpY2ggZG9tYWlucyBjYW4g
c2hhcmUgcGFnZXMKdG8gYmVnaW4gd2l0aC4gVGhhdCdzIG5vcm1hbGx5IGVub3VnaC4KClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
