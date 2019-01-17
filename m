From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: Re: [PATCH v6 2/2] xen/blkback: rework connect_ring()
 to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront
Date: Thu, 17 Jan 2019 10:29:23 -0500
Message-ID: <20190117152919.GA26079__41864.6662765697$1547738894$gmane$org@localhost.localdomain>
References: <1547484104-20625-1-git-send-email-dongli.zhang@oracle.com>
 <1547484104-20625-2-git-send-email-dongli.zhang@oracle.com>
 <20190115082036.y7svi3xz3dkqd4w4@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dcL0=PZ=gmail.com=konrad.r.wilk@srs-us1.protection.inumbo.net>)
 id 1gk9bk-0004Hv-73
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 15:29:28 +0000
Received: by mail-qt1-x841.google.com with SMTP id i7so11665765qtj.10
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jan 2019 07:29:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20190115082036.y7svi3xz3dkqd4w4@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, Dongli Zhang <dongli.zhang@oracle.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Paul.Durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDk6MjA6MzZBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCAxMjo0MTo0NEFNICswODAwLCBEb25n
bGkgWmhhbmcgd3JvdGU6Cj4gPiBUaGUgeGVuc3RvcmUgJ3JpbmctcGFnZS1vcmRlcicgaXMgdXNl
ZCBnbG9iYWxseSBmb3IgZWFjaCBibGtiYWNrIHF1ZXVlIGFuZAo+ID4gdGhlcmVmb3JlIHNob3Vs
ZCBiZSByZWFkIGZyb20geGVuc3RvcmUgb25seSBvbmNlLiBIb3dldmVyLCBpdCBpcyBvYnRhaW5l
ZAo+ID4gaW4gcmVhZF9wZXJfcmluZ19yZWZzKCkgd2hpY2ggbWlnaHQgYmUgY2FsbGVkIG11bHRp
cGxlIHRpbWVzIGR1cmluZyB0aGUKPiA+IGluaXRpYWxpemF0aW9uIG9mIGVhY2ggYmxrYmFjayBx
dWV1ZS4KPiA+IAo+ID4gSWYgdGhlIGJsa2Zyb250IGlzIG1hbGljaW91cyBhbmQgdGhlICdyaW5n
LXBhZ2Utb3JkZXInIGlzIHNldCBpbiBkaWZmZXJlbnQKPiA+IHZhbHVlIGJ5IGJsa2Zyb250IGV2
ZXJ5IHRpbWUgYmVmb3JlIGJsa2JhY2sgcmVhZHMgaXQsIHRoaXMgbWF5IGVuZCB1cCBhdAo+ID4g
dGhlICJXQVJOX09OKGkgIT0gKFhFTl9CTEtJRl9SRVFTX1BFUl9QQUdFICogYmxraWYtPm5yX3Jp
bmdfcGFnZXMpKTsiIGluCj4gPiB4ZW5fYmxraWZfZGlzY29ubmVjdCgpIHdoZW4gZnJvbnRlbmQg
aXMgZGVzdHJveWVkLgo+ID4gCj4gPiBUaGlzIHBhdGNoIHJld29ya3MgY29ubmVjdF9yaW5nKCkg
dG8gcmVhZCB4ZW5zdG9yZSAncmluZy1wYWdlLW9yZGVyJyBvbmx5Cj4gPiBvbmNlLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56aGFuZ0BvcmFjbGUuY29tPgo+
IAo+IExHVE06Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKQXBwbGllZC4KCldpbGwgcHVzaCBvdXQgdG8gSmVucyBpbiBhIGNvdXBsZSBv
ZiBkYXlzLiBUaGFuayB5b3UhCj4gCj4gVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
