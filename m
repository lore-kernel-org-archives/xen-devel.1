From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/10] xen: add cloc target
Date: Tue, 22 May 2018 13:08:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805221307040.24793@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-10-git-send-email-sstabellini@kernel.org>
 <5B03DE1102000078001C480E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B03DE1102000078001C480E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBNYXkgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDIyLjA1LjE4
IGF0IDAyOjUzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4v
TWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9NYWtlZmlsZQo+ID4gQEAgLTI2NywzICsyNjcsMTQgQEAg
JChLQ09ORklHX0NPTkZJRyk6Cj4gPiAgaW5jbHVkZS9jb25maWcvYXV0by5jb25mLmNtZDogOwo+
ID4gIAo+ID4gIC1pbmNsdWRlICQoQkFTRURJUikvaW5jbHVkZS9jb25maWcvYXV0by5jb25mLmNt
ZAo+ID4gKwo+ID4gKy5QSE9OWTogY2xvYwo+ID4gK2Nsb2M6IGJ1aWxkCj4gCj4gTm90IHN1cmUg
aGVyZSAtIHdvdWxkbid0IGl0IGJlIHJlYXNvbmFibGUgdG8gaGF2ZSBubyBkZXBlbmRlbmN5IGhl
cmUgYXQKPiBhbGwsIGFuZCBqdXN0IGhhdmUgdGhlIHJ1bGUgYWN0IG9uIHdoYXRldmVyIGlzIGlu
IHRoZSB0cmVlIGF0IHByZXNlbnQgKGZyb20KPiB3aGF0ZXZlciBwcmlvciBpbnZvY2F0aW9uIG9m
IG1ha2UpPwoKVGhpcyBpcyBhIHRhcmdldCBmb3IgcGVvcGxlIHRoYXQga25vdyB3aGF0IHRoZXkg
YXJlIGRvaW5nLCBzbyBpdCBtYWtlcwpzZW5zZS4gSSdsbCByZW1vdmUgYnVpbGQgYXMgZGVwZW5k
ZW5jeS4KCgo+ID4gKwkkKGV2YWwgdG1wZmlsZSA6PSAkKHNoZWxsIG1rdGVtcCkpCj4gPiArCSQo
Zm9yZWFjaCBmLCAkKHNoZWxsIGZpbmQgJChCQVNFRElSKSAtbmFtZSAqLm8uZCksIFwKPiA+ICsJ
CSQoZXZhbCBwYXRoIDo9ICQoZGlyICQoZikpKSBcCj4gPiArCQkkKGV2YWwgbmFtZSA6PSAkKHNo
ZWxsIGNhdCAkKGYpIHwgaGVhZCAtMSB8IGN1dCAtZCAiICIgLWYgMikpIFwKPiA+ICsJCSQoc2hl
bGwgaWYgdGVzdCAtZiAkKHBhdGgpLyQobmFtZSkgOyB0aGVuIGVjaG8gJChwYXRoKS8kKG5hbWUp
ID4+ICQodG1wZmlsZSk7IGZpOykpCj4gPiArCWNsb2MgLS1saXN0LWZpbGU9JCh0bXBmaWxlKQo+
ID4gKwlybSAkKHRtcGZpbGUpCj4gCj4gSSB0aGluayB5b3UgYWxzbyB3YW50IHRvICJybSAtZiAk
KHRtcGZpbGUpIiBmaXJzdCB0aGluZyBpbiBjYXNlIGEgcHJpb3IgIm1ha2UgY2xvYyIKPiB3YXMg
aW50ZXJydXB0ZWQuCgpUaGUgaXNzdWUgaXMgdGhhdCB0bXBmaWxlIHdpbGwgYmUgZGlmZmVyZW50
IHRoZSBzZWNvbmQgdGltZSBhcm91bmQKKG1rdGVtcCByZXR1cm5pbmcgYSBuZXcgbmFtZSkgc28g
aXQgaXMgbm90IHF1aXRlIHBvc3NpYmxlIHRvIHJlbW92ZSB0aGUKb2xkIHRtcGZpbGUuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
