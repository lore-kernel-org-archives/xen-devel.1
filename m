From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 13/16 RESEND] rbtree: place easiest case
 first in rb_erase()
Date: Wed, 03 Jan 2018 04:32:40 -0700
Message-ID: <5A4CCD68020000780019A773@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-14-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-14-kpraveen.lkml@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, dario.faggioli@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE3IGF0IDE2OjIwLCA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiBJbiBy
Yl9lcmFzZSwgbW92ZSB0aGUgZWFzeSBjYXNlIChub2RlIHRvIGVyYXNlIGhhcyBubyBtb3JlIHRo
YW4KPiAxIGNoaWxkKSBmaXJzdC4gSSBmZWVsIHRoZSBjb2RlIHJlYWRzIGVhc2llciB0aGF0IHdh
eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoZWwgTGVzcGluYXNzZSA8d2Fsa2VuQGdvb2dsZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFJpayB2YW4gUmllbCA8cmllbEByZWRoYXQuY29tPgo+IENjOiBQ
ZXRlciBaaWpsc3RyYSA8YS5wLnppamxzdHJhQGNoZWxsby5ubD4KPiBDYzogQW5kcmVhIEFyY2Fu
Z2VsaSA8YWFyY2FuZ2VAcmVkaGF0LmNvbT4KPiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBp
bmZyYWRlYWQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFtMaW51eCBjb21taXQgNjA2NzBiODAzNGQ2ZTJiYTg2
MGFmNzljOTM3OWI3Nzg4ZDA5ZGI3M10KPiAKPiBQb3J0ZWQgdG8gWGVuLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFByYXZlZW4gS3VtYXIgPGtwcmF2ZWVuLmxrbWxAZ21haWwuY29tPgoKQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
