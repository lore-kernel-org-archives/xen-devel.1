From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Wed, 9 Jan 2019 15:24:11 -0800
Message-ID: <CACMJ4GbEo5KJp9evyX6rmTda5KmqhP6VnxxpBktbY5mk+_RKng@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAKf6xpvXBGUwFAjvwromG737Bg-_MB7rWBB=Oj7q2zHgaiF5mg@mail.gmail.com>
 <CACMJ4GZBtksGHNBe2sqVTu6zb3p4E1Q0Zq-R+r75B6E00x9sMA@mail.gmail.com>
 <CAKf6xptAc9KfCbnr_GOJPjacXKQHgvMgddzMCfH5RThC3Kf2dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dxNJ=PR=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghND0-00083f-Sv
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 23:24:26 +0000
Received: by mail-lj1-x243.google.com with SMTP id c19-v6so8010081lja.5
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 15:24:25 -0800 (PST)
In-Reply-To: <CAKf6xptAc9KfCbnr_GOJPjacXKQHgvMgddzMCfH5RThC3Kf2dA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gOSwgMjAxOSBhdCA2OjE2IEFNIEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBKYW4gOSwgMjAxOSBhdCAxOjQ4IEFNIENocmlzdG9w
aGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBU
dWUsIEphbiA4LCAyMDE5IGF0IDI6NTQgUE0gSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4gT24gTW9uLCBKYW4gNywgMjAxOSBhdCAyOjQzIEFNIENocmlzdG9w
aGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID4g
PiArCj4gPiA+ID4gKy8qIEEgc3BhY2UtYXZhaWxhYmxlIG5vdGlmaWNhdGlvbiB0aGF0IGlzIGF3
YWl0aW5nIHN1ZmZpY2llbnQgc3BhY2UgKi8KPiA+ID4gPiArc3RydWN0IHBlbmRpbmdfZW50Cj4g
PiA+ID4gK3sKPiA+ID4gPiArICAgIC8qCj4gPiA+ID4gKyAgICAgKiBQb2ludGVyIHRvIHRoZSBy
aW5nX2luZm8gdGhhdCB0aGlzIGVudCBwZXJ0YWlucyB0by4gVXNlZCB0byBlbnN1cmUgdGhhdAo+
ID4gPiA+ICsgICAgICogcmluZ19pbmZvLT5ucGVuZGluZyBpcyBkZWNyZW1lbnRlZCB3aGVuIGVu
dHMgZm9yIHdpbGRjYXJkIHJpbmdzIGFyZQo+ID4gPiA+ICsgICAgICogY2FuY2VsbGVkIGZvciBk
b21haW4gZGVzdHJveS4KPiA+ID4gPiArICAgICAqIENhdXRpb246IE11c3QgaG9sZCB0aGUgY29y
cmVjdCBsb2NrcyBiZWZvcmUgYWNjZXNzaW5nIHJpbmdfaW5mbyB2aWEgdGhpcy4KPiA+ID4KPiA+
ID4gSXQgd291bGQgYmUgY2xlYXJlciBpZiB0aGlzIHN0YXRlZCB0aGUgY29ycmVjdCBsb2Nrcy4K
PiA+Cj4gPiBvayAtIGl0IHdvdWxkIG1lYW4gZHVwbGljYXRpbmcgdGhlIHN0YXRlbWVudCBhYm91
dCB3aGljaCBsb2NrcyBhcmUKPiA+IG5lZWRlZCB0aG91Z2gsIHNpbmNlIGl0IGlzIGV4cGxhaW5l
ZCBlbHNld2hlcmUgaW4gdGhlIGZpbGUsIHdoaWNoIG1lYW5zCj4gPiBpdCB3aWxsIG5lZWQgdXBk
YXRpbmcgaW4gdHdvIHBsYWNlcyBpZiB0aGUgbG9ja2luZyByZXF1aXJlbWVudHMgY2hhbmdlLgo+
ID4gVGhhdCB3YXMgd2h5IEkgd29yZGVkIGl0IHRoYXQgd2F5LCBhcyBhbiBpbmRpY2F0b3IgdG8g
Z28gYW5kIGZpbmQgd2hlcmUKPiA+IGl0IGlzIGFscmVhZHkgZGVzY3JpYmVkLCB0byBhdm9pZCB0
aGF0Lgo+Cj4gIkNhdXRpb24iIG1hZGUgbWUgdGhpbmsgKnJpbmdfaW5mbyBwb2ludHMgZnJvbSBk
b21haW4gQSdzIHBlbmRpbmdfZW50Cj4gdG8gZG9tYWluIEIncyByaW5nX2luZm8uICBSZWFkaW5n
IHBhdGNoIDEwIChub3RpZnkgb3ApIEkgc2VlIHRoYXQgaXQKPiByZWFsbHkganVzdCBwb2ludHMg
YmFjayB0byBkb21haW4gQSdzIHJpbmdfaW5mby4gIFNvIHRoZSAiQ2F1dGlvbiIgaXMKPiBqdXN0
IHRoYXQgeW91IHN0aWxsIGhhdmUgdG8gbG9jayByaW5nX2luZm8gKEwzKSBldmVuIHRob3VnaCB5
b3UgY2FuCj4gZ2V0IHRvIHRoZSBwb2ludGVyIHZpYSBMMi4gIElzIHRoYXQgY29ycmVjdD8KClll
cywgZXhhY3RseS4KCj4gSSBhZ3JlZSBhIHNpbmdsZSBsb2NhdGlvbiBmb3IgdGhlIGxvY2tpbmcg
ZG9jdW1lbnRhdGlvbiBpcyBiZXR0ZXIgdGhhbgo+IHNwbGl0dGluZyBvciBkdXBsaWNhdGluZy4g
IEFzIGxvbmcgYXMgbm8gY3Jvc3MtZG9tYWluIGxvY2tpbmcgaXMKPiByZXF1aXJlZCwgdGhpcyBp
cyBmaW5lLgoKT0sgLSB0aGFua3MuCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
