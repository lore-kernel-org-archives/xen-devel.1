From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Wed, 09 Jan 2019 07:38:40 -0700
Message-ID: <5C360770020000780020BD18@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAKf6xpvXBGUwFAjvwromG737Bg-_MB7rWBB=Oj7q2zHgaiF5mg@mail.gmail.com>
 <5C35C04B020000780020BB8D@prv1-mh.provo.novell.com>
 <CAKf6xptouC=bDD54mJY0Ddgm1V9aXQhp-ntTPVAERQ29s7wpRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7QHe=PR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghF0G-0006HZ-AR
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 14:38:44 +0000
In-Reply-To: <CAKf6xptouC=bDD54mJY0Ddgm1V9aXQhp-ntTPVAERQ29s7wpRQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE5IGF0IDE1OjI2LCA8amFuZHJ5dWtAZ21haWwuY29tPiB3cm90ZToKPiBP
biBXZWQsIEphbiA5LCAyMDE5IGF0IDQ6MzUgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPj4gPj4+IE9uIDA4LjAxLjE5IGF0IDIzOjU0LCA8amFuZHJ5dWtAZ21haWwu
Y29tPiB3cm90ZToKPj4gPiBPbiBNb24sIEphbiA3LCAyMDE5IGF0IDI6NDMgQU0gQ2hyaXN0b3Bo
ZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPj4gPj4gKyAg
ICAgKi8KPj4gPj4gKyAgICBzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5mbzsKPj4gPj4g
KyAgICAvKiBkb21haW4gdG8gYmUgbm90aWZpZWQgd2hlbiBzcGFjZSBpcyBhdmFpbGFibGUgKi8K
Pj4gPj4gKyAgICBkb21pZF90IGRvbWFpbl9pZDsKPj4gPj4gKyAgICB1aW50MTZfdCBwYWQ7Cj4+
ID4KPj4gPiBDYW4gd2Ugb3JkZXIgZG9tYWluX2lkIGFmdGVyIGxlbiBhbmQgZHJvcCB0aGUgcGFk
Pwo+Pgo+PiBUaGF0IHdvdWxkIHN0aWxsIGNhbGwgZm9yIGEgcGFkIGZpZWxkIC0gd2UgcHJlZmVy
IHRvIGhhdmUgZXhwbGljaXQgcGFkZGluZywKPj4gYW5kIGFsc28gdG8gY2hlY2sgaXQncyB6ZXJv
LCB0aGUgbGF0dGVyIHRvIGFsbG93IGZvciBhc3NpZ25pbmcgbWVhbmluZyB0bwo+PiB0aGUgZmll
bGQgZG93biB0aGUgcm9hZC4KPiAKPiBUaGlzIHN0cnVjdCBpcyBpbnRlcm5hbCB0byBYZW4gYW5k
IGFyZ28sIHNvIGRvIHdlIHN0aWxsIG5lZWQgZXhwbGljaXQgCj4gcGFkZGluZz8KCk9oLCBpbnRl
cm5hbCBzdHJ1Y3R1cmVzIGRvbid0IG5lZWQgYW55IGV4cGxpY2l0IHBhZGRpbmcuIFdoZXJlIHRo
ZQpkb21haW5faWQgZmllbGQgZ2V0cyBwbGFjZWQgc3RpbGwgZG9lc24ndCBtYXR0ZXIgdGhlbiwg
dGhvdWdoLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
