From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 10 Jan 2019 15:29:45 -0800
Message-ID: <CACMJ4GYAcFijiX1czOGwCoSLcBwZR2uO-r66UpyRpf2kja57eg@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAKf6xpvXBGUwFAjvwromG737Bg-_MB7rWBB=Oj7q2zHgaiF5mg@mail.gmail.com>
 <5C35C04B020000780020BB8D@prv1-mh.provo.novell.com>
 <CAKf6xptouC=bDD54mJY0Ddgm1V9aXQhp-ntTPVAERQ29s7wpRQ@mail.gmail.com>
 <5C360770020000780020BD18@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gkqY=PS=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghjlw-0006Wm-3F
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 23:30:00 +0000
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so11267132ljh.13
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 15:29:58 -0800 (PST)
In-Reply-To: <5C360770020000780020BD18@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gOSwgMjAxOSBhdCA2OjM4IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDkuMDEuMTkgYXQgMTU6MjYsIDxqYW5kcnl1a0BnbWFp
bC5jb20+IHdyb3RlOgo+ID4gT24gV2VkLCBKYW4gOSwgMjAxOSBhdCA0OjM1IEFNIEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gPj4+IE9uIDA4LjAxLjE5IGF0IDIz
OjU0LCA8amFuZHJ5dWtAZ21haWwuY29tPiB3cm90ZToKPiA+PiA+IE9uIE1vbiwgSmFuIDcsIDIw
MTkgYXQgMjo0MyBBTSBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+ID4+ID4+ICsgICAgICovCj4gPj4gPj4gKyAgICBzdHJ1Y3QgYXJnb19y
aW5nX2luZm8gKnJpbmdfaW5mbzsKPiA+PiA+PiArICAgIC8qIGRvbWFpbiB0byBiZSBub3RpZmll
ZCB3aGVuIHNwYWNlIGlzIGF2YWlsYWJsZSAqLwo+ID4+ID4+ICsgICAgZG9taWRfdCBkb21haW5f
aWQ7Cj4gPj4gPj4gKyAgICB1aW50MTZfdCBwYWQ7Cj4gPj4gPgo+ID4+ID4gQ2FuIHdlIG9yZGVy
IGRvbWFpbl9pZCBhZnRlciBsZW4gYW5kIGRyb3AgdGhlIHBhZD8KPiA+Pgo+ID4+IFRoYXQgd291
bGQgc3RpbGwgY2FsbCBmb3IgYSBwYWQgZmllbGQgLSB3ZSBwcmVmZXIgdG8gaGF2ZSBleHBsaWNp
dCBwYWRkaW5nLAo+ID4+IGFuZCBhbHNvIHRvIGNoZWNrIGl0J3MgemVybywgdGhlIGxhdHRlciB0
byBhbGxvdyBmb3IgYXNzaWduaW5nIG1lYW5pbmcgdG8KPiA+PiB0aGUgZmllbGQgZG93biB0aGUg
cm9hZC4KPiA+Cj4gPiBUaGlzIHN0cnVjdCBpcyBpbnRlcm5hbCB0byBYZW4gYW5kIGFyZ28sIHNv
IGRvIHdlIHN0aWxsIG5lZWQgZXhwbGljaXQKPiA+IHBhZGRpbmc/Cj4KPiBPaCwgaW50ZXJuYWwg
c3RydWN0dXJlcyBkb24ndCBuZWVkIGFueSBleHBsaWNpdCBwYWRkaW5nLiBXaGVyZSB0aGUKPiBk
b21haW5faWQgZmllbGQgZ2V0cyBwbGFjZWQgc3RpbGwgZG9lc24ndCBtYXR0ZXIgdGhlbiwgdGhv
dWdoLgoKb2ssIEkndmUgc3dpdGNoZWQgdGhlIGxlbiBmaWVsZCBoZXJlIGZyb20gdWludDMyX3Qg
dG8gdW5zaWduZWQgaW50CihwYXJ0IG9mIG1vdmluZyBhd2F5IGZyb20gZml4ZWQtd2lkdGggdHlw
ZXMgd2hlcmUgbm90IHJlcXVpcmVkLCBhcwpyZXF1ZXN0ZWQgbGF0ZXIgaW4gdGhpcyB0aHJlYWQp
IGFuZCBzbyB3aGlsZSBhdCBpdCBoYXZlIGRyb3BwZWQgdGhlCnVubmVlZGVkIHBhZCBmaWVsZCB0
b28uCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
