From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v3 0/5] xen/blk: persistent grant rework
Date: Mon, 27 Aug 2018 12:10:23 -0400
Message-ID: <20180827161023.GV10467__6053.13898199729$1535386159$gmane$org@char.us.oracle.com>
References: <20180813140114.20126-1-jgross@suse.com>
 <20180817155909.4cwiy6bhhgiala5m@mac>
 <8aaf02b1-999d-81fc-2732-ed556b959a8a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bur+=lk=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1fuK6A-0002Wi-9r
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 16:10:38 +0000
Content-Disposition: inline
In-Reply-To: <8aaf02b1-999d-81fc-2732-ed556b959a8a@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDM6NTI6MjNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxNy8wOC8xOCAxNzo1OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgQXVnIDEzLCAyMDE4IGF0IDA0OjAxOjA5UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gPj4gUGVyc2lzdGVudCBncmFudHMgYXJlIHVzZWQgaW4gdGhlIFhlbidzIGJsa2Zyb250
L2Jsa2JhY2sgZHJpdmVycyB0bwo+ID4+IGF2b2lkIG1hcHBpbmcvdW5tYXBwaW5nIG9mIEkvTyBi
dWZmZXJzIGluIHRoZSBiYWNrZW5kIGZvciBlYWNoIEkvTy4KPiA+Pgo+ID4+IFdoaWxlIHRoaXMg
c3BlZWRzIHVwIHByb2Nlc3NpbmcgcXVpdGUgYSBiaXQgdGhlcmUgYXJlIHByb2JsZW1zIHJlbGF0
ZWQKPiA+PiB0byBwZXJzaXN0ZW50IGdyYW50cyBpbiBzb21lIGNvbmZpZ3VyYXRpb25zOiBkb21h
aW5zIHdpdGggbXVsdGlwbGUKPiA+PiBibG9jayBkZXZpY2VzIG1ha2luZyB1c2Ugb2YgcGVyc2lz
dGVudCBncmFudHMgbWlnaHQgc3VmZmVyIGZyb20gYSBsYWNrCj4gPj4gb2YgZ3JhbnRzIGlmIGVh
Y2ggb2YgdGhlIGJsb2NrIGRldmljZXMgZXhwZXJpZW5jZWQgYSBoaWdoIEkvTyBsb2FkIGF0Cj4g
Pj4gc29tZSB0aW1lLiBUaGlzIGlzIGR1ZSB0byB0aGUgbnVtYmVyIG9mIHBlcnNpc3RlbnQgZ3Jh
bnRzIHBlciBkZXZpY2UKPiA+PiBvbmx5IHRvIGJlIGxpbWl0ZWQgYnkgYSByYXRoZXIgaGlnaCBt
YXhpbXVtIHZhbHVlLCBidXQgbmV2ZXIgYmVpbmcKPiA+PiByZWxlYXNlZCBldmVuIGluIGNhc2Ug
b2YgbG9uZ2VyIHRpbWVzIHdpdGhvdXQgYW55IEkvTy4KPiA+Pgo+ID4+IFRoaXMgc2VyaWVzIG1v
ZGlmaWVzIHhlbi1ibGtiYWNrIHRvIHVubWFwIGFueSBkb21VIHBhZ2UgbWFwcGVkIHZpYSBhCj4g
Pj4gcGVyc2lzdGVudCBncmFudCBhZnRlciBhIHRpbWVvdXQgKGRlZmF1bHQ6IDYwIHNlY29uZHMp
LiBUaGUgdGltZW91dAo+ID4+IGlzIHNldCB0byBpdHMgZGVmYXVsdCB2YWx1ZSBhZ2FpbiB3aGVu
IGEgcGVyc2lzdGVudCBncmFudCBoYXMgYmVlbgo+ID4+IHVzZWQgZm9yIGFuIEkvTy4KPiA+Pgo+
ID4+IHhlbi1ibGtmcm9udCBpcyBtb2RpZmllZCB0byBzY2FuIGV2ZXJ5IDEwIHNlY29uZHMgZm9y
IHBlcnNpc3RlbnQgZ3JhbnRzCj4gPj4gbm90IGluIHVzZSBieSBibGtiYWNrIGFueSBtb3JlIGFu
ZCB0byByZW1vdmUgc3VjaCBncmFudHMuCj4gPj4KPiA+PiBUaGUgbGFzdCAzIHBhdGNoZXMgYXJl
IHNtYWxsIGNsZWFudXBzIG9mIGJsa2Zyb250IGFuZCBibGtiYWNrIGRyaXZlcnMuCj4gPj4KPiA+
PiBWMzoKPiA+PiAtIHBhdGNoIDE6IG1ha2UgdGltZW91dCBwYXJhbWV0ZXIgc3RhdGljCj4gPiAK
PiA+IEtvbnJhZCBpZiB5b3UgYXJlIE9LIHdpdGggdGhpcyBzZXJpZXMsIGNvdWxkIHlvdSBwbGVh
c2Ugc2VuZCBhIHB1bGwKPiA+IHJlcXVlc3QgdG8gSmVucz8KPiAKPiBQaW5nPwoKWWVzLCBsZXQg
bWUgZG8gdGhhdCBub3cuCj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
